# SHL_MEM_IMM

## Mnemonic

- `SHL_MEM_IMM`

## Opcode

- `0x77`

## Description

Logical shift left.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SHL [0xA000], 1
```
