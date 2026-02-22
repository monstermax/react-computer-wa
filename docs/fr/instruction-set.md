# Jeu d'instructions

Fichier source : [`web_assembly/src/cpu_instructions.ts`](../../web_assembly/src/cpu_instructions.ts)  
Fichier source : [`web_assembly/src/Cpu.ts`](../../web_assembly/src/Cpu.ts)  

Définition des opcodes : `web_assembly/src/cpu_instructions.ts`
Comportement à l'exécution : `web_assembly/src/Cpu.ts`

## Contrôle

- `NOP`, `HALT`
- `CALL`, `RET`
- `DEBUG_IMM`, `DEBUG_REG`, `DEBUG_MEM`
- `INT3`

## Sauts

- `JMP`
- `JZ`, `JNZ`
- `JC`, `JNC`
- `JL`, `JLE`
- `JG`, `JGE`

## Move / pile

- `MOV_REG_IMM`, `MOV_REG_REG`, `MOV_REG_MEM`
- `MOV_MEM_REG`, `MOV_MEM_IMM`
- `XCHG`
- `PUSH_REG`, `POP_REG`, `SET_SP`

## ALU

- `INC_*`, `DEC_*`, `NOT_*`
- `ADD_*`, `SUB_*`, `AND_*`, `OR_*`, `XOR_*`

## Comparaison / test

- `CMP_REG_IMM`, `CMP_REG_REG`, `CMP_REG_MEM`
- `TEST_REG_IMM`, `TEST_REG_REG`, `TEST_REG_MEM`

## Shifts

- `SHL_*`
- `SHR_*`

## Adressage 16-bit par paires de registres

- `LEA_REG_REG_IMM`
- `LEA_REG_REG_MEM`
- `LDI_REG_REG_REG`
- `STI_REG_REG_REG`
- `STI_REG_REG_IMM`
