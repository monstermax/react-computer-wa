# SHL_MEM_IMM

## Mnemonic

- `shl`

## Opcode

- `SHL_MEM_IMM`

## Description

Logical shift left.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
shl [0xa000], 1
```
