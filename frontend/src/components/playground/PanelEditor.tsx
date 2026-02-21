
import React, { useEffect, useRef, useState } from "react";
import Editor, { useMonaco, type Monaco } from '@monaco-editor/react';
import { shikiToMonaco } from '@shikijs/monaco'
import { createHighlighter } from 'shiki'


import { toHex } from "@/lib/lib_numbers";
import { compileCode, compileCodeV2, formatBytecode, getAssemblyCodeMapping, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";

import { FileModal } from "./FileModal";

import type { u16, u8, u32 } from "@/types/computer.types";
import type { EmulatorHook } from "@/hooks/useEmulator";
import type { Token } from "@/compiler/compiler_lexer";


const defaultLoadAddress = '0xA000';

//const defaultCodeFilepath = "user/examples/draw_fractal_on_screen.asm";
const defaultCodeFilepath = "user/tests/lcd_test.asm";
//const defaultCodeFilepath = "bootloader/bootloader_v2.asm";
//const defaultCodeFilepath = "os/os_v3.asm";

const defaultCodePrefix = `; == User Program (Loaded @ 0xA000) ==
; Type "custom" in the shell to run it.
; IMPORTANT: end with "ret" !
; ==                                ==
`;


export type PanelEditorProps = {
    emulator: EmulatorHook;
    logs: string[];
    editorHightLine: number | null;
    editorInitialContent: string;
    panelEmulatorHidden: boolean;
    codeMapping: Record<string, Token | undefined>;
    addLog: (msg: string) => void;
    togglePanelEmulator: () => void;
    setEditorInitialContent: React.Dispatch<React.SetStateAction<string>>;
    setEditorHightLine: React.Dispatch<React.SetStateAction<number | null>>;
    openAssemblyFileInEditor: (filePath: string, selectedLine?: number | undefined) => Promise<void>
    updateCodeMapping: (newCodeMapping: Record<string, Token | undefined>) => void
}


export const PanelEditor: React.FC<PanelEditorProps> = (props) => {
    const { emulator, logs, panelEmulatorHidden, editorInitialContent, editorHightLine, codeMapping } = props;
    const { addLog, togglePanelEmulator, setEditorInitialContent, setEditorHightLine, openAssemblyFileInEditor, updateCodeMapping } = props;

    const monaco = useMonaco();

    // ── Editor ──
    const editorRef = useRef<any>(null); // Monaco Editor
    const monacoRef = useRef<Monaco>(null);
    const [currentHighlight, setCurrentHighlight] = useState<any[]>([]);

    const [machineCode, setMachineCode] = useState<string | null>(null);
    const [machineCodeLabels, setMachineCodeLabels] = useState<string | null>(null);
    const [bytecode, setBytecode] = useState<Map<u16, u8> | null>(null);
    const [editorContent, setEditorContent] = useState(editorInitialContent);
    const [loadAddress, setLoadAddress] = useState(defaultLoadAddress);
    const [editorError, setEditorError] = useState<string | null>(null);
    const [editorStatus, setEditorStatus] = useState<string | null>(null);
    const [isFileModalOpen, setIsFileModalOpen] = useState(false);
    const [codeLoaded, setCodeLoaded] = useState(false);


    // ── Logs ──
    const [activeTab, setActiveTab] = useState<'editor' | 'compiled' | 'labels' | 'log'>('editor');
    const logEndRef = useRef<HTMLDivElement>(null);

    // Handle Logs Scroll
    useEffect(() => {
        //logEndRef.current?.scrollIntoView({ behavior: 'smooth' }); // TODO: a revoir: ca scroll la page entiere, à chaque nouveau caractere
    }, [logs]);


    const handleEditorDidMount = async (editor: any, monaco: Monaco) => {
        editorRef.current = editor;
        monacoRef.current = monaco;

        const highlighter = await createHighlighter({
            themes: ['vitesse-dark'],
            langs: ['asm'],
        });

        monaco.languages.register({ id: 'asm' });
        shikiToMonaco(highlighter, monaco);
    };


    const handleEditorWillMount = (monaco: Monaco) => {
        // Enregistrer un nouveau langage
        monaco.languages.register({ id: 'asm' });

        // Définir les règles de tokens (c'est un exemple très basique pour illustration)
        monaco.languages.setMonarchTokensProvider('asm', {
            keywords: [
                'section',
                'mov', 'add', 'sub', 'jmp', 'int', 'push', 'pop', 'call', 'ret',
                'cmp', 'je', 'jne', 'jg', 'jl', 'jge', 'jle', 'lea'
            ],
            registers: /%?[a-z]+/,
            directives: /^\s*[a-z]+\s/,

            tokenizer: {
                root: [
                    [/;.*$/, 'comment'],
                    [/[a-z_]+(?=\s*:)/, 'tag'],
                    [/[a-z]+/, { cases: { '@keywords': 'keyword', '@default': 'identifier' } }],
                    [/\$?[0-9]+/, 'number'],
                    [/%?[a-z]+/, 'register'],
                    [/[{}()\[\]]/, '@brackets'],
                ]
            },
        });

        // Définir la configuration (commentaires, brackets, etc.)
        monaco.languages.setLanguageConfiguration('asm', {
            comments: { lineComment: ';' },
            brackets: [['{', '}'], ['[', ']'], ['(', ')']],
        });

    };


    // ═══════════════════════════════════════════
    //  Editor: Compile & Load user code to RAM
    // ═══════════════════════════════════════════

    // Load default editor code
    useEffect(() => {

        const _fetch = async () => {
            openAssemblyFileInEditor(defaultCodeFilepath)
            return
            const codeUrl = `/asm/${defaultCodeFilepath}`;
            const response = await fetch(codeUrl);
            const content = await response.text();
            setEditorInitialContent(defaultCodePrefix + content)
        }

        const timer = setTimeout(_fetch, 100);
        return () => clearTimeout(timer);
    }, []);


    useEffect(() => {
        if (editorInitialContent && editorHightLine !== null) {
            //console.log('editorHightLine:', editorHightLine)
            highlightLine(editorHightLine);
        }
    }, [editorInitialContent, editorHightLine])


    const handleCompileEditorCode = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        setEditorError(null);
        setEditorStatus(null);

        const addr = parseInt(loadAddress);
        if (isNaN(addr) || addr < 0 || addr > 0xFFFF) {
            setEditorError('Invalid load address');
            return;
        }

        try {
            addLog(`Compiling user code... (target @ ${toHex(addr, 4)})`);

            //const compiled = await compileCode(editorContent, { startAddress: addr, architecture: CUSTOM_CPU });
            const compiled = await compileCodeV2(editorContent, undefined, { startAddress: addr, architecture: CUSTOM_CPU });

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

            const newCodeMapping = getAssemblyCodeMapping(compiled);
            updateCodeMapping(newCodeMapping)

            let _machineCodeLabels = "";
            _machineCodeLabels += "=== LABELS ===\n";
            compiled.labels.forEach((labelInfo, name) => {
                const labelAddress = labelInfo.address ?? 0xFFFF;
                _machineCodeLabels += `  ${name.padEnd(20)} : ${toHex(labelAddress, 4)} (line ${labelAddress} - section ${labelInfo.section})\n`;
            });
            _machineCodeLabels += "\n";
            setMachineCodeLabels(_machineCodeLabels)

            const _bytecode: Map<u16, u8> = getBytecodeArray(compiled);
            setBytecode(_bytecode)
            setCodeLoaded(false)

            const msg = `Compiled ${_bytecode.size} bytes`;
            setEditorStatus(msg);
            addLog(msg);
            addLog(`You can load the compiled code in RAM with the "Load" button`);

        } catch (e: any) {
            setEditorError(e.message || 'Compilation error');
            addLog(`Error: ${e.message}`);
        }
    }


    const handleLoadEditorCodeInRam = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null || !bytecode) return;

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
                emulator.writeRam(addr + offset as u16, value as u8);
            }

            const msg = `Loaded ${bytecode.size} bytes @ ${toHex(addr, 4)}`;
            setEditorStatus(msg);
            setCodeLoaded(true)
            addLog(msg);
            addLog(`Type "custom" in the shell to run your code (call ${toHex(addr, 4)})`);

        } catch (e: any) {
            setEditorError(e.message || 'Load error');
            addLog(`Error: ${e.message}`);
        }
    }


    const handleEditorUpdate = (value: string | undefined, event: any) => {
        setEditorContent(value ?? '');
        setBytecode(null)
        setCodeLoaded(false)
        setMachineCode(null)
    };


    const handleOpenAssemblyFile = async () => {
        setIsFileModalOpen(true)
    }


    const highlightLine = (lineNumber: number) => {
        const editor = editorRef.current;
        const monaco = monacoRef.current;
        if (!monaco) return;

        // Créer la nouvelle décoration
        const decorations = [{
            range: new monaco.Range(lineNumber, 1, lineNumber, 1),
            options: {
                isWholeLine: true,
                className: 'border-l-4 border-blue-500 bg-blue-50/30',
                //className: 'bg-yellow-500/30',
            }
        }];

        const newDecorationIds = editor.deltaDecorations(currentHighlight, decorations);
        setCurrentHighlight(newDecorationIds);

        //editor.revealLine(lines[0], monaco.editor.ScrollType.Smooth);
        editor.revealLineInCenter(lineNumber, monaco.editor.ScrollType.Smooth);
    };


    return (
        <>

            {/* Editor Tabs: Editor / Log */}
            <div className="flex border-b border-zinc-800/50 bg-[#0c0c13] shrink-0 h-12">
                <button
                    onClick={() => setActiveTab('editor')}
                    className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'editor' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                        }`}>
                    Editor
                </button>

                <button
                    onClick={() => setActiveTab('log')}
                    className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'log' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                        }`}>
                    Log
                </button>

                {!!bytecode && (
                    <>
                        <button
                            onClick={() => setActiveTab('compiled')}
                            className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'compiled' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Compiled
                        </button>

                        <button
                            onClick={() => setActiveTab('labels')}
                            className={`px-4 py-1.5 text-[11px] tracking-wider uppercase transition-colors cursor-pointer ${activeTab === 'labels' ? 'text-zinc-200 border-b-2 border-indigo-500' : 'text-zinc-500 hover:text-zinc-400'
                                }`}>
                            Labels
                        </button>
                    </>
                )}

                {/* Button "togglePanelEmulator" for Mobile-only */}
                <button
                    onClick={() => togglePanelEmulator()}
                    className={`xl:hidden ms-auto tracking-wider px-3 py-1 text-sm uppercase transition-colors text-zinc-500 hover:text-zinc-400 cursor-pointer
                        ${!panelEmulatorHidden
                            ? 'text-zinc-200 border-b-2 border-b-emerald-800'
                            : 'text-zinc-500 hover:text-zinc-400 border-b-2 border-b-orange-800'
                        }`}
                >
                    {panelEmulatorHidden ? "➤ Emulator" : "Expand (2)"}
                </button>

                {/* Button "togglePanelEmulator" for Desktop-only */}
                <button
                    onClick={() => togglePanelEmulator()}
                    className={`hidden xl:block ms-auto tracking-wider px-3 py-1 text-sm uppercase transition-colors text-zinc-500 hover:text-zinc-400 cursor-pointer
                        ${!panelEmulatorHidden
                            ? 'text-zinc-200 border-b-2 border-b-emerald-800'
                            : 'text-zinc-500 hover:text-zinc-400 border-b-2 border-b-orange-800'
                        }`}
                >
                    {panelEmulatorHidden ? "↩" : "⛶"}
                </button>
            </div>

            {/* Editor / Log content */}
            <div className={`flex-1 overflow-y-auto overscroll-contain flex flex-col ${activeTab === 'editor' ? "" : "hidden"}`}>

                <div>
                    {/* Editor Toolbar */}
                    <div className="flex items-center gap-2 px-4 py-2 border-b border-zinc-800/50 bg-[#0c0c13] shrink-0">
                        <button
                            onClick={() => handleOpenAssemblyFile()}
                            className="cursor-pointer px-3 bg-indigo-600 hover:bg-indigo-500 rounded"
                        >
                            Open File
                        </button>

                        <button
                            disabled={!editorContent}
                            onClick={handleCompileEditorCode}
                            className="ms-auto px-3.5 py-1.5 text-xs font-medium rounded bg-indigo-600 hover:bg-indigo-500 disabled:bg-zinc-700 text-white transition-colors cursor-pointer">
                            Compile
                        </button>

                        <button
                            disabled={!bytecode}
                            onClick={handleLoadEditorCodeInRam}
                            className="px-3.5 py-1.5 text-xs font-medium rounded bg-indigo-600 hover:bg-indigo-500 disabled:bg-zinc-700 text-white transition-colors cursor-pointer">
                            Load
                        </button>

                        <div className="flex items-center gap-1.5">
                            <label className="text-[10px] text-zinc-500 uppercase tracking-wider">@</label>
                            <input
                                value={loadAddress}
                                onChange={e => setLoadAddress(e.target.value)}
                                className={`w-20 px-2 py-1 text-xs bg-zinc-900 border border-zinc-700/50 rounded focus:outline-none focus:border-indigo-500/60 ${codeLoaded ? "text-emerald-300" : "text-zinc-500"}`}
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
                    {!editorError && (
                        <div className="px-4 py-1.5 bg-emerald-950/40 border-b border-emerald-800/30 text-emerald-300 text-[11px]">
                            {editorStatus || 'Ready to compile'}
                        </div>
                    )}
                </div>

                <Editor
                    //ref={editorRef}
                    theme="vs-dark"
                    defaultLanguage="asm"
                    value={editorInitialContent}
                    onChange={handleEditorUpdate}
                    beforeMount={handleEditorWillMount}
                    onMount={handleEditorDidMount}
                >
                </Editor>
            </div>

            <div className={`flex-1 overflow-y-auto overscroll-contain ${activeTab === 'compiled' ? "" : "hidden"}`}>
                <Editor
                    className="h-full"
                    language="nasm"
                    value={machineCode ?? ''}
                //tabSize={4}
                //insertSpaces={true}
                //readOnly
                >
                </Editor>
            </div>

            <div className={`flex-1 overflow-y-auto overscroll-contain ${activeTab === 'labels' ? "" : "hidden"}`}>
                <Editor
                    className="h-full"
                    language="nasm"
                    value={machineCodeLabels ?? ''}
                //tabSize={4}
                //insertSpaces={true}
                //readOnly
                >
                </Editor>
            </div>

            <div className={`flex-1 overflow-y-auto overscroll-contain p-4 bg-[#08080d] text-[11px] leading-5 ${activeTab === 'log' ? "" : "hidden"}`}>
                {logs.length === 0 ? (
                    <div className="text-zinc-600 italic">No logs yet.</div>
                ) : (
                    logs.map((l, i) => (
                        <div key={i} className="text-zinc-400">{l}</div>
                    ))
                )}
                <div ref={logEndRef} />
            </div>


            <FileModal
                isOpen={isFileModalOpen}
                onClose={() => setIsFileModalOpen(false)}
                onSelectFile={openAssemblyFileInEditor}
            />
        </>
    );
}

