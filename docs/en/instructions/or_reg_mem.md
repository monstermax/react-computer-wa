# OR_REG_MEM

## Mnemonic

- `OR_REG_MEM`

## Opcode

- `0x47`

## Description

Bitwise OR.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
OR A, [0xA000]
```
