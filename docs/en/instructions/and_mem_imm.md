# AND_MEM_IMM

## Mnemonic

- `AND_MEM_IMM`

## Opcode

- `0x43`

## Description

Bitwise AND.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
AND [0xA000], 0x0F
```
