# CMP_REG_MEM

## Mnemonic

- `cmp`

## Opcode

- `CMP_REG_MEM`

## Description

Compare operands and update flags.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
cmp a, [0xa000]
```
