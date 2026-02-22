# MOV_MEM_IMM

## Mnemonic

- `MOV_MEM_IMM`

## Opcode

- `0x24`

## Description

Move data between registers/memory/immediate.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
MOV [0xA000], 0x2A
```
