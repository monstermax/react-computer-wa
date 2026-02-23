
import { IoDevice } from "../IoDevice";
import { U8 } from "../../lib/lib_numbers";

import type { u16, u8 } from "@/types";


/**
 * RNG (Random Number Generator)
 * 
 * Ports:
 * - RNG_OUTPUT (0x00): Lecture → génère et retourne un nombre aléatoire 0-255
 * - RNG_SEED (0x01): Écriture → définir le seed
 */


const PORTS = {
    RNG_OUTPUT: 0x00,
    RNG_SEED: 0x01,
} as const;


export type RngDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class RngDevice extends IoDevice {
    static type = 'system';
    public seed: number;


    constructor(idx: u8, name: string, params: RngDeviceParams) {
        super(idx, name, params);

        this.seed = Date.now();
    }


    // Linear Congruential Generator (LCG)
    // Paramètres: a=1103515245, c=12345, m=2^32 (standard glibc)
    generateRandom(currentSeed: number): number {
        const a = 1103515245;
        const c = 12345;
        const m = 0x100000000; // 2^32

        const nextSeed = (a * currentSeed + c) % m;
        this.seed = nextSeed

        this.emit("state", { seed: nextSeed });

        // Retourner un byte (0-255)
        return (nextSeed >> 16) & 0xFF;
    }


    read(port: u8): u8 {
        switch (port) {
            case PORTS.RNG_OUTPUT:
                // Générer un nouveau nombre aléatoire
                const random = this.generateRandom(this.seed);
                //console.log(`🎲 RNG: Generated ${random}`);
                return random as u8;

            case PORTS.RNG_SEED:
                // Lecture du seed actuel (high byte)
                return U8(this.seed >> 24);

            default:
                console.warn(`RNG: Unknown read port 0x${port.toString(16)}`);
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case PORTS.RNG_OUTPUT:
                // Écriture sur OUTPUT n'a pas d'effet
                console.warn(`RNG: Cannot write to OUTPUT port`);
                break;

            case PORTS.RNG_SEED:
                // Définir un nouveau seed
                const newSeed = (value << 24) | (this.seed & 0x00FFFFFF);
                this.seed = newSeed;
                this.emit("state", { seed: newSeed });
                console.log(`🎲 RNG: Seed set to 0x${newSeed.toString(16)}`);
                break;

            default:
                console.warn(`RNG: Unknown write port 0x${port.toString(16)}`);
                break;
        }
    }


    reset() {
        this.seed = Date.now();
        this.emit("state", { seed: this.seed });
    }

}


