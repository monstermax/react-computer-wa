# DEBUG_IMM

## Mnemonic

- `debug`

## Opcode

- `DEBUG_IMM`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
debug_imm 1, 0x2a
```
