
# 8-bit Computer Emulator

A custom 8-bit computer emulator built from scratch, featuring a CPU running in WebAssembly, an assembly compiler, a bootloader, a minimal OS with shell, and an interactive browser-based playground.

## Architecture

The CPU is an 8-bit processor with a 16-bit address bus (64KB addressable memory), implemented in AssemblyScript and compiled to WebAssembly.

**Registers:** 6 general-purpose 8-bit registers (A–F), plus PC (16-bit), SP (16-bit), and IR (8-bit).

**Memory map:**

| Range | Usage |
|---|---|
| `0x0000-0x04FF` | ROM (Bootloader) |
| `0x0500-0xEFFF` | RAM |
| `0x0500+` | RAM — OS |
| `0xA000+` | RAM — User programs |
| `0xEFFF` | RAM — Stack top (grows downward) |
| `0xF000+` | I/O device ports |

## Instruction Set

The CPU supports a custom instruction set including:

- **Data movement:** `mov`, `lea`, `ldi`, `sti`, `push`, `pop`
- **Arithmetic:** `add`, `sub`, `inc`, `dec`, `cmp`
- **Logic:** `and`, `or`, `xor`, `shl`, `shr`
- **Control flow:** `jmp`, `je`, `jne`, `jl`, `jg`, `jnc`, `call`, `ret`
- **System:** `hlt`

## I/O Devices

Devices are dynamically registered at boot and accessed via memory-mapped I/O starting at `0xF000`. Each device exposes ports for reading and writing.

| Device | Type | Description |
|---|---|---|
| Keyboard | Input | Key data (port 0) + status (port 1) |
| Console | Output | Character output (port 0), clear (port 1) |
| Screen | Output | 32×32 pixel display, HSL color mapping (0–255) |
| LEDs | Output | 8-bit LED register |
| Disk | Storage | Sequential read/write storage, holds the OS image |
| DMA | System | Direct memory access controller |

## Assembly Compiler

A two-pass compiler that targets the custom CPU architecture.

- Sections: `.text` and `.data`
- Labels and local labels (`.label`)
- `EQU` constants with chaining support
- `DB` / `DW` data directives (including multi-line)
- Preprocessor with `include` for file inclusion
- Configurable start address for relocatable code

## Boot Sequence

1. **Bootloader** (ROM @ `0x0000`): initializes devices, loads the OS from disk into RAM, jumps to OS entry point
2. **OS** (RAM @ `0x0700`): sets up the shell, registers built-in commands
3. **Shell**: interactive command prompt over console/keyboard

Shell commands include: `help`, `custom` (execute user code), `pixels`, `sprite`, `leds`, `clear`, `ls`, `halt`.

## Playground

A browser-based IDE built with React and TypeScript for writing, compiling, and running assembly programs on the emulator.

**Features:**
- ASM editor with syntax highlighting ([prism-react-editor](https://github.com/jonpyt/prism-react-editor)) and tab indentation
- Compile & load user code at a configurable address (default `0xA000`)
- Open `.asm` source files from a file browser
- Live device panels: console, 32×32 screen, LEDs, keyboard input, CPU state
- Memory explorer and register dump (on-demand)
- Execution controls: start, stop, step, speed display
- Tabbed right panel (Devices / Memory / Docs) with built-in documentation

## Tech Stack

- **CPU emulation:** AssemblyScript → WebAssembly
- **Compiler:** TypeScript
- **Frontend:** React, TypeScript, Tailwind CSS
- **Editor:** prism-react-editor with NASM syntax highlighting
- **Build:** Vite

## Getting Started

```bash
npm install
npm run dev
```

The WASM module is built separately from the AssemblyScript source:

```bash
npm run asbuild
```

## Project Structure

```
web_assembly/
  src/                # AssemblyScript CPU implementation (→ WASM)

frontend/
  src/
    compiler/         # Assembly compiler (two-pass, TypeScript)
    components/
      playground/     # React playground component and device UIs
      devices/        # Device implementations (keyboard, console, screen, leds, disk, dma)
    lib/
    pages/
    types/
  public/
    asm/
      bootloader/     # Bootloader ASM source
      os/             # OS and shell ASM source
```

## Resources

### Assembly Script
- https://www.assemblyscript.org/


## License

MIT


