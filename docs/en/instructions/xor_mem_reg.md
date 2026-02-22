# XOR_MEM_REG

## Mnemonic

- `XOR_MEM_REG`

## Opcode

- `0x4E`

## Description

Bitwise XOR.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
XOR [0xA000], A
```
