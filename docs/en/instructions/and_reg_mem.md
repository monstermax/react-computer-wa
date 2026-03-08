# AND_REG_MEM

## Mnemonic

- `and`

## Opcode

- `AND_REG_MEM`

## Description

Bitwise AND.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
and a, [0xa000]
```
