# SHR_MEM_IMM

## Mnemonic

- `shr`

## Opcode

- `SHR_MEM_IMM`

## Description

Logical shift right.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
shr [0xa000], 1
```
