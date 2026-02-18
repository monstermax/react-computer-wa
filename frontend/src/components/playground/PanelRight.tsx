
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


export type PanelRightProps = {
    emulator: EmulatorHook;
    registers8: Record<string, u8>;
    registers16: Record<string, bigint | u8 | u16>;
    memory: Uint8Array<ArrayBuffer> | null;
    dumpRam: () => void
    dumpMemory: () => void
    setMemory: (value: React.SetStateAction<Uint8Array<ArrayBuffer> | null>) => void;
}


export const PanelRight: React.FC<PanelRightProps> = (props) => {
    const { emulator, registers8, registers16, memory, dumpRam, dumpMemory } = props;

    const [preferHdScreen, setPreferHdScreen] = useState(false);
    const [selectedDisk, setselectedDisk] = useState('os_disk');

    const [rightTab, setRightTab] = useState<'devices' | 'memory' | 'sources' | 'docs'>('devices');

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

                    {/*
                            {rightTab === 'devices' && (
                                <>
                                    <button onClick={() => dumpRegisters()}
                                        className="px-3 py-1 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                                        Dump CPU State
                                    </button>
                                </>
                            )}
                            */}
                </div>
            </div>

            <div className={`flex-1 overflow-y-auto p-4 ${rightTab === 'devices' ? "" : "hidden"}`}>
                {/* ── Row 1: Console + Screen ── */}
                <div className="flex flex-wrap gap-3 mb-3">
                    {/* Console */}
                    <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] w-full md:w-auto min-w-96">
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

                        {/* Screen */}
                        <div className={`border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0 ${!preferHdScreen ? "" : "hidden"}`}>
                            <Screen deviceInstance={screenDevice} />
                        </div>

                        {/* Screen HD */}
                        <div className={`border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] shrink-0 ${preferHdScreen ? "" : "hidden"}`}>
                            <ScreenCanvas deviceInstance={screenHdDevice} />
                        </div>
                    </div>
                </div>

                {/* ── Row 2: LEDs + Keyboard + CPU State ── */}
                <div className="flex gap-3 mb-3 w-full">

                    <div className="flex-1 flex flex-col gap-3">
                        {/* Keyboard */}
                        <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] min-w-0 grow-0">
                            <Keyboard deviceInstance={keyboardDevice} />
                        </div>

                        {/* Switchs */}
                        <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Switchs deviceInstance={switchsDevice} />
                        </div>

                        {/* LEDs */}
                        <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                            <Leds deviceInstance={ledsDevice} />
                        </div>
                    </div>

                    {/* CPU State */}
                    <div className="flex-1 ">
                        <div className="flex flex-col gap-3">
                            <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                <Registers registers8={registers8} registers16={registers16} />
                            </div>

                            <div className="border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14]">
                                <Lcd deviceInstance={lcdDevice} />
                            </div>
                        </div>
                    </div>

                    {/* Disk ── */}
                    <div className="flex-1 border border-zinc-800/50 rounded-lg p-2 bg-[#0c0c14] flex flex-col gap-4 relative">
                        <button
                            className={`absolute top-0 right-0 px-2 py-0 bg-background m-1 rounded cursor-pointer flex gap-1`}
                            onClick={() => setselectedDisk(sel => sel === 'os_disk' ? 'user_disk' : 'os_disk')}
                        >
                            <div className={selectedDisk === 'os_disk' ? "" : "line-through"}>OS</div>
                            /
                            <div className={selectedDisk === 'user_disk' ? "" : "line-through"}>User</div>
                        </button>

                        <div className={`${selectedDisk === 'os_disk' ? "" : "hidden"}`}>
                            <Disk deviceInstance={osDiskDevice} />
                        </div>
                        <div className={`${selectedDisk === 'user_disk' ? "" : "hidden"}`}>
                            <Disk deviceInstance={userDiskDevice} />
                        </div>
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
                <Docs loadAddress={"0xA000"} />
            </div> {/* .docs */}

        </>
    );
}

