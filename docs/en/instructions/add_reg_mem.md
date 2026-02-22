# ADD_REG_MEM

## Mnemonic

- `add`

## Opcode

- `ADD_REG_MEM`

## Description

Add source to destination.

## Operands

- `reg`
- `addr16`

## Runtime status

- Implemented in `web_assembly/src/Cpu.ts`.

## Assembly example

```asm
add a, [0xa000]
```
