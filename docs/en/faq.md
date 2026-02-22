# FAQ

## Why do some addresses look out of RAM range?

`MemoryBus` routes accesses through fixed ROM/RAM/I/O ranges.
A TODO note exists in `Memory.ts` about address mapping and full RAM usage.

## Where are CPU instructions defined?

- Opcode enum: `web_assembly/src/cpu_instructions.ts`
- Instruction execution: `web_assembly/src/Cpu.ts` (`fetchInstructionActions`)

## Where are WebAssembly exports defined?

In `web_assembly/src/index.ts`.

## How are devices exposed to the system?

`IoManager` writes a device table in RAM (count + entries + names), and I/O access is routed through `0xF000+`.
