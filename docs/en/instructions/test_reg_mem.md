# TEST_REG_MEM

## Mnemonic

- `test`

## Opcode

- `TEST_REG_MEM`

## Description

Bitwise test and update flags.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
test a, [0xa000]
```
