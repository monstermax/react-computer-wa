
import { Opcode } from "../cpu_instructions";
import { BreakpointType, Computer } from "./Computer";
import { high16, low16, toHex } from "../utils";
import { console, jsCpu } from "../external_functions";
import { MEMORY_MAP } from "../memory_map";


export class CpuRegisters {
    A: u8 = 0;
    B: u8 = 0;
    C: u8 = 0;
    D: u8 = 0;
    E: u8 = 0;
    F: u8 = 0;
    PC: u16 = 0;
    IR: u8 = 0;
    SP: u16 = 0;
    FLAGS: u8 = 0;
}


export class Cpu {
    public computer: Computer;
    public registers: CpuRegisters;
    public halted: boolean = false;
    public cycles: u64 = 0;
    public alu: ALU = new ALU;
    public isOnBreakpoint: boolean = false; // TODO: a revoir. (a deplacer sur le computer ? à prevoir sur chaque core ?)
    public interruptsEnabled: boolean = false;
    public inInterruptHandler: boolean = false;

    constructor(computer: Computer) {
        this.computer = computer;
        this.registers = new CpuRegisters;
    }


    public resetCpu(): void {
        this.registers = new CpuRegisters;
        this.halted = false;
        this.cycles = 0;
        this.isOnBreakpoint = false;
        this.interruptsEnabled = true;
        this.inInterruptHandler = false;
    }


    public runCpuCycle(skipBreakpoints: boolean=false): void {
        if (this.halted) return;

        const interrupt = this.computer.interruptManager;
        if (!interrupt) throw new Error("Missing interrupt")

        // Handle Interrupts - Vérifier les interruptions AVANT de fetch
        if (interrupt && this.interruptsEnabled && !this.inInterruptHandler && interrupt.hasPendingInterrupt()) {
            this.handleInterrupt();
            //return; // On saute l'exécution normale ce cycle
        }

        // Unblock current INT3 breakpoint (go to PC + 1)
        if (this.computer.pendingBreakpointType === BreakpointType.INT3) {
            this.computer.pendingBreakpointType = BreakpointType.NONE;
            //this.registers.PC++; // ca bug. solution alternative : faire le PC++ dès qu'on rencontre le INT3
            //console.log(`Unblock INT3 breakpoint. new PC : ${toHex(this.registers.PC)}`)
        }

        // Inrement cycles count
        this.cycles++;

        // Fetch current instruction
        this.fetchInstruction();

        // Execute current instruction
        this.executeInstruction(this.registers.IR, skipBreakpoints);
    }


    // Read current instruction at memory address of PC
    private fetchInstruction(): void {
        const opcode: u8 = this.readMemory(this.registers.PC);
        this.registers.IR = opcode;
    }


    private executeInstruction(opcode: u8, skipBreakpoints: boolean=false): void {
        const memoryBus = this.computer.memoryBus;
        const PcHex = toHex(this.registers.PC, 4);

        if (!memoryBus) {
            console.warn(`MemoryBus not found at address ${PcHex}`);
            return;
        }


        // Read Program Counter (PC)
        const PC = this.registers.PC as u16;


        // Check for IDE breakpoint at current PC
        const breakpoints = this.computer.breakpoints;

        if (breakpoints.has(PC)) {
            // Trigger or Skip breakpoint

            const breakpoint = breakpoints.get(PC);
            if (!breakpoint) throw new Error('missing breakpoint');
            //console.log(`Checking BP at ${breakpoint.address} VS ${PC} (pending=${this.computer.pendingBreakpointType})`)

            if (this.computer.pendingBreakpointType === BreakpointType.NONE && !skipBreakpoints) {
                // Trigger breakpoint
                console.log(`CPU Breakpoint (IDE) at address ${PcHex}`)
                this.computer.pendingBreakpointType = BreakpointType.IDE;
                this.isOnBreakpoint = true; // empeche de traiter d'autres cycles au cours de ce tick. (en attendant l'arret de la clock)
                jsCpu.breakpoint()
                return;

            } else {
                // Skip (Unblock) IDE breakpoint
                this.computer.pendingBreakpointType = BreakpointType.NONE;
            }

        } else if (this.computer.pendingBreakpointType === BreakpointType.IDE) {
            // Skip IDE Breakpoint (cas où le breakpoint a été retiré avant de relancer)
            //console.log('DEBUG pendingBreakpointType IDE ??')
            //throw new Error("debug me");
            this.computer.pendingBreakpointType = BreakpointType.NONE;
        }


        // Fetch instructions actions (fetch & execute)
        const actions: InstructionActions = fetchInstructionActions(opcode);

        if (actions.execute) {
            // New API

            // 1. Fetch data (read-only)
            const data: Uint8Array = actions.fetch
                ? actions.fetch(this)
                : new Uint8Array(0);

            // 2. Execute instruction (write)
            actions.execute(this, data);
            return

        } else if (actions.run) {
            // Old API
            actions.run(this)
            return
        }

        throw new Error(`Instruction not found: ${toHex(opcode)} (${opcode}) at address ${toHex(this.registers.PC, 4)}`);
    }


    public getCpuCycles(): u64 {
        return this.cycles;
    }


    public getFlag(flag: string): boolean {
        // flag type: 'zero' | 'carry'
        return flag === 'zero'
            ? !!(this.registers.FLAGS & 0b10)
            : !!(this.registers.FLAGS & 0b01);
    }


    public setFlags(zero: boolean, carry: boolean): void {
        this.registers.FLAGS = ((zero ? 0b10 : 0) | (carry ? 0b01 : 0))
    }


    public readMem8(pc: u16): u8 {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        const value = this.readMemory((pc + 1) as u16);
        return value;
    }


    public readMem16(pc: u16): u16 {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        // little endian
        const low = this.readMemory((pc + 1) as u16);
        const high = this.readMemory((pc + 2) as u16);
        //const value = ((high << 8) | low) as u16;
        const value = ((high * 256) + low) as u16;
        return value;
    }


    public readMemory(address: u16): u8 {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        const value = memoryBus.read(address)
        return value;
    }


    public writeMemory(address: u16, value: u8): void {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        memoryBus.write(address, value)
    }


    public pushValue(value: u8): void {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        // Écrire la valeur à [SP]
        this.writeMemory(this.registers.SP, value);

        // Décrémenter SP (pile descend)
        this.registers.SP = ((this.registers.SP - 1) & 0xFFFF) as u16;
    }


    public popValue(): u8 {
        const memoryBus = this.computer.memoryBus;
        if (!memoryBus) throw new Error("Missing MemoryBus")

        // Incrémenter SP d'abord (pile remonte)
        this.registers.SP = ((this.registers.SP + 1) & 0xFFFF) as u16;

        // Lire la valeur à [SP]
        const value = this.readMemory(this.registers.SP);

        return value;
    }


    handleInterrupt(): void {
        const interrupt = this.computer.interruptManager;
        if (!interrupt) throw new Error("Missing interrupt")

        const irq = interrupt.getPendingIRQ(0, 0);
        if (irq === 0xFF) return;

        //console.log(`🎯 Handling IRQ ${irq}, handlerAddr = ${toHex(interrupt.handlerAddr)}`);

        // 1. Désactiver interruptions
        this.interruptsEnabled = false;
        this.inInterruptHandler = true;

        // 2. Sauvegarder contexte sur la pile
        const sp = this.registers.SP;
        const pc = this.registers.PC;
        const flags = this.registers.FLAGS;

        // PUSH Flags
        this.writeMemory(sp, flags);
        this.registers.SP = (sp - 1) as u16;

        // PUSH PC (little-endian)
        this.writeMemory((sp - 1) as u16, ((pc >> 8) & 0xFF) as u8); // High byte
        this.writeMemory((sp - 2) as u16, (pc & 0xFF) as u8);      // Low byte
        this.registers.SP = (sp - 3) as u16;

        // 3. Acquitter l'interruption
        interrupt.acknowledgeInterrupt(irq);

        // 4. Sauter au handler
        let handlerAddress = interrupt.handlerAddr;
        if (handlerAddress === 0) {
            //// Vecteur par défaut: 0x0040 + irq*4
            //handlerAddress = (0x0040 + (irq * 4)) as u16;
            throw new Error("missing handlerAddress")
        }

        this.registers.PC = handlerAddress;

        console.log(`🔄 Interruption IRQ${irq} -> Handler ${toHex(handlerAddress)}`);
    }


    public getRegisterNameByIdx(regIdx: u8): string {
        if (regIdx === 1) return 'A';
        if (regIdx === 2) return 'B';
        if (regIdx === 3) return 'C';
        if (regIdx === 4) return 'D';
        if (regIdx === 5) return 'E';
        if (regIdx === 6) return 'F';
        //if (regIdx === 11) return 'SP';

        throw new Error(`Register #${regIdx} not found at address ${toHex(this.registers.PC, 4)}`);
    }


    public getRegisterValueByIdx(regIdx: u8): u8 {
        if (regIdx === 1) return this.registers.A;
        if (regIdx === 2) return this.registers.B;
        if (regIdx === 3) return this.registers.C;
        if (regIdx === 4) return this.registers.D;
        if (regIdx === 5) return this.registers.E;
        if (regIdx === 6) return this.registers.F;
        //if (regIdx === 11) return this.registers.SP; // TODO: u16

        throw new Error(`Register #${regIdx} not found at address ${toHex(this.registers.PC, 4)}`);
    }


    public setRegisterValueByIdx(regIdx: u8, value: u8): void {
        if (regIdx === 1) {
            this.registers.A = value;
            return;
        }
        if (regIdx === 2) {
            this.registers.B = value;
            return;
        }
        if (regIdx === 3) {
            this.registers.C = value;
            return;
        }
        if (regIdx === 4) {
            this.registers.D = value;
            return;
        }
        if (regIdx === 5) {
            this.registers.E = value;
            return;
        }
        if (regIdx === 6) {
            this.registers.F = value;
            return;
        }
        //if (regIdx === 11) {
        //    this.registers.SP = value; // TODO: u16
        //    return;
        //}

        throw new Error(`Register #${regIdx} not found at address ${toHex(this.registers.PC, 4)}`);
    }

}




class InstructionActions {
    run: ((cpu: Cpu) => void) | null;
    fetch: ((cpu: Cpu) => Uint8Array) | null;
    execute: ((cpu: Cpu, data: Uint8Array) => void) | null;

    constructor(
        run: ((cpu: Cpu) => void) | null = null,
        fetch: ((cpu: Cpu) => Uint8Array) | null = null,
        execute: ((cpu: Cpu, data: Uint8Array) => void) | null = null
    ) {
        this.run = run;
        this.fetch = fetch;
        this.execute = execute;
    }
}


function fetchInstructionActions(opcode: u8): InstructionActions {
    let run: ((cpu: Cpu) => void) | null = null; // Old API
    let fetch: ((cpu: Cpu) => Uint8Array) | null = null; // New API
    let execute: ((cpu: Cpu, data: Uint8Array) => void) | null = null; // New API

    switch (opcode) {

        case <u8>Opcode.DEBUG_IMM: // TEST New API
            fetch = (cpu: Cpu): Uint8Array => {
                const data: Uint8Array = new Uint8Array(2);
                data[0] = cpu.readMem8(cpu.registers.PC); // debugId
                data[1] = cpu.readMem8(cpu.registers.PC + 1); // debugValue
                //console.log(`DEBUG IMM (fetch) #${data[0]} : ${toHex(data[1])}`)
                return data;
            };

            execute = (cpu: Cpu, data: Uint8Array): void => {
                const debugId: u8 = data[0];
                const debugValue: u8 = data[1];
                console.log(`DEBUG IMM #${debugId} : ${toHex(debugValue)} (${debugValue})`)
                cpu.registers.PC += 3;
            };
            break;


        case <u8>Opcode.NOP:
            execute = (cpu: Cpu) => {
                cpu.registers.PC++;
            };
            break;

        case <u8>Opcode.HALT:
            execute = (cpu: Cpu) => {
                cpu.halted = true;
                console.log(`CPU Halted`)
                jsCpu.halted()
            };
            break;

        case <u8>Opcode.DEBUG_IMM: // Old API
            run = (cpu: Cpu) => {
                const debugId = cpu.readMem8(cpu.registers.PC);
                const debugValue = cpu.readMem8(cpu.registers.PC + 1);
                console.log(`DEBUG IMM #${debugId} : ${toHex(debugValue)} (${debugValue})`)
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.DEBUG_REG:
            run = (cpu: Cpu) => {
                const debugId = cpu.readMem8(cpu.registers.PC);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regName = cpu.getRegisterNameByIdx(regIdx);
                const debugValue = cpu.getRegisterValueByIdx(regIdx);
                console.log(`DEBUG REG #${debugId} : ${regName} = ${toHex(debugValue)} (${debugValue})`)
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.DEBUG_MEM:
            run = (cpu: Cpu) => {
                const debugId = cpu.readMem8(cpu.registers.PC);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const debugValue = cpu.readMemory(memAddress);
                console.log(`DEBUG MEM #${debugId} : [${toHex(memAddress)}] = ${toHex(debugValue)} (${debugValue})`)
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.EI:
            run = (cpu: Cpu) => {
                cpu.interruptsEnabled = true;
                cpu.registers.PC += 1;
            };
            break;

        case <u8>Opcode.DI:
            run = (cpu: Cpu) => {
                cpu.interruptsEnabled = false;
                cpu.registers.PC += 1;
            };
            break;

        case <u8>Opcode.INT:
            run = (cpu: Cpu) => {
                const intCode = cpu.readMem8(cpu.registers.PC);

                if (intCode === 0x80) {
                    // Syscall
                    // TODO: gérer le dispatch des Syscall vers le code assembleur
                    // voir "SYSCALLS TABLE" dans le fichier memory_map.ts
                    const syscallsTablePointer = MEMORY_MAP.SYSCALLS_TABLE_START;
                    const syscallTablePointer = syscallsTablePointer + intCode * MEMORY_MAP.SYSCALLS_TABLE_ENTRY_SIZE;
                    const handlerAddressPointerLow = cpu.readMemory(syscallTablePointer + 3)
                    const handlerAddressPointerHigh = cpu.readMemory(syscallTablePointer + 3)
                    const handlerAddressPointer = <u8>(handlerAddressPointerLow + 256 * handlerAddressPointerHigh);
                    const handlerAddress = cpu.readMemory(handlerAddressPointer);

                    // Adresse de retour = PC + 2 (opcode + 1 byte)
                    const returnAddr = cpu.registers.PC + 2;

                    // PUSH l'adresse de retour sur la pile (16 bits)

                    // PUSH high byte
                    cpu.pushValue(<u8>(returnAddr >> 8) & 0xFF)

                    // PUSH low byte
                    cpu.pushValue(<u8>(returnAddr & 0xFF));

                    // Sauter
                    cpu.registers.PC = handlerAddress;
                    return;
                }

                // TODO: gérer plusieurs code d'interruption

                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.IRET:
            run = (cpu: Cpu) => {
                // POP return address
                const pcLow = cpu.popValue();
                const pcHigh = cpu.popValue();
                const returnAddr = ((pcHigh << 8) | pcLow) as u16;

                // POP Flags
                const flags = cpu.popValue();

                // Mettre à jour registres
                cpu.registers.PC = returnAddr;
                cpu.registers.FLAGS = flags;

                // Réactiver interruptions
                cpu.interruptsEnabled = true;
                cpu.inInterruptHandler = false;
            };
            break;

        case <u8>Opcode.INT3:
            run = (cpu: Cpu) => {
                const PcHex = toHex(cpu.registers.PC, 4);
                console.log(`CPU Breakpoint (INT3) at address ${PcHex}`)
                cpu.isOnBreakpoint = true; // empeche de traiter d'autres cycles au cours de ce tick. (en attendant l'arret de la clock)
                cpu.computer.pendingBreakpointType = BreakpointType.INT3; // permet de skipper le breakpoint lors du restart
                cpu.registers.PC++;
                jsCpu.breakpoint();
            };
            break;

        case <u8>Opcode.SET_SP_IMM:
            run = (cpu: Cpu) => {
                const imm16 = cpu.readMem16(cpu.registers.PC);
                cpu.registers.SP = imm16
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SET_SP_REG_REG:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regLowValue: u8 = cpu.getRegisterValueByIdx(regLowIdx);
                const regHighValue: u8 = cpu.getRegisterValueByIdx(regHighIdx);
                const spValue = ((regHighValue * 256) + regLowValue) as u16;
                cpu.registers.SP = spValue
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.GET_SP_REG_REG:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regLowValue: u8 = low16(cpu.registers.SP);
                const regHighValue: u8 = high16(cpu.registers.SP);
                cpu.setRegisterValueByIdx(regLowIdx, regLowValue);
                cpu.setRegisterValueByIdx(regHighIdx, regHighValue);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.CALL:
            run = (cpu: Cpu) => {
                // Adresse de retour = PC + 3 (opcode + 2 bytes d'adresse)
                const returnAddr = cpu.registers.PC + 3;

                // PUSH l'adresse de retour sur la pile (16 bits)

                // PUSH high byte
                cpu.pushValue(<u8>(returnAddr >> 8) & 0xFF)

                // PUSH low byte
                cpu.pushValue(<u8>(returnAddr & 0xFF));

                // Lire l'adresse de destination
                const callAddr = cpu.readMem16(cpu.registers.PC);

                // Sauter
                cpu.registers.PC = callAddr;
            };
            break;

        case <u8>Opcode.RET:
            run = (cpu: Cpu) => {
                // POP low byte
                const low = cpu.popValue();

                // POP high byte
                const high = cpu.popValue();

                //const retAddr = ((high << 8) | low) as u16;
                const retAddr = ((high * 256) + low) as u16;

                // Sauter à l'adresse retour
                cpu.registers.PC = retAddr;
            };
            break;

        case <u8>Opcode.JMP:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                cpu.registers.PC = memAddress;
            };
            break;

        case <u8>Opcode.JC:
            run = (cpu: Cpu) => {
                if (cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JNC:
            run = (cpu: Cpu) => {
                if (!cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JZ:
            run = (cpu: Cpu) => {
                if (cpu.getFlag('zero')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JNZ:
            run = (cpu: Cpu) => {
                if (!cpu.getFlag('zero')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JL:
            run = (cpu: Cpu) => {
                if (!cpu.getFlag('zero') && cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JLE:
            run = (cpu: Cpu) => {
                if (cpu.getFlag('zero') || cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JG:
            run = (cpu: Cpu) => {
                if (!cpu.getFlag('zero') && !cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.JGE:
            run = (cpu: Cpu) => {
                if (cpu.getFlag('zero') || !cpu.getFlag('carry')) {
                    const memAddress = cpu.readMem16(cpu.registers.PC);
                    cpu.registers.PC = memAddress;

                } else {
                    cpu.registers.PC += 3;
                }
            };
            break;

        case <u8>Opcode.XCHG:
            fetch = (cpu: Cpu): Uint8Array => {
                const data: Uint8Array = new Uint8Array(4);
                const reg1Idx = data[0] = cpu.readMem8(cpu.registers.PC);     // reg1Idx
                const reg2Idx = data[1] = cpu.readMem8(cpu.registers.PC + 1); // reg2Idx
                data[2] = cpu.getRegisterValueByIdx(reg1Idx); // reg1Value
                data[3] = cpu.getRegisterValueByIdx(reg2Idx); // reg2Value
                return data;
            };

            execute = (cpu: Cpu, data: Uint8Array): void => {
                const reg1Idx: u8 = data[0];
                const reg2Idx: u8 = data[1];
                const reg1OldValue: u8 = data[2];
                const reg2OldValue: u8 = data[3];
                cpu.setRegisterValueByIdx(reg1Idx, reg2OldValue);
                cpu.setRegisterValueByIdx(reg2Idx, reg1OldValue);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.MOV_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 2);
                cpu.writeMemory(memAddress, immValue);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.MOV_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                cpu.setRegisterValueByIdx(regIdx, immValue);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.MOV_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                cpu.setRegisterValueByIdx(targetRegIdx, sourceRegValue);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.MOV_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                cpu.setRegisterValueByIdx(regIdx, memValue);
                //console.log(`DEBUG MOV_REG_MEM pc=${toHex(cpu.registers.PC)} memAddress=${toHex(memAddress)} memValue=${toHex(memValue)}`)
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.MOV_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const regIdx = cpu.readMem8(cpu.registers.PC + 2);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                cpu.writeMemory(memAddress, regValue);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.PUSH_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                cpu.pushValue(regValue)
                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.POP_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const popValue = cpu.popValue()
                cpu.setRegisterValueByIdx(regIdx, popValue);
                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.INC_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.inc(regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.INC_MEM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.inc(memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.DEC_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.dec(regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.DEC_MEM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.dec(memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.NOT_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult: AluResult = cpu.alu.not(regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 2;
            };
            break;

        case <u8>Opcode.NOT_MEM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.not(memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.ADD_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.add(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.ADD_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const targetRegValue: u8 = cpu.getRegisterValueByIdx(targetRegIdx);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                const aluResult = cpu.alu.add(targetRegValue, sourceRegValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(targetRegIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.ADD_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.add(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.ADD_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.add(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.ADD_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.add(memValue, regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SUB_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.sub(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SUB_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const targetRegValue: u8 = cpu.getRegisterValueByIdx(targetRegIdx);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                const aluResult = cpu.alu.sub(targetRegValue, sourceRegValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(targetRegIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SUB_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.sub(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SUB_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.sub(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SUB_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.sub(memValue, regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.AND_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.and(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.AND_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const targetRegValue: u8 = cpu.getRegisterValueByIdx(targetRegIdx);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                const aluResult = cpu.alu.and(targetRegValue, sourceRegValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(targetRegIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.AND_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.and(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.AND_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.and(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.AND_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.and(memValue, regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.OR_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.or(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.OR_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const targetRegValue: u8 = cpu.getRegisterValueByIdx(targetRegIdx);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                const aluResult = cpu.alu.or(targetRegValue, sourceRegValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(targetRegIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.OR_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.or(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.OR_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.or(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.OR_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.or(memValue, regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.XOR_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.xor(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.XOR_REG_REG:
            run = (cpu: Cpu) => {
                const targetRegIdx = cpu.readMem8(cpu.registers.PC);
                const targetRegValue: u8 = cpu.getRegisterValueByIdx(targetRegIdx);
                const sourceRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const sourceRegValue: u8 = cpu.getRegisterValueByIdx(sourceRegIdx);
                const aluResult = cpu.alu.xor(targetRegValue, sourceRegValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(targetRegIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.XOR_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.xor(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.XOR_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.xor(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.XOR_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const regIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const aluResult = cpu.alu.xor(memValue, regValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.CMP_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.cmp(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.CMP_REG_REG:
            run = (cpu: Cpu) => {
                const reg1Idx = cpu.readMem8(cpu.registers.PC);
                const reg1Value: u8 = cpu.getRegisterValueByIdx(reg1Idx);
                const reg2Idx = cpu.readMem8(cpu.registers.PC + 1);
                const reg2Value: u8 = cpu.getRegisterValueByIdx(reg2Idx);
                const aluResult = cpu.alu.cmp(reg1Value, reg2Value);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.CMP_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.cmp(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.CMP_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue = cpu.readMem8(cpu.registers.PC + 2);
                const aluResult = cpu.alu.cmp(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.TEST_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.test(regValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.TEST_REG_REG:
            run = (cpu: Cpu) => {
                const reg1Idx = cpu.readMem8(cpu.registers.PC);
                const reg1Value: u8 = cpu.getRegisterValueByIdx(reg1Idx);
                const reg2Idx = cpu.readMem8(cpu.registers.PC + 1);
                const reg2Value: u8 = cpu.getRegisterValueByIdx(reg2Idx);
                const aluResult = cpu.alu.test(reg1Value, reg2Value);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.TEST_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const memValue = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.test(regValue, memValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.TEST_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue = cpu.readMemory(memAddress);
                const immValue: u8 = cpu.readMem8(cpu.registers.PC + 2);
                const aluResult = cpu.alu.test(memValue, immValue);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.registers.PC += 4;
            };
            break;

        // SHL (Shift Left)
        case <u8>Opcode.SHL_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const imm: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.shl(regValue, imm);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SHL_REG_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const countRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const count: u8 = cpu.getRegisterValueByIdx(countRegIdx);
                const aluResult = cpu.alu.shl(regValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SHL_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const count: u8 = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.shl(regValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SHL_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue: u8 = cpu.readMemory(memAddress);
                const imm: u8 = cpu.readMem8(cpu.registers.PC + 2);
                const aluResult = cpu.alu.shl(memValue, imm);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SHL_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue: u8 = cpu.readMemory(memAddress);
                const countRegIdx = cpu.readMem8(cpu.registers.PC + 2);
                const count: u8 = cpu.getRegisterValueByIdx(countRegIdx);
                const aluResult = cpu.alu.shl(memValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        // SHR (Shift Right)
        case <u8>Opcode.SHR_REG_IMM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const imm: u8 = cpu.readMem8(cpu.registers.PC + 1);
                const aluResult = cpu.alu.shr(regValue, imm);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SHR_REG_REG:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const countRegIdx = cpu.readMem8(cpu.registers.PC + 1);
                const count: u8 = cpu.getRegisterValueByIdx(countRegIdx);
                const aluResult = cpu.alu.shr(regValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 3;
            };
            break;

        case <u8>Opcode.SHR_REG_MEM:
            run = (cpu: Cpu) => {
                const regIdx = cpu.readMem8(cpu.registers.PC);
                const regValue: u8 = cpu.getRegisterValueByIdx(regIdx);
                const memAddress = cpu.readMem16(cpu.registers.PC + 1);
                const count: u8 = cpu.readMemory(memAddress);
                const aluResult = cpu.alu.shr(regValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.setRegisterValueByIdx(regIdx, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SHR_MEM_IMM:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue: u8 = cpu.readMemory(memAddress);
                const imm: u8 = cpu.readMem8(cpu.registers.PC + 2);
                const aluResult = cpu.alu.shr(memValue, imm);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.SHR_MEM_REG:
            run = (cpu: Cpu) => {
                const memAddress = cpu.readMem16(cpu.registers.PC);
                const memValue: u8 = cpu.readMemory(memAddress);
                const countRegIdx = cpu.readMem8(cpu.registers.PC + 2);
                const count: u8 = cpu.getRegisterValueByIdx(countRegIdx);
                const aluResult = cpu.alu.shr(memValue, count);
                cpu.setFlags(aluResult.flags.zero, aluResult.flags.carry);
                cpu.writeMemory(memAddress, aluResult.result);
                cpu.registers.PC += 4;
            };
            break;

        // LEA_REG_REG_IMM: (regLow, regHigh) = imm16
        // Encoding: [opcode] [regLow] [regHigh] [imm16_low] [imm16_high]
        case <u8>Opcode.LEA_REG_REG_IMM:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const imm16 = cpu.readMem16(cpu.registers.PC + 2);
                cpu.setRegisterValueByIdx(regHighIdx, ((imm16 >> 8) & 0xFF) as u8);
                cpu.setRegisterValueByIdx(regLowIdx, (imm16 & 0xFF) as u8);
                cpu.registers.PC += 5;
            };
            break;

        // LEA_REG_REG_MEM: (regLow, regHigh) = mem16[addr] // Reads 2 bytes from memory (little-endian) into register pair
        // Encoding: [opcode] [regLow] [regHigh] [addr_low] [addr_high]
        case <u8>Opcode.LEA_REG_REG_MEM:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const memAddress = cpu.readMem16(cpu.registers.PC + 2);
                const low = (memAddress & 0xFF) as u8;
                const high = ((memAddress >> 8) & 0xFF) as u8;
                cpu.setRegisterValueByIdx(regLowIdx, low);
                cpu.setRegisterValueByIdx(regHighIdx, high);
                cpu.registers.PC += 5;
            };
            break;

        // LDI_REG_REG_REG: destReg = memory[regLow:regHigh] // Load indirect: read value at address formed by register pair
        // Encoding: [opcode] [destReg] [regLow] [regHigh]
        case <u8>Opcode.LDI_REG_REG_REG:
            run = (cpu: Cpu) => {
                const destRegIdx = cpu.readMem8(cpu.registers.PC);
                const regLowIdx = cpu.readMem8(cpu.registers.PC + 1);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 2);
                const low: u8 = cpu.getRegisterValueByIdx(regLowIdx);
                const high: u8 = cpu.getRegisterValueByIdx(regHighIdx);
                const address: u16 = ((high * 256) + low) as u16;
                const value = cpu.readMemory(address);
                cpu.setRegisterValueByIdx(destRegIdx, value);
                cpu.registers.PC += 4;
            };
            break;

        // STI_REG_REG_REG: memory[regLow:regHigh] = srcReg // Store indirect: write value to address formed by register pair
        // Encoding: [opcode] [regLow] [regHigh] [srcReg]
        case <u8>Opcode.STI_REG_REG_REG:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const srcRegIdx = cpu.readMem8(cpu.registers.PC + 2);
                const low: u8 = cpu.getRegisterValueByIdx(regLowIdx);
                const high: u8 = cpu.getRegisterValueByIdx(regHighIdx);
                const address: u16 = ((high * 256) + low) as u16;
                const value = cpu.getRegisterValueByIdx(srcRegIdx);
                cpu.writeMemory(address, value);
                cpu.registers.PC += 4;
            };
            break;

        case <u8>Opcode.STI_REG_REG_IMM:
            run = (cpu: Cpu) => {
                const regLowIdx = cpu.readMem8(cpu.registers.PC);
                const regHighIdx = cpu.readMem8(cpu.registers.PC + 1);
                const immValue = cpu.readMem8(cpu.registers.PC + 2);
                const low: u8 = cpu.getRegisterValueByIdx(regLowIdx);
                const high: u8 = cpu.getRegisterValueByIdx(regHighIdx);
                const address: u16 = ((high * 256) + low) as u16;
                cpu.writeMemory(address, immValue);
                cpu.registers.PC += 4;
            };
            break;
    }

    return new InstructionActions(run, fetch, execute);
}



class Flags {
    zero: boolean = false;
    carry: boolean = false;
}

class AluResult {
    result: u8 = 0;
    flags: Flags = { zero: false, carry: false };
}


// Arithmetic Logic Unit
class ALU {
    not(a: u8): AluResult {
        const result = ((~a) & 0xFF) as u8;
        const carry = (~a) > 0xFF;
        const zero = result === 0;
        const flags: Flags = ({ zero, carry });
        return { result, flags };
    }
    add(a: u8, b: u8): AluResult {
        const result = ((a + b) & 0xFF) as u8;
        //const carry = (a + b) > 0xFF;
        const carry = (result < a);
        const zero = result === 0;
        const flags: Flags = ({ zero, carry });
        return { result, flags };
    }

    sub(a: u8, b: u8): AluResult {
        const result = ((a - b) & 0xFF) as u8;
        const zero = result === 0;
        const carry = a < b; // Borrow
        //const carry = (result > a);
        const flags: Flags = ({ zero, carry });
        return { result, flags };
    }

    and(a: u8, b: u8): AluResult {
        const result = ((a & b) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: false });
        return { result, flags };
    }

    or(a: u8, b: u8): AluResult {
        const result = ((a | b) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: false });
        return { result, flags };
    }

    xor(a: u8, b: u8): AluResult {
        const result = ((a ^ b) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: false });
        return { result, flags };
    }

    inc(value: u8): AluResult {
        const result = ((value + 1) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: result < value });
        return { result, flags };
    }

    dec(value: u8): AluResult {
        const result = ((value - 1) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: result > value });
        return { result, flags };
    }

    // Test & Compare
    test(a: u8, b: u8): AluResult { // comme AND mais ne stocke pas le résultat
        const result = ((a & b) & 0xFF) as u8;
        const flags: Flags = ({ zero: result === 0, carry: false });
        return { result: 0, flags };
    }

    cmp(a: u8, b: u8): AluResult {
        // Compare a et b: a - b (sans stocker le résultat)
        const result = ((a - b) & 0xFF) as u8;
        const zero = result === 0;
        const carry = a < b; // Borrow
        const flags: Flags = ({ zero, carry });
        return { result: 0, flags };
    }

    // ROL - Rotate Left (sans utiliser le carry comme entrée)
    rol(value: u8, count: u8 = 1): AluResult {  // Pas de paramètre carryIn!
        let result = value;
        let carry = false;

        for (let i = 0; i < count; i++) {
            const msb = !!(result & 0x80);  // Bit qui va sortir
            result = ((result << 1) & 0xFF) as u8;

            // ROL: le bit qui sort à gauche rentre à droite
            if (msb) {
                result = result | 0x01;  // L'ancien MSB devient LSB
            }

            carry = msb;  // Le MSB devient le flag carry
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // ROR - Rotate Right (sans utiliser le carry comme entrée)
    ror(value: u8, count: u8 = 1): AluResult {  // Pas de paramètre carryIn!
        let result = value;
        let carry = false;

        for (let i = 0; i < count; i++) {
            const lsb = !!(result & 0x01);  // Bit qui va sortir
            result = ((result >> 1) & 0xFF) as u8;

            // ROR: le bit qui sort à droite rentre à gauche
            if (lsb) {
                result = result | 0x80;  // L'ancien LSB devient MSB
            }

            carry = lsb;  // Le LSB devient le flag carry
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // RCL - Rotate Left through Carry (utilise le carry comme entrée)
    rcl(value: u8, count: u8 = 1, carryIn: boolean = false): AluResult {
        let result = value;
        let carry = carryIn;

        for (let i = 0; i < count; i++) {
            const msb = !!(result & 0x80);  // Bit qui va sortir
            result = ((result << 1) & 0xFF) as u8;

            // RCL: l'ancien flag carry rentre à droite
            if (carry) {
                result = result | 0x01;  // L'ancien carry devient LSB
            }

            carry = msb;  // Le MSB devient le nouveau flag carry
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // RCR - Rotate Right through Carry (utilise le carry comme entrée)
    rcr(value: u8, count: u8 = 1, carryIn: boolean = false): AluResult {
        let result = value;
        let carry = carryIn;

        for (let i = 0; i < count; i++) {
            const lsb = !!(result & 0x01);  // Bit qui va sortir
            result = ((result >> 1) & 0xFF) as u8;

            // RCR: l'ancien flag carry rentre à gauche
            if (carry) {
                result = result | 0x80;  // L'ancien carry devient MSB
            }

            carry = lsb;  // Le LSB devient le nouveau flag carry
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // Shift bits

    // SHL (Shift Left) - Décalage à gauche
    shl(value: u8, count: u8 = 1): AluResult {
        let result = value;
        let carry = false;

        for (let i = 0 as u8; i < count; i++) {
            carry = !!(result & 0x80);  // MSB -> carry
            result = ((result << 1) & 0xFF) as u8;
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // SHR (Shift Right) - Décalage à droite
    shr(value: u8, count: u8 = 1): AluResult {
        let result = value;
        let carry = false;

        for (let i = 0 as u8; i < count; i++) {
            carry = !!(result & 0x01);  // LSB -> carry
            result = ((result >> 1) & 0xFF) as u8;
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }

    // Arithmetic Shifts

    // SAL - Shift Arithmetic Left (SAL est identique à SHL)
    sal(value: u8, count: u8 = 1): AluResult {
        return this.shl(value, count);  // SAL = SHL
    }

    // SAR - Shift Arithmetic Right (préserve le signe)
    sar(value: u8, count: u8 = 1): AluResult {
        let result = value;
        let carry = false;

        for (let i = 0; i < count; i++) {
            const msb = result & 0x80;  // Bit de signe
            carry = !!(result & 0x01);  // LSB -> carry

            // Décalage à droite avec préservation du signe
            result = ((result >> 1) & 0xFF) as u8;
            if (msb) {
                result = result | 0x80;  // Restaure le bit de signe
            }
        }

        const zero = result === 0;
        return { result, flags: { zero, carry } };
    }
}

