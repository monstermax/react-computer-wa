# SHL_MEM_REG

## Mnemonic

- `SHL_MEM_REG`

## Opcode

- `0x78`

## Description

Logical shift left.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SHL [0xA000], A
```
