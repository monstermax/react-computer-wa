# ADD_MEM_IMM

## Mnemonic

- `ADD_MEM_IMM`

## Opcode

- `0x39`

## Description

Add source to destination.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
ADD [0xA000], 0x01
```
