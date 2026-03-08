
# CONTROL
- NOP: `() => {}`
- HALT: `() => { halt() }`
- CALL: `() => { push( low16(registers['PC']) ); push( high16(registers['PC']) ); jump($1); }`
- RET: `() => { pop_high=pop(); pop_low=pop(); jump(popped_address); }`

- DEBUG_IMM: `() => { log($1); }`
- DEBUG_REG: `() => { log( registers[$1] ); }`
- DEBUG_MEM: `() => { log( mem[$1] ); }`

# INTERRUPTS
- //INT = 0x08     // TODO
- INT3: `() => { breakpoint(); }`
- //EI = 0x0A      // TODO   // Enable Interrupts
- //DI = 0x0B      // TODO   // Disable Interrupts
- //IRET = 0x0C    // TODO   // Return from Interrupt
- //SYSCALL = 0x0D // TODO

# JUMP
- JMP: `() => { jump($1); }`
- JZ: `() => { if (zero) jump($1); }`
- JNZ: `() => { if (!zero) jump($1); }`
- JC: `() => { if (carry) jump($1); }`
- JNC: `() => { if (!carry) jump($1); }`
- JL: `() => { if (lower) jump($1); }`
- JLE: `() => { if (lower_or_equals) jump($1); }`
- JG: `() => { if (greater) jump($1); }`
- JGE: `() => { if (greater_or_equals) jump($1); }`
- JE = JZ
- JNE = JNZ
- JA = JG
- JAE = JGE
- JB = JL
- JBE = JLE

# MOV
- MOV_REG_IMM: `() => { registers[$1] = $2; }`
- MOV_REG_REG: `() => { registers[$1] = registers[$2]; }`
- MOV_REG_MEM: `() => { registers[$1] = mem[$2]; }`
- MOV_MEM_REG: `() => { mem[$1] = registers[$2]; }`
- MOV_MEM_IMM: `() => { mem[$1] = $2; }`
- XCHG: `() => { registers[$1, $2] = registers[$2, $1]; }`

# STACK
- PUSH_REG: `() => { push(registers[$1]); }`
- POP_REG: `() => { registers[$1] = pop(); }`
- SET_SP_IMM: `() => { registers['SP'] = $2; }`
- SET_SP_REG_REG: `() => { registers['SP'] = registers[$1, $2]; }`
- GET_SP_REG_REG: `() => { registers[$1, $2] = registers['SP']; }`

# ALU
- INC_REG: `() => { registers[$1]++ }`
- INC_MEM: `() => { mem[$1]++ }`
- DEC_REG: `() => { registers[$1]-- }`
- DEC_MEM: `() => { mem[$1]-- }`
- NOT_REG: `() => { !registers[$1] }`
- NOT_MEM: `() => { !mem[$1] }`

- ADD_REG_IMM: `() => { add(registers[$1], $2) }`
- ADD_REG_REG: `() => { add(registers[$1], registers[$2]) }`
- ADD_REG_MEM: `() => { add(registers[$1], mem[$2]) }`
- ADD_MEM_IMM: `() => { add(mem[$1], $2) }`
- ADD_MEM_REG: `() => { add(mem[$1], registers[$2]) }`

- SUB_REG_IMM: `() => { sub(registers[$1], $2) }`
- SUB_REG_REG: `() => { sub(registers[$1], registers[$2]) }`
- SUB_REG_MEM: `() => { sub(registers[$1], mem[$2]) }`
- SUB_MEM_IMM: `() => { sub(mem[$1], $2) }`
- SUB_MEM_REG: `() => { sub(mem[$1], registers[$2]) }`

- AND_REG_IMM: `() => { and(registers[$1], $2) }`
- AND_REG_REG: `() => { and(registers[$1], registers[$2]) }`
- AND_REG_MEM: `() => { and(registers[$1], mem[$2]) }`
- AND_MEM_IMM: `() => { and(mem[$1], $2) }`
- AND_MEM_REG: `() => { and(mem[$1], registers[$2]) }`

- OR_REG_IMM: `() => { or(registers[$1], $2) }`
- OR_REG_REG: `() => { or(registers[$1], registers[$2]) }`
- OR_REG_MEM: `() => { or(registers[$1], mem[$2]) }`
- OR_MEM_IMM: `() => { or(mem[$1], $2) }`
- OR_MEM_REG: `() => { or(mem[$1], registers[$2]) }`

- XOR_REG_IMM: `() => { xor(registers[$1], $2) }`
- XOR_REG_REG: `() => { xor(registers[$1], registers[$2]) }`
- XOR_REG_MEM: `() => { xor(registers[$1], mem[$2]) }`
- XOR_MEM_IMM: `() => { xor(mem[$1], $2) }`
- XOR_MEM_REG: `() => { xor(mem[$1], registers[$2]) }`

# TESTS
- CMP_REG_IMM: `() => { cmp(registers[$1], $2) }`
- CMP_REG_REG: `() => { cmp(registers[$1], registers[$2]) }`
- CMP_REG_MEM: `() => { cmp(registers[$1], mem[$2]) }`
- CMP_MEM_IMM: `() => { cmp(mem[$1], $2) }`

- TEST_REG_IMM: `() => { test(registers[$1], $2) }`
- TEST_REG_REG: `() => { test(registers[$1], registers[$2]) }`
- TEST_REG_MEM: `() => { test(registers[$1], mem[$2]) }`
- TEST_MEM_IMM: `() => { test(mem[$1], $2) }`


// TODO (in Cpu.ts) 👇

# BITS ROL (with Carry)
- ROL_REG_IMM = 0x60     // Rotate Left (avec carry)
- ROL_REG_REG = 0x61     // Rotate Left (avec carry)
- ROL_REG_MEM = 0x62     // Rotate Left (avec carry)
- ROL_MEM_IMM = 0x63     // Rotate Left (avec carry)
- ROL_MEM_REG = 0x64     // Rotate Left (avec carry)

- ROR_REG_IMM = 0x65     // Rotate Right (avec carry)
- ROR_REG_REG = 0x66     // Rotate Right (avec carry)
- ROR_REG_MEM = 0x67     // Rotate Right (avec carry)
- ROR_MEM_IMM = 0x68     // Rotate Right (avec carry)
- ROR_MEM_REG = 0x69     // Rotate Right (avec carry)

# BITS ROL (through Carry)
- RCL_REG_IMM = 0x6A     // Rotate Left through Carry
- RCL_REG_REG = 0x6B     // Rotate Left through Carry
- RCL_REG_MEM = 0x6C     // Rotate Left through Carry
- RCL_MEM_IMM = 0x6D     // Rotate Left through Carry
- RCL_MEM_REG = 0x6E     // Rotate Left through Carry

- RCR_REG_IMM = 0x6F     // Rotate Right through Carry
- RCR_REG_REG = 0x70     // Rotate Right through Carry
- RCR_REG_MEM = 0x71     // Rotate Right through Carry
- RCR_MEM_IMM = 0x72     // Rotate Right through Carry
- RCR_MEM_REG = 0x73     // Rotate Right through Carry


// OK (in Cpu.ts) 👇

# BITS SHIFT
- SHL_REG_IMM = 0x74 // Shift Left N bits
- SHL_REG_REG = 0x75 // Shift Left N bits
- SHL_REG_MEM = 0x76 // Shift Left N bits
- SHL_MEM_IMM = 0x77 // Shift Left N bits
- SHL_MEM_REG = 0x78 // Shift Left N bits

- SHR_REG_IMM = 0x79 // Shift Right N bits
- SHR_REG_REG = 0x7A // Shift Right N bits
- SHR_REG_MEM = 0x7B // Shift Right N bits
- SHR_MEM_IMM = 0x7C // Shift Right N bits
- SHR_MEM_REG = 0x7D // Shift Right N bits


# LEA
- LEA_REG_REG_IMM: `() => { registers[$1, $2] = $3 }`
- LEA_REG_REG_MEM: `() => { registers[$1, $2] = $3 }`

# LDI / STI
- LDI_REG_REG_REG: `() => { registers[$1] = mem[ registers[$2, $3] ] }`

- STI_REG_REG_REG: `() => { mem[ registers[$1, $2] ] = registers[$3] }`
- STI_REG_REG_IMM: `() => { mem[ registers[$1, $2] ] = $3 }`
