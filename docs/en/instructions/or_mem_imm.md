# OR_MEM_IMM

## Mnemonic

- `OR_MEM_IMM`

## Opcode

- `0x48`

## Description

Bitwise OR.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
OR [0xA000], 0xF0
```
