# STI_REG_REG_IMM

## Mnemonic

- `STI_REG_REG_IMM`

## Opcode

- `0x84`

## Description

Store indirect via register pair address.

## Operands

- `reg_low`
- `reg_high`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
STI A, B, 0x2A
```
