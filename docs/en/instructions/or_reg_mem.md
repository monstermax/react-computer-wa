# OR_REG_MEM

## Mnemonic

- `or`

## Opcode

- `OR_REG_MEM`

## Description

Bitwise OR.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
or a, [0xa000]
```
