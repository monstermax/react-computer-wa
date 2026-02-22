# XOR_MEM_IMM

## Mnemonic

- `XOR_MEM_IMM`

## Opcode

- `0x4D`

## Description

Bitwise XOR.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
XOR [0xA000], 0xFF
```
