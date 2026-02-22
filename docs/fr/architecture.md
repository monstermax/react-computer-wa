# Architecture

## Vue d'ensemble

L'émulateur modélise un CPU 8-bit avec un espace d'adressage 16-bit.

Composants centraux :

- moteur CPU (`Cpu.ts`)
- routage mémoire (`Memory.ts`)
- gestion des périphériques et de l'I/O (`IoManager.ts`)
- API publique WebAssembly (`index.ts`)

## Modèle CPU

Registres :

- 8-bit : `A B C D E F`
- 16-bit : `PC SP`
- 8-bit : `IR FLAGS`

Flags utilisés actuellement :

- `zero`
- `carry`

## Flux d'exécution

À chaque cycle :

1. lecture de l'opcode à `PC`
2. stockage dans `IR`
3. exécution de l'instruction
4. mise à jour de `PC`

Le dispatch des instructions est dans `fetchInstructionActions`.
