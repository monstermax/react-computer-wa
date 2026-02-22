# SUB_REG_MEM

## Mnemonic

- `SUB_REG_MEM`

## Opcode

- `0x3D`

## Description

Subtract source from destination.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
SUB A, [0xA000]
```
