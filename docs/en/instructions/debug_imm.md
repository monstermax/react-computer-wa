# DEBUG_IMM

## Mnemonic

- `DEBUG_IMM`

## Opcode

- `0x04`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `imm8`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
DEBUG_IMM 1, 0x2A
```
