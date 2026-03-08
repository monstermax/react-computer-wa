# AND_MEM_IMM

## Mnemonic

- `and`

## Opcode

- `AND_MEM_IMM`

## Description

Bitwise AND.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
and [0xa000], 0x0f
```
