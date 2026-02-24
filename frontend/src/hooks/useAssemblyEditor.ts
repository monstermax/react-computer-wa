
import { useState } from "react";


export type AssemblyEditorFile = {
    filepath: string;
    content: string;
    highlightedLine: number | null;
    breakpointsLines: number[];
    loading: boolean;
}


export type AssemblyEditorParams = {
}


export const useAssemblyEditor = (params?: AssemblyEditorParams): AssemblyEditorHook => {
    const [openFiles, setOpenFiles] = useState<Map<string, AssemblyEditorFile>>(new Map);
    const [activeFile, setActiveFile] = useState<string | null>(null);
    const [activeLine, setActiveLine] = useState<number | null>(null);


    const openFile = (filepath: string, content='', highlightedLine?: number, active=true) => {
        const file: AssemblyEditorFile = {
            filepath,
            content,
            highlightedLine: highlightedLine ?? null,
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
            switchToFile(filepath, highlightedLine)
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

    const switchToFile = (filepath: string, highlightedLine?: number) => {
        console.log('switchToFile:', filepath, highlightedLine)
        setActiveFile(filepath)
        setActiveLine(highlightedLine ?? null)
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
                const fileOld = _new.get(filepath) ?? { filepath, content: '', breakpointsLines: [], highlightedLine: null, loading: false };
                _new.set(filepath, { ...fileOld, ...file })
            }

            return _new;
        })
    }

    const fetchFile = async (filepath: string) => {
        const response = await fetch(`/asm/${filepath}`);
        const value = await response.text();
        return value;
    }

    const hook = {
        openFiles,
        activeFile,
        activeLine,
        setOpenFiles,
        setActiveFile,
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
    activeLine: number | null;
    setOpenFiles: React.Dispatch<React.SetStateAction<Map<string, AssemblyEditorFile>>>;
    setActiveFile: React.Dispatch<React.SetStateAction<string | null>>;
    fetchFile: (filepath: string) => Promise<string>;
    openFile: (filepath: string, content?: string, highlightedLine?: number | undefined, active?: boolean) => void;
    closeFile: (filepath: string) => void;
    switchToFile: (filepath: string, highlightedLine?: number) => void;
    newFile: () => void;
    updateFile: (filepath: string, file: Partial<AssemblyEditorFile>) => void;
    updateFileContent: (filepath: string, content: string) => void;
}

