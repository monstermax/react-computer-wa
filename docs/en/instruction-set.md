# Instruction Set

Source file: [`webassembly/src/cpu_instructions.ts`](../../webassembly/src/cpu_instructions.ts)  
Source file: [`webassembly/src/Cpu.ts`](../../webassembly/src/Cpu.ts)  

Opcode definitions are in `webassembly/src/cpu_instructions.ts`.
Execution behavior is implemented in `webassembly/src/Cpu.ts`.

## Control

- [`NOP`](./instructions/nop.md), [`HALT`](./instructions/halt.md)
- [`CALL`](./instructions/call.md), [`RET`](./instructions/ret.md)
- [`DEBUG_IMM`](./instructions/debug_imm.md), [`DEBUG_REG`](./instructions/debug_reg.md), [`DEBUG_MEM`](./instructions/debug_mem.md)
- [`INT3`](./instructions/int3.md) (breakpoint)

## Jumps

- [`JMP`](./instructions/jmp.md)
- [`JZ`](./instructions/jz.md), [`JNZ`](./instructions/jnz.md)
- [`JC`](./instructions/jc.md), [`JNC`](./instructions/jnc.md)
- [`JL`](./instructions/jl.md), [`JLE`](./instructions/jle.md)
- [`JG`](./instructions/jg.md), [`JGE`](./instructions/jge.md)

Aliases in enum:

- `JE = JZ`, `JNE = JNZ`
- `JA = JG`, `JAE = JGE`
- `JB = JL`, `JBE = JLE`

## Move / Stack

- [`MOV_REG_IMM`](./instructions/mov_reg_imm.md), [`MOV_REG_REG`](./instructions/mov_reg_reg.md), [`MOV_REG_MEM`](./instructions/mov_reg_mem.md)
- [`MOV_MEM_REG`](./instructions/mov_mem_reg.md), [`MOV_MEM_IMM`](./instructions/mov_mem_imm.md)
- [`XCHG`](./instructions/xchg.md)
- [`PUSH_REG`](./instructions/push_reg.md), [`POP_REG`](./instructions/pop_reg.md), [`SET_SP`](./instructions/set_sp.md)

## ALU

- `INC_*`, `DEC_*`, `NOT_*`
- `ADD_*`
- `SUB_*`
- `AND_*`
- `OR_*`
- `XOR_*`

## Compare / test

- [`CMP_REG_IMM`](./instructions/cmp_reg_imm.md), [`CMP_REG_REG`](./instructions/cmp_reg_reg.md), [`CMP_REG_MEM`](./instructions/cmp_reg_mem.md)
- [`TEST_REG_IMM`](./instructions/test_reg_imm.md), [`TEST_REG_REG`](./instructions/test_reg_reg.md), [`TEST_REG_MEM`](./instructions/test_reg_mem.md)

## Shift

- `SHL_*`
- `SHR_*`

## 16-bit addressing via register pairs

- [`LEA_REG_REG_IMM`](./instructions/lea_reg_reg_imm.md)
- [`LEA_REG_REG_MEM`](./instructions/lea_reg_reg_mem.md)
- [`LDI_REG_REG_REG`](./instructions/ldi_reg_reg_reg.md)
- [`STI_REG_REG_REG`](./instructions/sti_reg_reg_reg.md)
- [`STI_REG_REG_IMM`](./instructions/sti_reg_reg_imm.md)

## Notes

The opcode enum already includes rotate and interrupt-related entries (`ROL/ROR/RCL/RCR`, `INT/EI/DI/IRET/SYSCALL`), but they are not all wired in the current execution switch.
