

import React from "react";
import { Link } from "wouter";

import { SpeedDisplay } from "./SpeedDisplay";

import type { u32 } from "@/types/computer.types";
import type { EmulatorHook } from "@/hooks/useEmulator";


export type NavbarProps = {
    emulator: EmulatorHook;
    clockFrequency: u32;
    speedMultiplier: u32;
    setClockFrequency: React.Dispatch<React.SetStateAction<u32>>;
    setSpeedMultiplier: React.Dispatch<React.SetStateAction<u32>>;
    runCpuStep: () => void
    handleResetComputer: () => Promise<void>
}


export const Navbar: React.FC<NavbarProps> = (props) => {
    const { emulator, clockFrequency, speedMultiplier } = props;
    const { runCpuStep, setClockFrequency, handleResetComputer, setSpeedMultiplier } = props;

    return (
        <>
            {/* ── Header ── */}
            <header className="flex flex-wrap gap-2 px-2 md:px-5 py-1 border-b border-zinc-800/80 bg-[#0d0d14] shrink-0">

                {/* Logo + Buttons */}
                <div className="-logo-and-buttons flex items-center grow">
                    <div className="flex items-center gap-3">
                        <Link to="/" className="flex gap-2 items-center">
                            <div className="w-2.5 h-2.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.6)]" />
                            <span className="text-sm font-semibold tracking-wider text-zinc-300 uppercase text-center text-wrap md:text-nowrap">
                                8-bit Playground
                            </span>
                        </Link>
                        <span className="text-[10px] px-2 py-0.5 rounded bg-zinc-800 text-zinc-500 tracking-wider hidden md:block">v3</span>
                    </div>

                    {/* ── Toolbar ── */}
                    <div className="ms-auto flex gap-2 px-2 py-2 border-zinc-800/60 bg-[#0b0b12] shrink-0 items-center">
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
                            className="md:ms-8 px-3 py-1.5 text-xs rounded bg-red-800/80 hover:bg-red-700 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer"
                        >
                            Reset
                        </button>
                    </div>
                </div>

                {/* Clock Infos */}
                <div className="-clock ms-auto grid grid-cols-3 gap-4 text-sm items-center">
                    <div className="flex flex-col gap-1">
                        <div className="self-center">Tick Freq</div>

                        <input
                            type="number"
                            min={1}
                            max={1000}
                            step={1}
                            className="w-16 bg-background-light px-1 rounded text-center self-center"
                            value={clockFrequency}
                            onChange={(event) => setClockFrequency(Number(event.target.value) as u32)}
                        />
                    </div>

                    <div className="flex flex-col gap-1">
                        <div className="self-center">Multiplier</div>

                        <input
                            type="number"
                            min={1}
                            max={10_000}
                            step={1}
                            className="w-24 bg-background-light px-1 rounded text-center self-center"
                            value={speedMultiplier}
                            onChange={(event) => setSpeedMultiplier(Number(event.target.value) as u32)}
                        />
                    </div>

                    <SpeedDisplay emulator={emulator} />
                </div>

            </header>
        </>
    );
}

