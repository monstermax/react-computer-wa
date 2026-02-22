# DEBUG_MEM

## Mnemonic

- `DEBUG_MEM`

## Opcode

- `0x06`

## Description

Debug helper instruction.

## Operands

- `debug_id`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
DEBUG_MEM 1, 0xA000
```
