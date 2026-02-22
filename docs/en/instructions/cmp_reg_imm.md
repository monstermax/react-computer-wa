# CMP_REG_IMM

## Mnemonic

- `cmp`

## Opcode

- `CMP_REG_IMM`

## Description

Compare operands and update flags.

## Operands

- `reg`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
cmp a, 0x00
```
