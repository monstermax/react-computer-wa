
import { useCallback, useState } from "react";
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


    const openFile = useCallback((filepath: string, content='', _markerLine?: number, debugLine?: number, active=true) => {
        const file: AssemblyEditorFile = {
            filepath,
            content,
            markerLine: _markerLine ?? null,
            debugLine: debugLine ?? null,
            breakpointsLines: [],
            loading: false,
        }

        const _new = new Map(openFiles);

        if (! _new.has(filepath)) {
            _new.set(filepath, file);
        }

        setOpenFiles(_new);

        if (active) {
            switchToFile(filepath, _markerLine, debugLine)
        }
    }, [openFiles])


    const switchToFile = (filepath: string, markerLineNew?: number, debugLine?: number) => {
        //console.log('switchToFile:', filepath, markerLineNew, debugLine)
        setActiveFile(filepath)
        setMarkerLine(markerLineNew ?? null)

        if (debuggerHook) {
            debuggerHook.setDebugLine(debugLine ?? null);
        }
    }


    const newFile = useCallback((content?: string) => {
        const allKeys = Array.from(openFiles.keys());
        //console.log(allKeys)
        let filepath = 'draft.asm';

        if (allKeys.includes(filepath)) {
            let num = 1;
            while (allKeys.includes(filepath)) {
                filepath = `draft_${num}.asm`;
                num++;
            }
        }

        openFile(filepath, content ?? `; new file ${filepath}`)
    }, [openFiles])


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


    const closeFile = useCallback((filepath: string) => {
        const _new = new Map(openFiles);

        const allKeysBefore = Array.from(_new.keys());
        const itemIdx = allKeysBefore.findIndex(k => k === filepath);

        if (_new.has(filepath)) {
            _new.delete(filepath)
        }

        // Si c'etait le dernier onglet ouvert, on ouvre un nouveau fichier
        if (_new.size === 0) {
            _new.set('draft.asm', { filepath: 'draft.asm', content: '', debugLine: null, markerLine: null, breakpointsLines: [], loading: false })
        }

        // Si c'etait l'onglet courant, on switch au prochain onglet
        if (filepath === activeFile) {
            const allKeysAfter = Array.from(_new.keys());
            const suggestedKey = allKeysAfter[itemIdx] ?? allKeysAfter[itemIdx+1] ?? allKeysAfter[itemIdx-1] ?? allKeysAfter[0];

            if (suggestedKey) {
                setActiveFile(suggestedKey);
            }
        }

        setOpenFiles(_new);
    }, [openFiles, activeFile])


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
    newFile: (content?: string) => void;
    updateFile: (filepath: string, file: Partial<AssemblyEditorFile>) => void;
    updateFileContent: (filepath: string, content: string) => void;
}

