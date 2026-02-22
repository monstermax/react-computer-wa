# MOV_REG_MEM

## Mnemonic

- `MOV_REG_MEM`

## Opcode

- `0x22`

## Description

Move data between registers/memory/immediate.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
MOV A, [0xA000]
```
