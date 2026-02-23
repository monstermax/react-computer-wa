
import { Cpu } from "./Cpu";
import { IoManager } from "./IoManager";
import { MemoryBus, Ram, Rom } from "./Memory";
//import { console } from "./external_functions";


export class Computer {
    public memoryBus: MemoryBus | null = null;
    public rom: Rom | null = null;
    public ram: Ram | null = null;
    public ioManager: IoManager | null = null;
    public cpus: Cpu[] = [];
    public breakpoints: Breakpoint[] = [];
    public pendingBreakpoint: u16 = 0xFFFF;


    constructor() {
    }

    addMemoryBus(): void {
        this.memoryBus = new MemoryBus(this);
    }

    addMemoryRam(): void {
        this.ram = new Ram(this);

        //const ram = this.ram;
        //if (ram) {
        //    const ptr = changetype<usize>(ram) as i32;
        //    consoleLog(`Ram mounted at address ${toHex(ptr)}`)
        //}
    }

    addMemoryRom(): void {
        this.rom = new Rom(this);
    }

    addMemoryIoManager(): void {
        this.ioManager = new IoManager(this);
    }

    addMemoryCpu(): void {
        this.cpus.push(new Cpu(this));
    }

    setBreakpoints(addresses: u16[], files: string[], lines: u16[]): void {
        this.breakpoints = [];

        for (let i=0; i<addresses.length; i++) {
            const address = addresses[i];
            const file = files[i];
            const line = lines[i];
            const breakpoint = new Breakpoint(address, file, line)
            this.breakpoints.push(breakpoint);

            //console.log(`breakpoint: ${this.breakpoints.length} (${address}, ${file}, ${line})`)
        }

        console.log(`breakpoints: ${this.breakpoints.length}`)
    }
}



class Breakpoint {
    address: u16 = 0
    file: string = 'main.asm'
    line: u16 = 0

    constructor(address: u16, file: string, line: u16) {
        this.address = address;
        this.file = file;
        this.line = line;
    }
}

