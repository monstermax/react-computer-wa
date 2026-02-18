
import { useEffect, useRef, useState } from "react";

import { getBytecodeArray } from "@/compiler/compiler_utils";
import { deviceTypeFromString, useDevicesManager, type DeviceHook, type DevicesManagerHook } from "./useDevice";
import { Clock } from "@/components/devices/clock";

import * as releaseModule from "@/../public/web_assembly/release";

import type { u32, u8, u16 } from "@/types/computer.types";
import type { CompiledProgram } from "@/types/compiler.types";
import type { IoDevice } from "@/components/devices/IoDevice";
import type { InterruptTimerDevice } from "@/components/devices/interrupt_timer";
import { delayer } from "@/lib/lib_delayer";



export type WasmExports = typeof releaseModule.__AdaptedExports;


export type useEmulatorParams = {
    clockFrequency: u32;
    speedMultiplier: u32;
    dumpRegisters: () => Promise<void>
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

    const jsIoRead = (deviceIdx: u8, port: u8): u8 => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        return device.read(port);
    };


    const jsIoWrite = (deviceIdx: u8, port: u8, value: u8): void => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.write(port, value);
    };


    const jsIoReset = (deviceIdx: u8): void => {
        if (!devicesManager.devicesRef.current) throw new Error("missing devices ref");
        const device = devicesManager.devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.reset();
    }


    const jsCpuHalted = (): void => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0
        setCpuHalted(true)
        addLog('CPU halted');
    };

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
                    wasmExports.computerRunCycles(computerPointer, speedMultiplier);

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
                        timer.write(0x03 as u8, 0 as u8) // declenche le tick du timer
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


    const startClock = () => {
        addLog('Clock started')
        clock.start();
        setClockStatus(true)
    }


    const stopClock = () => {
        clock.stop();
        setClockStatus(false)
        cyclesPerSecondRef.current = 0
        addLog('Clock stopped')
    }


    const runCycles = (cyclesCount=1) => {
        if (!wasmExports || computerPointer === null) return;

        try {
            wasmExports.computerRunCycles(computerPointer, cyclesCount);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    const resetComputer = () => {
        if (!wasmExports || computerPointer === null) return;

        try {
            wasmExports.computerResetComputer(computerPointer)

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    }


    // ═══════════════════════════════════════════
    //  Register & memory dump (on demand only)
    // ═══════════════════════════════════════════

    const readControlRegisters = (wasmExports: WasmExports, computerPtr: releaseModule.__Internref4) => {
        try {
            return {
                cycles: wasmExports.computerGetCycles(computerPtr),
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
        setClockStatus(false)
        cyclesPerSecondRef.current = 0

        error.message = "[WASM ERROR] " + error.message;
        throw error;
    }


    // Load code

    // Load bootloader
    const loadBootloader = (compiled: CompiledProgram): number => {
        if (!wasmExports || !computerPointer || !devicesManager.devicesRef.current) return 0;

        const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
        const byteCodeArr = Array.from(byteCodeMap);
        const values = new Uint8Array(byteCodeArr.map(r => r[1]));

        const valPtr = wasmExports.allocate(values.length);
        new Uint8Array(wasmExports.memory.buffer).set(values, valPtr);

        try {
            wasmExports.computerloadCode(computerPointer, valPtr, values.length);
            return values.length;

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
        cpuHalted,
        addDevicesToComputer,
        runCycles,
        setClockStatus,
        startClock,
        stopClock,
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
    cyclesPerSecondRef: React.RefObject<number>;
    clockStatus: boolean;
    devicesManager: DevicesManagerHook;
    cpuHalted: boolean;
    addDevicesToComputer: (deviceHooks: DeviceHook<IoDevice>[]) => void;
    runCycles: (cyclesCount?: number) => void;
    setClockStatus: (value: React.SetStateAction<boolean>) => void;
    startClock: () => void;
    stopClock: () => void;
    readControlRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { cycles: bigint, PC: u16, SP: u16, IR: u8 };
    readDataRegisters: (wasmExports: typeof releaseModule.__AdaptedExports, computerPtr: releaseModule.__Internref4) => { A: u8, B: u8, C: u8, D: u8, E: u8, F: u8 };
    readRam: (address: u16) => u8;
    writeRam: (address: u16, value: u8) => void;
    resetComputer: () => void;
    loadBootloader: (compiled: CompiledProgram) => number;
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

