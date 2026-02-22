# SUB_MEM_IMM

## Mnemonic

- `SUB_MEM_IMM`

## Opcode

- `0x3E`

## Description

Subtract source from destination.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SUB [0xA000], 0x01
```
