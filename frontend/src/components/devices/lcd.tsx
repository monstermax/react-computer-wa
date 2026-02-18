
import { useCallback, useEffect, useRef, useState } from "react";

import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";


export type LcdDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    width?: number;
    height?: number;
}

export class LcdDevice extends IoDevice {
    static type = 'output';

    public width: number = 16;
    public height: number = 2;
    public display: string[][];
    public cursorRow: number = 0;
    public cursorCol: number = 0;
    public cursorVisible: boolean = true;


    constructor(idx: u8, name: string, params: LcdDeviceParams) {
        super(idx, name, params);

        this.width = params.width ?? this.width;
        this.height = params.height ?? this.height;
        this.display = Array(this.height).fill(null).map(() => Array(this.width).fill(' '))

        this.emit('state', { width: this.width, height: this.height, display: this.display })
    }


    read(port: u8): u8 {
        switch (port) {
            // LCD est write-only

            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // LCD_DATA - Écrire un caractère
                if (this.cursorRow < this.height && this.cursorCol < this.width) {
                    const char = String.fromCharCode(value);
                    this.display[this.cursorRow][this.cursorCol] = char;

                    // Auto-avancer curseur

                    this.cursorCol = this.cursorCol + 1

                    if (this.cursorCol >= this.width) {
                        this.cursorCol = 0;
                        this.cursorRow = (this.cursorRow + 1) % this.height;

                        this.emit('state', { cursorRow: this.cursorRow })
                    }

                    this.emit('state', { cursorCol: this.cursorCol })
                }
                break;

            case 0x01: // LCD_COMMAND
                switch (value) {
                    case 0x01: // Clear
                        this.display = Array(this.height).fill(null).map(() => Array(this.width).fill(' '));
                        this.cursorRow = 0;
                        this.cursorCol = 0;
                        this.emit('state', { cursorCol: this.cursorCol, cursorRow: this.cursorRow, display: this.display })
                        break;

                    case 0x02: // Home
                        this.cursorRow = 0;
                        this.cursorCol = 0;
                        this.emit('state', { cursorCol: this.cursorCol, cursorRow: this.cursorRow })
                        break;

                    case 0x0C: // Display ON, cursor OFF
                        this.cursorVisible = false;
                        this.emit('state', { cursorVisible: this.cursorVisible })
                        break;

                    case 0x0E: // Display ON, cursor ON
                        this.cursorVisible = true;
                        this.emit('state', { cursorVisible: this.cursorVisible })
                        break;

                    case 0x10: // Cursor left
                        this.cursorCol = Math.max(0, this.cursorCol - 1);
                        this.emit('state', { cursorCol: this.cursorCol })
                        break;

                    case 0x14: // Cursor right
                        this.cursorCol = Math.min(this.width - 1, this.cursorCol + 1);
                        this.emit('state', { cursorCol: this.cursorCol })
                        break;
                }
                break;

            case 0x02: // LCD_CURSOR - Position curseur (row * 16 + col)
                const row = Math.floor(value / this.width) % this.height;
                const col = value % this.width;
                this.cursorRow = row;
                this.cursorCol = col;
                this.emit('state', { cursorCol: this.cursorCol, cursorRow: this.cursorRow })
                break;
        }
    }


    reset(): void {
        this.display = Array(this.height).fill(null).map(() => Array(this.width).fill(' '));
        this.cursorRow = 0;
        this.cursorCol = 0;
        this.cursorVisible = true;

        this.emit('state', { cursorCol: this.cursorCol, cursorRow: this.cursorRow, display: this.display, cursorVisible: this.cursorVisible })
    }


    getText(): string[] {
        return this.display.map(row => row.join(''));
    }
}




export type LcdProps = {
    deviceInstance: LcdDevice | null;
}


export const Lcd: React.FC<LcdProps> = (props) => {
    const { deviceInstance } = props;

    const [display, setDisplay] = useState<string[][]>(Array(0).fill(null).map(() => Array(0).fill(' ')))
    const [cursorRow, setCursorRow] = useState<number>(0)
    const [cursorCol, setCursorCol] = useState<number>(0)
    const [cursorVisible, setCursorVisible] = useState<boolean>(true)


    useEffect(() => {
        if (!deviceInstance) return;

        const stateHandler = (state: any) => {
            //console.log('LcdDisplay state update', state)

            if (state.display !== undefined) {
                setDisplay(state.display)
            }

            if (state.cursorRow !== undefined) {
                setCursorRow(state.cursorRow)
            }

            if (state.cursorCol !== undefined) {
                setCursorCol(state.cursorCol)
            }

            if (state.cursorVisible !== undefined) {
                setCursorVisible(state.cursorVisible)
            }
        }

        setDisplay(Array(deviceInstance.height).fill(null).map(() => Array(deviceInstance.width).fill(' ')));

        deviceInstance.on('state', stateHandler)

        return () => {
            deviceInstance.off('state', stateHandler)
        };

    }, [deviceInstance])


    if (!deviceInstance) {
        return (
            <>Loading LCD...</>
        );
    }

    return (
        <>
            <h2>LCD</h2>

            <div className="p-2 rounded flex gap-4 items-center">

                <div className="bg-green-900 border-4 border-slate-600 rounded-lg p-3 mx-auto">
                    {display.map((row, rowIndex) => (
                        <div key={rowIndex} className="font-mono text-lg leading-tight">
                            {row.map((char, colIndex) => {
                                const isCursor = cursorVisible &&
                                    rowIndex === cursorRow &&
                                    colIndex === cursorCol;

                                return (
                                    <span
                                        key={colIndex}
                                        className={`inline-block w-[1.2ch] text-center ${isCursor
                                            ? 'bg-green-400 text-slate-900 animate-pulse'
                                            : 'text-green-400'
                                            }`}
                                    >
                                        {char}
                                    </span>
                                );
                            })}
                        </div>
                    ))}
                </div>
            </div>
        </>
    );
}

