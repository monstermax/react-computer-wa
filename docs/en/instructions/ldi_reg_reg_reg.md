# LDI_REG_REG_REG

## Mnemonic

- `LDI_REG_REG_REG`

## Opcode

- `0x82`

## Description

Load indirect via register pair address.

## Operands

- `reg_dst`
- `reg_low`
- `reg_high`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
LDI C, A, B
```
