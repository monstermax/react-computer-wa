

import React, { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { Editor, type PrismEditor } from "prism-react-editor";
import { Link } from "wouter";

import "prism-react-editor/prism/languages/nasm";
import "prism-react-editor/languages/asm";
import "prism-react-editor/layout.css";
import "prism-react-editor/themes/github-dark.css";

import { toHex } from "@/lib/lib_numbers";
import { useEmulator, type EmulatorHook } from "@/hooks/useEmulator";
import { useDevice } from "@/hooks/useDevice";

import { MEMORY_MAP } from "@/../../web_assembly/src/memory_map";
import { compileCode, formatBytecode, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";

import { MemoryExplorer } from "@/components/playground/MemoryExplorer";
import { Keyboard, KeyboardDevice } from "@/components/devices/keyboard";
import { Console, ConsoleDevice } from "@/components/devices/console";
import { Screen, ScreenDevice } from "@/components/devices/screen";
import { Leds, LedsDevice } from "@/components/devices/leds";
import { Disk, DiskDevice } from "@/components/devices/disk";
import { DmaDevice } from "@/components/devices/dma";
import { FileModal } from "./FileModal";
import { Docs } from "./Docs";
import { Registers } from "./Registers";
import { SpeedDisplay } from "./SpeedDisplay";
import { ScreenCanvas, ScreenCanvasDevice } from "../devices/screen_canvas";
import { InterruptDevice } from "../devices/interrupt";

import type { u16, u8, u32 } from "@/types/computer.types";
import { InterruptTimerDevice } from "../devices/interrupt_timer";
import { BuzzerDevice } from "../devices/buzzer";
import { RngDevice } from "../devices/rng";
import { RtcDevice } from "../devices/rtc";


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


const defaultLoadAddress = '0xA000';



//  Default user code
const defaultCodeUrl = "/asm/user/examples/draw_fractal_on_screen.asm";


// ─────────────────────────────────────────────
//  Playground Component
// ─────────────────────────────────────────────
export const Playground: React.FC<{ autoStart?: boolean }> = (props) => {
    const { autoStart = true } = props;

    const clockFrequency = 100 as u32;   // nb tick per second
    const speedMultiplier = 0.5 * 10_000 as u32; // nb cycles per tick

    // ── Registers & Memory (on-demand only via Dump buttons, NOT synced per tick) ──
    const [registers8, setRegisters8] = useState<Record<string, u8>>({});
    const [registers16, setRegisters16] = useState<Record<string, u8 | u16 | bigint>>({});
    const [memory, setMemory] = useState<Uint8Array<ArrayBuffer> | null>(null);

    // ── Boot state ──
    const [devicesLoaded, setDevicesLoaded] = useState(false);
    const [bootloaderLoaded, setBootloaderLoaded] = useState(false);
    const [osDiskData, setOsDiskData] = useState<[u16, u8][] | null>(null);

    // ── Editor ──
    const editorRef = useRef<PrismEditor>(null);
    const [editorInitialContent, setEditorInitialContent] = useState("");
    const [machineCode, setMachineCode] = useState<string | null>(null);
    const [machineCodeLabels, setMachineCodeLabels] = useState<string | null>(null);
    const [bytecode, setBytecode] = useState<Map<u16, u8> | null>(null);
    const [editorContent, setEditorContent] = useState(editorInitialContent);
    const [loadAddress, setLoadAddress] = useState(defaultLoadAddress);
    const [editorError, setEditorError] = useState<string | null>(null);
    const [editorStatus, setEditorStatus] = useState<string | null>(null);
    const [isFileModalOpen, setIsFileModalOpen] = useState(false);

    // ── Logs ──
    const [activeTab, setActiveTab] = useState<'editor' | 'compiled' | 'labels' | 'log'>('editor');
    const [rightTab, setRightTab] = useState<'devices' | 'memory' | 'sources' | 'docs'>('devices');
    const [logs, setLogs] = useState<string[]>([]);
    const logEndRef = useRef<HTMLDivElement>(null);


    //  Logging
    const addLog = useCallback((msg: string) => {
        setLogs(prev => [...prev.slice(-300), `[${new Date().toLocaleTimeString()}] ${msg}`]);
    }, []);


    // ── Emulator ──
    const emulator = useEmulator({ clockFrequency, speedMultiplier, addLog });

    // ── Devices ──
    const keyboardDevice = useDevice<KeyboardDevice>(emulator.devicesManager, 'keyboard', KeyboardDevice, {})
    const consoleDevice = useDevice<ConsoleDevice>(emulator.devicesManager, 'console', ConsoleDevice, { width: 80, height: 25 });
    //const screenDevice = useDevice<ScreenDevice>(emulator.devicesManager, 'screen', ScreenDevice, {});
    const screenDevice = useDevice<ScreenCanvasDevice>(emulator.devicesManager, 'screen', ScreenCanvasDevice, { width: 32, height: 32, pixelSize: 8 });
    const ledsDevice = useDevice<LedsDevice>(emulator.devicesManager, 'leds', LedsDevice, {});
    const osDiskDevice = useDevice<DiskDevice>(emulator.devicesManager, 'os_disk', DiskDevice, { data: osDiskData });
    const userDiskDevice = useDevice<DiskDevice>(emulator.devicesManager, 'user_disk', DiskDevice, { data: [] });
    const dmaDevice = useDevice<DmaDevice>(emulator.devicesManager, 'dma', DmaDevice, { devicesRef: emulator.devicesManager.devicesRef, readRam: emulator.readRam, writeRam: emulator.writeRam });
    const interruptDevice = useDevice<InterruptDevice>(emulator.devicesManager, 'interrupt', InterruptDevice, {  });
    const timerDevice = useDevice<InterruptTimerDevice>(emulator.devicesManager, 'timer', InterruptTimerDevice, {  });
    const rtcDevice = useDevice<RtcDevice>(emulator.devicesManager, 'rtc', RtcDevice, {  });
    const rngDevice = useDevice<RngDevice>(emulator.devicesManager, 'rng', RngDevice, {  });
    const buzzerDevice = useDevice<BuzzerDevice>(emulator.devicesManager, 'buzzer', BuzzerDevice, {  });


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


    // Handle Logs Scroll
    useEffect(() => {
        //logEndRef.current?.scrollIntoView({ behavior: 'smooth' }); // TODO: a revoir: ca scroll la page entiere, à chaque nouveau caractere
    }, [logs]);


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
                keyboardDevice,
                consoleDevice,
                ledsDevice,
                screenDevice,
                osDiskDevice,
                userDiskDevice,
                dmaDevice,
                interruptDevice,
                timerDevice,
                rtcDevice,
                rngDevice,
                buzzerDevice,
            ]);

            setDevicesLoaded(true);
            addLog('Devices loaded (keyboard, console, leds, screen, os_disk, dma)');
        };

        const timer = setTimeout(_loadDevices, 100);
        return () => clearTimeout(timer);
    }, [emulator.computerPointer, osDiskData, devicesLoaded]);




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


    const dumpRegisters = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;
        setRegisters8(emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer));
        setRegisters16(emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer));
    };


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


    // ═══════════════════════════════════════════
    //  Editor: Compile & Load user code to RAM
    // ═══════════════════════════════════════════

    // Load default editor code
    useEffect(() => {
        const _fetch = async () => {
            const response = await fetch(defaultCodeUrl);
            const content = await response.text();
            setEditorInitialContent(content)
        }

        const timer = setTimeout(_fetch, 100);
        return () => clearTimeout(timer);
    }, []);

    const handleCompileEditorCode = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        setEditorError(null);
        setEditorStatus(null);

        const addr = parseInt(loadAddress);
        if (isNaN(addr) || addr < 0 || addr > 0xFFFF) {
            setEditorError('Invalid load address');
            return;
        }

        try {
            addLog(`Compiling user code... (target @ ${toHex(addr, 4)})`);

            const compiled = await compileCode(editorContent, CUSTOM_CPU, { startAddress: addr });

            if (compiled.errors.length > 0) {
                //const errMsg = compiled.errors.map(e => `Line ${e.line}: ${e.message}`).join('\n');
                //setEditorError(errMsg);
                setEditorError("Compilation failed");

                for (const error of compiled.errors) {
                    addLog(`Line ${error.line}: ${error.message}`);
                }

                addLog('User Compilation failed');
                return;
            }

            const machineCodeRaw: string = formatBytecode(compiled);
            const _machineCode = `// === MACHINE CODE ===\n\n[\n${machineCodeRaw.trim()}\n]`;
            setMachineCode(_machineCode)

            let _machineCodeLabels = "";
            _machineCodeLabels += "=== LABELS ===\n";
            compiled.labels.forEach((labelInfo, name) => {
                const labelAddress = labelInfo.address;
                _machineCodeLabels += `  ${name.padEnd(20)} : ${toHex(labelAddress, 4)} (line ${labelAddress} - section ${labelInfo.section})\n`;
            });
            _machineCodeLabels += "\n";
            setMachineCodeLabels(_machineCodeLabels)

            const _bytecode: Map<u16, u8> = getBytecodeArray(compiled);
            setBytecode(_bytecode)

            const msg = `Compiled ${_bytecode.size} bytes`;
            setEditorStatus(msg);
            addLog(msg);
            addLog(`You can load the compiled code in RAM with the "Load" button`);

        } catch (e: any) {
            setEditorError(e.message || 'Compilation error');
            addLog(`Error: ${e.message}`);
        }
    }


    const handleLoadEditorCodeInRam = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null || !bytecode) return;

        setEditorError(null);
        setEditorStatus(null);

        try {
            const addr = parseInt(loadAddress);
            if (isNaN(addr) || addr < 0 || addr > 0xFFFF) {
                setEditorError('Invalid load address');
                return;
            }

            // Write each byte to emulator RAM at the correct address
            for (const [offset, value] of bytecode.entries()) {
                emulator.writeRam(addr + offset as u16, value as u8);
            }

            const msg = `Loaded ${bytecode.size} bytes @ ${toHex(addr, 4)}`;
            setEditorStatus(msg);
            addLog(msg);
            addLog(`Type "custom" in the shell to run your code (call ${toHex(addr, 4)})`);

        } catch (e: any) {
            setEditorError(e.message || 'Load error');
            addLog(`Error: ${e.message}`);
        }
    }


    const handleEditorUpdate = (value: string, editor: PrismEditor) => {
        setEditorContent(value);
        setBytecode(null)
        setMachineCode(null)
    };


    const handleOpenAssemblyFile = async () => {
        setIsFileModalOpen(true)
    }


    const openAssemblyFileInEditor = async (filePath: string) => {
        const response = await fetch(`/asm/${filePath}`);
        const value = await response.text();
        setEditorInitialContent(value)
    }


    return (
        <div className="h-screen flex flex-col bg-[#0a0a0f] text-zinc-200 overflow-hidden"
            style={{ fontFamily: "'JetBrains Mono', 'Fira Code', 'SF Mono', monospace" }}>

            {/* ── Header ── */}
            <header className="flex items-center justify-between px-5 py-0 border-b border-zinc-800/80 bg-[#0d0d14] shrink-0">
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
                        disabled={emulator.clockStatus}
                        onClick={() => runCpuStep()}
                        className="px-3 py-1.5 text-xs rounded bg-blue-700 hover:bg-blue-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Step
                    </button>
                    <button
                        disabled={emulator.clockStatus}
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
                        onClick={() => emulator.resetComputer()}
                        className="ms-8 px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Reset
                    </button>
                </div>

                <SpeedDisplay emulator={emulator} />
            </header>


            {/* ── Main Content ── */}
            <div className="flex-1 flex overflow-hidden">

                {/* ══════ Left: ASM Editor Panel ══════ */}
                <div className="w-[700px] max-w-[50vw] flex flex-col border-r border-zinc-800/60 shrink-0">

                    {/* Editor Toolbar */}
                    <div className="flex items-center gap-2 px-4 py-2 border-b border-zinc-800/50 bg-[#0c0c13] shrink-0">
                        <button
                            onClick={() => handleOpenAssemblyFile()}
                            className="cursor-pointer px-3 bg-indigo-600 hover:bg-indigo-500 rounded"
                        >
                            Open File
                        </button>

                        <button
                            disabled={!editorContent}
                            onClick={handleCompileEditorCode}
                            className="ms-auto px-3.5 py-1.5 text-xs font-medium rounded bg-indigo-600 hover:bg-indigo-500 disabled:bg-zinc-700 text-white transition-colors cursor-pointer">
                            Compile
                        </button>

                        <button
                            disabled={!bytecode}
                            onClick={handleLoadEditorCodeInRam}
                            className="px-3.5 py-1.5 text-xs font-medium rounded bg-indigo-600 hover:bg-indigo-500 disabled:bg-zinc-700 text-white transition-colors cursor-pointer">
                            Load
                        </button>

                        <div className="flex items-center gap-1.5">
                            <label className="text-[10px] text-zinc-500 uppercase tracking-wider">@</label>
                            <input
                                value={loadAddress}
                                onChange={e => setLoadAddress(e.target.value)}
                                className="w-20 px-2 py-1 text-xs bg-zinc-900 border border-zinc-700/50 rounded text-zinc-300 focus:outline-none focus:border-indigo-500/60"
                            />
                        </div>
                    </div>

                    {/* Status / Error banners */}
                    {editorError && (
                        <div className="px-4 py-2 bg-red-950/60 border-b border-red-800/40 text-red-300 text-[11px] whitespace-pre-wrap">
                            {editorError}
                            <button onClick={() => setEditorError(null)} className="ml-3 text-red-500 hover:text-red-300 cursor-pointer">✕</button>
                        </div>
                    )}
                    {editorStatus && !editorError && (
                        <div className="px-4 py-1.5 bg-emerald-950/40 border-b border-emerald-800/30 text-emerald-300 text-[11px]">
                            {editorStatus}
                        </div>
                    )}

                    {/* Tabs: Editor / Log */}
                    <div className="flex border-b border-zinc-800/50 bg-[#0c0c13] shrink-0">
                        <button onClick={() => setActiveTab('editor')}
                            className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'editor' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Editor
                        </button>

                        <button onClick={() => setActiveTab('log')}
                            className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'log' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Log
                        </button>

                        {!!bytecode && (
                            <>
                                <button onClick={() => setActiveTab('compiled')}
                                    className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'compiled' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                        }`}>
                                    Compiled
                                </button>

                                <button onClick={() => setActiveTab('labels')}
                                    className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'labels' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                        }`}>
                                    Labels
                                </button>
                            </>
                        )}
                    </div>

                    {/* Editor / Log content */}
                    <div className={`flex-1 overflow-auto ${activeTab === 'editor' ? "" : "hidden"}`}>
                        <Editor
                            ref={editorRef}
                            className="h-full"
                            language="nasm"
                            value={editorInitialContent}
                            onUpdate={handleEditorUpdate}
                            tabSize={4}
                            insertSpaces={true}
                        >
                        </Editor>
                    </div>

                    <div className={`flex-1 overflow-auto ${activeTab === 'compiled' ? "" : "hidden"}`}>
                        <Editor
                            className="h-full"
                            language="nasm"
                            value={machineCode ?? ''}
                            tabSize={4}
                            insertSpaces={true}
                            readOnly
                        >
                        </Editor>
                    </div>

                    <div className={`flex-1 overflow-auto ${activeTab === 'labels' ? "" : "hidden"}`}>
                        <Editor
                            className="h-full"
                            language="nasm"
                            value={machineCodeLabels ?? ''}
                            tabSize={4}
                            insertSpaces={true}
                            readOnly
                        >
                        </Editor>
                    </div>

                    <div className={`flex-1 overflow-y-auto p-4 bg-[#08080d] text-[11px] leading-5 ${activeTab === 'log' ? "" : "hidden"}`}>
                        {logs.length === 0 ? (
                            <div className="text-zinc-600 italic">No logs yet.</div>
                        ) : (
                            logs.map((l, i) => (
                                <div key={i} className="text-zinc-400">{l}</div>
                            ))
                        )}
                        <div ref={logEndRef} />
                    </div>
                </div>

                {/* ══════ Right: Emulator ══════ */}
                <div className="flex-1 flex flex-col overflow-hidden">

                    {/* Right panel tabs */}
                    <div className="flex border-b border-zinc-800/50 bg-[#0c0c13] shrink-0">
                        <button onClick={() => setRightTab('devices')}
                            className={`px-4 py-2 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${rightTab === 'devices' ? 'text-zinc-200 border-b-2 border-emerald-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Devices
                        </button>

                        <button onClick={() => setRightTab('memory')}
                            className={`px-4 py-2 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${rightTab === 'memory' ? 'text-zinc-200 border-b-2 border-emerald-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Memory
                        </button>

                        {/*
                        <button onClick={() => setRightTab('sources')}
                            className={`px-4 py-2 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${rightTab === 'sources' ? 'text-zinc-200 border-b-2 border-emerald-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Sources
                        </button>
                        */}

                        <button onClick={() => setRightTab('docs')}
                            className={`px-4 py-2 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${rightTab === 'docs' ? 'text-zinc-200 border-b-2 border-emerald-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Docs
                        </button>


                        {/* ── Toolbar ── */}
                        <div className="ms-auto flex items-center gap-2 px-5 py-2 border-b border-zinc-800/60 bg-[#0b0b12] shrink-0 flex-wrap min-h-14">
                            {rightTab === 'memory' && (
                                <>
                                    <button onClick={() => dumpRam()}
                                        className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                        Dump RAM
                                    </button>

                                    <button onClick={() => dumpMemory()}
                                        className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                        Dump Wasm Memory
                                    </button>
                                </>
                            )}

                            {rightTab === 'devices' && (
                                <>
                                    <button onClick={() => dumpRegisters()}
                                        className="px-3 py-1 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                        Dump CPU State
                                    </button>
                                </>
                            )}
                        </div>
                    </div>

                    <div className={`flex-1 overflow-y-auto p-4 ${rightTab === 'devices' ? "" : "hidden"}`}>
                        {/* ── Row 1: Console + Screen ── */}
                        <div className="flex gap-3 mb-3">
                            {/* Console */}
                            <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] min-w-0">
                                <Console deviceInstance={consoleDevice.instance} />
                            </div>

                            {/* Screen */}
                            <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0">
                                <ScreenCanvas deviceInstance={screenDevice.instance} />
                            </div>
                        </div>

                        {/* ── Row 2: LEDs + Keyboard + CPU State ── */}
                        <div className="flex gap-3 mb-3 w-full">

                            <div className="flex-1 flex flex-col gap-3">
                                {/* Keyboard */}
                                <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] min-w-0 grow-0">
                                    <Keyboard deviceInstance={keyboardDevice.instance} />
                                </div>

                                {/* LEDs */}
                                <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                    <Leds deviceInstance={ledsDevice.instance} />
                                </div>
                            </div>

                            {/* CPU State */}
                            <div className="flex-1 ">
                                <div className="flex flex-col gap-3 grow-0 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                    <Registers registers8={registers8} registers16={registers16} />
                                </div>
                            </div>

                            {/* Disk ── */}
                            <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                <Disk deviceInstance={osDiskDevice.instance} />
                            </div>
                        </div>
                    </div>

                    <div className={`flex-1 overflow-y-auto p-4 ${rightTab === 'memory' ? "" : "hidden"}`}>
                        <MemoryExplorer
                            memory={memory}
                            offset={0x00}
                            bytesPerLine={16}
                            linesPerPage={16}
                            open={true}
                        />
                    </div>

                    <div className={`flex-1 overflow-y-auto p-4 text-sm leading-relaxed text-zinc-300 ${rightTab === 'sources' ? "" : "hidden"}`}>
                        TODO: files explorer
                    </div>

                    <div className={`flex-1 overflow-y-auto p-4 text-sm leading-relaxed text-zinc-300 ${rightTab === 'docs' ? "" : "hidden"}`}>
                        <Docs loadAddress={loadAddress} />
                    </div> {/* .docs */}

                </div>
            </div>


            <FileModal
                isOpen={isFileModalOpen}
                onClose={() => setIsFileModalOpen(false)}
                onSelectFile={openAssemblyFileInEditor}
            />
        </div>
    );
};



