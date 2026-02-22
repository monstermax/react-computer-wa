# DEBUG_REG

## Mnemonic

- `debug`

## Opcode

- `DEBUG_REG`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
debug_reg 1, a
```
