# STI_REG_REG_REG

## Mnemonic

- `STI_REG_REG_REG`

## Opcode

- `0x83`

## Description

Store indirect via register pair address.

## Operands

- `reg_low`
- `reg_high`
- `reg_src`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
STI A, B, C
```
