
import { useEffect, useRef, useState } from "react";

import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";


export type KeyboardDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class KeyboardDevice extends IoDevice {
    name = 'keyboard';
    static type = 'input';
    vendor = '';
    model = '';

    lastChar = 0 as u8;
    lastCharName: string = "";
    hasChar = false;
    isEnable = true;
    irqEnabled = false;
    charQueue: {charCode: u8, charName: string}[] = [];
    private specialKeys: Map<string, u8> = new Map<string, u8>();


    constructor(idx: u8, name: string, params: KeyboardDeviceParams) {
        super(idx, name, params);

        // Initialiser le mapping des touches spéciales
        this.initSpecialKeys();
    }


    private initSpecialKeys(): void {
        // Codes standards pour les touches fléchées (souvent utilisés dans les terminaux)
        this.specialKeys.set("ArrowUp", 0x1B as u8);     // ESC [ A
        this.specialKeys.set("ArrowDown", 0x1B as u8);   // ESC [ B
        this.specialKeys.set("ArrowLeft", 0x1B as u8);   // ESC [ C
        this.specialKeys.set("ArrowRight", 0x1B as u8);  // ESC [ D
        // Note: On utilise ESC comme premier caractère, le deuxième sera ajouté dans handleKeyDown
    }


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // KEYBOARD_DATA
                //console.log('keyboard char:', this.lastChar)
                return this.lastChar;

            case 0x01: // KEYBOARD_STATUS
                return ((this.hasChar ? 0x01 : 0x00) | (this.irqEnabled ? 0x02 : 0x00)) as u8;
        }
        return 0 as u8
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // KEYBOARD_DATA
                this.lastChar = 0 as u8;
                this.lastCharName = "";
                this.hasChar = false;
                this.emit('state', { lastChar: this.lastChar, hasChar: this.hasChar, lastCharName: this.lastCharName })
                break;

            case 0x01: // KEYBOARD_STATUS
                // Bit 0: clear le flag hasChar
                if ((value & 0x01) === 0) {
                    this.hasChar = false;
                    this.emit('state', { hasChar: this.hasChar })

                    this.handleCharCodeDequeue()
                }

                // Bit 1: enable/disable IRQ
                this.irqEnabled = (value & 0x02) !== 0;
                break
        }
    }

    start(target: HTMLElement | Window = window) {
        const handleKeyDown = (event: KeyboardEvent) => {
            if (!this.isEnable) return;

            let charCode: u8;
            let charName: string;

            // Vérifier si c'est une touche fléchée
            if (event.key.startsWith('Arrow')) {
                // Pour les flèches, on utilise un séquence ESC + [ + lettre
                // C'est le standard des terminaux (ANSI escape codes)
                switch (event.key) {
                    case 'ArrowUp':
                        charCode = 0x41 as u8; // 'A' en ASCII
                        charName = '↑';
                        break;
                    case 'ArrowDown':
                        charCode = 0x42 as u8; // 'B' en ASCII
                        charName = '↓';
                        break;
                    case 'ArrowLeft':
                        charCode = 0x44 as u8; // 'D' en ASCII
                        charName = '←';
                        break;
                    case 'ArrowRight':
                        charCode = 0x43 as u8; // 'C' en ASCII
                        charName = '→';
                        break;
                    default:
                        return;
                }

                // Pour les flèches, on envoie d'abord ESC (0x1B) puis le caractère
                this.handleCharCodeQueued(0x1B as u8, 'ESC');
                this.handleCharCodeQueued(0x5B as u8, '['); // Caractère '['
                this.handleCharCodeQueued(charCode, charName);

                event.preventDefault();
                event.stopPropagation();
                return;
            }

            charCode = (event.key.length === 1)
                ? event.key.charCodeAt(0) as u8
                : event.keyCode as u8;

            charName = event.key || `${charCode}`;

            const BACKSPACE = 8;
            const TAB = 9;
            const CR = 10;
            const LF = 13;
            const ESC = 27;
            const SPACE = 32;
            if (charCode < SPACE && ! [BACKSPACE, TAB, CR, LF, ESC].includes(charCode)) return;

            this.handleCharCodeQueued(charCode as u8, charName);
            event.preventDefault();
            event.stopPropagation();
        };

        target.addEventListener('keydown', handleKeyDown as EventListener);

        // Return cleanup function
        return () => {
            target.removeEventListener('keydown', handleKeyDown as EventListener);
        };
    }


    reset() {
        this.lastChar = 0 as u8;
        this.lastCharName = "";
        this.hasChar = false;
        this.irqEnabled = false;
        this.emit('state', { lastChar: this.lastChar, hasChar: this.hasChar, lastCharName: this.lastCharName })
    }


    handleCharCodeQueued(charCode: u8, charName: string) {
        this.charQueue.push({charCode, charName})
        this.handleCharCodeDequeue()
    }


    // Fonction pour simuler une touche (pour testing)
    handleCharCodeDequeue() {
        if (this.hasChar) return; // un caractere est toujours en attente de traitement par le cpu
        if (this.charQueue.length === 0) return; //queue vide
        //if (charCode > 127) return;

        const data = this.charQueue.shift();
        if (!data) return;

        const { charCode, charName } = data;

        this.lastChar = charCode as u8;
        this.lastCharName = charName;
        this.hasChar = true;

        this.emit('state', { lastChar: this.lastChar, hasChar: this.hasChar, lastCharName: this.lastCharName })

        //if (interruptHook?.requestInterrupt) {
        //    interruptHook.requestInterrupt(U8(MEMORY_MAP.IRQ_KEYBOARD));
        //}
    }

}



export type KeyboardProps = {
    deviceInstance: KeyboardDevice | null
}

export const Keyboard: React.FC<KeyboardProps> = (props) => {
    const { deviceInstance } = props;

    const [lastChar, setLastChar] = useState<u8>(0 as u8)
    const [lastCharName, setLastCharName] = useState<string>("")
    const [hasChar, setHasChar] = useState<boolean>(true)
    const [isFocused, setIsFocused] = useState(false)
    const containerRef = useRef<HTMLDivElement>(null)


    useEffect(() => {
        if (!deviceInstance) return;

        const stateHandler = (state: any) => {
            if (state.lastChar !== undefined) {
                setLastChar(state.lastChar)
            }
            if (state.lastCharName !== undefined) {
                setLastCharName(state.lastCharName)
            }

            if (state.hasChar !== undefined) {
                setHasChar(state.hasChar)
            }
        }

        deviceInstance.on('state', stateHandler)

        return () => {
            deviceInstance.off('state', stateHandler)
        };

    }, [deviceInstance])


    // Attach keyboard listener to the container div
    useEffect(() => {
        if (!deviceInstance || !containerRef.current) return;

        const cleanup = deviceInstance.start(containerRef.current);
        return cleanup;
    }, [deviceInstance])


    if (!deviceInstance) {
        return (
            <>Loading Keyboard...</>
        );
    }


    return (
        <>
            <h2>Keyboard</h2>

            <div
                ref={containerRef}
                id="device-keyboard"
                tabIndex={0}
                onFocus={() => setIsFocused(true)}
                onBlur={() => setIsFocused(false)}
                className={`grid grid-cols-2 gap-4 p-3 bg-slate-900/50 rounded outline-none cursor-pointer transition-all min-h-28 ${
                    isFocused
                        ? 'ring-2 ring-green-500/50'
                        : 'ring-1 ring-transparent hover:ring-slate-600/50'
                }`}
            >
                <div>
                    <div className="text-xs text-slate-400 mb-1">Last Char:</div>
                    <div className="font-mono text-green-400">
                        {lastChar > 0 ? (
                            <div>
                                <div className="flex">
                                    <div className="text-2xl">
                                        '{String.fromCharCode(lastChar)}'
                                    </div>

                                    <div className="text-sm text-slate-400 ml-2">
                                        (0x{lastChar.toString(16).padStart(2, '0')})
                                    </div>
                                </div>

                                {(lastCharName.length > 1) && (
                                    <div className="italic">{lastCharName}</div>
                                )}
                            </div>
                        ) : (
                            <span className="text-slate-600">--</span>
                        )}
                    </div>
                </div>
                <div>
                    <div className="text-xs text-slate-400 mb-1">Status:</div>
                    <div className="flex items-center gap-2 mt-2">
                        <div
                            className={`w-4 h-4 rounded-full ${hasChar ? 'bg-green-500 animate-pulse' : 'bg-slate-700'
                                }`}
                        />
                        <span className="text-sm text-slate-300">
                            {isFocused
                                ? (hasChar ? 'Char Available' : 'Listening...')
                                : 'Click to focus'
                            }
                        </span>
                    </div>
                </div>
            </div>
        </>
    );
}
