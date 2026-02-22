# TEST_REG_IMM

## Mnemonic

- `TEST_REG_IMM`

## Opcode

- `0x53`

## Description

Bitwise test (AND) and update flags.

## Operands

- `reg`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
TEST A, 0x01
```
