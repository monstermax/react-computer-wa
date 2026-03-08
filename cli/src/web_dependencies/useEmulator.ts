
//import { useEffect, useRef, useState } from "react";

import { deviceTypeFromString, useDevicesManager, type DeviceHook, type DevicesManagerHook } from "./useDevice";
import { Clock } from "./devices/clock";
import { delayer } from "../lib/lib_delayer";

import * as releaseModule from "../../../webassembly/build/release";

import type { u32, u8, u16 } from "@/types";
import type { IoDevice } from "./IoDevice";
import type { InterruptTimerDevice } from "./devices/interrupt_timer";

import type { CompiledProgram } from "../../../web/src/types/compiler.types";


interface Window {
    wasmConsoleLog: (message: string) => void;
    wasmConsoleWarn: (message: string) => void;
}


export type RegistersDump = {
    registers8: {
        A: u8;
        B: u8;
        C: u8;
        D: u8;
        E: u8;
        F: u8;
    };
    registers16: {
        PC: u16;
        SP: u16;
        IR: u8;
    };
    cyclesCount: number;
}


export type WasmExports = typeof releaseModule.__AdaptedExports;


export type useEmulatorParams = {
    clockFrequency: u32;
    speedMultiplier: u32;
    dumpRegisters: () => Promise<RegistersDump | null>
    addLog?: (msg: string) => void;
}


export const useEmulator = async (params: useEmulatorParams) => {
    const { clockFrequency, speedMultiplier, addLog=console.log, dumpRegisters } = params

    // Wasm
    let wasmExports = null as WasmExports | null;

    // Computer
    let computerPointer = null as releaseModule.__Internref4 | null;

    // Clock
    const clock = new Clock(clockFrequency);
    let clockStatus: boolean = false;
    let cyclesPerSecondRef: number = 0;
    let cpuHalted: boolean = false;

    // ── Devices Manager ──
    const devicesManager = useDevicesManager();


    // Add a device
    const addDevicesToComputer = (deviceHooks: DeviceHook<IoDevice>[]): void => {
        if (!wasmExports || !computerPointer || !devicesManager.devicesRef) return;

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

            devicesManager.devicesMap.set(deviceHook.deviceName, deviceIdx);
            deviceHook.instanciate(deviceIdx);
        }
    }


    //  Init WASM 
    const _initWasm = async () => {
        if (wasmExports) return;

        const wasmImports = {
            env: {
                jsIoRead,
                jsIoWrite,
                jsIoReset,
                jsCpuHalted,
                jsCpuBreakpoint,
                'console.log': window.wasmConsoleLog, //console.log is mapped on window.wasmConsoleLog
                'console.warn': window.wasmConsoleWarn, //console.warn is mapped on window.wasmConsoleWarn
            },
        };

        const _wasmExports = await loadWasmExports(wasmImports, true);
        //console.log({ wasmExports: _wasmExports })
        wasmExports = _wasmExports

        try {
            const _computerPointer = _wasmExports.instanciateComputer();
            computerPointer = _computerPointer;
            addLog('Emulator initialized');

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };





    // ═══════════════
    //  I/O callbacks 
    // ═══════════════

    const jsIoRead = (deviceIdx: u8, port: u8): u8 => {
        if (!devicesManager.devicesRef) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        return device.read(port);
    };


    const jsIoWrite = (deviceIdx: u8, port: u8, value: u8): void => {
        if (!devicesManager.devicesRef) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.write(port, value);
    };


    const jsIoReset = (deviceIdx: u8): void => {
        if (!devicesManager.devicesRef) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.reset();
    }


    const jsCpuHalted = (): void => {
        clock.stop();
        clockStatus = false
        cyclesPerSecondRef = 0
        cpuHalted = true
        addLog('CPU halted');
    };

    const jsCpuBreakpoint = (): void => {
        clock.stop();
        clockStatus = false
        cyclesPerSecondRef = 0
        addLog('CPU Breakpoint');
        throw new Error("Breakpoint");
    };


    //  Init clock & tick handler
    let lastCycles = 0n;
    let lastCyclesDate = Date.now();

    const _handleClockTick = () => {
        if (wasmExports && computerPointer) {
            try {
                // Run cycles
                const canContinue = wasmExports.computerRunCycles(computerPointer, speedMultiplier);
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
                cyclesPerSecondRef = cyclesPerSecond;

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
                    : devicesManager.devicesRef.get(timerIdx) as InterruptTimerDevice | undefined ?? null;

                if (timer) {
                    timer.write(0x03 as u8, 0 as u8) // declenche le tick du timer
                }

            } catch (err: any) {
                wasmError(err);
                throw new Error("Unreachable Error");
            }
        }
    }

    clock.on('tick', _handleClockTick);



    // Redémarre la clock quand on change le frequence
    clock.setFrequency(clockFrequency);


    const startClock = () => {
        addLog('Clock started')
        clock.start();
        clockStatus = true
    }


    const stopClock = () => {
        clock.stop();
        clockStatus = false
        cyclesPerSecondRef = 0
        addLog('Clock stopped')
    }


    const runCycles = (cyclesCount=1): boolean => {
        if (!wasmExports || computerPointer === null) return false;

        try {
            const canContinue = wasmExports.computerRunCycles(computerPointer, cyclesCount, cyclesCount === 1);
            return canContinue;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    const resetComputer = () => {
        if (!wasmExports || computerPointer === null) return;

        try {
            wasmExports.computerResetComputer(computerPointer)

            cpuHalted = false
            startClock()

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
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


    // RAM Read
    const readRam = (address: u16): u8 => {
        if (!wasmExports || computerPointer === null) return 0 as u8;

        try {
            return wasmExports.computerGetMemory(computerPointer, address) as u8;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // RAM Write
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
        clockStatus = false
        cyclesPerSecondRef = 0

        error.message = "[WASM ERROR] " + error.message;
        throw error;
    }


    // Load code

    // Load bootloader
    const loadBootloader = (compiled: CompiledProgram): number => {
        if (!wasmExports || !computerPointer || !devicesManager.devicesRef) return 0;

        const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
        const byteCodeArr = Array.from(byteCodeMap);
        const values = new Uint8Array(byteCodeArr.map(r => r[1]));

        const valPtr = wasmExports.allocate(values.length);
        new Uint8Array(wasmExports.memory.buffer).set(values, valPtr);

        try {
            wasmExports.computerloadCodeInRAM(computerPointer, valPtr, values.length);
            return values.length;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    await _initWasm()


    const hook: EmulatorHook = {
        wasmExports,
        computerPointer,
        clock,
        cyclesPerSecondRef,
        clockStatus,
        devicesManager,
        cpuHalted,
        addDevicesToComputer,
        runCycles,
        startClock,
        stopClock,
        getCyclesCount,
        readControlRegisters,
        readDataRegisters,
        readRam,
        writeRam,
        resetComputer,
        loadBootloader,
        wasmError,
    };

    return hook;
}


export type EmulatorHook = {
    wasmExports: WasmExports | null;
    computerPointer: releaseModule.__Internref4 | null;
    clock: Clock;
    cyclesPerSecondRef: number;
    clockStatus: boolean;
    devicesManager: DevicesManagerHook;
    cpuHalted: boolean;
    addDevicesToComputer: (deviceHooks: DeviceHook<IoDevice>[]) => void;
    runCycles: (cyclesCount?: number) => boolean;
    startClock: () => void;
    stopClock: () => void;
    getCyclesCount: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => bigint;
    readControlRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { PC: u16, SP: u16, IR: u8 };
    readDataRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { A: u8, B: u8, C: u8, D: u8, E: u8, F: u8 };
    readRam: (address: u16) => u8;
    writeRam: (address: u16, value: u8) => void;
    resetComputer: () => void;
    loadBootloader: (compiled: CompiledProgram) => number;
    wasmError: (error: Error) => never;
}


async function loadWasmExports(imports: { env: unknown }, debug=true) {
    const urlPrefix = "http://localhost:3950";

    console.log(`Loading WASM`)

    const wasmFileUrl = debug
        ? `${urlPrefix}/webassembly/debug.wasm`
        : `${urlPrefix}/webassembly/release.wasm`

    const _module = await WebAssembly.compileStreaming(fetch(wasmFileUrl));
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


const wasmConsoleWarn = (message: string) => {
    console.warn("[WASM WARN]", message);
}

const window = globalThis as unknown as Window;
window.wasmConsoleLog = wasmConsoleLog; // used by wasmImports "console.log" callback as an external function of wasm
window.wasmConsoleWarn = wasmConsoleWarn; // used by wasmImports "console.warn" callback as an external function of wasm





export function getBytecodeArray(program: CompiledProgram, sectionName?: string): Map<u16, u8> {
    const code: Map<u16, u8> = new Map;

    for (const section of program.sections) {
        if (sectionName && section.name !== sectionName) continue;

        for (const entry of section.data) {
            code.set(entry.address as u16, entry.value as u8);
        }
    }

    return code;
}
