# LEA_REG_REG_MEM

## Mnemonic

- `LEA_REG_REG_MEM`

## Opcode

- `0x81`

## Description

Load 16-bit value/address into register pair.

## Operands

- `reg_low`
- `reg_high`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
LEA A, B, [0x2000]
```
