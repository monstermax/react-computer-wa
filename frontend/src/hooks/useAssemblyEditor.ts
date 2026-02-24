
import { useState } from "react";
import type { DebuggerHook } from "./useDebugger";


export type AssemblyEditorFile = {
    filepath: string;
    content: string;
    markerLine: number | null;
    debugLine: number | null;
    breakpointsLines: number[];
    loading: boolean;
}


export type AssemblyEditorParams = {
    asmPrefixUrl?: string;
    debuggerHook?: DebuggerHook;
}


export const useAssemblyEditor = (params?: AssemblyEditorParams): AssemblyEditorHook => {
    const { asmPrefixUrl='', debuggerHook } = params ?? {};

    const [openFiles, setOpenFiles] = useState<Map<string, AssemblyEditorFile>>(new Map);
    const [activeFile, setActiveFile] = useState<string | null>(null);
    const [markerLine, setMarkerLine] = useState<number | null>(null); // marker bleu (highlight line)


    const openFile = (filepath: string, content='', _markerLine?: number, debugLine?: number, active=true) => {
        const file: AssemblyEditorFile = {
            filepath,
            content,
            markerLine: _markerLine ?? null,
            debugLine: debugLine ?? null,
            breakpointsLines: [],
            loading: false,
        }

        setOpenFiles(old => {
            const _new = new Map(old);

            if (! _new.has(filepath)) {
                _new.set(filepath, file);
            }

            return _new
        })

        if (active) {
            switchToFile(filepath, _markerLine, debugLine)
        }
    }

    const closeFile = (filepath: string) => {
        setOpenFiles(old => {
            const _new = new Map(old);

            if (_new.has(filepath)) {
                _new.delete(filepath)
            }

            return _new
        })
    }

    const switchToFile = (filepath: string, _markerLine?: number, debugLine?: number) => {
        console.log('switchToFile:', filepath, _markerLine, debugLine)
        setActiveFile(filepath)

        setMarkerLine(_markerLine ?? null)

        if (debuggerHook) {
            debuggerHook.setDebugLine(debugLine ?? null);
        }
    }

    const switchToNextFile = () => {
        // TODO: a utiliser quand on close un file
    }

    const newFile = () => {
        openFile('draft.asm')
    }

    const updateFileContent = (filepath: string, content: string) => {
        updateFile(filepath, { content })
    }

    const updateFile = (filepath: string, file: Partial<AssemblyEditorFile>) => {
        setOpenFiles(old => {
            const _new = new Map(old);

            if (_new.has(filepath)) {
                const fileOld = _new.get(filepath) ?? { filepath, content: '', breakpointsLines: [], markerLine: null, debugLine: null, loading: false };
                _new.set(filepath, { ...fileOld, ...file })
            }

            return _new;
        })
    }

    const fetchFile = async (filepath: string) => {
        const response = await fetch(`${asmPrefixUrl}/asm/${filepath}`);
        const value = await response.text();
        return value;
    }

    const hook: AssemblyEditorHook = {
        openFiles,
        activeFile,
        markerLine,
        setOpenFiles,
        setActiveFile,
        setMarkerLine,
        fetchFile,
        openFile,
        closeFile,
        switchToFile,
        newFile,
        updateFile,
        updateFileContent,
    };

    return hook;
}


export type AssemblyEditorHook = {
    openFiles: Map<string, AssemblyEditorFile>;
    activeFile: string | null;
    markerLine: number | null;
    setOpenFiles: React.Dispatch<React.SetStateAction<Map<string, AssemblyEditorFile>>>;
    setActiveFile: React.Dispatch<React.SetStateAction<string | null>>;
    setMarkerLine: React.Dispatch<React.SetStateAction<number | null>>;
    fetchFile: (filepath: string) => Promise<string>;
    openFile: (filepath: string, content?: string, _markerLine?: number, debugLine?: number, active?: boolean) => void;
    closeFile: (filepath: string) => void;
    switchToFile: (filepath: string, _markerLine?: number, debugLine?: number) => void;
    newFile: () => void;
    updateFile: (filepath: string, file: Partial<AssemblyEditorFile>) => void;
    updateFileContent: (filepath: string, content: string) => void;
}

