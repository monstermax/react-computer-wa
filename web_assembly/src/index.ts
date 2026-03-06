
// The entry file of your WebAssembly module.

import { Computer } from "./Computer";
import { console } from "./external_functions";
import { MEMORY_MAP } from "./memory_map";


export function instanciateComputer(): Computer {
    const computer = new Computer;
    computer.addMemoryBus();
    computer.addMemoryRam();
    computer.addMemoryRom();
    computer.addMemoryIoManager();
    computer.addMemoryCpu();
    console.log(`Computer instanciated`)
    return computer;
}


export function allocate(size: i32): usize {
    const buf = new ArrayBuffer(size);
    return changetype<usize>(buf);
}


// Load bootloader code in ROM
export function computerloadCodeInROM(computer: Computer, valPtr: usize, dataLen: i32): void {
    const rom = computer.rom;

    if (!rom) {
        throw new Error("ROM not found");
    }

    //if (dataLen > (MEMORY_MAP.ROM_END + 1 as i32)) {
    //    throw new Error("Bootloader code too heavy");
    //}

    for (let i: i32 = 0; i < dataLen; i++) {
        //const addr: u16 = load<u16>(addrPtr + i);
        const addr: u16 = i as u16;
        const val: u8 = load<u8>(valPtr + i);
        //console.log(`load code line #${i} (addr=${addr} | val=${val})`)
        rom.write(addr, val);
    }
}


// Load bootloader code in RAM
export function computerloadCodeInRAM(computer: Computer, valPtr: usize, dataLen: i32): void {
    const ram = computer.ram;

    if (!ram) {
        throw new Error("RAM not found");
    }

    if (dataLen > (MEMORY_MAP.RAM_END + 1 as i32)) {
        throw new Error("Bootloader code too heavy");
    }

    for (let i: i32 = 0; i < dataLen; i++) {
        //const addr: u16 = load<u16>(addrPtr + i);
        const addr: u16 = i as u16;
        const val: u8 = load<u8>(valPtr + i);
        //console.log(`load code line #${i} (addr=${addr} | val=${val})`)
        ram.write(addr, val);
    }
}


export function computerRunCycles(computer: Computer, cycles: u32, skipBreakpoints: boolean=false): boolean {
    let canContinue = true;

    if (computer.cpus.length > 0) {

        // remove breakpoints bypass
        for (let i = 0; i < computer.cpus.length; i++) {
            const cpu = computer.cpus[i];
            cpu.isOnBreakpoint = false;
        }

        // run cycles
        for (let i: u32 = 0; i < cycles; i++) {
            for (let i = 0; i < computer.cpus.length; i++) {
                const cpu = computer.cpus[i];

                if (!cpu) throw new Error(`Missing CPU #${i}`);

                if (cpu.isOnBreakpoint || cpu.halted) {
                    canContinue = false;

                } else {
                    cpu.runCpuCycle(skipBreakpoints);
                }
            }
        }
    }

    return canContinue;
}


export function computerGetCycles(computer: Computer): u64 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.getCpuCycles();
    }

    return 0;
}


export function computerGetRegisterPC(computer: Computer): u16 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.PC
    }

    return 0;
}


export function computerGetRegisterSP(computer: Computer): u16 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.SP
    }

    return 0;
}


export function computerGetRegisterIR(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.IR
    }

    return 0;
}


export function computerGetRegisterA(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.A
    }

    return 0;
}

export function computerGetRegisterB(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.B
    }

    return 0;
}

export function computerGetRegisterC(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.C
    }

    return 0;
}

export function computerGetRegisterD(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.D
    }

    return 0;
}

export function computerGetRegisterE(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.E
    }

    return 0;
}

export function computerGetRegisterF(computer: Computer): u8 {
    if (computer.cpus.length > 0) {
        const cpu = computer.cpus[0];
        return cpu.registers.F
    }

    return 0;
}


export function computerGetMemory(computer: Computer, address: u16): u8 {
    const memoryBus = computer.memoryBus;

    if (memoryBus && memoryBus.read) {
        const value = memoryBus.read(address);
        return value
    }

    return 0;
}


export function computerSetMemory(computer: Computer, address: u16, value: u8): void {
    const memoryBus = computer.memoryBus;

    if (memoryBus) {
        memoryBus.write(address, value);
        return
    }
}


export function computerAddDevice(
    computer: Computer,
    namePtr: usize,
    nameLen: i32,
    typeId: u8
): u8 {
    const ioManager = computer.ioManager;
    if (!ioManager) throw new Error("IoManager not found");

    // Convert raw pointer to AS string
    let name = '';
    for (let i: i32 = 0; i < nameLen; i++) {
        name += String.fromCharCode(load<u8>(namePtr + i));
    }

    //console.log(`Adding Device "${name}" [${nameLen}] (type ${typeId})`);

    return ioManager.addDevice(name, typeId);
}



export function computerResetComputer(computer: Computer): void {
    // Reset Ram
    const ram = computer.ram;

    if (ram) {
        ram.reset();
    }

    // Reset Devices
    const ioManager = computer.ioManager;
    if (ioManager) {
        ioManager.resetDevices()
    }

    // Reset Cpu
    for (let i = 0; i < computer.cpus.length; i++) {
        const cpu = computer.cpus[i];
        cpu.resetCpu();
    }

    if (ioManager) {
        ioManager.reloadDevices()
    }
}


export function computerSetBreakpoints(computer: Computer, addresses: u16[], files: string[], lines: u16[]): void {
    computer.setBreakpoints(addresses, files, lines);
}
