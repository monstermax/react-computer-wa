

import { IoDevice } from "../IoDevice";

import type { u8 } from "../../types";


export type SwitchsDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class SwitchsDevice extends IoDevice {
    static type = 'input';
    private switchs: u8 = 0 as u8;
    private pendingSwitchIdx: u8 = 0xFF as u8; // 0xFF = pas de changement en attente
    private switchQueue: { switchIdx: u8, newState: boolean }[] = [];


    constructor(idx: u8, name: string, params: SwitchsDeviceParams) {
        super(idx, name, params);
    }


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // SWITCHS_DATA
                return this.switchs;

            case 0x01: // SWITCHS_STATUS
                // Retourne l'index du switch en attente (0-7), ou 0xFF si aucun
                return this.pendingSwitchIdx;

            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // SWITCHS_DATA - écriture (pour reset ou set direct)
                this.switchs = value;
                this.pendingSwitchIdx = 0xFF as u8; // clear pending
                this.emit('state', { switchs: this.switchs, pendingSwitchIdx: this.pendingSwitchIdx })
                break;

            case 0x01: // SWITCHS_STATUS - acquittement
                // Le CPU écrit l'index qu'il a traité pour acquitter
                if (value === this.pendingSwitchIdx) {
                    this.pendingSwitchIdx = 0xFF as u8;
                    this.emit('state', { pendingSwitchIdx: this.pendingSwitchIdx })

                    // Traiter le prochain événement de la queue
                    this.processNextInQueue();
                }
                break;
        }
    }


    getSwitchs(): u8[] {
        // Retourne un tableau de bits pour l'affichage UI
        return Array.from({ length: 8 }, (_, i) => ((this.switchs >> i) & 1) as u8);
    }


    // Ajouter un changement à la queue
    queueBitChange(switchIdx: u8, on: boolean) {
        if (switchIdx < 0 || switchIdx > 7) return;

        this.switchQueue.push({ switchIdx, newState: on });
        this.processNextInQueue();
    }

    // Traiter le prochain événement de la queue
    private processNextInQueue() {
        // Si un changement est déjà en attente, on ne fait rien
        if (this.pendingSwitchIdx !== 0xFF) return;

        // Si la queue est vide, on ne fait rien
        if (this.switchQueue.length === 0) return;

        // Prendre le prochain événement
        const event = this.switchQueue.shift();
        if (!event) return;

        // Appliquer le changement
        const { switchIdx, newState } = event;

        if (newState) {
            this.switchs = (this.switchs | (1 << switchIdx)) as u8;
        } else {
            this.switchs = (this.switchs & ~(1 << switchIdx)) as u8;
        }

        // Marquer ce switch comme en attente
        this.pendingSwitchIdx = switchIdx;

        this.emit('state', {
            switchs: this.switchs,
            pendingSwitchIdx: this.pendingSwitchIdx
        });
    }

    // Pour compatibilité avec l'ancienne interface
    toggleBit(switchIdx: u8) {
        if (switchIdx < 0 || switchIdx > 7) return;

        const currentState = ((this.switchs >> switchIdx) & 1) === 1;
        this.queueBitChange(switchIdx, !currentState);
    }

    setBit(switchIdx: u8, on: boolean = true) {
        this.queueBitChange(switchIdx, on);
    }


    reset(): void {
        this.switchs = 0 as u8;
        this.pendingSwitchIdx = 0xFF as u8;
        this.switchQueue = [];
        this.emit('state', {
            switchs: this.switchs,
            pendingSwitchIdx: this.pendingSwitchIdx
        })
    }
}



