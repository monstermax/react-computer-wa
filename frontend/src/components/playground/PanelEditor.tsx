
import React, { useEffect, useMemo, useRef, useState } from "react";
import Editor, { useMonaco, type Monaco } from '@monaco-editor/react';
import { shikiToMonaco } from '@shikijs/monaco'
import { createHighlighter } from 'shiki'

import { toHex } from "@/lib/lib_numbers";
import { compileCode, compileCodeV2, formatBytecode, getAssemblyCodeMapping, getBytecodeArray, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";
import { basename } from "@/lib/lib_strings";

import { FileModal } from "./FileModal";

import type { u16, u8, u32 } from "@/types/computer.types";
import type { EmulatorHook } from "@/hooks/useEmulator";
import type { Token } from "@/compiler/compiler_lexer";
import type { AssemblyEditorFile, AssemblyEditorHook } from "@/hooks/useAssemblyEditor";
import type { DebuggerHook } from "@/hooks/useDebugger";
import type { CompilerHook } from "@/hooks/useCompiler";
import type { CompilerError } from "@/types/compiler.types";


const defaultLoadAddress = '0xA000';

//const defaultCodeFilepath = "user/examples/draw_fractal_on_screen.asm";
//const defaultCodeFilepath = "user/tests/lcd_test.asm";
const defaultCodeFilepath = "user/examples/sokoban_game.asm";
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
    panelEmulatorHidden: boolean;
    codeMapping: Record<string, Token | undefined>;
    assemblyEditorHook: AssemblyEditorHook;
    debuggerHook: DebuggerHook;
    compilerHook: CompilerHook;
    addLog: (msg: string) => void;
    togglePanelEmulator: () => void;
    openAssemblyFileInEditor: (filePath: string, selectedLine?: number | undefined) => Promise<void>;
    updateCodeMapping: (newCodeMapping: Record<string, Token | undefined>) => void;
}


export const PanelEditor: React.FC<PanelEditorProps> = (props) => {
    const { emulator, logs, panelEmulatorHidden, codeMapping, assemblyEditorHook, debuggerHook, compilerHook } = props;
    const { addLog, togglePanelEmulator, openAssemblyFileInEditor, updateCodeMapping } = props;

    const monaco = useMonaco();

    // ── Editor ──
    const editorRef = useRef<any>(null); // Monaco Editor
    const monacoRef = useRef<Monaco>(null);
    const [editorMounted, setEditorMounted] = useState(false);
    const [isFileModalOpen, setIsFileModalOpen] = useState(false);

    const editorContent = useMemo(() => {
        const file: AssemblyEditorFile | null = assemblyEditorHook.activeFile
            ? assemblyEditorHook.openFiles.get(assemblyEditorHook.activeFile) ?? null
            : null;

        return file?.content ?? '';
    }, [assemblyEditorHook.activeFile, assemblyEditorHook.openFiles.size]); // NOTE: ne pas refresh en fonction de assemblyEditorHook.openFiles sinon l'edition fonctionne mal

    // ── Compiler ──
    const [machineCode, setMachineCode] = useState<string | null>(null);
    const [machineCodeLabels, setMachineCodeLabels] = useState<string | null>(null);
    const [bytecode, setBytecode] = useState<Map<u16, u8> | null>(null);
    const [loadAddress, setLoadAddress] = useState(defaultLoadAddress);
    const [editorError, setEditorError] = useState<string | null>(null);
    const [editorStatus, setEditorStatus] = useState<string | null>(null);
    const [codeLoaded, setCodeLoaded] = useState(false);

    // ── Marker & Breakpoints ──
    const [currentHighlightMarker, setCurrentHighlightMarker] = useState<any[]>([]); // Marker decoration (blue)
    const [currentHighlightDebugger, setCurrentHighlightDebugger] = useState<any[]>([]); // Marker decoration (jaune)
    const decorationsRef = useRef([]); // Breakpoints decortions

    // ── Logs ──
    const [activeTab, setActiveTab] = useState<'editor' | 'compiled' | 'labels' | 'log'>('editor');
    const logEndRef = useRef<HTMLDivElement>(null);


    // Handle Logs Scroll
    useEffect(() => {
        //logEndRef.current?.scrollIntoView({ behavior: 'smooth' }); // TODO: a revoir: ca scroll la page entiere, à chaque nouveau caractere
    }, [logs]);


    // A REVOIR
    const codeMappingReverse = useMemo(() => {
        const _codeMappingReverse = Object.fromEntries(
            Object.entries(codeMapping)
                .map(([address, v]) => [`${v?.file}:${v?.line}`, address])
        )

        //console.log('codeMapping changed:', Object.keys(codeMapping).length, codeMapping)
        //console.log('_codeMapping changed:', Object.keys(_codeMappingReverse).length, _codeMappingReverse)
        return _codeMappingReverse
    }, [codeMapping])


    // A REVOIR
    useEffect(() => {
        if (!editorMounted) return;

        const handleToggleBreakpoint = (lineNumber: number) => {
            const filepath = assemblyEditorHook.activeFile;
            if (!filepath) return;

            const file = assemblyEditorHook.activeFile;

            const instructionMappingRev = codeMappingReverse[`${filepath}:${lineNumber}`] ?? '';            //if (!mapping) return;
            const address = (instructionMappingRev ? Number(instructionMappingRev) : 0) as u16;

            if (file) {
                //console.log('toggleBreakpoint:', file, lineNumber)
                debuggerHook.toggleBreakpoint(file, lineNumber, address)
            }
        };

        const handleSetBreakpoint = (lineNumber: number, active: boolean) => {
            const filepath = assemblyEditorHook.activeFile;
            if (!filepath) return;

            const file = assemblyEditorHook.activeFile;

            const instructionMappingRev = codeMappingReverse[`${filepath}:${lineNumber}`] ?? '';            //if (!mapping) return;
            const address = (instructionMappingRev ? Number(instructionMappingRev) : 0) as u16;

            if (file) {
                console.log('setBreakpoint:', file, lineNumber, active)
                debuggerHook.setBreakpoint(file, lineNumber, address, active)
            }
        };

        emulator.eventEmitter.on('toggleBreakpoint', handleToggleBreakpoint)
        emulator.eventEmitter.on('setBreakpoint', handleSetBreakpoint)

        return () => {
            emulator.eventEmitter.off('toggleBreakpoint', handleToggleBreakpoint)
            emulator.eventEmitter.off('setBreakpoint', handleSetBreakpoint)
        }

    }, [editorMounted, assemblyEditorHook.activeFile])


    const handleEditorDidMount = async (editor: any, monaco: Monaco) => {
        editorRef.current = editor;
        monacoRef.current = monaco;

        // Configurer le gutter pour les breakpoints
        editor.onMouseDown((e: any) => {

            if (e.target?.type === monaco.editor.MouseTargetType.GUTTER_GLYPH_MARGIN) {
                const lineNumber = e.target.position.lineNumber;
                emulator.eventEmitter.emit('toggleBreakpoint', lineNumber)
            }
        });

        // Ajouter un menu contextuel
        editor.addAction({
            id: 'add-breakpoint',
            label: 'Add Breakpoint',
            contextMenuGroupId: 'navigation',
            contextMenuOrder: 1.5,
            run: (ed: any) => {
                const position = ed.getPosition();

                if (position) {
                    emulator.eventEmitter.emit('setBreakpoint', position.lineNumber, true)
                }
            }
        });

        editor.addAction({
            id: 'remove-breakpoint',
            label: 'Remove Breakpoint',
            contextMenuGroupId: 'navigation',
            contextMenuOrder: 1.6,
            run: (ed: any) => {
                const position = ed.getPosition();

                if (position) {
                    emulator.eventEmitter.emit('setBreakpoint', position.lineNumber, false)
                }
            }
        });


        const highlighter = await createHighlighter({
            themes: ['vitesse-dark'],
            langs: ['asm'],
        });

        monaco.languages.register({ id: 'asm' });
        shikiToMonaco(highlighter, monaco);

        setEditorMounted(true)
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


    useEffect(() => {
        updateBreakpointDecorations(debuggerHook.breakpoints)
    }, [assemblyEditorHook.activeFile, debuggerHook.breakpoints])



    const updateBreakpointDecorations = (_breakpoints: Map<string, any>) => {
        const monaco = monacoRef.current;
        if (!editorRef.current || !monaco) return;


        // Nettoyer les anciennes décorations
        if (decorationsRef.current.length > 0) {
            editorRef.current.deltaDecorations(decorationsRef.current, []);
        }

        // Créer les nouvelles décorations
        const decorations = Array.from(_breakpoints.values())
            .filter(breakpoint => breakpoint.file === assemblyEditorHook.activeFile)
            .map(breakpoint => ({
                range: new monaco.Range(breakpoint.line, 1, breakpoint.line, 1),
                options: {
                    isWholeLine: false,
                    glyphMarginClassName: 'breakpoint-dot',
                    glyphMarginHoverMessage: 'Breakpoint',
                }
            }));

        decorationsRef.current = editorRef.current.deltaDecorations([], decorations);
    };


    // Applique scroll horizonral sur files tabs
    useEffect(() => {
        const fileTabs = document.querySelector<HTMLDivElement>('.-file-tabs');
        if (!fileTabs) return;

        const handleWheel = (e: WheelEvent) => {
            if (fileTabs.contains(e.target as Node)) {
                e.preventDefault();
                fileTabs.scrollLeft += e.deltaY;
            }
        };

        fileTabs.addEventListener('wheel', handleWheel, { passive: false });
        return () => fileTabs.removeEventListener('wheel', handleWheel);
    }, []);


    // ═══════════════════════════════════════════
    //  Editor: Compile & Load user code to RAM
    // ═══════════════════════════════════════════

    const handleCompileEditorCode = async () => {
        if (!emulator.wasmExports || emulator.computerPointer === null) return;

        setEditorError(null);
        setEditorStatus(null);

        const startAddress = parseInt(loadAddress);
        if (isNaN(startAddress) || startAddress < 0 || startAddress > 0xFFFF) {
            setEditorError('Invalid load address');
            return;
        }

        try {
            addLog(`Compiling user code... (target @ ${toHex(startAddress, 4)})`);

            const compiled = await compilerHook.compileCode(editorContent, undefined, startAddress)

            // Build Machine Code content (Javascript human-readable values)
            const machineCodeRaw: string = formatBytecode(compiled);
            const _machineCode = `// === MACHINE CODE ===\n\n[\n${machineCodeRaw.trim()}\n]`;
            setMachineCode(_machineCode)

            // Mapping between Assembly sourcecode and Compiled Instructions
            const newCodeMapping = getAssemblyCodeMapping(compiled);
            updateCodeMapping(newCodeMapping)

            // Build labels content (Compilation labels, human-readable)
            let _machineCodeLabels = "";
            _machineCodeLabels += "=== LABELS ===\n";
            compiled.labels.forEach((labelInfo, name) => {
                const labelAddress = labelInfo.address ?? 0xFFFF;
                _machineCodeLabels += `  ${name.padEnd(20)} : ${toHex(labelAddress, 4)} (line ${labelAddress} - section ${labelInfo.section})\n`;
            });
            _machineCodeLabels += "\n";
            setMachineCodeLabels(_machineCodeLabels)

            // Build Bytecode content (Machine Bytecode, ready to load in RAM)
            const _bytecode: Map<u16, u8> = getBytecodeArray(compiled);
            setBytecode(_bytecode)
            setCodeLoaded(false)

            // Display completion information
            const msg = `Compiled ${_bytecode.size} bytes`;
            setEditorStatus(msg);
            addLog(msg);
            addLog(`You can load the compiled code in RAM with the "Load" button`);

        } catch (e: any) {
            setEditorError(e.message || 'Compilation Failed');
            addLog(`Error: ${e.message}`);

            if (e.compileErrors) {
                for (const error of e.compileErrors.errors as CompilerError[]) {
                    addLog(`Line ${error.line}: ${error.message}`);
                }

            }
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


    // Handle editor changes
    const handleEditorUpdate = (value: string | undefined, event: any) => {
        if (assemblyEditorHook.activeFile) {
            assemblyEditorHook.updateFileContent(assemblyEditorHook.activeFile, value ?? '')
        }

        //setEditorContent(value ?? '');
        setBytecode(null)
        setCodeLoaded(false)
        setMachineCode(null)
    };


    // Handle files modal opening
    const handleOpenAssemblyFile = async () => {
        setIsFileModalOpen(true)
    }



    // Met à jour les marker quand la ligne marker ou debugger change
    useEffect(() => {
        const _activate = () => {
            const debugLine = debuggerHook.debugLine;

            const markerLine = debugLine === null
                ? assemblyEditorHook.markerLine
                : null;

            highlightLineDebugger(debugLine);
            highlightLineMarker(markerLine);
        }

        _activate()
    }, [assemblyEditorHook.markerLine, debuggerHook.debugLine]);



    // Ajoute un marker (jaune) sur la ligne debugger
    const highlightLineDebugger = (lineNumber: number | null) => {
        const editor = editorRef.current;
        const monaco = monacoRef.current;
        if (!monaco) return;

        // Créer la nouvelle décoration
        const decorations = (lineNumber === null)
            ? []
            : [
                {
                    range: new monaco.Range(lineNumber, 1, lineNumber, 1),
                    options: {
                        isWholeLine: true,
                        className: 'border border-yellow-500',
                    }
                }
            ];

        //console.log('decorations:', decorations)

        const newDecorationIds = editor.deltaDecorations(currentHighlightDebugger, decorations);
        setCurrentHighlightDebugger(newDecorationIds);

        if (lineNumber !== null) {
            //editor.revealLine(lines[0], monaco.editor.ScrollType.Smooth);
            editor.revealLineInCenter(lineNumber, monaco.editor.ScrollType.Smooth);
        }
    }



    // Ajoute un marker (cadre jaune) sur la ligne active
    const highlightLineMarker = (lineNumber: number | null) => {
        const editor = editorRef.current;
        const monaco = monacoRef.current;
        if (!monaco) return;

        // Créer la nouvelle décoration
        const decorations = (lineNumber === null)
            ? []
            : [
                {
                    range: new monaco.Range(lineNumber, 1, lineNumber, 1),
                    options: {
                        isWholeLine: true,
                        className: 'border-l-4 border-blue-500 bg-blue-50/30',
                    }
                }
            ];

        //console.log('decorations:', decorations)

        const newDecorationIds = editor.deltaDecorations(currentHighlightMarker, decorations);
        setCurrentHighlightMarker(newDecorationIds);

        if (lineNumber !== null) {
            //editor.revealLine(lines[0], monaco.editor.ScrollType.Smooth);
            editor.revealLineInCenter(lineNumber, monaco.editor.ScrollType.Smooth);
        }
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
            <div className={`-code-editor flex-1 overflow-y-auto overscroll-contain flex flex-col ${activeTab === 'editor' ? "" : "hidden"}`}>

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

                    <div className="-file-tabs">
                        {Array.from(assemblyEditorHook.openFiles.values()).map(file => {
                            const isActive = file.filepath === assemblyEditorHook.activeFile;
                            return (
                                <div
                                    key={file.filepath}
                                    className={`${isActive ? "bg-background-light-2xl" : "bg-background-light"}`}
                                    onClick={(event) => assemblyEditorHook.switchToFile(file.filepath)}
                                    onMouseUp={(event) => {
                                        if (event.button === 1) {
                                            assemblyEditorHook.closeFile(file.filepath)
                                        }
                                    }}
                                >
                                    {basename(file.filepath)}
                                    <span
                                        className="close-btn"
                                        onClick={(e) => {
                                            e.stopPropagation(); // Empêche le switch d'onglet
                                            assemblyEditorHook.closeFile(file.filepath);
                                        }}
                                        title="Close"
                                    >
                                        ×
                                    </span>
                                </div>
                            );
                        })}
                        <div
                            className="bg-background-light"
                            onClick={() => assemblyEditorHook.newFile()}
                            title="New file"
                        >
                            +
                        </div>
                    </div>
                </div>

                {/* overflow-scroll content */}

                <Editor
                    //ref={editorRef}
                    theme="vs-dark"
                    defaultLanguage="asm"
                    value={editorContent}
                    onChange={handleEditorUpdate}
                    beforeMount={handleEditorWillMount}
                    onMount={handleEditorDidMount}
                    options={{ glyphMargin: true }}
                >
                </Editor>
            </div>

            <div className={`flex-1 overflow-y-auto overscroll-contain ${activeTab === 'compiled' ? "" : "hidden"}`}>
                <Editor
                    className="h-full"
                    language="javascript"
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
                    language="yaml"
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


