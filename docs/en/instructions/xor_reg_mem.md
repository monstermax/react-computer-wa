# XOR_REG_MEM

## Mnemonic

- `XOR_REG_MEM`

## Opcode

- `0x4C`

## Description

Bitwise XOR.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
XOR A, [0xA000]
```
