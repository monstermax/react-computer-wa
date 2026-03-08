# XOR_MEM_REG

## Mnemonic

- `xor`

## Opcode

- `XOR_MEM_REG`

## Description

Bitwise XOR.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
xor [0xa000], a
```
