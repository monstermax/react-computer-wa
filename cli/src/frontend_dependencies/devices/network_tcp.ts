
import { Socket } from 'net';

import { IoDevice } from "../IoDevice";
import { U8 } from "../../lib/lib_numbers";

//import { MEMORY_MAP } from "../../../web_assembly/src/memory_map";
import { MEMORY_MAP } from "../../webassembly_dependencies/memory_map";

import type { u16, u8 } from "@/types";


export type NetworkTcpDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class NetworkTcpDevice extends IoDevice {
    static type = 'network';

    BUFFER_SIZE = 512;


    constructor(idx: u8, name: string, params: NetworkTcpDeviceParams) {
        super(idx, name, params);

    }


    // TODO: le composant doit écouter en permanence le socket. quand il recoit de la donnée, il l'ajoute à un buffer.
    // quand le CPU veut "read" on depile la queue
    // quand le CPU veut "write" (1 byte), on ajoute dans un buffer. le composant gere l'envoi quand le buffer est plein ou quand un delai est écoulé


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // NETWORK_TCP_DATA
                return 0 as u8;

            default:
                return 0 as u8;
        }
    }


    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // NETWORK_TCP_DATA
                break;

        }
    }


    reset() {
        this.emit('state', {})
    }


    async writeByte(socket: Socket, byte: number): Promise<void> {
        return new Promise((resolve, reject) => {
            const buffer = Buffer.from([byte]);
            socket.write(buffer, (err) => {
                if (err) reject(err);
                else resolve();
            });
        });
    }


    async readByte(socket: Socket): Promise<number> {
        return new Promise((resolve, reject) => {
            const onData = (data: Buffer) => {
                cleanup();
                resolve(Number(data[0]));
            };

            const onError = (err: Error) => {
                cleanup();
                reject(err);
            };

            const onEnd = () => {
                cleanup();
                reject(new Error('Socket fermé par le pair'));
            };

            const cleanup = () => {
                socket.removeListener('data', onData);
                socket.removeListener('error', onError);
                socket.removeListener('end', onEnd);
            };

            socket.once('data', onData);
            socket.once('error', onError);
            socket.once('end', onEnd);
        });
    }

}

