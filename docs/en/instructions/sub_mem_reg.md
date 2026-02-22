# SUB_MEM_REG

## Mnemonic

- `SUB_MEM_REG`

## Opcode

- `0x3F`

## Description

Subtract source from destination.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SUB [0xA000], A
```
