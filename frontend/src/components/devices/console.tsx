
import { useEffect, useRef, useState } from "react";

import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";


const initialConsoleLines = [
    `# Press the Start button above to run the computer`,
    '',
    '',
    '# 1. This will launch the bootloader located in the ROM.',
    '',
    '# 2. The operating system is then loaded into memory and executed. Once started, it offers a shell containing several commands.',
    '',
    '# 3. You can write assembly code (in the left-hand section), compile it, and run it in this emulator.',
];

export type ConsoleDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    width?: number;
    height?: number;
    maxLines?: number;
}

export class ConsoleDevice extends IoDevice {
    static type = 'output';
    name = 'console';
    vendor = '';
    model = '';

    width = 30;
    height = 15;
    lines = [] as string[];
    maxLines = 100;
    currentLine = "";


    constructor(idx: u8, name: string, params: ConsoleDeviceParams) {
        super(idx, name, params);

        this.width = params.width ?? this.width;
        this.height = params.height ?? this.height;
        this.maxLines = params.maxLines ?? this.maxLines;
    }


    read(port: u8): u8 {
        return 0 as u8; // write only
    }

    write(port: u8, value: u8): void {
        const BACKSPACE = 8;
        const TAB = 9;
        const CR = 10;
        const LF = 13;
        const ESC = 27;
        const SPACE = 32;

        switch (port) {
            case 0x00: // CONSOLE_CHAR - Écrire un caractère
                const charCode = value;
                const char = String.fromCharCode(charCode);

                //console.log('console char:', char)

                if (charCode === CR || charCode === LF) {
                    // Newline (LF ou CR)
                    this.lines.push(this.currentLine)
                    //console.log('console lines:', this.lines)

                    // Limiter le nombre de lignes
                    if (this.lines.length > this.maxLines) {
                        this.lines = this.lines.slice(-this.maxLines);
                        return;
                    }

                    this.currentLine = "";
                    //console.log(`📟 Console: "${currentLine}"`);

                    this.emit('state', { lines: this.lines, currentLine: this.currentLine })

                } else if (charCode === BACKSPACE) {
                    // Backspace
                    this.currentLine = this.currentLine.slice(0, -1);
                    this.emit('state', { currentLine: this.currentLine })

                } else if (charCode >= SPACE /* && charCode <= 0x7E */) {
                    // Caractères imprimables ASCII
                    this.currentLine = this.currentLine + char;
                    this.emit('state', { currentLine: this.currentLine })

                } else if ([TAB, ESC].includes(charCode)) {
                    // caractères de contrôle - ignorer

                } else {
                    // Autres caractères de contrôle - ignorer
                    console.warn(`📟 Console: Unprintable character 0x${charCode.toString(16)} (${charCode})`);
                }
                break;

            case 0x01: // CONSOLE_CLEAR - Clear screen
                this.reset()
                //console.log(`📟 Console: Screen cleared`);
                break;
        }
    }

    reset() {
        this.lines = [];
        this.currentLine = "";
        this.emit('state', { lines: this.lines, currentLine: this.currentLine })
    }
}



export type ConsoleProps = {
    deviceInstance: ConsoleDevice | null
}


export const Console: React.FC<ConsoleProps> = (props) => {
    const { deviceInstance } = props;

    const [lines, setLines] = useState<string[]>([])
    const [currentLine, setCurrentLine] = useState<string>("")
    const [demoCleaned, setDemoCleaned] = useState(false);
    const scrollRef = useRef<HTMLDivElement>(null);
    const logEndRef = useRef<HTMLDivElement>(null);


    useEffect(() => {
        if (!deviceInstance) return;

        const stateHandler = (state: any) => {
            //console.log('Console state update', state)

            if (!demoCleaned) {
                setLines([]);
                setCurrentLine("");
                setDemoCleaned(true)
            }

            if (state.lines !== undefined) {
                setLines(state.lines)
            }

            if (state.currentLine !== undefined) {
                setCurrentLine(state.currentLine)
            }
        };

        deviceInstance.on('state', stateHandler)

        if (!demoCleaned) {
            setLines(initialConsoleLines);
        }

        return () => {
            deviceInstance.off('state', stateHandler)
        };

    }, [deviceInstance, demoCleaned])


    // Handle Console Scroll
    useEffect(() => {
        //logEndRef.current?.scrollIntoView({ behavior: 'smooth' }); // TODO: a revoir: ca scroll la page entiere, à chaque nouveau caractere
    }, [currentLine, lines]);


    const handleClear = () => {
        if (!deviceInstance) return;
        deviceInstance.write(0x01 as u8, 0 as u8); // CONSOLE_CLEAR
    };


    if (!deviceInstance) {
        return (
            <>Loading Console...</>
        );
    }


    return (
        <div className="flex justify-end">
            <div
                ref={scrollRef}
                className="bg-[#1e1e1e] rounded-lg overflow-hidden border border-gray-700 shadow-xl font-mono text-sm relative group"
                style={{ height: `${deviceInstance.height * 1.15}em`, width: `${deviceInstance.width * 1.1}ch` }}
            >
                {/* Terminal Header */}
                <div className="bg-[#2d2d2d] px-4 py-2 flex items-center border-b border-gray-700">
                    <div className="flex space-x-2">
                        <div className="w-3 h-3 rounded-full bg-[#ff5f56] border border-[#ff3b30]"></div>
                        <div className="w-3 h-3 rounded-full bg-[#ffbd2e] border border-[#ff9f0a]"></div>
                        <div className="w-3 h-3 rounded-full bg-[#27c93f] border border-[#34c759]"></div>
                    </div>
                    <div className="flex-1 text-center">
                        <span className="text-xs text-gray-400">bash</span>
                    </div>
                    <div className="w-16"></div>
                </div>

                {/* Terminal Content */}
                <div
                    className="p-4 overflow-y-auto bg-[#1e1e1e] cursor-text relative"
                    style={{ height: `calc(${deviceInstance.height * 1.15}em - 41px)` }}
                    onClick={() => document.getElementById('device-keyboard')?.focus()}
                >
                    {/* Clear button - appears on hover */}
                    <button
                        onClick={handleClear}
                        className="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity bg-red-700 hover:bg-red-600 px-2 py-0.5 rounded text-xs text-gray-200 border border-red-600"
                    >
                        Clear
                    </button>

                    {lines.length === 0 && !currentLine ? (
                        <div className="text-green-500/50 italic">

                        </div>
                    ) : (
                        <>
                            {lines.map((line, i) => (
                                <div key={i} className="text-gray-300 whitespace-pre-wrap break-all">
                                    {line || '\u00A0'}
                                </div>
                            ))}
                            {currentLine && (
                                <div className="text-gray-300 whitespace-pre-wrap break-all">
                                    {currentLine}
                                    <span className="animate-pulse ml-0.5">▊</span>
                                </div>
                            )}
                        </>
                    )}
                    <div ref={logEndRef} />
                </div>
            </div>
        </div>
    );
}
