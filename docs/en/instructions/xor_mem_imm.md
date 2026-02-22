# XOR_MEM_IMM

## Mnemonic

- `xor`

## Opcode

- `XOR_MEM_IMM`

## Description

Bitwise XOR.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
xor [0xa000], 0xff
```
