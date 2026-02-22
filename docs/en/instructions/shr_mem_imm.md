# SHR_MEM_IMM

## Mnemonic

- `SHR_MEM_IMM`

## Opcode

- `0x7C`

## Description

Logical shift right.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SHR [0xA000], 1
```
