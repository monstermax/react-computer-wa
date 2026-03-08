
import { isIoAddress, isRamAddress, isRomAddress, MEMORY_MAP } from "./memory_map";
import { toHex } from "./lib/lib_numbers";
import { Computer } from "./Computer";
import { console } from "./external_functions";


export class MemoryBus {
    private computer: Computer;
    verbose: boolean = false;

    constructor(computer: Computer) {
        this.computer = computer;
    }

    // TODO: le mapping des adresses empeche d'utiliser toute la ram (la plage située avant RAM_START)

    public read(address: u16): u8 {
        let value: u8 = 0;

        if (isRomAddress(address)) {
            const rom = this.computer.rom;

            if (!rom || !rom.read) {
                throw new Error(`No ROM found. Cannot read at address ${toHex(address)}`);
            }

            value = rom.read(address);

        } else if (isRamAddress(address)) {
            const ram = this.computer.ram;

            if (!ram) {
                throw new Error(`No RAM found. Cannot read at address ${toHex(address)}`);
            }

            value = ram.read(address);

        } else if (isIoAddress(address)) {
            const ioManager = this.computer.ioManager;

            if (!ioManager) {
                throw new Error(`No IO Manager found. Cannot read at address ${toHex(address)}`);
            }

            const ioRelativeAddress = address - MEMORY_MAP.IO_START;

            value = ioManager.read(ioRelativeAddress);

        } else {
            throw new Error(`Address read out of memory range : ${toHex(address)}`);
        }

        if (this.verbose) {
            console.log(`Reading Memory value "${toHex(value)}" (${value}) at address "${toHex(address)} (${address})"`);
        }
        return value;
    }


    public write(address: u16, value: u8): void {
        if (this.verbose && ! isRomAddress(address)) {
            console.log(`Writing Memory value "${toHex(value)}" (${value}) at address "${toHex(address)} (${address})"`);
        }

        if (isRomAddress(address)) {
            const rom = this.computer.rom;

            if (!rom) {
                throw new Error(`No ROM found. Cannot write at address ${toHex(address)}`);
            }

            //if (1) throw new Error(`ROM is Read-Only. Cannot write at address ${toHex(address)}`);
            // TODO: activer cette ligne
            // => Cela requiert de charger le bootloader en RAM au lieu de l'executer directement depuis la ROM

            rom.write(address, value)
            return;
        }

        if (isRamAddress(address)) {
            const ram = this.computer.ram;

            if (!ram) {
                throw new Error(`No RAM found. Cannot write at address ${toHex(address)}`);
            }

            ram.write(address, value);
            return
        }

        if (isIoAddress(address)) {
            const ioManager = this.computer.ioManager;

            if (!ioManager) {
                throw new Error(`No IO Manager found. Cannot write at address ${toHex(address)}`);
            }

            const ioRelativeAddress = address - MEMORY_MAP.IO_START;

            ioManager.write(ioRelativeAddress, value);
            return
        }

        throw new Error(`Address write out of memory range : ${toHex(address)}`);
    }
}


abstract class Memory {
    protected storage: StaticArray<u8>;
    protected size: u32;

    constructor(size: i32) {
        this.storage = new StaticArray<u8>(size);
        this.size = size;
    }

    public read(address: u16): u8 {
        if (address < 0 || address > <u16>this.storage.length - 1) {
            throw new Error(`Address out of memory range : ${address}`);
        }

        return this.storage[address];
    }

    public write(address: u16, value: u8): void {
        if (address < 0 || address > <u16>this.storage.length - 1) {
            throw new Error(`Address out of memory range : ${address}`);
        }

        this.storage[address] = value;
    }


    public reset(): void {
        this.storage = new StaticArray<u8>(this.size);
    }
}


export class Rom extends Memory {
    private computer: Computer

    constructor(computer: Computer) {
        super(2**16);
        this.computer = computer;
    }

}


export class Ram extends Memory {
    private computer: Computer;

    constructor(computer: Computer) {
        super(2**16);
        this.computer = computer;
    }

}

