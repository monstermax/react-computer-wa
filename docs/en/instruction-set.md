# Instruction Set

References:

- Opcode enum: `web_assembly/src/cpu_instructions.ts`
- Execution switch: `web_assembly/src/Cpu.ts`

This page lists only instruction families visible in the current code.

## Control

- `NOP`
- `HALT`
- `CALL`
- `RET`
- `DEBUG_IMM`, `DEBUG_REG`, `DEBUG_MEM`
- `INT3`

## Jumps

- `JMP`
- `JZ`, `JNZ`
- `JC`, `JNC`
- `JL`, `JLE`
- `JG`, `JGE`

Aliases exist in the enum (`JE/JNE/JA/JAE/JB/JBE`) and map to these opcodes.

## Move / Stack

- `MOV_REG_IMM`
- `MOV_REG_REG`
- `MOV_REG_MEM`
- `MOV_MEM_REG`
- `MOV_MEM_IMM`
- `XCHG`
- `PUSH_REG`
- `POP_REG`
- `SET_SP`

## ALU

- `INC_REG`, `INC_MEM`
- `DEC_REG`, `DEC_MEM`
- `NOT_REG`, `NOT_MEM`
- `ADD_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)
- `SUB_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)
- `AND_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)
- `OR_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)
- `XOR_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)

## Tests

- `CMP_REG_IMM`
- `CMP_REG_REG`
- `CMP_REG_MEM`
- `TEST_REG_IMM`
- `TEST_REG_REG`
- `TEST_REG_MEM`

## Shifts

- `SHL_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)
- `SHR_*` (REG/IMM, REG/REG, REG/MEM, MEM/IMM, MEM/REG)

## Indirect addressing / 16-bit register pairs

- `LEA_REG_REG_IMM`
- `LEA_REG_REG_MEM`
- `LDI_REG_REG_REG`
- `STI_REG_REG_REG`
- `STI_REG_REG_IMM`

## Factual notes

- The enum also includes rotate opcodes (`ROL/ROR/RCL/RCR`) and interrupt-related opcodes (`INT/EI/DI/IRET/SYSCALL`) marked TODO or not implemented in the current execution switch.
- The CPU currently uses `zero` and `carry` flags.
