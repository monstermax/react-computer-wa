# SUB_MEM_REG

## Mnemonic

- `sub`

## Opcode

- `SUB_MEM_REG`

## Description

Subtract source from destination.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
sub [0xa000], a
```
