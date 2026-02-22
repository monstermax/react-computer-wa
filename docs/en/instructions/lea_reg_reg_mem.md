# LEA_REG_REG_MEM

## Mnemonic

- `lea`

## Opcode

- `LEA_REG_REG_MEM`

## Description

Load a 16-bit address/value reference into a register pair.

## Operands

- `reg_low`
- `reg_high`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
lea a, b, [0x2000]
```
