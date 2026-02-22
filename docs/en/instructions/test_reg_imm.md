# TEST_REG_IMM

## Mnemonic

- `test`

## Opcode

- `TEST_REG_IMM`

## Description

Bitwise test and update flags.

## Operands

- `reg`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
test a, 0x01
```
