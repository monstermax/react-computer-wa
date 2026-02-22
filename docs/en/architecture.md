# Architecture

## What it does

The emulator models an 8-bit CPU with a 16-bit address space.

Core pieces:

- CPU execution engine (`Cpu.ts`)
- Memory bus routing (`Memory.ts`)
- Device registration and I/O dispatch (`IoManager.ts`)
- WebAssembly public API (`index.ts`)

## CPU model

Registers:

- 8-bit: `A B C D E F`
- 16-bit: `PC SP`
- 8-bit: `IR FLAGS`

Flags currently used:

- `zero`
- `carry`

## Execution flow

Per cycle:

1. Read opcode at `PC`
2. Store opcode in `IR`
3. Execute instruction
4. Update `PC` according to instruction format/behavior

Instruction dispatch is centralized in `fetchInstructionActions`.

## WebAssembly API surface

Main exported functions include:

- Computer lifecycle: `instanciateComputer`, `computerResetComputer`
- Program loading: `computerloadCode`
- Execution: `computerRunCycles`, `computerGetCycles`
- Inspection: register getters + `computerGetMemory`
- Mutation: `computerSetMemory`
- Devices: `computerAddDevice`
