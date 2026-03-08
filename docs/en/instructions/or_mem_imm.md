# OR_MEM_IMM

## Mnemonic

- `or`

## Opcode

- `OR_MEM_IMM`

## Description

Bitwise OR.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
or [0xa000], 0xf0
```
