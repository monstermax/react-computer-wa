# SHR_MEM_REG

## Mnemonic

- `shr`

## Opcode

- `SHR_MEM_REG`

## Description

Logical shift right.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
shr [0xa000], a
```
