# Instruction Set

Opcode definitions are in `web_assembly/src/cpu_instructions.ts`.
Execution behavior is implemented in `web_assembly/src/Cpu.ts`.

## Control

- `NOP`, `HALT`
- `CALL`, `RET`
- `DEBUG_IMM`, `DEBUG_REG`, `DEBUG_MEM`
- `INT3` (breakpoint)

## Jumps

- `JMP`
- `JZ`, `JNZ`
- `JC`, `JNC`
- `JL`, `JLE`
- `JG`, `JGE`

Aliases in enum:

- `JE = JZ`, `JNE = JNZ`
- `JA = JG`, `JAE = JGE`
- `JB = JL`, `JBE = JLE`

## Move / Stack

- `MOV_REG_IMM`, `MOV_REG_REG`, `MOV_REG_MEM`
- `MOV_MEM_REG`, `MOV_MEM_IMM`
- `XCHG`
- `PUSH_REG`, `POP_REG`, `SET_SP`

## ALU

- `INC_*`, `DEC_*`, `NOT_*`
- `ADD_*`
- `SUB_*`
- `AND_*`
- `OR_*`
- `XOR_*`

## Compare / test

- `CMP_REG_IMM`, `CMP_REG_REG`, `CMP_REG_MEM`
- `TEST_REG_IMM`, `TEST_REG_REG`, `TEST_REG_MEM`

## Shift

- `SHL_*`
- `SHR_*`

## 16-bit addressing via register pairs

- `LEA_REG_REG_IMM`
- `LEA_REG_REG_MEM`
- `LDI_REG_REG_REG`
- `STI_REG_REG_REG`
- `STI_REG_REG_IMM`

## Notes

The opcode enum already includes rotate and interrupt-related entries (`ROL/ROR/RCL/RCR`, `INT/EI/DI/IRET/SYSCALL`), but they are not all wired in the current execution switch.
