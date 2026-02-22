# CMP_REG_IMM

## Mnemonic

- `CMP_REG_IMM`

## Opcode

- `0x50`

## Description

Compare operands and update flags.

## Operands

- `reg`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
CMP A, 0x00
```
