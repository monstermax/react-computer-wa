
import { Cpu } from "./Cpu";
import { InterruptManager } from "./InterruptManager";
import { IoManager } from "./IoManager";
import { MemoryBus, Ram, Rom } from "./Memory";
import { InterruptTimerDevice } from "../devices/InterruptTimer";
import { DEVICE_TYPE_SYSTEM } from "../memory_map";
//import { console } from "./external_functions";


export enum BreakpointType {
    NONE = 0,
    INT3 = 1,
    IDE = 2,
}


export class Computer {
    public memoryBus: MemoryBus | null = null;
    public rom: Rom | null = null;
    public ram: Ram | null = null;
    public ioManager: IoManager | null = null;
    public cpus: Cpu[] = [];
    public breakpoints: Map<u16, Breakpoint> = new Map;
    public pendingBreakpointType: BreakpointType = BreakpointType.NONE;
    public interruptManager: InterruptManager | null = null;
    public timers: InterruptTimerDevice[] = [];


    constructor() {
    }

    addMemoryBus(): void {
        this.memoryBus = new MemoryBus(this);
    }

    addRam(): void {
        this.ram = new Ram(this);

        //const ram = this.ram;
        //if (ram) {
        //    const ptr = changetype<usize>(ram) as i32;
        //    consoleLog(`Ram mounted at address ${toHex(ptr)}`)
        //}
    }

    addRom(): void {
        this.rom = new Rom(this);
    }

    addIoManager(): void {
        this.ioManager = new IoManager(this);
    }

    addCpu(): void {
        this.cpus.push(new Cpu(this));
    }

    addInterruptManager(): void {
        const ioManager = this.ioManager;
        if (!ioManager) throw new Error("Missing ioManager")

        this.interruptManager = new InterruptManager;

        ioManager.addDevice('interrupt', DEVICE_TYPE_SYSTEM);
    }

    addTimer(): void {
        const ioManager = this.ioManager;
        if (!ioManager) throw new Error("Missing ioManager")

        const timer = new InterruptTimerDevice(this);
        ioManager.addDevice('timer0', DEVICE_TYPE_SYSTEM);

        this.timers.push(timer);
    }

    setBreakpoints(addresses: u16[], files: string[], lines: u16[]): void {
        this.breakpoints = new Map;

        for (let i=0; i<addresses.length; i++) {
            const address = addresses[i];
            const file = files[i];
            const line = lines[i];
            const breakpoint = new Breakpoint(address, file, line)
            this.breakpoints.set(address, breakpoint);

            //console.log(`breakpoint: ${this.breakpoints.length} (${address}, ${file}, ${line})`)
        }

        console.log(`breakpoints: ${this.breakpoints.size}`)
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

