# TEST_REG_MEM

## Mnemonic

- `TEST_REG_MEM`

## Opcode

- `0x55`

## Description

Bitwise test (AND) and update flags.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
TEST A, [0xA000]
```
