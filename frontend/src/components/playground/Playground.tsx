

import React, { useCallback, useEffect, useRef, useState } from "react";

import { MEMORY_MAP } from "@/../../web_assembly/src/memory_map";

import { compileCode, compileCodeV2, getAssemblyCodeMapping, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";
import { toHex } from "@/lib/lib_numbers";

import { useEmulator, type EmulatorHook } from "@/hooks/useEmulator";
import { useDevice } from "@/hooks/useDevice";
import { useAssemblyEditor } from "@/hooks/useAssemblyEditor";
import { useDebugger } from "@/hooks/useDebugger";
import { useCompiler } from "@/hooks/useCompiler";

import { ScreenCanvasDevice } from "../devices/screen_canvas";
import { InterruptDevice } from "../devices/interrupt";
import { InterruptTimerDevice } from "../devices/interrupt_timer";
import { BuzzerDevice } from "../devices/buzzer";
import { RngDevice } from "../devices/rng";
import { RtcDevice } from "../devices/rtc";
import { SwitchsDevice } from "../devices/switchs";
import { SpeakerDevice } from "../devices/speaker";
import { LcdDevice } from "../devices/lcd";

import { Navbar } from "./Navbar";
import { PanelEmulator } from "./PanelEmulator";
import { PanelEditor } from "./PanelEditor";
import { KeyboardDevice } from "@/components/devices/keyboard";
import { ConsoleDevice } from "@/components/devices/console";
import { ScreenDevice } from "@/components/devices/screen";
import { LedsDevice } from "@/components/devices/leds";
import { DiskDevice } from "@/components/devices/disk";
import { DmaDevice } from "@/components/devices/dma";

import type { u16, u8, u32 } from "@/types/computer.types";
import type { Token } from "@/compiler/compiler_lexer";


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


const defaultCodeFilepath = "user/examples/sokoban_game.asm";
const osCodeFilepath = "os/os_v3.asm";
const bootloaderCodeFilepath = "bootloader/bootloader_v2.asm";

const asmPrefixUrl = "";


// ─────────────────────────────────────────────
//  Playground Component
// ─────────────────────────────────────────────
export const Playground: React.FC<{ autoStart?: boolean }> = (props) => {
    const { autoStart = false } = props;

    // ── Clock ──
    const [clockFrequency, setClockFrequency] = useState(10 as u32);       // nb tick per second
    const [speedMultiplier, setSpeedMultiplier] = useState(1000 as u32); // nb cycles per tick

    // ── Boot state ──
    const [devicesLoaded, setDevicesLoaded] = useState(false);
    const [bootloaderLoaded, setBootloaderLoaded] = useState(false);
    const [osDiskData, setOsDiskData] = useState<[u16, u8][] | null>(null);

    const [memory, setMemory] = useState<Uint8Array<ArrayBuffer> | null>(null);

    // ── Registers & Memory (on-demand only via Dump buttons, NOT synced per tick) ──
    const [modifiedRegisters, setModifiedRegisters] = useState<string[]>([]);
    const [registers8, setRegisters8] = useState<Record<string, u8>>({});
    const [registers16, setRegisters16] = useState<Record<string, u8 | u16 | bigint>>({});
    const [cyclesCount, setCyclesCount] = useState<number>(0);

    // ── Logs ──
    const [logs, setLogs] = useState<string[]>([]);

    //  Logging
    const addLog = useCallback((msg: string) => {
        setLogs(prev => [...prev.slice(-300), `[${new Date().toLocaleTimeString()}] ${msg}`]);
    }, []);

    const [panelEmulatorHidden, setPanelEmulatorHidden] = useState(false);
    const [panelEditorHidden, setPanelEditorHidden] = useState(false);

    const dumpRegisters = async (): Promise<RegistersDump | null> => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return null;

        const registers8_new = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        const registers16_new = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        const cyclesCount_new = Number(emulator.getCyclesCount(emulator.wasmExports, emulator.computerPointer));

        const _modifiedRegisters: string[] = [];

        Object.entries(registers8).forEach(([regName, regValueOld]) => {
            const regValueNew = registers8_new[regName as keyof typeof registers8_new];

            if (regValueNew !== regValueOld) {
                _modifiedRegisters.push(regName);
            }
        })

        setModifiedRegisters(_modifiedRegisters)

        setRegisters8(registers8_new);
        setRegisters16(registers16_new);
        setCyclesCount(cyclesCount_new);

        return {
            registers8: registers8_new,
            registers16: registers16_new,
            cyclesCount: cyclesCount_new,
        }
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


    const debuggerHook = useDebugger(emulator);
    const assemblyEditorHook = useAssemblyEditor({ debuggerHook, asmPrefixUrl })
    const compilerHook = useCompiler();

    const [codeMapping, setCodeMapping] = useState<Record<string, Token | undefined>>({})


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
        const compiled = await compilerHook.compileBootloader()

        const newCodeMapping = getAssemblyCodeMapping(compiled);
        updateCodeMapping(newCodeMapping)

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



    useEffect(() => {
        const _run = async () => {
            const contentDefault = await assemblyEditorHook.fetchFile(defaultCodeFilepath)
            assemblyEditorHook.openFile(defaultCodeFilepath, contentDefault)

            //const contentBootloader = await assemblyEditorHook.fetchFile(bootloaderCodeFilepath)
            //assemblyEditorHook.openFile(bootloaderCodeFilepath, contentBootloader, undefined, undefined, false)

            //const contentOs = await assemblyEditorHook.fetchFile(osCodeFilepath)
            //assemblyEditorHook.openFile(osCodeFilepath, contentOs, undefined, undefined, false)

            // BUG ici. les fichiers n'ecrasent les un-les autres. seul le dernier reste ouvert. pb references react
        }

        const timer = setTimeout(_run, 10);
        return () => clearTimeout(timer);
    }, [])


    const handleResetComputer = async () => {
        setCodeMapping({});

        // Reload OS on OS_DISK
        if (osDiskDeviceHook.instance) {
//            const diskData = await compileAndLoadOsCode();
//            setOsDiskData(diskData);
//
//            osDiskDeviceHook.instance.loadRawData(new Map(diskData))
        }

        // Reset Computer
        emulator.resetComputer()
    }


    // Compile OS Code
    const compileAndLoadOsCode = async () => {
        const compiled = await compilerHook.compileOs()

        const newCodeMapping = getAssemblyCodeMapping(compiled);
        updateCodeMapping(newCodeMapping)

        const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
        const byteCodeArr = Array.from(byteCodeMap);
        const data = byteCodeArr ?? [];

        return data;
    }


    const updateCodeMapping = (newCodeMapping: Record<string, Token | undefined>) => {
        setCodeMapping(old => ({ ...old, ...newCodeMapping }));
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


    // Dump registers when computer is instanciated
    useEffect(() => {
        dumpRegisters()
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
    }


    const dumpDisk = (diskDevice: DiskDevice | null) => {
        if (!diskDevice) return;
        setMemory(new Uint8Array(diskDevice.storage.values()));
    }



    // ════════════════════════
    //  Clock & Cycle controls 
    // ════════════════════════

    const runCpuStep = () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        //const controlBefore = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        //const dataBefore = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        //console.log('BEFORE', controlBefore, dataBefore);

        emulator.runCycles(1);

        //const controlAfter = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        //const dataAfter = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        //console.log('AFTER', controlAfter, dataAfter);

        dumpRegisters()
            .then(registers => {
                if (!registers) return;
                const { registers16 } = registers;
                const PC = toHex(Number(registers16.PC), 4);
                const currentCodeMapped = codeMapping[PC]

                if (currentCodeMapped) {
                    openAssemblyFileInEditor(currentCodeMapped.file, undefined, currentCodeMapped.line)
                }
            })

    };


    useEffect(() => {
        if (emulator.clockStatus) {
            //assemblyEditorHook.setMarkerLine(null);
            debuggerHook.setDebugLine(null);
            return;
        }

        dumpRegisters()
            .then(registers => {
                if (!registers) return;
                const { registers16 } = registers;
                const PC = toHex(Number(registers16.PC), 4);
                const currentCodeMapped = codeMapping[PC]

                if (currentCodeMapped) {
                    openAssemblyFileInEditor(currentCodeMapped.file, undefined, currentCodeMapped.line)
                }
            })

    }, [emulator.clockStatus])


    const togglePanelEmulator = () => {
        setPanelEmulatorHidden(b => !b)
    }

    const togglePanelEditor = () => {
        setPanelEditorHidden(b => !b)
    }


    const openAssemblyFileInEditor = async (filepath: string, markerLine?: number, debugLine?: number) => {
        const content = await assemblyEditorHook.fetchFile(filepath);
        assemblyEditorHook.openFile(filepath, content, markerLine, debugLine)
    }


    return (
        <div
            className="h-screen flex flex-col bg-[#0a0a0f] text-zinc-200"
            style={{ fontFamily: "'JetBrains Mono', 'Fira Code', 'SF Mono', monospace" }}
        >

            {/* ── Header ── */}
            <Navbar
                emulator={emulator}
                clockFrequency={clockFrequency}
                speedMultiplier={speedMultiplier}
                setClockFrequency={setClockFrequency}
                setSpeedMultiplier={setSpeedMultiplier}
                runCpuStep={runCpuStep}
                handleResetComputer={handleResetComputer}
                />

            {/* ── Main Content ── */}
            <div className="flex gap-4 h-full overflow-hidden">

                {/* ══════ Emulator ══════ */}
                <div className={`flex flex-col w-full h-full flex-2 ${panelEmulatorHidden ? "hidden" : ""}`}>
                    <PanelEmulator
                        emulator={emulator}
                        cyclesCount={cyclesCount}
                        registers8={registers8}
                        registers16={registers16}
                        modifiedRegisters={modifiedRegisters}
                        memory={memory}
                        panelEmulatorHidden={panelEmulatorHidden}
                        panelEditorHidden={panelEditorHidden}
                        codeMapping={codeMapping}
                        assemblyEditorHook={assemblyEditorHook}
                        debuggerHook={debuggerHook}
                        dumpMemory={dumpMemory}
                        dumpRam={dumpRam}
                        dumpDisk={dumpDisk}
                        togglePanelEmulator={togglePanelEmulator}
                        togglePanelEditor={togglePanelEditor}
                        openAssemblyFileInEditor={openAssemblyFileInEditor}
                        />
                </div>

                {/* ══════ Assembly Editor Panel ══════ */}
                <div className={`flex-col w-full xl:min-w-[600px] h-full flex-1 border-r border-zinc-800/60 ${(panelEmulatorHidden) ? "flex" : "hidden"} ${panelEditorHidden ? "hidden" : "xl:flex"}`}>
                    <PanelEditor
                        emulator={emulator}
                        logs={logs}
                        panelEmulatorHidden={panelEmulatorHidden}
                        codeMapping={codeMapping}
                        assemblyEditorHook={assemblyEditorHook}
                        debuggerHook={debuggerHook}
                        compilerHook={compilerHook}
                        addLog={addLog}
                        togglePanelEmulator={togglePanelEmulator}
                        openAssemblyFileInEditor={openAssemblyFileInEditor}
                        updateCodeMapping={updateCodeMapping}
                        />
                </div>

            </div>

        </div>
    );
};




