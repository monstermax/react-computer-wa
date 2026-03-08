# MOV_MEM_IMM

## Mnemonic

- `mov`

## Opcode

- `MOV_MEM_IMM`

## Description

Move data.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
mov [0xa000], 0x2a
```
