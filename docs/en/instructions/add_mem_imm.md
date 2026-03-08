# ADD_MEM_IMM

## Mnemonic

- `add`

## Opcode

- `ADD_MEM_IMM`

## Description

Add source to destination.

## Operands

- `addr16`
- `imm8`

## Runtime status

- Implemented in `webassembly/src/Cpu.ts`.

## Assembly example

```asm
add [0xa000], 0x01
```
