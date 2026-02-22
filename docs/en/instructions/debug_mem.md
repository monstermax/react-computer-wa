# DEBUG_MEM

## Mnemonic

- `debug`

## Opcode

- `DEBUG_MEM`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
debug_mem 1, 0xa000
```
