
// useDebugger { address: u16, file: string, line: u16 }

import { useState } from "react";


export type Breakpoint = {
    address: u16,
    file: string,
    line: u16;
}


export const useDebugger = (): DebuggerHook => {
    //const breakpointsRef = useRef<Map<string, Breakpoint>>(new Map());
    const [breakpoints, setBreakpoints] = useState<Map<string, Breakpoint>>(new Map());


    const setBreakpoint = (file: string, line: number, active=true) => {
        const breakpointKey = `${file}:${line}`
        const address: number | null = 0; // TODO: utiliser codeMappingReverse

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


    const toggleBreakpoint = (file: string, line: number) => {
        const breakpointKey = `${file}:${line}`
        const address: number | null = 0; // TODO: utiliser codeMappingReverse

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
    setBreakpoint: (file: string, line: number, active?: boolean) => void;
    toggleBreakpoint: (file: string, line: number) => void;
}

