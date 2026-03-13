
import React from "react";

import { MEMORY_MAP } from "@/../../webassembly/src/memory_map";
import { toHex } from "@/lib/lib_numbers";



export type DocsProps = {
    loadAddress: string;
}

export const Docs: React.FC<DocsProps> = (props) => {
    const { loadAddress } = props;

    return (
        <>
            {/* ── Intro ── */}
            <h2 className="text-lg font-semibold text-zinc-100 mb-3 mt-0">Introduction</h2>
            <p className="mb-4">
                This playground runs a custom 8-bit computer emulated in WebAssembly.
                It boots a bootloader from ROM, which loads a mini OS from disk into RAM.
                The OS provides a shell where you can run built-in commands or execute your own assembly code.
            </p>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-5">CPU</h3>
            <p className="mb-3">
                The CPU is an 8-bit processor with a 16-bit address bus (64KB addressable memory).
                It runs one instruction per cycle, with a configurable clock speed.
            </p>

            <h4 className="text-xs font-semibold text-zinc-400 uppercase tracking-wider mb-1.5 mt-3">Registers</h4>
            <p className="mb-2">6 general-purpose 8-bit data registers and 3 control registers:</p>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">A, B, C, D, E, F</code> <span className="text-zinc-400">General-purpose 8-bit registers</span>
                <code className="text-amber-400">PC</code> <span className="text-zinc-400">Program Counter (16-bit) — current instruction address</span>
                <code className="text-amber-400">SP</code> <span className="text-zinc-400">Stack Pointer (16-bit) — top of stack</span>
                <code className="text-amber-400">IR</code> <span className="text-zinc-400">Instruction Register (8-bit) — current opcode</span>
            </div>
            <p className="mb-3 text-zinc-400 text-xs">
                Registers C:D are often used together as a 16-bit address pair (low:high).
            </p>

            <h4 className="text-xs font-semibold text-zinc-400 uppercase tracking-wider mb-1.5 mt-3">Key Instructions</h4>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">mov</code>   <span className="text-zinc-400">Move data between registers, memory, and immediates</span>
                <code className="text-amber-400">lea</code>   <span className="text-zinc-400">Load effective address into a register pair (C:D)</span>
                <code className="text-amber-400">ldi</code>   <span className="text-zinc-400">Load indirect — read byte at address in C:D</span>
                <code className="text-amber-400">sti</code>   <span className="text-zinc-400">Store indirect — write byte to address in C:D</span>
                <code className="text-amber-400">push / pop</code> <span className="text-zinc-400">Stack operations</span>
                <code className="text-amber-400">call / ret</code> <span className="text-zinc-400">Subroutine call and return</span>
                <code className="text-amber-400">jmp / je / jne / jl / jg</code> <span className="text-zinc-400">Unconditional and conditional jumps</span>
                <code className="text-amber-400">cmp</code>   <span className="text-zinc-400">Compare two values (sets flags for conditional jumps)</span>
                <code className="text-amber-400">add / sub / inc / dec</code> <span className="text-zinc-400">Arithmetic operations</span>
                <code className="text-amber-400">and / or / xor / shl / shr</code> <span className="text-zinc-400">Bitwise operations</span>
                <code className="text-amber-400">int3</code>   <span className="text-zinc-400">Add an assembly breakpoint</span>
                <code className="text-amber-400">debug</code>   <span className="text-zinc-400">Debug values from assembly to console.log</span>
                <code className="text-amber-400">hlt</code>   <span className="text-zinc-400">Halt the CPU</span>
            </div>

            {/* ── Memory ── */}
            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-5">Memory Map</h3>

            <h4 className="text-xs font-semibold text-zinc-400 uppercase tracking-wider mb-1.5 mt-3">ROM</h4>
            <p className="mb-2">
                The bootloader resides in ROM starting at <code className="text-amber-400">0x0000</code>.
                It initializes devices, copies the OS from disk to RAM, then jumps to the OS entry point.
            </p>

            <h4 className="text-xs font-semibold text-zinc-400 uppercase tracking-wider mb-1.5 mt-3">RAM</h4>
            <p className="mb-2">
                The OS, stack, and user programs all live in RAM. User code is loaded at the address
                specified in the editor toolbar (default <code className="text-amber-400">{loadAddress}</code>).
            </p>
            <div className="font-mono text-xs mb-3 pl-2">
                <div className="flex gap-4">
                    <code className="text-amber-400">{toHex(MEMORY_MAP.RAM_START, 4)}-{toHex(MEMORY_MAP.RAM_END, 4)}</code>
                    <span className="text-zinc-400">RAM</span>
                </div>

                <div className="ps-4 grid grid-cols-[auto_1fr] gap-x-4 gap-y-1">
                    <code className="text-amber-400">{toHex(MEMORY_MAP.BOOTLOADER_START, 4)}-{toHex(MEMORY_MAP.DEVICE_TABLE_COUNT-1, 4)}</code>
                    <span className="text-zinc-400">Bootloader</span>

                    <code className="text-amber-400">{toHex(MEMORY_MAP.DEVICE_TABLE_COUNT, 4)}-{toHex(MEMORY_MAP.DEVICE_STRINGS_END, 4)}</code>
                    <span className="text-zinc-400">Devices Table</span>

                    <code className="text-amber-400">{toHex(MEMORY_MAP.SYSCALLS_TABLE_COUNT, 4)}-{toHex(MEMORY_MAP.SYSCALLS_STRINGS_END, 4)}</code>
                    <span className="text-zinc-400">Syscalls Table</span>

                    <code className="text-amber-400">{toHex(MEMORY_MAP.OS_START, 4)}+</code>
                    <span className="text-zinc-400">OS code and data</span>

                    <code className="text-amber-400">{loadAddress}+</code>
                    <span className="text-zinc-400">User program (default load address)</span>

                    <code className="text-amber-400">{toHex(MEMORY_MAP.STACK_END, 4)}</code>
                    <span className="text-zinc-400">Stack top (grows downward to {toHex(MEMORY_MAP.STACK_START, 4)})</span>
                </div>

            </div>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">{toHex(MEMORY_MAP.IO_START, 4)}-{toHex(MEMORY_MAP.IO_END, 4)}</code>
                <span className="text-zinc-400">I/O mapped devices</span>
            </div>

            {/* ── Devices ── */}
            <h2 className="text-lg font-semibold text-zinc-100 mb-3 mt-8 pt-4 border-t border-zinc-800/50">Devices</h2>
            <p className="mb-4">
                All devices are memory-mapped starting at <code className="text-amber-400">{toHex(MEMORY_MAP.IO_START, 4)}</code>.
                Write to device ports with <code className="text-amber-400">sti cl, dl, value</code> and
                read with <code className="text-amber-400">ldi al, cl, dl</code> where C:D holds the port address.
            </p>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Console</h3>
            <p className="mb-2">Text output device. Write ASCII characters one at a time.</p>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">port 0</code> <span className="text-zinc-400">Write a character (ASCII byte). Use 0x0D for newline.</span>
                <code className="text-amber-400">port 1</code> <span className="text-zinc-400">Write any value to clear the console</span>
            </div>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Keyboard</h3>
            <p className="mb-2">
                Input device. Click the Keyboard widget in the Devices tab to give it focus, then type.
                Characters are queued and consumed one at a time by the CPU.
            </p>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">port 0</code> <span className="text-zinc-400">Read: last character pressed. Write 0: clear character.</span>
                <code className="text-amber-400">port 1</code> <span className="text-zinc-400">Read: status (bit 0 = char available). Write 0: acknowledge.</span>
            </div>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Screen</h3>
            <p className="mb-2">
                32×32 pixel display. Pixel color is a hue value (0–255) mapped to HSL at 100% saturation/50% lightness.
                Set X, then Y, then write color to draw a pixel.
            </p>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">port 0</code> <span className="text-zinc-400">Set pixel X coordinate (0–31)</span>
                <code className="text-amber-400">port 1</code> <span className="text-zinc-400">Set pixel Y coordinate (0–31)</span>
                <code className="text-amber-400">port 2</code> <span className="text-zinc-400">Write pixel color (0–255 hue value)</span>
            </div>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">LEDs</h3>
            <p className="mb-2">8 individually controllable LEDs. Each bit of the port byte controls one LED.</p>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">port 0</code> <span className="text-zinc-400">Read/write LED state (8 bits = 8 LEDs, bit 0 = LED 0)</span>
            </div>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Disk</h3>
            <p className="mb-3">
                Sequential storage device with a 16-bit address cursor. Used by the bootloader to
                load the OS. Supports byte-level read/write with auto-incrementing address.
            </p>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Custom IO Devices</h3>
            <p className="mb-3">
                Create your own IO devices to interract between the emulated computer and the real world.
            </p>

            {/* ── Assembly ── */}
            <h2 className="text-lg font-semibold text-zinc-100 mb-3 mt-8 pt-4 border-t border-zinc-800/50">Writing Assembly</h2>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Boot Sequence</h3>
            <p className="mb-3">
                On startup the bootloader (ROM) initializes all devices, reads the OS binary from disk,
                copies it into RAM, and jumps to the OS entry point.
                The OS launches the shell which waits for user input.
            </p>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Shell Commands</h3>
            <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 font-mono text-xs mb-3 pl-2">
                <code className="text-amber-400">help</code>    <span className="text-zinc-400">Show help information</span>
                <code className="text-amber-400">custom</code>  <span className="text-zinc-400">Execute user code loaded in RAM</span>
                <code className="text-amber-400">pixels</code>  <span className="text-zinc-400">Run a graphics demo on screen</span>
                <code className="text-amber-400">sprite</code>  <span className="text-zinc-400">Draw a sprite on screen</span>
                <code className="text-amber-400">leds</code>    <span className="text-zinc-400">Toggle LEDs on/off</span>
                <code className="text-amber-400">clear</code>   <span className="text-zinc-400">Clear the console</span>
                <code className="text-amber-400">ls</code>      <span className="text-zinc-400">List files</span>
                <code className="text-amber-400">halt</code>    <span className="text-zinc-400">Halt the CPU</span>
            </div>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Writing Custom Programs</h3>
            <p className="mb-2">
                Write assembly in the left-side editor, click <strong className="text-zinc-100">Compile & Load</strong> to
                inject it into RAM at the specified address, then type <code className="text-amber-400">custom</code> in the shell to execute it.
            </p>
            <p className="mb-2 text-xs text-zinc-400">Important rules:</p>
            <ul className="list-disc list-inside mb-3 text-zinc-400 text-xs space-y-1 pl-2">
                <li>Always end with <code className="text-amber-400">ret</code> — your code runs as a subroutine called by the shell</li>
                <li>Balance the stack — every <code className="text-amber-400">push</code> needs a matching <code className="text-amber-400">pop</code></li>
                <li>All registers are free to use — the shell does not rely on preserved values</li>
                <li>Access devices via <code className="text-amber-400">sti</code> / <code className="text-amber-400">ldi</code> using their I/O base address</li>
            </ul>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Example: Draw a Pixel</h3>
            <pre className="bg-[#0a0a14] border border-zinc-800/50 rounded p-3 text-xs text-emerald-300/80 mb-4 overflow-x-auto">{
                `; Draw a red pixel at (10, 5)
mov cl, [screen_io_base]
mov dl, [screen_io_base + 1]
sti cl, dl, 10       ; X = 10
call inc_cd
sti cl, dl, 5        ; Y = 5
call inc_cd
sti cl, dl, 0x01     ; color = red (hue)
ret`
            }</pre>

            <h3 className="text-sm font-semibold text-emerald-400 uppercase tracking-wider mb-2 mt-4">Example: Print to Console</h3>
            <pre className="bg-[#0a0a14] border border-zinc-800/50 rounded p-3 text-xs text-emerald-300/80 mb-6 overflow-x-auto">{
                `; Print "Hi" followed by a newline

section .data
  ASCII_H db 'H'
  ASCII_i db 'i'

section .text
    mov cl, [console_io_base]
    mov dl, [console_io_base + 1]

    mov al, ASCII_H ; 'H'
    sti cl, dl, al

    mov al, ASCII_i ; 'i'
    sti cl, dl, al

    sti cl, dl, 13       ; CR = newline
    ret`
            }</pre>

        </>
    );
}