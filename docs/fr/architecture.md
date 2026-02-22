# Architecture

## Vue d’ensemble

Le projet implémente un ordinateur 8-bit avec bus d’adresses 16-bit.

Points observés :

- CPU en AssemblyScript (`web_assembly/src/Cpu.ts`)
- Module compilé en WebAssembly
- Frontend React/Vite/TypeScript
- Bus mémoire qui route ROM / RAM / I/O (`Memory.ts`)
- Gestionnaire I/O (`IoManager.ts`)

## CPU

Registres visibles dans `CpuRegisters` :

- `A, B, C, D, E, F` (u8)
- `PC` (u16)
- `IR` (u8)
- `SP` (u16)
- `FLAGS` (u8)

Flags gérés actuellement via `getFlag/setFlags` :

- bit 1 = zero
- bit 0 = carry

## Exécution

Cycle CPU (`runCpuCycle`) :

1. fetch opcode à `PC`
2. stocke opcode dans `IR`
3. exécute l’instruction

Le dispatch d’instructions est dans `fetchInstructionActions`.

## Frontend / WASM boundary

Exports principaux visibles dans `web_assembly/src/index.ts` :

- `instanciateComputer()`
- `computerloadCode(...)`
- `computerRunCycles(...)`
- getters registres / mémoire
- `computerSetMemory(...)`
- `computerAddDevice(...)`
- `computerResetComputer(...)`
