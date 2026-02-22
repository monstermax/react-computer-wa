# FAQ

## Pourquoi certaines adresses semblent “hors RAM” ?

Le `MemoryBus` route les accès selon des plages fixes ROM/RAM/I/O.
Une note TODO existe dans `Memory.ts` sur le mapping d’adresses et l’utilisation complète de la RAM.

## Où sont définies les instructions CPU ?

- Enum opcodes : `web_assembly/src/cpu_instructions.ts`
- Exécution des instructions : `web_assembly/src/Cpu.ts` (`fetchInstructionActions`)

## Où sont les exports WebAssembly ?

Dans `web_assembly/src/index.ts`.

## Comment les devices sont exposés au système ?

`IoManager` écrit une table des devices en RAM (count + entries + noms), puis les accès I/O passent par plage mémoire `0xF000+`.
