# LEA_REG_REG_IMM

## Mnemonic

- `lea`

## Opcode

- `LEA_REG_REG_IMM`

## Description

Load 16-bit immediate into a register pair.

## Operands

- `reg_low`
- `reg_high`
- `imm16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
lea a, b, 0x1234
```
