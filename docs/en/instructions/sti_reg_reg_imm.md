# STI_REG_REG_IMM

## Mnemonic

- `sti`

## Opcode

- `STI_REG_REG_IMM`

## Description

Store immediate value at address formed by register pair.

## Operands

- `reg_low`
- `reg_high`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
sti a, b, 0x2a
```
