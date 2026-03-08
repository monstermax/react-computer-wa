# XOR_REG_MEM

## Mnemonic

- `xor`

## Opcode

- `XOR_REG_MEM`

## Description

Bitwise XOR.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
xor a, [0xa000]
```
