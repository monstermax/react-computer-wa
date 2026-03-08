# MOV_MEM_REG

## Mnemonic

- `mov`

## Opcode

- `MOV_MEM_REG`

## Description

Move data.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
mov [0xa000], a
```
