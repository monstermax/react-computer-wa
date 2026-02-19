
import { useCallback, useEffect, useMemo, useRef, useState } from "react";

import { IoDevice } from "./IoDevice";

import type { u8 } from "@/types/computer.types";


export type ScreenCanvasDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
    width?: number;
    height?: number;
    pixelSize?: number;
    maxLines?: number;
}

export class ScreenCanvasDevice extends IoDevice {
    static type = 'output';
    width = 32 as u8;
    height = 32 as u8;
    pixelSize = 1 as u8;
    private pixels: Uint8Array[];
    private currentX: u8 = 0 as u8;
    private currentY: u8 = 0 as u8;

    constructor(idx: u8, name: string, params: ScreenCanvasDeviceParams) {
        super(idx, name, params);

        this.width = params.width as u8 ?? this.width;
        this.height = params.height as u8 ?? this.height;
        this.pixelSize = params.pixelSize as u8 ?? this.pixelSize;
        this.pixels = Array(this.height).fill(null).map(() => new Uint8Array(this.width))
    }


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // PIXEL_X
                return this.currentX;

            case 0x01: // PIXEL_Y
                return this.currentY;

            case 0x02: // PIXEL_COLOR
                if (this.currentY < this.height && this.currentX < this.width) {
                    const color = this.pixels[this.currentY][this.currentX] as u8;
                    return color;
                }
                return 0 as u8;

            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // PIXEL_X
                this.currentX = (value % this.width) as u8;
                this.emit('state', { currentX: this.currentX, })
                break;

            case 0x01: // PIXEL_Y
                this.currentY = (value % this.height) as u8;
                this.emit('state', { currentY: this.currentY, })
                break;

            case 0x02: // PIXEL_COLOR - Écrire pixel à (currentX, currentY)
                if (this.currentY < this.height && this.currentX < this.width) {
                    const color = value;
                    this.pixels[this.currentY][this.currentX] = color;

                    this.emit('state', { pixels: this.pixels })
                }
                break;
        }
    }


    getPixel(x: number, y: number): u8 {
        if (y >= 0 && y < this.height && x >= 0 && x < this.width) {
            return this.pixels[y][x] as u8;
        }
        return 0 as u8;
    }


    clear() {
        this.pixels = Array(this.height).fill(null).map(() => new Uint8Array(this.width));
        this.emit('state', { pixels: this.pixels })
    }


    reset() {
        this.clear();

        this.currentX = 0 as u8;
        this.currentY = 0 as u8;

        this.emit('state', {
            currentX: this.currentX,
            currentY: this.currentY,
        })
    }
}



export type ScreenCanvasProps = {
    deviceInstance: ScreenCanvasDevice | null;
}



export const ScreenCanvas: React.FC<ScreenCanvasProps> = (props) => {
    const { deviceInstance } = props;

    const canvasRef = useRef<HTMLCanvasElement>(null);
    const [currentX, setCurrentX] = useState<number>(0);
    const [currentY, setCurrentY] = useState<number>(0);

    const PIXEL_SIZE = useMemo(() => deviceInstance?.pixelSize, [deviceInstance]);
    const width = useMemo(() => deviceInstance?.width, [deviceInstance]);
    const height = useMemo(() => deviceInstance?.height, [deviceInstance]);


    // Draw the full screen from pixel data
    const drawScreen = useCallback((pixels: Uint8Array[]) => {
        if (!PIXEL_SIZE || !width || !height) return;

        const canvas = canvasRef.current;
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        if (!ctx) return;

        ctx.fillStyle = '#0a0a12';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        for (let y = 0; y < height; y++) {
            if (!pixels[y]) continue;
            for (let x = 0; x < width; x++) {
                const color = pixels[y][x];
                if (color === 0) continue;

                ctx.fillStyle = hslFromByte(color as u8);
                ctx.fillRect(x * PIXEL_SIZE, y * PIXEL_SIZE, PIXEL_SIZE, PIXEL_SIZE);
            }
        }
    }, [width, height]);


    // Listen to device state changes
    useEffect(() => {
        if (!deviceInstance) return;

        const stateHandler = (state: any) => {
            if (state.pixels !== undefined) {
                drawScreen(state.pixels);
            }

            if (state.currentX !== undefined) {
                setCurrentX(state.currentX);
            }

            if (state.currentY !== undefined) {
                setCurrentY(state.currentY);
            }
        };

        deviceInstance.on('state', stateHandler);

        return () => {
            deviceInstance.off('state', stateHandler);
        };
    }, [deviceInstance, drawScreen]);


    // Initial clear
    useEffect(() => {
        const canvas = canvasRef.current;
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        if (!ctx) return;

        ctx.fillStyle = '#0a0a12';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
    }, []);


    const handleClear = useCallback(() => {
        if (!deviceInstance) return;
        deviceInstance.clear();
    }, [deviceInstance]);


    if (!deviceInstance || !PIXEL_SIZE || !width || !height) {
        return <>Loading Screen...</>;
    }

    return (
        <>
            <h2>Screen</h2>

            <div className="flex flex-col gap-2">
                <canvas
                    ref={canvasRef}
                    width={width * PIXEL_SIZE}
                    height={height * PIXEL_SIZE}
                    className="bg-black border-4 border-slate-600 rounded-lg"
                    style={{ imageRendering: 'pixelated' }}
                />

                <div className="flex gap-2 justify-center">
                    <div className="text-xs text-slate-400 p-2 bg-slate-900/30 rounded">
                        Cursor [X={currentX} / Y={currentY}]
                    </div>

                    <button
                        onClick={handleClear}
                        className="cursor-pointer bg-red-600 hover:bg-red-700 px-3 py-1 rounded text-sm transition-colors"
                    >
                        Clear
                    </button>
                </div>
            </div>
        </>
    );
};


function hslFromByte(value: u8): string {
    const hue = Math.round((value / 255) * 360);
    return `hsl(${hue},100%,50%)`;
}
