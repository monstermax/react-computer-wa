# STI_REG_REG_REG

## Mnemonic

- `sti`

## Opcode

- `STI_REG_REG_REG`

## Description

Store register value at address formed by register pair.

## Operands

- `reg_low`
- `reg_high`
- `reg_src`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
sti a, b, c
```
