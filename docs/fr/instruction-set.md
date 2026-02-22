# Instruction Set

Références:

- Enum des opcodes: `web_assembly/src/cpu_instructions.ts`
- Implémentation executeur: `web_assembly/src/Cpu.ts`

Ce document liste uniquement les familles visibles dans le code.

## Contrôle

- `NOP`
- `HALT`
- `CALL`
- `RET`
- `DEBUG_IMM`, `DEBUG_REG`, `DEBUG_MEM`
- `INT3`

## Sauts

- `JMP`
- `JZ`, `JNZ`
- `JC`, `JNC`
- `JL`, `JLE`
- `JG`, `JGE`

Alias présents dans l’enum (`JE/JNE/JA/JAE/JB/JBE`) vers ces opcodes.

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

## Adressage indirect / 16-bit pairs

- `LEA_REG_REG_IMM`
- `LEA_REG_REG_MEM`
- `LDI_REG_REG_REG`
- `STI_REG_REG_REG`
- `STI_REG_REG_IMM`

## Notes factuelles

- L’enum contient aussi des opcodes rotation (`ROL/ROR/RCL/RCR`) et interruptions (`INT/EI/DI/IRET/SYSCALL`) marqués TODO ou non implémentés dans le switch d’exécution actuel.
- Le CPU utilise actuellement les flags `zero` et `carry`.
