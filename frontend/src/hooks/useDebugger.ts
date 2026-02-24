
// useDebugger { address: u16, file: string, line: u16 }

import { useEffect, useState } from "react";
import type { EmulatorHook } from "./useEmulator";


export type Breakpoint = {
    address: u16,
    file: string,
    line: number;
}


export const useDebugger = (emulator: EmulatorHook): DebuggerHook => {
    //const breakpointsRef = useRef<Map<string, Breakpoint>>(new Map());
    const [breakpoints, setBreakpoints] = useState<Map<string, Breakpoint>>(new Map());


    const setBreakpoint = (file: string, line: number, address: u16, active=true) => {
        const breakpointKey = `${file}:${line}`

        setBreakpoints(old => {
            const _new = new Map(old);

            if ((address === null || !active) && _new.has(breakpointKey)) {
                _new.delete(breakpointKey)

            } else if (active) {
                _new.set(breakpointKey, { address, file, line, })
            }

            return _new;
        })
    }


    const toggleBreakpoint = (file: string, line: number, address: u16) => {
        const breakpointKey = `${file}:${line}`

        setBreakpoints(old => {
            const _new = new Map(old);

            if (_new.has(breakpointKey)) {
                _new.delete(breakpointKey)

            } else {
                _new.set(breakpointKey, { address, file, line, })
            }

            return _new;
        })
    }


    useEffect(() => {
        const cpuBreakpoints = Array.from(breakpoints.values())
        emulator.setEditorBreakpointsForCpu(cpuBreakpoints)
    }, [breakpoints])


    const hook = {
        breakpoints,
        setBreakpoints,
        setBreakpoint,
        toggleBreakpoint,
    }

    return hook;
}


export type DebuggerHook = {
    breakpoints: Map<string, Breakpoint>;
    setBreakpoints: React.Dispatch<React.SetStateAction<Map<string, Breakpoint>>>;
    setBreakpoint: (file: string, line: number, address: u16, active?: boolean) => void;
    toggleBreakpoint: (file: string, line: number, address: u16) => void;
}

