# CMP_REG_MEM

## Mnemonic

- `CMP_REG_MEM`

## Opcode

- `0x52`

## Description

Compare operands and update flags.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
CMP A, [0xA000]
```
