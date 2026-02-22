# LEA_REG_REG_IMM

## Mnemonic

- `LEA_REG_REG_IMM`

## Opcode

- `0x80`

## Description

Load 16-bit value/address into register pair.

## Operands

- `reg_low`
- `reg_high`
- `imm16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
LEA A, B, 0x1234
```
