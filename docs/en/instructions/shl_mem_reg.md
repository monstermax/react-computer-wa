# SHL_MEM_REG

## Mnemonic

- `shl`

## Opcode

- `SHL_MEM_REG`

## Description

Logical shift left.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
shl [0xa000], a
```
