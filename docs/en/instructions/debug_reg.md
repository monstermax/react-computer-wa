# DEBUG_REG

## Mnemonic

- `DEBUG_REG`

## Opcode

- `0x05`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
DEBUG_REG 1, A
```
