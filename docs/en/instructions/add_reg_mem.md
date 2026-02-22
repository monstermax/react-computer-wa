# ADD_REG_MEM

## Mnemonic

- `ADD_REG_MEM`

## Opcode

- `0x38`

## Description

Add source to destination.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
ADD A, [0xA000]
```
