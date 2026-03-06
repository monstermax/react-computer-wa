
import { useEffect, useRef, useState } from "react";
import EventEmitter from "eventemitter3";


import { getBytecodeArray, getBytecodeUint8Array } from "@/compiler/compiler_utils";
import { deviceTypeFromString, useDevicesManager, type DeviceHook, type DevicesManagerHook } from "./useDevice";
import { Clock } from "@/components/devices/clock";
import { delayer } from "@/lib/lib_delayer";

import * as releaseModule from "@/../public/web_assembly/release";

import type { u32, u8, u16 } from "@/types/computer.types";
import type { CompiledProgram } from "@/types/compiler.types";
import type { IoDevice } from "@/components/devices/IoDevice";
import type { InterruptTimerDevice } from "@/components/devices/interrupt_timer";
import type { RegistersDump } from "@/components/playground/Playground";
import type { Breakpoint } from "./useDebugger";


declare global {
    interface Window {
        wasmConsoleLog: (message: string) => void;
        wasmConsoleWarn: (message: string) => void;
    }
}


export type WasmExports = typeof releaseModule.__AdaptedExports;


export type useEmulatorParams = {
    clockFrequency: u32;
    speedMultiplier: u32;
    dumpRegisters: (followCurrentLine?: boolean) => Promise<RegistersDump | null>
    addLog: (msg: string) => void;
}


export const useEmulator = (params: useEmulatorParams) => {
    const { clockFrequency, speedMultiplier, addLog, dumpRegisters } = params

    // Wasm
    const [wasmExports, setWasmExports] = useState<WasmExports | null>(null);

    // Computer
    const [computerPointer, setComputerPointer] = useState<releaseModule.__Internref4 | null>(null);

    // Clock
    const [clock] = useState(() => new Clock(clockFrequency));
    const [clockStatus, setClockStatus] = useState<boolean>(false);
    const cyclesPerSecondRef = useRef(0);
    const [cpuHalted, setCpuHalted] = useState(false);

    // ── Devices Manager ──
    const devicesManager = useDevicesManager();

    const [eventEmitter] = useState(() => new EventEmitter)


    // Add a device
    const addDevicesToComputer = (deviceHooks: DeviceHook<IoDevice>[]): void => {
        if (!wasmExports || !computerPointer || !devicesManager.devicesRef.current) return;

        for (const deviceHook of deviceHooks) {
            const deviceType: string = deviceHook.deviceClass.type;
            const typeId = deviceTypeFromString(deviceType);
            const nameBuffer = new TextEncoder().encode(deviceHook.deviceName);
            const namePtr = wasmExports.allocate(nameBuffer.length);
            const memoryUint8 = new Uint8Array(wasmExports.memory.buffer);
            memoryUint8.set(nameBuffer, namePtr);

            let deviceIdx: u8 | null = null;

            try {
                deviceIdx = wasmExports.computerAddDevice(computerPointer, namePtr, nameBuffer.length, typeId) as u8;

            } catch (err: any) {
                wasmError(err);
                throw new Error("Unreachable Error");
            }

            devicesManager.setDevicesMap(m => new Map(m).set(deviceHook.deviceName, deviceIdx));
            deviceHook.instanciate(deviceIdx);
        }
    }


    //  Init WASM 
    useEffect(() => {
        const _initWasm = async () => {
            if (wasmExports) return;

            const wasmImports = {
                env: {
                    jsIoRead,
                    jsIoWrite,
                    jsIoReset,
                    jsCpuHalted,
                    jsCpuBreakpoint,
                    //console.log is mapped on window.wasmConsoleLog
                    //console.warn is mapped on window.wasmConsoleWarn
                },
            };

            const _wasmExports = await loadWasmExports(wasmImports, true);
            //console.log({ wasmExports: _wasmExports })
            setWasmExports(_wasmExports)

            try {
                const _computerPointer = _wasmExports.instanciateComputer();
                setComputerPointer(_computerPointer);
                addLog('Emulator initialized');

            } catch (err: any) {
                wasmError(err);
                throw new Error("Unreachable Error");
            }

        };

        const timer = setTimeout(_initWasm, 100);
        return () => clearTimeout(timer);
    }, []);


    // ═══════════════
    //  I/O callbacks 
    // ═══════════════

    // Le CPU lit des données depuis un IO Device de reset [External function for webassembly]
    const jsIoRead = (deviceIdx: u8, port: u8): u8 => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        return device.read(port);
    };


    // Le CPU écrit des données sur un IO Device de reset [External function for webassembly]
    const jsIoWrite = (deviceIdx: u8, port: u8, value: u8): void => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.write(port, value);
    };


    // Le CPU indique à un IO Device de reset [External function for webassembly]
    const jsIoReset = (deviceIdx: u8): void => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.reset();
    }


    // Le CPU indique être arrêté [External function for webassembly]
    const jsCpuHalted = (): void => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0
        setCpuHalted(true)
        addLog('CPU halted');
    };


    // Le CPU indique traiter un breakpoint [External function for webassembly]
    const jsCpuBreakpoint = (): void => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0
        addLog('CPU Breakpoint');
    };


    //  Init clock & tick handler
    useEffect(() => {
        if (!computerPointer) return;

        let lastCycles = 0n;
        let lastCyclesDate = Date.now();

        const _handleClockTick = () => {
            if (wasmExports && computerPointer) {
                try {
                    // Run cycles
                    const canContinue = wasmExports.computerRunCycles(computerPointer, speedMultiplier, false);

                    if (!canContinue) clock.stop();

                    // dump les registres CPU (max freq = 10x/sec. | min freq = 5x/sec)
                    delayer('dump-registers', dumpRegisters, 100, 200, []);

                } catch (err: any) {
                    wasmError(err);
                    throw new Error("Unreachable Error");
                }

                try {
                    // Compute speed only
                    const newCycles = wasmExports.computerGetCycles(computerPointer);
                    const diff = newCycles - lastCycles;
                    const duration = Date.now() - lastCyclesDate;
                    const cyclesPerSecond = 1000 * Number(diff) / duration;
                    cyclesPerSecondRef.current = cyclesPerSecond;

                    lastCycles = newCycles;
                    lastCyclesDate = Date.now();

                } catch (err: any) {
                    wasmError(err);
                    throw new Error("Unreachable Error");
                }

                try {
                    const timerIdx = devicesManager.devicesMap.get('timer') ?? null;

                    const timer: InterruptTimerDevice | null = (timerIdx === null)
                        ? null
                        : devicesManager.devicesRef.current.get(timerIdx) as InterruptTimerDevice | undefined ?? null;

                    if (timer) {
                        timer.write(0x03 as u8, 0 as u8) // declenche le tick du timer (à chaque tick de clock)
                    }

                } catch (err: any) {
                    wasmError(err);
                    throw new Error("Unreachable Error");
                }
            }
        }

        clock.on('tick', _handleClockTick);

        return () => {
            clock.off('tick', _handleClockTick);
        }
    }, [computerPointer, devicesManager, speedMultiplier]);


    // Redémarre la clock quand on change le frequence
    useEffect(() => {
        clock.setFrequency(clockFrequency);
    }, [clockFrequency])


    // Démarre la clock
    const startClock = () => {
        addLog('Clock started')
        clock.start();
        setClockStatus(true)
    }


    // Arrête la clock
    const stopClock = () => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0
        addLog('Clock stopped')
    }


    // Execute N cycles
    const runCycles = (cyclesCount=1): boolean => {
        if (!wasmExports || computerPointer === null) return false;

        try {
            const skipBreakpoints = (cyclesCount === 1);
            const canContinue = wasmExports.computerRunCycles(computerPointer, cyclesCount, skipBreakpoints);
            return canContinue;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // Reset l'ordinateur
    const resetComputer = () => {
        if (!wasmExports || computerPointer === null) return;

        try {
            wasmExports.computerResetComputer(computerPointer)

            setCpuHalted(false)
            //startClock()

            dumpRegisters(!clockStatus)

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    }


    // Déclare la liste de breakpoints au CPU
    const setEditorBreakpointsForCpu = (breakpoints: Breakpoint[]) => {
        if (!wasmExports || computerPointer === null) return;

        console.log({ breakpoints })
        const addresses: u16[] = breakpoints.map(b => b.address as u16)
        const files: string[] = breakpoints.map(b => b.file)
        const lines: u16[] = breakpoints.map(b => b.line as u16)
        wasmExports.computerSetBreakpoints(computerPointer, addresses, files, lines);
    }


    // ═══════════════════════════════════════════
    //  Register & memory dump (on demand only)
    // ═══════════════════════════════════════════

    //cyclesCount
    const getCyclesCount = (wasmExports: WasmExports, computerPtr: releaseModule.__Internref4): bigint => {
        try {
            return wasmExports.computerGetCycles(computerPtr)

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    }


    // Read all CPU Control Registers
    const readControlRegisters = (wasmExports: WasmExports, computerPtr: releaseModule.__Internref4) => {
        try {
            return {
                PC: wasmExports.computerGetRegisterPC(computerPtr) as u16,
                SP: wasmExports.computerGetRegisterSP(computerPtr) as u16,
                IR: wasmExports.computerGetRegisterIR(computerPtr) as u8,
            }

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // Read all CPU Data Registers
    const readDataRegisters = (wasmExports: WasmExports, computerPtr: releaseModule.__Internref4) => {
        try {
            return {
                A: wasmExports.computerGetRegisterA(computerPtr) as u8,
                B: wasmExports.computerGetRegisterB(computerPtr) as u8,
                C: wasmExports.computerGetRegisterC(computerPtr) as u8,
                D: wasmExports.computerGetRegisterD(computerPtr) as u8,
                E: wasmExports.computerGetRegisterE(computerPtr) as u8,
                F: wasmExports.computerGetRegisterF(computerPtr) as u8,
            }

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // MemoryBus Read (ROM/RAM/IO) - Quick Memory Access for the GUI
    const readRam = (address: u16): u8 => {
        if (!wasmExports || computerPointer === null) return 0 as u8;

        try {
            return wasmExports.computerGetMemory(computerPointer, address) as u8;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // MemoryBus Write (ROM/RAM/IO) - Quick Memory Access for the GUI (used by DmaDevice)
    const writeRam = (address: u16, value: u8) => {
        if (!wasmExports || computerPointer === null) return;
        //console.log(`write ram @ ${toHex(address, 4)} : ${toHex(value)} (${value})`)

        try {
            wasmExports.computerSetMemory(computerPointer, address, value);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    const wasmError = (error: Error) => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0

        // dump les registres CPU (max freq = 10x/sec. | min freq = 5x/sec)
        dumpRegisters(true)

        error.message = "[WASM ERROR] " + error.message;
        throw error;
    }


    // Load code

    // Load bootloader
    const loadBootloaderInRAM = (compiled: CompiledProgram): number => {
        if (!wasmExports || !computerPointer || !devicesManager.devicesRef.current) return 0;

        const uint8Arr: Uint8Array = getBytecodeUint8Array(compiled);

        const valPtr = wasmExports.allocate(uint8Arr.length);
        new Uint8Array(wasmExports.memory.buffer).set(uint8Arr, valPtr);

        try {
            wasmExports.computerloadCodeInRAM(computerPointer, valPtr, uint8Arr.length);
            return uint8Arr.length;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    const hook: EmulatorHook = {
        wasmExports,
        computerPointer,
        clock,
        cyclesPerSecondRef,
        clockStatus,
        devicesManager,
        eventEmitter,
        cpuHalted,
        addDevicesToComputer,
        runCycles,
        setClockStatus,
        startClock,
        stopClock,
        getCyclesCount,
        readControlRegisters,
        readDataRegisters,
        readRam,
        writeRam,
        resetComputer,
        loadBootloaderInRAM,
        setEditorBreakpointsForCpu,
        wasmError,
    };

    return hook;
}


export type EmulatorHook = {
    wasmExports: WasmExports | null;
    computerPointer: releaseModule.__Internref4 | null;
    clock: Clock;
    cyclesPerSecondRef: React.RefObject<number>;
    clockStatus: boolean;
    devicesManager: DevicesManagerHook;
    eventEmitter: EventEmitter;
    cpuHalted: boolean;
    addDevicesToComputer: (deviceHooks: DeviceHook<IoDevice>[]) => void;
    runCycles: (cyclesCount?: number) => void;
    setClockStatus: (value: React.SetStateAction<boolean>) => void;
    startClock: () => void;
    stopClock: () => void;
    getCyclesCount: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => bigint;
    readControlRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { PC: u16, SP: u16, IR: u8 };
    readDataRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { A: u8, B: u8, C: u8, D: u8, E: u8, F: u8 };
    readRam: (address: u16) => u8;
    writeRam: (address: u16, value: u8) => void;
    resetComputer: () => void;
    loadBootloaderInRAM: (compiled: CompiledProgram) => number;
    setEditorBreakpointsForCpu: (breakpoints: Breakpoint[]) => void;
    wasmError: (error: Error) => never;
}


async function loadWasmExports(imports: { env: unknown }, debug=true) {
    const wasmFileUrl = debug
        ? "/web_assembly/debug.wasm"
        : "/web_assembly/release.wasm"

    const _module = await globalThis.WebAssembly.compileStreaming(globalThis.fetch(wasmFileUrl));
    const wasmExports = await releaseModule.instantiate(_module, imports);
    return wasmExports;
}


const wasmConsoleLog = (message: string) => {
    let styles: string[] = [];

    if (message?.startsWith('Executing instruction')) styles.push('color:cyan');
    if (message?.startsWith('Reading Memory')) styles.push('color:green');
    if (message?.startsWith('Writing Memory')) styles.push('color:yellow');
    if (message?.startsWith('DEBUG')) styles.push('color:orange');
    styles.push('color:blue')

    const messages = styles.length
        ? ["%c[WASM LOG]", styles.join(';'), message]
        : ["[WASM LOG]", message];

    console.log(...messages);
}

window.wasmConsoleLog = wasmConsoleLog; // used by wasmImports "console.log" callback as an external function of wasm


const wasmConsoleWarn = (message: string) => {
    console.warn("[WASM WARN]", message);
}

window.wasmConsoleWarn = wasmConsoleWarn; // used by wasmImports "console.warn" callback as an external function of wasm

