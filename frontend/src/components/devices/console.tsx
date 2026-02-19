
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
    width = 30;
    height = 15;
    lines = [] as string[];
    maxLines = 100;
    currentLine = "";
    currentLinePosition = 0;
    private escapeSequence: string = "";
    private inEscapeSequence: boolean = false;


    constructor(idx: u8, name: string, params: ConsoleDeviceParams) {
        super(idx, name, params);

        this.width = params.width ?? this.width;
        this.height = params.height ?? this.height;
        this.maxLines = params.maxLines ?? this.maxLines;
    }


    private handleEscapeSequence(charCode: u8): void {
        // Accumuler la séquence
        this.escapeSequence += String.fromCharCode(charCode);

        // Les séquences pour les flèches sont: ESC [ A (haut), ESC [ B (bas), ESC [ C (droite), ESC [ D (gauche)
        if (this.escapeSequence.length === 1 && charCode !== 0x5B) { // 0x5B = '['
            // Pas une séquence de flèche valide
            this.inEscapeSequence = false;
            this.escapeSequence = "";
            return;
        }

        if (this.escapeSequence.length === 2) {
            // Séquence complète, on l'interprète
            this.processArrowSequence(this.escapeSequence);
            this.inEscapeSequence = false;
            this.escapeSequence = "";
        }
    }


    // Méthode pour traiter les flèches
    private processArrowSequence(seq: string): void {
        // seq est comme "[A", "[B", "[C", "[D"
        const arrow = seq.slice(-1); // Le dernier caractère

        // Représentation visuelle des flèches
        let arrowChar = "";
        switch (arrow) {
            case 'A': { // Up
                //arrowChar = "↑";
                break;
            }
            case 'B': { // Down
                //arrowChar = "↓";
                break;
            }
            case 'C': { // Right
                //arrowChar = "→";
                this.currentLinePosition++;
                break;
            }
            case 'D': { // Left
                //arrowChar = "←";
                this.currentLinePosition--;
                break;
            }
            default: return;
        }

        if (arrowChar) {
            // Afficher la flèche dans la console
            this.currentLine = this.currentLine + arrowChar;
            this.currentLinePosition += arrowChar.length;
            this.emit('state', { currentLine: this.currentLine });
        }

        this.emit('state', { currentLinePosition: this.currentLinePosition });
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

                //console.log('console char:', charCode, `"${char}"`, this.inEscapeSequence)

                // Gestion des séquences d'échappement
                if (this.inEscapeSequence) {
                    this.handleEscapeSequence(charCode);
                    return;
                }

                if (charCode === ESC) {
                    // Début d'une séquence d'échappement
                    this.inEscapeSequence = true;
                    this.escapeSequence = "";
                    return;
                }


                if (charCode === CR || charCode === LF) {
                    // Newline (LF ou CR)
                    this.lines.push(this.currentLine)
                    //console.log('console lines:', this.lines)

                    // Limiter le nombre de lignes
                    if (this.lines.length > this.maxLines) {
                        this.lines = this.lines.slice(-this.maxLines);

                    } else {
                        this.currentLine = "";
                        this.currentLinePosition = 0;

                        this.emit('state', { currentLine: this.currentLine, currentLinePosition: this.currentLinePosition })
                    }

                    //console.log(`📟 Console: "${this.currentLine}"`);

                    this.emit('state', { lines: this.lines.slice() })

                } else if (charCode === BACKSPACE) {
                    // Backspace
                    this.currentLine = this.currentLine.slice(0, -1);
                    this.currentLinePosition--;
                    this.emit('state', { currentLine: this.currentLine, currentLinePosition: this.currentLinePosition })

                } else if (charCode >= SPACE /* && charCode <= 0x7E */) {
                    // Caractères imprimables ASCII
                    this.currentLine = this.currentLine + char;
                    this.currentLinePosition += char.length;
                    this.emit('state', { currentLine: this.currentLine, currentLinePosition: this.currentLinePosition })

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
        this.currentLinePosition = 0
        this.emit('state', { lines: this.lines.slice(), currentLine: this.currentLine, currentLinePosition: this.currentLinePosition })
    }
}



export type ConsoleProps = {
    deviceInstance: ConsoleDevice | null
}


export const Console: React.FC<ConsoleProps> = (props) => {
    const { deviceInstance } = props;

    const [width, setWidth] = useState(0);
    const [height, setHeight] = useState(0);
    const [lines, setLines] = useState<string[]>([])
    const [currentLine, setCurrentLine] = useState<string>("")
    const [currentLinePosition, setCurrentLinePosition] = useState<number>(0)
    const [demoCleaned, setDemoCleaned] = useState(false);
    const scrollContainerRef = useRef<HTMLDivElement>(null);
    const logEndRef = useRef<HTMLDivElement>(null);


    useEffect(() => {
        if (!deviceInstance) return;

        const stateHandler = (state: any) => {
            //console.log('Console state update', state)

            if (!demoCleaned) {
                setLines([]);
                setCurrentLine("");
                setCurrentLinePosition(0);
                setDemoCleaned(true)
            }

            if (state.lines !== undefined) {
                setLines(state.lines)
            }

            if (state.currentLine !== undefined) {
                setCurrentLine(state.currentLine)
            }

            if (state.currentLinePosition !== undefined) {
                setCurrentLinePosition(state.currentLinePosition)
            }
        };

        deviceInstance.on('state', stateHandler)

        setWidth(deviceInstance.width)
        setHeight(deviceInstance.height)

        setLines(deviceInstance.lines.slice())
        setCurrentLine(deviceInstance.currentLine)
        setCurrentLinePosition(deviceInstance.currentLinePosition)

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

        const element = logEndRef.current;
        const offset = 0;

        const container = scrollContainerRef.current;
        if (!element || !container) return;

        const elementTop = element.offsetTop;
        const containerHeight = container.clientHeight;

        const targetScroll = elementTop - (containerHeight / 2) + offset;
        const maxScroll = container.scrollHeight - containerHeight;
        const clampedScroll = Math.max(0, Math.min(targetScroll, maxScroll));

        container.scrollTo({
            top: clampedScroll,
            behavior: 'smooth'
        });
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
        <div
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
                ref={scrollContainerRef}
                className="p-4 overflow-y-auto overscroll-contain bg-[#1e1e1e] cursor-text relative"
                style={{ height: `calc(${deviceInstance.height * 1.15}em - 41px)` }}
                onClick={() => document.getElementById('device-keyboard')?.focus({ preventScroll: true })}
            >
                {/* Clear button - appears on hover */}
                <button
                    onClick={handleClear}
                    className="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity bg-red-700 hover:bg-red-600 px-2 py-0.5 rounded text-xs text-gray-200 border border-red-600"
                >
                    Clear
                </button>

                {lines.length === 0 && !currentLine ? (
                    <div className=""></div>
                ) : (
                    <>
                        {lines.map((line, i) => (
                            <div key={i} className="text-gray-300 whitespace-pre-wrap break-all">
                                {line || '\u00A0'}
                            </div>
                        ))}
                        {currentLine && (
                            <div className="text-gray-300 whitespace-pre-wrap break-all relative">
                                {currentLine}
                                {/* <span className={`absolute animate-pulse ml-0.5`} style={{ left: `${currentLinePosition % width}ch`, top: `${(1.2 * Math.floor(currentLinePosition / width)).toFixed(1)}rem` }}>▊</span> */}
                                <span className={`animate-pulse ml-0.5`}>▊</span>
                            </div>
                        )}
                    </>
                )}
                <div ref={logEndRef} />
            </div>
        </div>
    );
}
