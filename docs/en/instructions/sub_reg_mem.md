# SUB_REG_MEM

## Mnemonic

- `sub`

## Opcode

- `SUB_REG_MEM`

## Description

Subtract source from destination.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
sub a, [0xa000]
```
