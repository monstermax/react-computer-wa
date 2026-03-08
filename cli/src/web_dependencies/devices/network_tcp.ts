import { createServer, Socket, type Server } from 'net';

import { IoDevice } from '../IoDevice';
import type { u8 } from '@/types';

export type NetworkTcpDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    host?: string;
    port?: number;
    autoFlushMs?: number;
};

/**
 * NETWORK_TCP (single device = single endpoint)
 *
 * Port map:
 * - 0x00 DATA (R/W)
 *   - read : pop 1 byte from RX queue (0 if empty)
 *   - write: push 1 byte to TX queue
 *
 * - 0x01 COMMAND (W)
 *   - 0x01 CONNECT (client mode)
 *   - 0x02 LISTEN  (server mode, single active client)
 *   - 0x03 DISCONNECT client socket
 *   - 0x04 CLOSE server
 *   - 0x05 FLUSH TX now
 *   - 0x06 CLEAR RX queue
 *
 * - 0x02 STATUS (R)
 *   bit0: connected
 *   bit1: has RX data
 *   bit2: has TX pending
 *   bit3: server listening
 *   bit4: error flag
 *
 * - 0x03 RX_COUNT (R)  [0..255]
 * - 0x04 TX_COUNT (R)  [0..255]
 * - 0x05 LAST_ERROR (R/W)
 *   - read : last error code
 *   - write: clear error when value=0
 *
 * - 0x06 HOST_0 (R/W)  default 127
 * - 0x07 HOST_1 (R/W)  default 0
 * - 0x08 HOST_2 (R/W)  default 0
 * - 0x09 HOST_3 (R/W)  default 1
 * - 0x0A PORT_LOW (R/W)
 * - 0x0B PORT_HIGH (R/W)
 */
export class NetworkTcpDevice extends IoDevice {
    static type = 'input/output';

    private readonly maxQueue = 4096;
    private readonly autoFlushMs: number;

    private host = [127, 0, 0, 1] as [number, number, number, number];
    private port = 7777;

    private socket: Socket | null = null;
    private server: Server | null = null;

    private rxQueue: number[] = [];
    private txQueue: number[] = [];

    private flushTimer: NodeJS.Timeout | null = null;

    private errorFlag = false;
    private lastErrorCode: u8 = 0 as u8;

    constructor(idx: u8, name: string, params: NetworkTcpDeviceParams) {
        super(idx, name, params);

        if (params.host) {
            const parsed = this.parseHost(params.host);
            if (parsed) this.host = parsed;
        }
        if (typeof params.port === 'number' && params.port > 0 && params.port <= 65535) {
            this.port = params.port;
        }

        this.autoFlushMs = Math.max(1, params.autoFlushMs ?? 10);
    }

    read(port: u8): u8 {
        switch (port) {
            case 0x00: {
                const byte = this.rxQueue.shift();
                this.emitState();
                return ((byte ?? 0) & 0xff) as u8;
            }
            case 0x02:
                return this.buildStatus();
            case 0x03:
                return Math.min(255, this.rxQueue.length) as u8;
            case 0x04:
                return Math.min(255, this.txQueue.length) as u8;
            case 0x05:
                return this.lastErrorCode;
            case 0x06:
                return (this.host[0] & 0xff) as u8;
            case 0x07:
                return (this.host[1] & 0xff) as u8;
            case 0x08:
                return (this.host[2] & 0xff) as u8;
            case 0x09:
                return (this.host[3] & 0xff) as u8;
            case 0x0a:
                return (this.port & 0xff) as u8;
            case 0x0b:
                return ((this.port >> 8) & 0xff) as u8;
            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        const v = Number(value) & 0xff;

        switch (port) {
            case 0x00:
                this.pushTx(v);
                break;

            case 0x01:
                this.handleCommand(v);
                break;

            case 0x05:
                if (v === 0) {
                    this.errorFlag = false;
                    this.lastErrorCode = 0 as u8;
                    this.emitState();
                }
                break;

            case 0x06:
            case 0x07:
            case 0x08:
            case 0x09: {
                const hIdx = Number(port) - 0x06;
                this.host[hIdx as 0 | 1 | 2 | 3] = v;
                this.emitState();
                break;
            }

            case 0x0a:
                this.port = (this.port & 0xff00) | v;
                this.emitState();
                break;
            case 0x0b:
                this.port = ((v << 8) | (this.port & 0x00ff)) & 0xffff;
                this.emitState();
                break;
        }
    }

    reset(): void {
        this.clearTimers();
        this.closeSocket();
        this.closeServer();

        this.rxQueue = [];
        this.txQueue = [];

        this.errorFlag = false;
        this.lastErrorCode = 0 as u8;

        this.emitState();
    }

    // ---------------------------------- commands ----------------------------------

    private handleCommand(cmd: number): void {
        switch (cmd) {
            case 0x01:
                void this.connectClient();
                break;
            case 0x02:
                void this.startServer();
                break;
            case 0x03:
                this.closeSocket();
                this.emitState();
                break;
            case 0x04:
                this.closeServer();
                this.emitState();
                break;
            case 0x05:
                void this.flushTx();
                break;
            case 0x06:
                this.rxQueue = [];
                this.emitState();
                break;
            default:
                break;
        }
    }

    // ---------------------------------- network -----------------------------------

    private async connectClient(): Promise<void> {
        try {
            this.closeSocket();

            const socket = new Socket();
            this.attachSocket(socket);

            await new Promise<void>((resolve, reject) => {
                socket.once('connect', () => resolve());
                socket.once('error', reject);
                socket.connect(this.port, this.hostString());
            });

            this.socket = socket;
            this.emitState();
            await this.flushTx();
        } catch {
            this.setError(1); // connect error
        }
    }

    private async startServer(): Promise<void> {
        try {
            this.closeServer();

            const server = createServer((sock) => {
                // Single active client policy
                this.closeSocket();
                this.socket = sock;
                this.attachSocket(sock);
                this.emitState();
                void this.flushTx();
            });

            await new Promise<void>((resolve, reject) => {
                server.once('listening', () => resolve());
                server.once('error', reject);
                server.listen(this.port, this.hostString());
            });

            server.on('error', () => this.setError(2));
            this.server = server;
            this.emitState();
        } catch {
            this.setError(2); // listen error
        }
    }

    private attachSocket(sock: Socket): void {
        sock.setNoDelay(true);

        sock.on('data', (data: Buffer) => {
            for (const b of data.values()) {
                if (this.rxQueue.length < this.maxQueue) this.rxQueue.push(b & 0xff);
            }
            this.emitState();
        });

        sock.on('close', () => {
            if (this.socket === sock) this.socket = null;
            this.emitState();
        });

        sock.on('end', () => {
            if (this.socket === sock) this.socket = null;
            this.emitState();
        });

        sock.on('error', () => this.setError(3)); // socket runtime error
    }

    private closeSocket(): void {
        const s = this.socket;
        this.socket = null;
        if (s) {
            s.removeAllListeners();
            s.destroy();
        }
    }

    private closeServer(): void {
        const srv = this.server;
        this.server = null;
        if (srv) {
            srv.removeAllListeners();
            srv.close(() => { });
        }
    }

    // ----------------------------------- queues -----------------------------------

    private pushTx(byte: number): void {
        if (this.txQueue.length < this.maxQueue) this.txQueue.push(byte & 0xff);
        this.scheduleFlush();
        this.emitState();
    }

    private scheduleFlush(): void {
        if (this.flushTimer) return;
        this.flushTimer = setTimeout(() => {
            this.flushTimer = null;
            void this.flushTx();
        }, this.autoFlushMs);
    }

    private async flushTx(): Promise<void> {
        if (!this.socket || this.txQueue.length === 0) {
            this.emitState();
            return;
        }

        const chunk = Buffer.from(this.txQueue.splice(0, this.txQueue.length));

        try {
            await new Promise<void>((resolve, reject) => {
                this.socket!.write(chunk, (err?: Error | null) => {
                    if (err) reject(err);
                    else resolve();
                });
            });
            this.emitState();
        } catch {
            this.setError(4); // write error
        }
    }

    // ----------------------------------- utils ------------------------------------

    private hostString(): string {
        return `${this.host[0]}.${this.host[1]}.${this.host[2]}.${this.host[3]}`;
    }

    private parseHost(host: string): [number, number, number, number] | null {
        const parts = host.split('.').map((x) => Number.parseInt(x, 10));
        if (parts.length !== 4 || parts.some((p) => !Number.isFinite(p) || p < 0 || p > 255)) {
            return null;
        }
        if (!parts[0] || !parts[1] || !parts[2] || !parts[3]) throw new Error("unreachable");
        return [parts[0], parts[1], parts[2], parts[3]];
    }

    private setError(code: number): void {
        this.errorFlag = true;
        this.lastErrorCode = (code & 0xff) as u8;
        this.emitState();
    }

    private buildStatus(): u8 {
        let status = 0;
        if (this.socket && !this.socket.destroyed) status |= 1 << 0;
        if (this.rxQueue.length > 0) status |= 1 << 1;
        if (this.txQueue.length > 0) status |= 1 << 2;
        if (this.server && this.server.listening) status |= 1 << 3;
        if (this.errorFlag) status |= 1 << 4;
        return (status & 0xff) as u8;
    }

    private clearTimers(): void {
        if (this.flushTimer) {
            clearTimeout(this.flushTimer);
            this.flushTimer = null;
        }
    }

    private emitState(): void {
        this.emit('state', {
            connected: !!this.socket && !this.socket.destroyed,
            listening: !!this.server && this.server.listening,
            host: this.hostString(),
            port: this.port,
            rxCount: this.rxQueue.length,
            txCount: this.txQueue.length,
            lastErrorCode: this.lastErrorCode,
            status: this.buildStatus(),
        });
    }
}
