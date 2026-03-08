# LDI_REG_REG_REG

## Mnemonic

- `ldi`

## Opcode

- `LDI_REG_REG_REG`

## Description

Load indirect from address formed by register pair.

## Operands

- `reg_dst`
- `reg_low`
- `reg_high`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
ldi c, a, b
```
