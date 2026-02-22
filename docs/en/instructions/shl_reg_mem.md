# SHL_REG_MEM

## Mnemonic

- `shl`

## Opcode

- `SHL_REG_MEM`

## Description

Logical shift left.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
shl a, [0xa000]
```
