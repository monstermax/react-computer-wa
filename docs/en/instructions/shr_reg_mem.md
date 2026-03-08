# SHR_REG_MEM

## Mnemonic

- `shr`

## Opcode

- `SHR_REG_MEM`

## Description

Logical shift right.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
shr a, [0xa000]
```
