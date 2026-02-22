# FAQ

## Where are opcodes defined?

`web_assembly/src/cpu_instructions.ts`

## Where is instruction behavior implemented?

`web_assembly/src/Cpu.ts` (`fetchInstructionActions`)

## Where are wasm exports declared?

`web_assembly/src/index.ts`

## How does memory-mapped I/O work?

Writes/reads in `0xF000-0xFFFF` are routed by `MemoryBus` to `IoManager`, then dispatched to host I/O callbacks.

## Why are some interrupt/rotate opcodes listed but not available yet?

They exist in the opcode enum, but not all are connected in the current execution switch.
