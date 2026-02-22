# ADD_MEM_REG

## Mnemonic

- `add`

## Opcode

- `ADD_MEM_REG`

## Description

Add source to destination.

## Operands

- `addr16`
- `reg`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
add [0xa000], a
```
