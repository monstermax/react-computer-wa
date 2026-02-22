# MOV_MEM_REG

## Mnemonic

- `MOV_MEM_REG`

## Opcode

- `0x23`

## Description

Move data between registers/memory/immediate.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
MOV [0xA000], A
```
