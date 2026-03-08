
import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";


/** author: claude
 * SPEAKER - Synthétiseur 8-bit style chiptune
 *
 * Ports:
 * - 0x00 SPEAKER_NOTE:      Note MIDI (0-127). 60=C4, 69=A4(440Hz), etc.
 * - 0x01 SPEAKER_DURATION:  Durée en dizaines de ms (1-255 → 10-2550ms). Écriture déclenche le son.
 * - 0x02 SPEAKER_WAVEFORM:  Type d'onde: 0=pulse (chiptune), 1=square, 2=triangle, 3=sawtooth
 * - 0x03 SPEAKER_VOLUME:    Volume (0-255), défaut 180
 *
 * Lire SPEAKER_DURATION retourne 1 si le son est en cours, 0 sinon.
 * Le compteur est basé sur les cycles CPU (nombre de reads).
 *
 * Common MIDI notes:
 *   C4=60  D4=62  E4=64  F4=65  G4=67  A4=69  B4=71
 *   C5=72  D5=74  E5=76  F5=77  G5=79  A5=81  B5=83
 *   C3=48  D3=50  E3=52  F3=53  G3=55  A3=57  B3=59
 */


const PORTS = {
    SPEAKER_NOTE:     0x00,
    SPEAKER_DURATION: 0x01,
    SPEAKER_WAVEFORM: 0x02,
    SPEAKER_VOLUME:   0x03,
} as const;


const POLLS_PER_MS = 40;


export type SpeakerDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    pollsPerMs?: number;
}


export class SpeakerDevice extends IoDevice {
    static type = 'output';

    private note: u8 = 69 as u8;
    private waveform: u8 = 0 as u8;
    private volume: u8 = 180 as u8;

    // Cycle-based countdown
    private remainingPolls: number = 0;

    // Web Audio
    private audioContext: AudioContext | null = null;
    private pollsPerMs: number;


    constructor(idx: u8, name: string, params: SpeakerDeviceParams) {
        super(idx, name, params);
        this.pollsPerMs = params.pollsPerMs ?? POLLS_PER_MS;
    }


    private getAudioContext(): AudioContext {
        if (!this.audioContext) {
            this.audioContext = new (window.AudioContext || (window as any).webkitAudioContext)();
        }
        return this.audioContext;
    }


    private playSound(note: u8, durationMs: number): void {
        if (durationMs === 0 || note === 0) return;

        const freq = midiToFreq(note);
        const ctx = this.getAudioContext();
        const now = ctx.currentTime;
        const dur = durationMs / 1000;
        const masterVol = (this.volume / 255) * 0.35;

        // ── Master gain ──
        const master = ctx.createGain();
        master.connect(ctx.destination);

        // ── ADSR on master ──
        const attack  = Math.min(0.015, dur * 0.05);
        const decay   = Math.min(0.05, dur * 0.1);
        const sustLvl = masterVol * 0.7;
        const release = Math.min(0.06, dur * 0.15);
        const sustainEnd = dur - release;

        master.gain.setValueAtTime(0.001, now);
        master.gain.linearRampToValueAtTime(masterVol, now + attack);
        master.gain.linearRampToValueAtTime(sustLvl, now + attack + decay);
        if (sustainEnd > attack + decay) {
            master.gain.setValueAtTime(sustLvl, now + sustainEnd);
        }
        master.gain.linearRampToValueAtTime(0.001, now + dur);

        const mode = this.waveform & 0x03;

        if (mode === 0) {
            // ── Pulse / Chiptune mode ──
            // Two detuned square oscillators + sub-octave triangle
            this.createChipVoice(ctx, master, freq, dur, now);
        } else {
            // ── Clean single oscillator modes ──
            const types: OscillatorType[] = ['square', 'square', 'triangle', 'sawtooth'];
            const osc = ctx.createOscillator();
            osc.type = types[mode];
            osc.frequency.setValueAtTime(freq, now);
            osc.connect(master);
            osc.start(now);
            osc.stop(now + dur);
        }

        // Set countdown
        this.remainingPolls = Math.round(durationMs * this.pollsPerMs);

        this.emit('state', {
            isPlaying: true,
            note,
            freq: Math.round(freq),
            durationMs,
            waveform: mode,
        });
    }


    /**
     * Chiptune voice: 2 detuned pulse waves + sub triangle + vibrato
     * Inspired by NES/C64 SID sound
     */
    private createChipVoice(
        ctx: AudioContext,
        destination: AudioNode,
        freq: number,
        dur: number,
        now: number,
    ): void {
        // ── Oscillator 1: main pulse ──
        const osc1 = ctx.createOscillator();
        osc1.type = 'square';
        osc1.frequency.setValueAtTime(freq, now);

        // ── Oscillator 2: detuned pulse (thickens the sound) ──
        const osc2 = ctx.createOscillator();
        osc2.type = 'square';
        osc2.frequency.setValueAtTime(freq * 1.003, now); // slight detune ~5 cents

        // ── Oscillator 3: sub-octave triangle (body/bass) ──
        const osc3 = ctx.createOscillator();
        osc3.type = 'triangle';
        osc3.frequency.setValueAtTime(freq / 2, now);

        // ── Vibrato LFO ──
        const lfo = ctx.createOscillator();
        lfo.type = 'sine';
        lfo.frequency.setValueAtTime(5, now); // 5 Hz vibrato

        const lfoGain = ctx.createGain();
        lfoGain.gain.setValueAtTime(0, now);
        // Vibrato kicks in after 100ms (avoid pitch wobble on attack)
        lfoGain.gain.setValueAtTime(0, now + 0.1);
        lfoGain.gain.linearRampToValueAtTime(freq * 0.008, now + 0.2); // ~14 cents depth

        lfo.connect(lfoGain);
        lfoGain.connect(osc1.frequency);
        lfoGain.connect(osc2.frequency);

        // ── Mixer ──
        const gain1 = ctx.createGain();
        gain1.gain.setValueAtTime(0.5, now);

        const gain2 = ctx.createGain();
        gain2.gain.setValueAtTime(0.35, now);

        const gain3 = ctx.createGain();
        gain3.gain.setValueAtTime(0.25, now);

        osc1.connect(gain1);
        osc2.connect(gain2);
        osc3.connect(gain3);

        gain1.connect(destination);
        gain2.connect(destination);
        gain3.connect(destination);

        // ── Start / Stop ──
        osc1.start(now);
        osc2.start(now);
        osc3.start(now);
        lfo.start(now);

        osc1.stop(now + dur);
        osc2.stop(now + dur);
        osc3.stop(now + dur);
        lfo.stop(now + dur);
    }


    read(port: u8): u8 {
        switch (port) {
            case PORTS.SPEAKER_NOTE:
                return this.note;

            case PORTS.SPEAKER_DURATION:
                if (this.remainingPolls > 0) {
                    this.remainingPolls--;
                    return 1 as u8;
                }
                return 0 as u8;

            case PORTS.SPEAKER_WAVEFORM:
                return this.waveform;

            case PORTS.SPEAKER_VOLUME:
                return this.volume;

            default:
                return 0 as u8;
        }
    }


    write(port: u8, value: u8): void {
        switch (port) {
            case PORTS.SPEAKER_NOTE:
                this.note = value;
                break;

            case PORTS.SPEAKER_DURATION:
                const durationMs = value * 10;
                this.playSound(this.note, durationMs);
                break;

            case PORTS.SPEAKER_WAVEFORM:
                this.waveform = (value & 0x03) as u8;
                break;

            case PORTS.SPEAKER_VOLUME:
                this.volume = value;
                break;

            default:
                break;
        }
    }


    reset(): void {
        this.remainingPolls = 0;
        this.note = 69 as u8;
        this.waveform = 0 as u8;
        this.volume = 180 as u8;

        this.emit('state', {
            isPlaying: false,
            note: this.note,
            waveform: 0,
        });
    }
}


/**
 * MIDI note number → frequency in Hz
 * f = 440 * 2^((note - 69) / 12)
 */
function midiToFreq(note: u8): number {
    return 440 * Math.pow(2, (note - 69) / 12);
}
