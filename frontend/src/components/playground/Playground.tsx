

import React, { useCallback, useEffect, useRef, useState } from "react";
import { Editor, type PrismEditor } from "prism-react-editor";
import { Link } from "wouter";

import "prism-react-editor/prism/languages/nasm";
import "prism-react-editor/languages/asm";
import "prism-react-editor/layout.css";
import "prism-react-editor/themes/github-dark.css";

import { toHex } from "@/lib/lib_numbers";

import { MEMORY_MAP } from "@/../../web_assembly/src/memory_map";
import { compileCode, formatBytecode, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";

import { MemoryExplorer } from "@/components/playground/MemoryExplorer";
import { IoDevice } from "@/components/devices/IoDevice";
import { Keyboard, KeyboardDevice } from "@/components/devices/keyboard";
import { Console, ConsoleDevice } from "@/components/devices/console";
import { Clock } from "@/components/devices/clock";
import { Screen, ScreenDevice } from "@/components/devices/screen";
import { Leds, LedsDevice } from "@/components/devices/leds";
import { Disk, DiskDevice } from "@/components/devices/disk";
import { DmaDevice } from "@/components/devices/dma";
import { FileModal } from "./FileModal";
import { Docs } from "./Docs";
import { Registers } from "./Registers";

import * as releaseModule from "@/../public/web_assembly/release";

import type { u16, u8, u32 } from "@/types/computer.types";


declare global {
    interface Window {
        wasmConsoleLog: (message: string) => void;
        wasmConsoleWarn: (message: string) => void;
    }
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



type WasmExports = typeof releaseModule.__AdaptedExports;


const defaultLoadAddress = '0xA000';


//  Default user code
const defaultCodeUrl = "/asm/examples/draw_fractal_on_screen.asm";
//const DEFAULT_CODE = "" // await import(`@/../public/asm/examples/draw_fractal_on_screen.asm?url`)


// ─────────────────────────────────────────────
//  Playground Component
// ─────────────────────────────────────────────

export const Playground: React.FC<{ autoStart?: boolean }> = (props) => {
    const { autoStart = false } = props;

    // ── Wasm ──
    const wasmExportsRef = useRef<WasmExports | null>(null);
    const [computerPointer, setComputerPointer] = useState<releaseModule.__Internref4 | null>(null);

    // ── Clock ──
    const clockFrequency = 10 as u32;
    const speedFactor = 100 as u32;
    const [clock] = useState(() => new Clock(clockFrequency));
    const [cyclesPerSecond, setCyclesPerSecond] = useState(0);

    // ── Registers & Memory (on-demand only via Dump buttons, NOT synced per tick) ──
    const [registers8, setRegisters8] = useState<Record<string, u8>>({});
    const [registers16, setRegisters16] = useState<Record<string, u8 | u16 | bigint>>({});
    const [memory, setMemory] = useState<Uint8Array<ArrayBuffer> | null>(null);

    // ── Devices (ALL of them, same as TestV3Component) ──
    const devicesRef = useRef<Map<number, IoDevice>>(new Map);
    const [keyboardDevice, setKeyboardDevice] = useState<KeyboardDevice | null>(null);
    const [consoleDevice, setConsoleDevice] = useState<ConsoleDevice | null>(null);
    const [screenDevice, setScreenDevice] = useState<ScreenDevice | null>(null);
    const [ledsDevice, setLedsDevice] = useState<LedsDevice | null>(null);
    const [diskDevice, setDiskDevice] = useState<DiskDevice | null>(null);
    const [dmaDevice, setDmaDevice] = useState<DmaDevice | null>(null);

    // ── Boot state ──
    const [devicesLoaded, setDevicesLoaded] = useState(false);
    const [bootloaderLoaded, setBootloaderLoaded] = useState(false);

    // ── Editor ──
    const editorRef = useRef<PrismEditor>(null);
    const [initialContent, setInitialContent] = useState("");
    const [machineCode, setMachineCode] = useState<string | null>(null);
    const [machineCodeLabels, setMachineCodeLabels] = useState<string | null>(null);
    const [bytecode, setBytecode] = useState<Map<u16, u8> | null>(null);
    const [editorContent, setEditorContent] = useState(initialContent);
    const [loadAddress, setLoadAddress] = useState(defaultLoadAddress);
    const [editorError, setEditorError] = useState<string | null>(null);
    const [editorStatus, setEditorStatus] = useState<string | null>(null);

    // ── Log ──
    const [activeTab, setActiveTab] = useState<'editor' | 'compiled' | 'labels' | 'log'>('editor');
    const [rightTab, setRightTab] = useState<'devices' | 'memory' | 'sources' | 'docs'>('devices');
    const [logs, setLogs] = useState<string[]>([]);
    const logEndRef = useRef<HTMLDivElement>(null);

    const [clockStatus, setClockStatus] = useState(false);
    const [isFileModalOpen, setIsFileModalOpen] = useState(false);


    // Load default editor code
    useEffect(() => {
        const _fetch = async () => {
            const response = await fetch(defaultCodeUrl);
            const content = await response.text();
            setInitialContent(content)
        }

        const timer = setTimeout(_fetch, 100);
        return () => clearTimeout(timer);
    }, []);


    // prevent Tab key
    useEffect(() => {
        const setupKeydownEvent = (event: KeyboardEvent) => {
            if (event.key == "Tab") {
                event.preventDefault();
            }
        }

        window.addEventListener("keydown", setupKeydownEvent)
    }, []);


    // ═══════════════════════════════════════════
    //  Logging
    // ═══════════════════════════════════════════

    const addLog = useCallback((msg: string) => {
        setLogs(prev => [...prev.slice(-300), `[${new Date().toLocaleTimeString()}] ${msg}`]);
    }, []);


    useEffect(() => {
        logEndRef.current?.scrollIntoView({ behavior: 'smooth' });
    }, [logs]);


    //  Auto-start when bootloader + devices ready
    useEffect(() => {
        if (!autoStart || !computerPointer || !devicesLoaded || !bootloaderLoaded) return;
        startClock();
    }, [computerPointer, devicesLoaded, bootloaderLoaded]);


    //  Init WASM 
    useEffect(() => {
        const _initWasm = async () => {
            if (wasmExportsRef.current) return;

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
            wasmExportsRef.current = _wasmExports;
            //window.wasm = _wasmExports.instance;

            console.log({ wasm: _wasmExports })

            try {
                const _computerPointer = _wasmExports.instanciateComputer();
                setComputerPointer(_computerPointer);

                addLog('Emulator initialized');

            } catch (err: any) {
                console.error('[WASM ERROR]', err)
            }

        };

        const timer = setTimeout(_initWasm, 100);
        return () => clearTimeout(timer);
    }, []);


    //  Load bootloader ROM 
    useEffect(() => {
        if (!computerPointer) return;
        const timer = setTimeout(loadBootloader, 100);
        return () => clearTimeout(timer);
    }, [computerPointer]);


    //  Load devices 
    useEffect(() => {
        if (!computerPointer) return;

        const _loadDevices = () => {
            addDevice('keyboard', 'input', '', '');
            addDevice('console', 'output', '', '');
            addDevice('leds', 'output', '', '');
            addDevice('screen', 'output', '', '');
            addDevice('os_disk', 'storage', '', '');
            addDevice('dma', 'system', '', '');
            setDevicesLoaded(true);
            addLog('Devices loaded (keyboard, console, leds, screen, os_disk, dma)');
        };

        const timer = setTimeout(_loadDevices, 100);
        return () => clearTimeout(timer);
    }, [computerPointer]);


    //  Init clock (speed measurement only, NO register/memory sync)
    useEffect(() => {
        if (!computerPointer) return;

        const _initClock = () => {
            let lastCycles = 0n;
            let lastCyclesDate = Date.now();

            clock.on('tick', () => {
                if (wasmExportsRef.current && computerPointer) {
                    const wasmExports = wasmExportsRef.current;

                    try {
                        // Run cycles
                        wasmExports.computerRunCycles(computerPointer, speedFactor);

                    } catch (err: any) {
                        wasmError(err);
                        throw new Error("Unreachable Error");
                    }

                    try {
                        // Compute speed only
                        const newCycles = wasmExports.computerGetCycles(computerPointer);
                        const diff = newCycles - lastCycles;
                        const duration = Date.now() - lastCyclesDate;
                        const _cyclesPerSecond = 1000 * Number(diff) / duration;
                        setCyclesPerSecond(_cyclesPerSecond);

                        lastCycles = newCycles;
                        lastCyclesDate = Date.now();

                    } catch (err: any) {
                        wasmError(err);
                        throw new Error("Unreachable Error");
                    }
                }
            });
        };

        const timer = setTimeout(_initClock, 100);
        return () => clearTimeout(timer);
    }, [computerPointer]);


    const wasmError = (error: Error) => {
        clock.stop();
        setClockStatus(false)
        setCyclesPerSecond(0)

        error.message = "[WASM ERROR] " + error.message;
        throw error;
    }


    const handleOpenFile = async () => {
        setIsFileModalOpen(true)
    }


    const openFile = async (filePath: string) => {
        const response = await fetch(`/asm/${filePath}`);
        const value = await response.text();
        setInitialContent(value)
    }


    // ═══════════════
    //  I/O callbacks 
    // ═══════════════

    const jsIoRead = (deviceIdx: u8, port: u8): u8 => {
        if (!devicesRef.current) throw new Error("missing devices ref");
        const device = devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        return device.read(port);
    };


    const jsIoWrite = (deviceIdx: u8, port: u8, value: u8): void => {
        if (!devicesRef.current) throw new Error("missing devices ref");
        const device = devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.write(port, value);
    };


    const jsIoReset = (deviceIdx: u8): void => {
        if (!devicesRef.current) throw new Error("missing devices ref");
        const device = devicesRef.current.get(deviceIdx);
        if (!device) throw new Error(`device #${deviceIdx} not found`);
        device.reset();
    }


    const jsCpuHalted = (): void => {
        clock.stop();
        setClockStatus(false)
        setCyclesPerSecond(0)
        addLog('CPU halted');
    };

    const jsCpuBreakpoint = (): void => {
        clock.stop();
        setClockStatus(false)
        setCyclesPerSecond(0)
        addLog('CPU Breakpoint');
    };


    //  WASM string helper
    function __liftString(ptr: number) { // source: release.js
        if (!ptr) return null;
        if (!wasmExportsRef.current) throw new Error("wasm not found in readString");
        const wasmExports = wasmExportsRef.current;
        const memory = wasmExports.memory as WebAssembly.Memory;

        const end = ptr + new Uint32Array(memory.buffer)[ptr - 4 >>> 2] >>> 1;
        const memoryU16 = new Uint16Array(memory.buffer);

        let start = ptr >>> 1;
        let string = "";
        while (end - start > 1024) string += String.fromCharCode(...memoryU16.subarray(start, start += 1024));
        return string + String.fromCharCode(...memoryU16.subarray(start, end));
    }


    //  Load bootloader 
    const loadBootloader = async () => {
        if (!wasmExportsRef.current || !computerPointer || !devicesRef.current) return;

        const wasmExports = wasmExportsRef.current;

        const sourceCode = await loadSourceCodeFromFile("bootloader/bootloader_v2.asm");
        const compiled = await compileCode(sourceCode, CUSTOM_CPU);

        if (compiled.errors.length > 0) {
            const errMsg = compiled.errors.map(e => `Line ${e.line}: ${e.message}`).join('\n');
            console.warn(`Bootloader Compilation errors:`, errMsg)
            throw new Error();
        }

        const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
        const byteCodeArr = Array.from(byteCodeMap);
        const values = new Uint8Array(byteCodeArr.map(r => r[1]));

        const valPtr = wasmExports.allocate(values.length);
        new Uint8Array(wasmExports.memory.buffer).set(values, valPtr);

        try {
            wasmExports.computerloadCode(computerPointer, valPtr, values.length);

            setBootloaderLoaded(true);
            addLog(`Bootloader loaded (${values.length} bytes)`);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    //  Add device
    const addDevice = async (name: string, type: string, vendor = '', model = '') => {
        if (!wasmExportsRef.current || !computerPointer || !devicesRef.current) return;

        const wasmExports = wasmExportsRef.current;

        let typeId = 1 as u8;
        const nameBuffer = new TextEncoder().encode(name);
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

        if (name === 'keyboard') {
            const device = new KeyboardDevice(deviceIdx, 'keyboard', { type: 'input', vendor, model });
            devicesRef.current.set(deviceIdx, device);
            setKeyboardDevice(device);

        } else if (name === 'console') {
            const { width, height } = { width: 80, height: 25 };
            const device = new ConsoleDevice(deviceIdx, 'console', { type: 'output', vendor, model, width, height });
            devicesRef.current.set(deviceIdx, device);
            setConsoleDevice(device);

        } else if (name === 'screen') {
            const device = new ScreenDevice(deviceIdx, 'screen', { type: 'output', vendor, model });
            devicesRef.current.set(deviceIdx, device);
            setScreenDevice(device);

        } else if (name === 'leds') {
            const device = new LedsDevice(deviceIdx, 'leds', { type: 'output', vendor, model });
            devicesRef.current.set(deviceIdx, device);
            setLedsDevice(device);

        } else if (name === 'dma') {
            const device = new DmaDevice(deviceIdx, 'dma', { type: 'system', vendor, model, devicesRef, readRam, writeRam });
            devicesRef.current.set(deviceIdx, device);
            setDmaDevice(device);

        } else if (name === 'os_disk') {
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

            const device = new DiskDevice(deviceIdx, 'os_disk', { type: 'storage', vendor, model, data });
            devicesRef.current.set(deviceIdx, device);
            setDiskDevice(device);

        } else {
            const device = new IoDevice(deviceIdx, name, { type });
            devicesRef.current.set(deviceIdx, device);
        }
    };


    // RAM Read
    const readRam = (address: u16): u8 => {
        if (!wasmExportsRef.current || computerPointer === null) return 0 as u8;
        const wasmExports = wasmExportsRef.current;

        try {
            return wasmExports.computerGetMemory(computerPointer, address) as u8;

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // RAM Write
    const writeRam = (address: u16, value: u8) => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;
        //console.log(`write ram @ ${toHex(address, 4)} : ${toHex(value)} (${value})`)

        try {
            wasmExports.computerSetMemory(computerPointer, address, value);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // ════════════════
    //  Clock controls 
    // ════════════════

    const startClock = () => {
        clock.start();
        setClockStatus(true)
    }

    const stopClock = () => {
        clock.stop();
        setClockStatus(false)
        setCyclesPerSecond(0)
    }


    const runCycle = () => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;

        const controlBefore = readControlRegisters(wasmExports, computerPointer);
        const dataBefore = readDataRegisters(wasmExports, computerPointer);
        console.log('BEFORE', controlBefore, dataBefore);

        try {
            wasmExports.computerRunCycles(computerPointer, 1);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }

        const controlAfter = readControlRegisters(wasmExports, computerPointer);
        const dataAfter = readDataRegisters(wasmExports, computerPointer);
        console.log('AFTER', controlAfter, dataAfter);

        dumpRegisters()
    };


    const resetComputer = () => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;

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

    const dumpRegisters = async () => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;
        setRegisters8(readDataRegisters(wasmExports, computerPointer));
        setRegisters16(readControlRegisters(wasmExports, computerPointer));
    };

    const dumpMemory = () => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;
        const memoryUint8Array = new Uint8Array(wasmExports.memory.buffer);
        setMemory(memoryUint8Array);
    };

    const dumpRam = () => {
        if (!wasmExportsRef.current || computerPointer === null) return;
        const wasmExports = wasmExportsRef.current;
        const start = 0x0000;
        const end = MEMORY_MAP.RAM_END;
        const memoryUint8Array = new Uint8Array(1 + end - start);

        try {
            for (let address = start; address <= end; address++) {
                const value = wasmExports.computerGetMemory(computerPointer, address as u16);
                memoryUint8Array[address] = value;
            }

            setMemory(memoryUint8Array);

        } catch (err: any) {
            wasmError(err);
            throw new Error("Unreachable Error");
        }
    };


    // ═══════════════════════════════════════════
    //  Editor: Compile & Load user code to RAM
    // ═══════════════════════════════════════════

    const handleCompile = async () => {
        if (!wasmExportsRef.current || computerPointer === null) return;

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


    const handleLoad = async () => {
        if (!wasmExportsRef.current || computerPointer === null || !bytecode) return;

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
                writeRam(addr + offset as u16, value as u8);
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
                        disabled={clockStatus}
                        onClick={() => runCycle()}
                        className="px-3 py-1.5 text-xs rounded bg-blue-700 hover:bg-blue-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Step
                    </button>
                    <button
                        disabled={clockStatus}
                        onClick={() => startClock()}
                        className="px-3 py-1.5 text-xs rounded bg-emerald-700 hover:bg-emerald-600 disabled:bg-zinc-700 text-white transition-colors cursor-pointer"
                    >
                        Start
                    </button>
                    <button
                        disabled={!clockStatus}
                        onClick={() => stopClock()}
                        className="px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Stop
                    </button>

                    <button
                        disabled={false}
                        onClick={() => resetComputer()}
                        className="ms-8 px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                    >
                        Reset
                    </button>
                </div>

                <div className="flex items-center gap-4 text-xs text-zinc-500 min-w-48 justify-end">
                    <div>Speed: </div>
                    {!clockStatus && (
                        <div>Stopped</div>
                    )}
                    {clockStatus && (cyclesPerSecond < 10) && (
                        <div>{Math.round(10 * cyclesPerSecond) / 10}/sec.</div>
                    )}
                    {clockStatus && (cyclesPerSecond >= 10) && (
                        <div>{Math.round(cyclesPerSecond)}/sec.</div>
                    )}
                </div>
            </header>


            {/* ── Main Content ── */}
            <div className="flex-1 flex overflow-hidden">

                {/* ══════ Left: ASM Editor Panel ══════ */}
                <div className="w-[700px] max-w-[50vw] flex flex-col border-r border-zinc-800/60 shrink-0">

                    {/* Editor Toolbar */}
                    <div className="flex items-center gap-2 px-4 py-2 border-b border-zinc-800/50 bg-[#0c0c13] shrink-0">
                        <button
                            onClick={() => handleOpenFile()}
                            className="cursor-pointer px-3 bg-indigo-600 hover:bg-indigo-500 rounded"
                        >
                            Open File
                        </button>

                        <button
                            disabled={!editorContent}
                            onClick={handleCompile}
                            className="ms-auto px-3.5 py-1.5 text-xs font-medium rounded bg-indigo-600 hover:bg-indigo-500 disabled:bg-zinc-700 text-white transition-colors cursor-pointer">
                            Compile
                        </button>

                        <button
                            disabled={!bytecode}
                            onClick={handleLoad}
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
                            value={initialContent}
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
                                <Console deviceInstance={consoleDevice} />
                            </div>

                            {/* Screen */}
                            <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0">
                                <Screen deviceInstance={screenDevice} />
                            </div>
                        </div>

                        {/* ── Row 2: LEDs + Keyboard + CPU State ── */}
                        <div className="flex gap-3 mb-3 w-full">

                            <div className="flex-1 flex flex-col gap-3">
                                {/* Keyboard */}
                                <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] min-w-0 grow-0">
                                    <Keyboard deviceInstance={keyboardDevice} />
                                </div>

                                {/* LEDs */}
                                <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                    <Leds deviceInstance={ledsDevice} />
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
                                <Disk deviceInstance={diskDevice} />
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
                onSelectFile={openFile}
            />
        </div>
    );
};


