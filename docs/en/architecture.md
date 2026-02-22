# Architecture

## Overview

The project implements an 8-bit computer with a 16-bit address bus.

Observed points:

- CPU in AssemblyScript (`web_assembly/src/Cpu.ts`)
- Compiled to a WebAssembly module
- React/Vite/TypeScript frontend
- Memory bus routing ROM / RAM / I/O (`Memory.ts`)
- I/O manager (`IoManager.ts`)

## CPU

Registers visible in `CpuRegisters`:

- `A, B, C, D, E, F` (u8)
- `PC` (u16)
- `IR` (u8)
- `SP` (u16)
- `FLAGS` (u8)

Current flags via `getFlag/setFlags`:

- bit 1 = zero
- bit 0 = carry

## Execution

CPU cycle (`runCpuCycle`):

1. fetch opcode at `PC`
2. store opcode in `IR`
3. execute instruction

Instruction dispatch is implemented in `fetchInstructionActions`.

## Frontend / WASM boundary

Main exports in `web_assembly/src/index.ts`:

- `instanciateComputer()`
- `computerloadCode(...)`
- `computerRunCycles(...)`
- register/memory getters
- `computerSetMemory(...)`
- `computerAddDevice(...)`
- `computerResetComputer(...)`
