
import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";

/**
 * SpeakerDevice — Séquenceur MIDI simple
 *
 * Le CPU écrit NOTE + GATE via les ports I/O.
 * Le JS joue le son via OscillatorNode — pas de buffer, pas de queue.
 *
 * Ports :
 *   0x00  NOTE      Note MIDI (0-127)
 *   0x01  WAVEFORM  0=square 1=triangle 2=sawtooth 3=sine
 *   0x02  VOLUME    0-255
 *   0x0A  GATE      1=note ON, 0=note OFF
 */

export type SpeakerDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class SpeakerDevice extends IoDevice {
    static type = 'output';

    private note:     u8 = 69  as u8;
    private waveform: u8 = 0   as u8;
    private volume:   u8 = 180 as u8;

    private audioCtx:  AudioContext | null = null;
    private osc:       OscillatorNode | null = null;
    private gainNode:  GainNode | null = null;

    constructor(idx: u8, name: string, params: SpeakerDeviceParams) {
        super(idx, name, params);
    }

    private getAudioCtx(): AudioContext {
        if (!this.audioCtx) {
            this.audioCtx = new AudioContext();
        }
        if (this.audioCtx.state === 'suspended') {
            this.audioCtx.resume();
        }
        return this.audioCtx;
    }

    private noteOn(): void {
        const ctx = this.getAudioCtx();

        // Couper la note précédente proprement
        this.noteOff();

        const types: OscillatorType[] = ['square', 'triangle', 'sawtooth', 'sine'];
        const freq = 440 * Math.pow(2, (this.note - 69) / 12);

        this.gainNode = ctx.createGain();
        this.gainNode.gain.setValueAtTime(this.volume / 255 * 0.4, ctx.currentTime);
        this.gainNode.connect(ctx.destination);

        this.osc = ctx.createOscillator();
        this.osc.type = types[this.waveform & 0x03];
        this.osc.frequency.setValueAtTime(freq, ctx.currentTime);
        this.osc.connect(this.gainNode);
        this.osc.start(ctx.currentTime);

        this.emit('state', { isPlaying: true, note: this.note, freq: Math.round(freq) });
    }

    private noteOff(): void {
        if (this.osc) {
            try {
                this.osc.stop();
                this.osc.disconnect();
            } catch(e) {}
            this.osc = null;
        }
        if (this.gainNode) {
            this.gainNode.disconnect();
            this.gainNode = null;
        }
        this.emit('state', { isPlaying: false });
    }

    read(port: u8): u8 {
        switch (port) {
            case 0x00: return this.note;
            case 0x01: return this.waveform;
            case 0x02: return this.volume;
            case 0x0A: return this.osc ? 1 as u8 : 0 as u8;
            default:   return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: this.note     = value; break;
            case 0x01: this.waveform = value; break;
            case 0x02: this.volume   = value; break;
            case 0x0A:
                if (value === 1) this.noteOn();
                else             this.noteOff();
                break;
            default: break;
        }
    }

    reset(): void {
        this.noteOff();
        this.note     = 69 as u8;
        this.waveform = 0  as u8;
        this.volume   = 180 as u8;
    }
}
