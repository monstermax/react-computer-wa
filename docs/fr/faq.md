# FAQ

## Où sont définis les opcodes ?

`webassembly/src/cpu_instructions.ts`

## Où est implémenté le comportement des instructions ?

`webassembly/src/Cpu.ts` (`fetchInstructionActions`)

## Où sont déclarés les exports wasm ?

`webassembly/src/index.ts`

## Comment fonctionne l'I/O mémoire mappée ?

Les accès `0xF000-0xFFFF` sont routés par `MemoryBus` vers `IoManager`, puis dispatchés vers les callbacks hôte.
