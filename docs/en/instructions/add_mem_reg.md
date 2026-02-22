# ADD_MEM_REG

## Mnemonic

- `ADD_MEM_REG`

## Opcode

- `0x3A`

## Description

Add source to destination.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
ADD [0xA000], A
```
