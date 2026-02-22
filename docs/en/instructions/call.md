# CALL

## Mnemonic

- `CALL`

## Opcode

- `0x02`

## Description

Call subroutine: push return address, then jump.

## Operands

- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
CALL 0x1200
```
