
import React, { useCallback, useEffect, useMemo, useRef, useState } from "react";

import { MemoryExplorer } from "@/components/playground/MemoryExplorer";
import { Keyboard, KeyboardDevice } from "@/components/devices/keyboard";
import { Console, ConsoleDevice } from "@/components/devices/console";
import { Screen, ScreenDevice } from "@/components/devices/screen";
import { Leds, LedsDevice } from "@/components/devices/leds";
import { Disk, DiskDevice } from "@/components/devices/disk";
import { Docs } from "./Docs";
import { Registers } from "./Registers";
import { ScreenCanvas, ScreenCanvasDevice } from "../devices/screen_canvas";

import { Switchs, SwitchsDevice } from "../devices/switchs";
import { Lcd, LcdDevice } from "../devices/lcd";

import type { EmulatorHook } from "@/hooks/useEmulator";
import type { u16, u8, u32 } from "@/types/computer.types";


export type PanelEmulatorProps = {
    emulator: EmulatorHook;
    registers8: Record<string, u8>;
    registers16: Record<string, bigint | u8 | u16>;
    memory: Uint8Array<ArrayBuffer> | null;
    panelEmulatorHidden: boolean;
    panelEditorHidden: boolean;
    dumpRam: () => void;
    dumpMemory: () => void;
    dumpDisk: (diskDevice: DiskDevice | null) => void;
    togglePanelEmulator: () => void;
    togglePanelEditor: () => void;
}


export const PanelEmulator: React.FC<PanelEmulatorProps> = (props) => {
    const { emulator, registers8, registers16, memory, panelEmulatorHidden, panelEditorHidden } = props;
    const { dumpRam, dumpMemory, dumpDisk, togglePanelEmulator, togglePanelEditor } = props;

    const [preferHdScreen, setPreferHdScreen] = useState(false);
    const [selectedDisk, setselectedDisk] = useState('os_disk');

    const [emulatorTab, setEmulatorTab] = useState<'devices' | 'memory' | 'docs'>('devices');

    const keyboardDevice = emulator.devicesManager.getDeviceByName<KeyboardDevice>('keyboard');
    const consoleDevice = emulator.devicesManager.getDeviceByName<ConsoleDevice>('console');
    const screenDevice = emulator.devicesManager.getDeviceByName<ScreenDevice>('screen');
    const screenHdDevice = emulator.devicesManager.getDeviceByName<ScreenCanvasDevice>('screen_hd');
    const switchsDevice = emulator.devicesManager.getDeviceByName<SwitchsDevice>('switchs');
    const ledsDevice = emulator.devicesManager.getDeviceByName<LedsDevice>('leds');
    const osDiskDevice = emulator.devicesManager.getDeviceByName<DiskDevice>('os_disk');
    const userDiskDevice = emulator.devicesManager.getDeviceByName<DiskDevice>('user_disk');
    const lcdDevice = emulator.devicesManager.getDeviceByName<LcdDevice>('lcd');

    return (
        <>

            {/* Emulator panel tabs */}
            <div className="flex border-b border-zinc-800/50 bg-[#0c0c13] shrink-0 px-4">
                <button
                    onClick={() => setEmulatorTab('devices')}
                    className={`px-2 md:px-4 py-1 text-[11px] tracking-wider uppercase transition-colors cursor-pointer 
                        ${emulatorTab === 'devices'
                            ? 'text-zinc-200 border-b-2 border-emerald-500'
                            : 'text-zinc-500 hover:text-zinc-400'
                        }`}>
                    Devices
                </button>

                <button
                    onClick={() => setEmulatorTab('memory')}
                    className={`px-2 md:px-4 py-1 text-[11px] tracking-wider uppercase transition-colors cursor-pointer 
                        ${emulatorTab === 'memory'
                            ? 'text-zinc-200 border-b-2 border-emerald-500'
                            : 'text-zinc-500 hover:text-zinc-400'
                        }`}>
                    Memory
                </button>

                <button
                    onClick={() => setEmulatorTab('docs')}
                    className={`px-2 md:px-4 py-1 text-[11px] tracking-wider uppercase transition-colors cursor-pointer 
                        ${emulatorTab === 'docs'
                            ? 'text-zinc-200 border-b-2 border-emerald-500'
                            : 'text-zinc-500 hover:text-zinc-400'
                        }
                    `}>
                    Docs
                </button>


                {/* ── Toolbar ── */}
                <div className="ms-auto flex items-center gap-2 ps-2 py-2 border-b border-zinc-800/60 bg-[#0b0b12] shrink-0 flex-wrap">
                    {emulatorTab === 'memory' && (
                        <>
                            {/*
                            <button
                                onClick={() => dumpDisk(osDiskDevice)}
                                className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                Dump Disk
                            </button>

                            <button
                                onClick={() => dumpRam()}
                                className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                Dump RAM
                            </button>
                            */}

                            {/*
                            <button
                                onClick={() => dumpMemory()}
                                className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                Dump Wasm Memory
                            </button>
                            */}
                        </>
                    )}

                    {/*
                    {rightTab === 'devices' && (
                        <>
                            <button
                                onClick={() => dumpRegisters()}
                                className="px-3 py-1 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                Dump CPU State
                            </button>
                        </>
                    )}
                    */}

                    {/* Button "togglePanelEmulator" for Mobile-only */}
                    <button 
                        onClick={() => togglePanelEmulator()}
                        className={`md:hidden px-3 py-1 text-sm uppercase transition-colors text-zinc-500 hover:text-zinc-400 cursor-pointer
                            ${!panelEditorHidden
                                ? 'text-zinc-500 hover:text-zinc-400 border-b-2 border-b-orange-800'
                                : 'text-zinc-200 border-b-2 border-b-emerald-800'
                        }`}
                    >
                        {panelEditorHidden ? "Show Emulator (2)" : "➤ Editor"}
                    </button>

                    {/* Button "togglePanelEmulator" for Desktop-only */}
                    <button 
                        onClick={() => togglePanelEditor()}
                        className={`hidden md:block px-3 py-1 text-sm uppercase transition-colors text-zinc-500 hover:text-zinc-400 cursor-pointer
                            ${!panelEditorHidden
                                ? 'text-zinc-200 border-b-2 border-b-emerald-800'
                                : 'text-zinc-500 hover:text-zinc-400 border-b-2 border-b-orange-800'
                        }`}
                    >
                        {panelEditorHidden ? "↩" : "⛶"}
                    </button>
                </div>
            </div>

            {/* Devices Tab */}
            <div className={`overflow-y-auto p-4 ${emulatorTab === 'devices' ? "" : "hidden"}`}>
                {/* ── Row 1: Console + Screen ── */}
                <div className="flex flex-wrap gap-3 mb-3">

                    <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] md:w-auto min-w-96 flex justify-center ">
                        <Console deviceInstance={consoleDevice} />
                    </div>

                    <div className="flex-1 relative">
                        <button
                            className={`absolute top-0 right-0 px-2 py-0 bg-background m-1 rounded cursor-pointer flex gap-1`}
                            onClick={() => setPreferHdScreen(b => !b)}
                        >
                            <div className={!preferHdScreen ? "" : "line-through"}>SD</div>
                            /
                            <div className={preferHdScreen ? "" : "line-through"}>HD</div>
                        </button>

                        <div className={`md:min-w-[500px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0 ${!preferHdScreen ? "" : "hidden"}`}>
                            {/* Screen */}
                            <Screen deviceInstance={screenDevice} />
                        </div>

                        <div className={`md:min-w-[500px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0 ${preferHdScreen ? "" : "hidden"}`}>
                            {/* Screen HD */}
                            <ScreenCanvas deviceInstance={screenHdDevice} />
                        </div>
                    </div>
                </div>

                {/* ── Row 2: LEDs + Keyboard + CPU State + Disks ── */}
                <div className="flex flex-wrap gap-3 mb-3">

                    <div className="flex flex-col gap-3 flex-1">
                        <div className="min-w-[350px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Switchs deviceInstance={switchsDevice} />
                        </div>

                        <div className="min-w-[350px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Leds deviceInstance={ledsDevice} />
                        </div>

                        <div className="min-w-[350px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Lcd deviceInstance={lcdDevice} />
                        </div>
                    </div>

                    <div className="flex flex-col gap-3 flex-1">
                        <div className="min-w-[350px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Registers registers8={registers8} registers16={registers16} />
                        </div>

                        <div className="min-w-[350px] border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Keyboard deviceInstance={keyboardDevice} />
                        </div>
                    </div>

                    {/* Disks ── */}
                    {/*
                    <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] flex flex-col gap-4 relative w-[350px]">
                        <button
                            className={`absolute top-0 right-0 px-2 py-0 bg-background m-1 rounded cursor-pointer flex gap-1`}
                            onClick={() => setselectedDisk(sel => sel === 'os_disk' ? 'user_disk' : 'os_disk')}
                        >
                            <div className={selectedDisk === 'os_disk' ? "" : "line-through"}>OS</div>
                            /
                            <div className={selectedDisk === 'user_disk' ? "" : "line-through"}>User</div>
                        </button>

                        <div className={`w-[350px] ${selectedDisk === 'os_disk' ? "" : "hidden"}`}>
                            <Disk deviceInstance={osDiskDevice} />
                        </div>
                        <div className={`w-[350px] ${selectedDisk === 'user_disk' ? "" : "hidden"}`}>
                            <Disk deviceInstance={userDiskDevice} />
                        </div>
                    </div>
                    */}
                </div>
            </div>

            {/* Memory Tab */}
            <div className={`overflow-y-auto p-2 ${emulatorTab === 'memory' ? "" : "hidden"}`}>
                <MemoryExplorer
                    memory={memory}
                    offset={0x00}
                    bytesPerLine={16}
                    linesPerPage={16}
                    open={true}
                    dumpDisk={dumpDisk}
                    dumpRam={dumpRam}
                    dumpMemory={dumpMemory}
                    disks={[osDiskDevice, userDiskDevice]}
                />
            </div>

            {/* Docs Tab */}
            <div className={`overflow-y-auto p-4 text-sm leading-relaxed text-zinc-300 ${emulatorTab === 'docs' ? "" : "hidden"}`}>
                <Docs loadAddress={"0xA000"} />
            </div>

        </>
    );
}

