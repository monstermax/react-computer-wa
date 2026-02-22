# SHL_REG_MEM

## Mnemonic

- `SHL_REG_MEM`

## Opcode

- `0x76`

## Description

Logical shift left.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SHL A, [0xA000]
```
