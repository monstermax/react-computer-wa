
import { IoDevice } from "../IoDevice";
import { high16, low16, toHex, U16 } from "../../lib/lib_numbers";

import type { u16, u8 } from "@/types";
import { delayer } from "../../lib/lib_delayer";


export type DiskDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    data?: Array<[u16, u8]> | Map<u16, u8>;
    maxSize?: u16;
    persistent?: boolean;
}

export class DiskDevice extends IoDevice {
    static type = 'storage';
    private currentAddress: u16 = 0 as u16;
    public storage: Map<u16, u8> = new Map;
    maxSize = 0xFFFF as u16;
    persistent: boolean = false;


    constructor(idx: u8, name: string, params: DiskDeviceParams) {
        super(idx, name, params);

        this.maxSize = params.maxSize ?? this.maxSize;
        this.persistent = params.persistent ?? this.persistent;

        this.emit('state', { maxSize: this.maxSize })

        if (this.persistent) {
            // load localstorage
            this.loadFromLocalStorage()
        }

        if (params.data && this.storage.size === 0) {
            this.loadRawData(new Map(params.data))
        }

    }


    loadFromLocalStorage() {
        if (!this.persistent) return;
//        const content = localStorage.getItem(`disk-${this.name}`);
//
//        if (content) {
//            //console.log('load content:', content)
//            const contents = content.split('').map((c, address) => [address as u16, c.charCodeAt(0) as u8]) as [u16, u8][]
//            this.storage = new Map(contents);
//
//            this.emit('state', { storage: this.storage })
//        }
    }


    saveToLocalStorageDelayed() {
        //console.log('saveToLocalStorageDelayed:', this.persistent)
        if (!this.persistent) return;
        delayer(`disk-${this.name}`, this.saveToLocalStorage.bind(this), 500, 2000, []);
    }


    saveToLocalStorage() {
        console.log('saveToLocalStorage:', this.persistent)
        if (!this.persistent) return;
        const contents = [...this.storage.values()].map(value => String.fromCharCode(value));
        const content = contents.join('');
        console.log('save content:', content.length)
//        localStorage.setItem(`disk-${this.name}`, content);
    }


    read(port: u8): u8 {
        //console.log(`DEBUG Reading Disk value on port ${toHex(port)} (${port})`);

        switch (port) {
            // ===== MODE RAW =====
            case 0: // DISK_DATA - lecture byte à l'adresse courante
                return this.storage.get(this.currentAddress) ?? 0 as u8;

            case 1: // DISK_SIZE_LOW - taille disque
                return low16(this.storage.size as u16); // Low byte

            case 2: // DISK_SIZE_HIGH - taille disque
                return high16(this.storage.size as u16); // High byte

            case 3: // DISK_ADDR_LOW - adresse courante (low)
                return low16(this.currentAddress);

            case 4: // DISK_ADDR_HIGH - adresse courante (high)
                return high16(this.currentAddress);


            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        //console.log(`DEBUG Writing Disk value ${toHex(value)} (${value}) on port ${toHex(port)} (${port})`);

        switch (port) {
            // ===== MODE RAW =====
            case 0: // DISK_DATA - écrire byte à l'adresse courante
                this.storage.set(this.currentAddress, value);

                if (this.storage.size > this.maxSize) {
                    this.storage.delete(this.currentAddress)
                    console.warn(`Disk ${this.name} overloaded`);
                }

                this.currentAddress = U16(this.currentAddress + 1);
                //console.log('💾 WRITE at', this.currentAddress, 'value', value);
                this.emit('state', { storage: this.storage })
                this.saveToLocalStorageDelayed()
                break;

            case 3: // DISK_ADDR_LOW - définir adresse (low)
                this.currentAddress = U16((this.currentAddress & 0xFF00) | value);
                break;

            case 4: // DISK_ADDR_HIGH - définir adresse (high)
                this.currentAddress = U16((this.currentAddress & 0x00FF) | (value << 8));
                break;

        }
    }


    loadRawData = (data: Map<u16, u8>) => {
        this.storage = new Map(data);

        if (this.storage.size > this.maxSize) {
            console.warn(`Disk ${this.name} overloaded`);
            this.deleteOverload()
        }

        this.emit('state', { storage: this.storage })
        this.saveToLocalStorageDelayed()
    }


    deleteOverload() {
        while (this.storage.size > this.maxSize) {
            const key = this.storage.keys().next();
            if (key.done) break;
            this.storage.delete(key.value)
        }
    }


    reset() {
        this.currentAddress = 0 as u16;
    }
}

