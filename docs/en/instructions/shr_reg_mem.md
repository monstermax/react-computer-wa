# SHR_REG_MEM

## Mnemonic

- `SHR_REG_MEM`

## Opcode

- `0x7B`

## Description

Logical shift right.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SHR A, [0xA000]
```
