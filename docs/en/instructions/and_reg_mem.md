# AND_REG_MEM

## Mnemonic

- `AND_REG_MEM`

## Opcode

- `0x42`

## Description

Bitwise AND.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
AND A, [0xA000]
```
