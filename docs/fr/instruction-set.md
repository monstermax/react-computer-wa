# Jeu d'instructions

Fichier source : [`web_assembly/src/cpu_instructions.ts`](../../web_assembly/src/cpu_instructions.ts)  
Fichier source : [`web_assembly/src/Cpu.ts`](../../web_assembly/src/Cpu.ts)  

Définition des opcodes : `web_assembly/src/cpu_instructions.ts`
Comportement à l'exécution : `web_assembly/src/Cpu.ts`

## Contrôle

- [`NOP`](../en/instructions/nop.md), [`HALT`](../en/instructions/halt.md)
- [`CALL`](../en/instructions/call.md), [`RET`](../en/instructions/ret.md)
- [`DEBUG_IMM`](../en/instructions/debug_imm.md), [`DEBUG_REG`](../en/instructions/debug_reg.md), [`DEBUG_MEM`](../en/instructions/debug_mem.md)
- [`INT3`](../en/instructions/int3.md)

## Sauts

- [`JMP`](../en/instructions/jmp.md)
- [`JZ`](../en/instructions/jz.md), [`JNZ`](../en/instructions/jnz.md)
- [`JC`](../en/instructions/jc.md), [`JNC`](../en/instructions/jnc.md)
- [`JL`](../en/instructions/jl.md), [`JLE`](../en/instructions/jle.md)
- [`JG`](../en/instructions/jg.md), [`JGE`](../en/instructions/jge.md)

## Move / pile

- [`MOV_REG_IMM`](../en/instructions/mov_reg_imm.md), [`MOV_REG_REG`](../en/instructions/mov_reg_reg.md), [`MOV_REG_MEM`](../en/instructions/mov_reg_mem.md)
- [`MOV_MEM_REG`](../en/instructions/mov_mem_reg.md), [`MOV_MEM_IMM`](../en/instructions/mov_mem_imm.md)
- [`XCHG`](../en/instructions/xchg.md)
- [`PUSH_REG`](../en/instructions/push_reg.md), [`POP_REG`](../en/instructions/pop_reg.md), [`SET_SP`](../en/instructions/set_sp.md)

## ALU

- `INC_*`, `DEC_*`, `NOT_*`
- `ADD_*`, `SUB_*`, `AND_*`, `OR_*`, `XOR_*`

## Comparaison / test

- [`CMP_REG_IMM`](../en/instructions/cmp_reg_imm.md), [`CMP_REG_REG`](../en/instructions/cmp_reg_reg.md), [`CMP_REG_MEM`](../en/instructions/cmp_reg_mem.md)
- [`TEST_REG_IMM`](../en/instructions/test_reg_imm.md), [`TEST_REG_REG`](../en/instructions/test_reg_reg.md), [`TEST_REG_MEM`](../en/instructions/test_reg_mem.md)

## Shifts

- `SHL_*`
- `SHR_*`

## Adressage 16-bit par paires de registres

- [`LEA_REG_REG_IMM`](../en/instructions/lea_reg_reg_imm.md)
- [`LEA_REG_REG_MEM`](../en/instructions/lea_reg_reg_mem.md)
- [`LDI_REG_REG_REG`](../en/instructions/ldi_reg_reg_reg.md)
- [`STI_REG_REG_REG`](../en/instructions/sti_reg_reg_reg.md)
- [`STI_REG_REG_IMM`](../en/instructions/sti_reg_reg_imm.md)
