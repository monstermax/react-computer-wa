# SUB_MEM_IMM

## Mnemonic

- `sub`

## Opcode

- `SUB_MEM_IMM`

## Description

Subtract source from destination.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
sub [0xa000], 0x01
```
