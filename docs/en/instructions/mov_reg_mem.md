# MOV_REG_MEM

## Mnemonic

- `mov`

## Opcode

- `MOV_REG_MEM`

## Description

Move data.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
mov a, [0xa000]
```
