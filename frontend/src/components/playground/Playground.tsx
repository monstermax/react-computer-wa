

import React, { useCallback, useEffect, useState } from "react";
import { Link } from "wouter";

import { MEMORY_MAP } from "@/../../web_assembly/src/memory_map";
import { compileCode, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";

import { useEmulator } from "@/hooks/useEmulator";
import { useDevice } from "@/hooks/useDevice";

import { ScreenCanvasDevice } from "../devices/screen_canvas";
import { InterruptDevice } from "../devices/interrupt";
import { InterruptTimerDevice } from "../devices/interrupt_timer";
import { BuzzerDevice } from "../devices/buzzer";
import { RngDevice } from "../devices/rng";
import { RtcDevice } from "../devices/rtc";
import { SwitchsDevice } from "../devices/switchs";
import { SpeakerDevice } from "../devices/speaker";
import { LcdDevice } from "../devices/lcd";

import { PanelRight } from "./PanelRight";
import { PanelLeft } from "./PanelLeft";
import { KeyboardDevice } from "@/components/devices/keyboard";
import { ConsoleDevice } from "@/components/devices/console";
import { ScreenDevice } from "@/components/devices/screen";
import { LedsDevice } from "@/components/devices/leds";
import { DiskDevice } from "@/components/devices/disk";
import { DmaDevice } from "@/components/devices/dma";
import { SpeedDisplay } from "./SpeedDisplay";

import type { u16, u8, u32 } from "@/types/computer.types";


declare global {
    interface Window {
        wasmConsoleLog: (message: string) => void;
        wasmConsoleWarn: (message: string) => void;
    }
}


const wasmConsoleLog = (message: string) => {
    let styles: string[] = [];

    //const message = __liftString(ptr);
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
window.wasmConsoleLog = wasmConsoleLog;


const wasmConsoleWarn = (message: string) => {
    console.warn("[WASM WARN]", message);
}
window.wasmConsoleWarn = wasmConsoleWarn;



// ─────────────────────────────────────────────
//  Playground Component
// ─────────────────────────────────────────────
export const Playground: React.FC<{ autoStart?: boolean }> = (props) => {
    const { autoStart = false } = props;

    // ── Clock ──
    const [clockFrequency, setClockFrequency] = useState(20 as u32);   // nb tick per second
    const [speedMultiplier, setSpeedMultiplier] = useState(10_000 as u32); // nb cycles per tick

    // ── Boot state ──
    const [devicesLoaded, setDevicesLoaded] = useState(false);
    const [bootloaderLoaded, setBootloaderLoaded] = useState(false);
    const [osDiskData, setOsDiskData] = useState<[u16, u8][] | null>(null);

    const [memory, setMemory] = useState<Uint8Array<ArrayBuffer> | null>(null);

    // ── Registers & Memory (on-demand only via Dump buttons, NOT synced per tick) ──
    const [registers8, setRegisters8] = useState<Record<string, u8>>({});
    const [registers16, setRegisters16] = useState<Record<string, u8 | u16 | bigint>>({});

    // ── Logs ──
    const [logs, setLogs] = useState<string[]>([]);

    //  Logging
    const addLog = useCallback((msg: string) => {
        setLogs(prev => [...prev.slice(-300), `[${new Date().toLocaleTimeString()}] ${msg}`]);
    }, []);

    const dumpRegisters = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;
        setRegisters8(emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer));
        setRegisters16(emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer));
    };


    // ── Emulator ──
    const emulator = useEmulator({ clockFrequency, speedMultiplier, addLog, dumpRegisters });

    // ── Devices ──
    const keyboardDeviceHook = useDevice<KeyboardDevice>(emulator.devicesManager, 'keyboard', KeyboardDevice, {})
    const consoleDeviceHook = useDevice<ConsoleDevice>(emulator.devicesManager, 'console', ConsoleDevice, { width: 80, height: 25 });
    const screenDeviceHook = useDevice<ScreenDevice>(emulator.devicesManager, 'screen', ScreenDevice, {});
    const screenHdDeviceHook = useDevice<ScreenCanvasDevice>(emulator.devicesManager, 'screen_hd', ScreenCanvasDevice, { width: 256, height: 256, pixelSize: 2 });
    const switchsDeviceHook = useDevice<SwitchsDevice>(emulator.devicesManager, 'switchs', SwitchsDevice, {});
    const ledsDeviceHook = useDevice<LedsDevice>(emulator.devicesManager, 'leds', LedsDevice, {});
    const osDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'os_disk', DiskDevice, { data: osDiskData });
    const userDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'user_disk', DiskDevice, { persistent: true });
    const dmaDeviceHook = useDevice<DmaDevice>(emulator.devicesManager, 'dma', DmaDevice, { devicesRef: emulator.devicesManager.devicesRef, readRam: emulator.readRam, writeRam: emulator.writeRam });
    const interruptDeviceHook = useDevice<InterruptDevice>(emulator.devicesManager, 'interrupt', InterruptDevice, {});
    const timerDeviceHook = useDevice<InterruptTimerDevice>(emulator.devicesManager, 'timer', InterruptTimerDevice, {});
    const rtcDeviceHook = useDevice<RtcDevice>(emulator.devicesManager, 'rtc', RtcDevice, {});
    const rngDeviceHook = useDevice<RngDevice>(emulator.devicesManager, 'rng', RngDevice, {});
    const buzzerDeviceHook = useDevice<BuzzerDevice>(emulator.devicesManager, 'buzzer', BuzzerDevice, {});
    const speakerDeviceHook = useDevice<SpeakerDevice>(emulator.devicesManager, 'speaker', SpeakerDevice, { pollsPerMs: 20 });
    const lcdDeviceHook = useDevice<LcdDevice>(emulator.devicesManager, 'lcd', LcdDevice, {});


    // Prevent GUI Tab key
    useEffect(() => {
        const setupKeydownEvent = (event: KeyboardEvent) => {
            if (event.key == "Tab") {
                event.preventDefault();
            }
        }

        const setupBeforeUnloadEvent = (event: BeforeUnloadEvent) => {
            if (document.activeElement?.id === 'device-keyboard') {
                event.preventDefault();

                var confirmationMessage = "\\o/";
                event.returnValue = confirmationMessage; // Gecko, Trident, Chrome 34+
                return confirmationMessage; // Gecko, WebKit, Chrome <34
            }
        }

        window.addEventListener("keydown", setupKeydownEvent)
        window.addEventListener("beforeunload", setupBeforeUnloadEvent)

        return () => {
            window.removeEventListener("keydown", setupKeydownEvent)
            window.removeEventListener("beforeunload", setupBeforeUnloadEvent)
        }
    }, []);


    //  Auto-start the clock when bootloader + devices ready
    useEffect(() => {
        if (!autoStart || !emulator.computerPointer || !devicesLoaded || !bootloaderLoaded) return;
        emulator.startClock();
    }, [emulator.computerPointer, devicesLoaded, bootloaderLoaded]);


    // Load bootloader ROM when computer is instanciated
    useEffect(() => {
        if (!emulator.computerPointer) return;
        const bootloaderFileUrl = "bootloader/bootloader_v2.asm";
        const timer = setTimeout(() => loadBootloader(bootloaderFileUrl), 100);
        return () => clearTimeout(timer);
    }, [emulator.computerPointer]);


    // Load bootloader
    const loadBootloader = async (bootloaderFileUrl: string) => {
        if (!emulator.wasmExports || !emulator.computerPointer || !emulator.devicesManager.devicesRef.current) return;

        const sourceCode = await loadSourceCodeFromFile(bootloaderFileUrl);
        const compiled = await compileCode(sourceCode, CUSTOM_CPU);

        if (compiled.errors.length > 0) {
            const errMsg = compiled.errors.map(e => `Line ${e.line}: ${e.message}`).join('\n');
            console.warn(`Bootloader Compilation errors:`, errMsg)
            throw new Error();
        }

        const size = emulator.loadBootloader(compiled)
        setBootloaderLoaded(true);
        addLog(`Bootloader loaded (${size} bytes)`);
    };


    // Compile OS Code on component mount
    useEffect(() => {
        const _compile = async () => {
            const diskData = await compileAndLoadOsCode();
            setOsDiskData(diskData);
        }

        const timer = setTimeout(_compile, 100)
        return () => clearTimeout(timer);
    }, [])



    const handleResetComputer = async () => {
        // Reload OS on OS_DISK
        if (osDiskDeviceHook.instance) {
            const diskData = await compileAndLoadOsCode();
            setOsDiskData(diskData);

            osDiskDeviceHook.instance.loadRawData(new Map(diskData))
        }

        // Reset Computer
        emulator.resetComputer()
    }


    // Compile OS Code
    const compileAndLoadOsCode = async () => {
        const startAddress = MEMORY_MAP.OS_START;
        const sourceCode = await loadSourceCodeFromFile('os/os_v3.asm');
        const compiled = await compileCode(sourceCode, CUSTOM_CPU, { startAddress });

        if (compiled.errors.length > 0) {
            const errMsg = compiled.errors.map(e => `Line ${e.line}: ${e.message}`).join('\n');
            console.warn(`OS Compilation errors:`, errMsg)
            throw new Error();
        }

        const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
        const byteCodeArr = Array.from(byteCodeMap);
        const data = byteCodeArr ?? [];

        return data;
    }


    //  Load devices when computer is instanciated
    useEffect(() => {
        if (!emulator.computerPointer || !osDiskData || devicesLoaded) return;

        const _loadDevices = async () => {
            emulator.addDevicesToComputer([
                keyboardDeviceHook,
                consoleDeviceHook,
                ledsDeviceHook,
                screenDeviceHook,
                osDiskDeviceHook,
                userDiskDeviceHook,
                dmaDeviceHook,
                interruptDeviceHook,
                timerDeviceHook,
                rtcDeviceHook,
                rngDeviceHook,
                buzzerDeviceHook,
                switchsDeviceHook,
                screenHdDeviceHook,
                speakerDeviceHook,
                lcdDeviceHook,
            ]);

            setDevicesLoaded(true);
            addLog('Devices loaded (keyboard, console, leds, screen, os_disk, dma)');
        };

        const timer = setTimeout(_loadDevices, 100);
        return () => clearTimeout(timer);
    }, [emulator.computerPointer, osDiskData, devicesLoaded]);


    const dumpMemory = () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;
        const memoryUint8Array = new Uint8Array(emulator.wasmExports.memory.buffer);
        setMemory(memoryUint8Array);
    };


    const dumpRam = () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        const start = 0x0000;
        const end = MEMORY_MAP.RAM_END;
        const memoryUint8Array = new Uint8Array(1 + end - start);

        try {
            for (let address = start; address <= end; address++) {
                const value = emulator.wasmExports.computerGetMemory(emulator.computerPointer, address as u16);
                memoryUint8Array[address] = value;
            }

            setMemory(memoryUint8Array);

        } catch (err: any) {
            emulator.wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // ════════════════════════
    //  Clock & Cycle controls 
    // ════════════════════════

    const runCpuStep = () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        const controlBefore = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        const dataBefore = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        console.log('BEFORE', controlBefore, dataBefore);

        emulator.runCycles(1);

        const controlAfter = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        const dataAfter = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        console.log('AFTER', controlAfter, dataAfter);

        dumpRegisters()
    };


    return (
        <div className="h-screen flex flex-col bg-[#0a0a0f] text-zinc-200 overflow-hidden"
            style={{ fontFamily: "'JetBrains Mono', 'Fira Code', 'SF Mono', monospace" }}>

            {/* ── Header ── */}
            <header className="flex items-center px-5 py-0 border-b border-zinc-800/80 bg-[#0d0d14] shrink-0">
                <div className="flex items-center gap-3">
                    <Link to="/" className="flex gap-2 items-center">
                        <div className="w-2.5 h-2.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.6)]" />
                        <span className="text-sm font-semibold tracking-wider text-zinc-300 uppercase">
                            8-bit Playground
                        </span>
                    </Link>
                    <span className="text-[10px] px-2 py-0.5 rounded bg-zinc-800 text-zinc-500 tracking-wider">v3</span>
                </div>

                {/* ── Toolbar ── */}
                <div className="flex items-center gap-2 px-5 py-2 border-b border-zinc-800/60 bg-[#0b0b12] shrink-0 flex-wrap">
                    {/* Emulator controls */}
                    <button
                        disabled={emulator.clockStatus || emulator.cpuHalted}
                        onClick={() => runCpuStep()}
                        className="px-3 py-1.5 text-xs rounded bg-blue-700 hover:bg-blue-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Step
                    </button>
                    <button
                        disabled={emulator.clockStatus || emulator.cpuHalted}
                        onClick={() => emulator.startClock()}
                        className="px-3 py-1.5 text-xs rounded bg-emerald-700 hover:bg-emerald-600 disabled:bg-zinc-700 text-white transition-colors cursor-pointer"
                    >
                        Start
                    </button>
                    <button
                        disabled={!emulator.clockStatus}
                        onClick={() => emulator.stopClock()}
                        className="px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Stop
                    </button>

                    <button
                        disabled={false}
                        onClick={() => handleResetComputer()}
                        className="ms-8 px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Reset
                    </button>
                </div>

                <div className="ms-auto me-4 flex gap-4 text-sm">
                    <div className="flex gap-1">
                        <div>Tick Freq</div>

                        <input
                            type="number"
                            min={1}
                            max={1000}
                            step={1}
                            className="w-16 bg-background-light px-1 rounded text-end"
                            value={clockFrequency}
                            onChange={(event) => setClockFrequency(Number(event.target.value) as u32)}
                        />
                    </div>

                    <div className="flex gap-1">
                        <div>Speed Multiplier</div>

                        <input
                            type="number"
                            min={1}
                            max={10_000}
                            step={1}
                            className="w-16 bg-background-light px-1 rounded text-end"
                            value={speedMultiplier}
                            onChange={(event) => setSpeedMultiplier(Number(event.target.value) as u32)}
                        />
                    </div>
                </div>

                <SpeedDisplay emulator={emulator} />
            </header>


            {/* ── Main Content ── */}
            <div className="flex-1 flex overflow-hidden">

                {/* ══════ Left: ASM Editor Panel ══════ */}
                <div className="w-[700px] max-w-[30vw] flex flex-col border-r border-zinc-800/60 shrink-0">
                    <PanelLeft
                        emulator={emulator}
                        logs={logs}
                        addLog={addLog}
                        />
                </div>

                {/* ══════ Right: Emulator ══════ */}
                <div className="flex-1 flex flex-col overflow-hidden">
                    <PanelRight
                        emulator={emulator}
                        registers8={registers8}
                        registers16={registers16}
                        memory={memory}
                        dumpMemory={dumpMemory}
                        dumpRam={dumpRam}
                        setMemory={setMemory}
                        />
                </div>
            </div>

        </div>
    );
};

