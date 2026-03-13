(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32)))
 (type $3 (func (param i32 i32) (result i32)))
 (type $4 (func (param i32 i32 i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i32 i32) (result i32)))
 (type $9 (func (param i32) (result i64)))
 (type $10 (func (result i32)))
 (type $11 (func (param i32 f64)))
 (type $12 (func (param i32) (result f64)))
 (type $13 (func (param i32 f64 f64) (result i32)))
 (type $14 (func (param i32 i32 i64) (result i32)))
 (type $15 (func (param i32 i64 i32)))
 (type $16 (func (param i64 i32) (result i32)))
 (type $17 (func (param i32 i64 i32 i32)))
 (type $18 (func (param i32 i64)))
 (type $19 (func (param f64) (result f64)))
 (type $20 (func (param i32 i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "wasmConsoleLog" (func $src/external_functions/console.log (param i32)))
 (import "env" "jsIoWrite" (func $src/external_functions/jsIo.write (param i32 i32 i32)))
 (import "env" "wasmConsoleWarn" (func $src/external_functions/console.warn (param i32)))
 (import "env" "jsIoRead" (func $src/external_functions/jsIo.read (param i32 i32) (result i32)))
 (import "env" "jsCpuBreakpoint" (func $src/external_functions/jsCpu.breakpoint))
 (import "env" "jsCpuHalted" (func $src/external_functions/jsCpu.halted))
 (import "env" "console.warn" (func $~lib/bindings/dom/console.warn (param i32)))
 (import "env" "jsIoReset" (func $src/external_functions/jsIo.reset (param i32)))
 (import "env" "console.log" (func $~lib/bindings/dom/console.log (param i32)))
 (global $src/cpu_instructions/Opcode.NOP i32 (i32.const 0))
 (global $src/cpu_instructions/Opcode.HALT i32 (i32.const 1))
 (global $src/cpu_instructions/Opcode.CALL i32 (i32.const 2))
 (global $src/cpu_instructions/Opcode.RET i32 (i32.const 3))
 (global $src/cpu_instructions/Opcode.DEBUG_IMM i32 (i32.const 4))
 (global $src/cpu_instructions/Opcode.DEBUG_REG i32 (i32.const 5))
 (global $src/cpu_instructions/Opcode.DEBUG_MEM i32 (i32.const 6))
 (global $src/cpu_instructions/Opcode.INT i32 (i32.const 8))
 (global $src/cpu_instructions/Opcode.INT3 i32 (i32.const 9))
 (global $src/cpu_instructions/Opcode.EI i32 (i32.const 10))
 (global $src/cpu_instructions/Opcode.DI i32 (i32.const 11))
 (global $src/cpu_instructions/Opcode.IRET i32 (i32.const 12))
 (global $src/cpu_instructions/Opcode.JMP i32 (i32.const 16))
 (global $src/cpu_instructions/Opcode.JZ i32 (i32.const 17))
 (global $src/cpu_instructions/Opcode.JNZ i32 (i32.const 18))
 (global $src/cpu_instructions/Opcode.JC i32 (i32.const 19))
 (global $src/cpu_instructions/Opcode.JNC i32 (i32.const 20))
 (global $src/cpu_instructions/Opcode.JL i32 (i32.const 21))
 (global $src/cpu_instructions/Opcode.JLE i32 (i32.const 22))
 (global $src/cpu_instructions/Opcode.JG i32 (i32.const 23))
 (global $src/cpu_instructions/Opcode.JGE i32 (i32.const 24))
 (global $src/cpu_instructions/Opcode.JE i32 (i32.const 17))
 (global $src/cpu_instructions/Opcode.JNE i32 (i32.const 18))
 (global $src/cpu_instructions/Opcode.JA i32 (i32.const 23))
 (global $src/cpu_instructions/Opcode.JAE i32 (i32.const 24))
 (global $src/cpu_instructions/Opcode.JB i32 (i32.const 21))
 (global $src/cpu_instructions/Opcode.JBE i32 (i32.const 22))
 (global $src/cpu_instructions/Opcode.MOV_REG_IMM i32 (i32.const 32))
 (global $src/cpu_instructions/Opcode.MOV_REG_REG i32 (i32.const 33))
 (global $src/cpu_instructions/Opcode.MOV_REG_MEM i32 (i32.const 34))
 (global $src/cpu_instructions/Opcode.MOV_MEM_REG i32 (i32.const 35))
 (global $src/cpu_instructions/Opcode.MOV_MEM_IMM i32 (i32.const 36))
 (global $src/cpu_instructions/Opcode.XCHG i32 (i32.const 37))
 (global $src/cpu_instructions/Opcode.PUSH_REG i32 (i32.const 38))
 (global $src/cpu_instructions/Opcode.POP_REG i32 (i32.const 39))
 (global $src/cpu_instructions/Opcode.SET_SP_IMM i32 (i32.const 40))
 (global $src/cpu_instructions/Opcode.SET_SP_REG_REG i32 (i32.const 41))
 (global $src/cpu_instructions/Opcode.GET_SP_REG_REG i32 (i32.const 42))
 (global $src/cpu_instructions/Opcode.INC_REG i32 (i32.const 48))
 (global $src/cpu_instructions/Opcode.INC_MEM i32 (i32.const 49))
 (global $src/cpu_instructions/Opcode.DEC_REG i32 (i32.const 50))
 (global $src/cpu_instructions/Opcode.DEC_MEM i32 (i32.const 51))
 (global $src/cpu_instructions/Opcode.NOT_REG i32 (i32.const 52))
 (global $src/cpu_instructions/Opcode.NOT_MEM i32 (i32.const 53))
 (global $src/cpu_instructions/Opcode.ADD_REG_IMM i32 (i32.const 54))
 (global $src/cpu_instructions/Opcode.ADD_REG_REG i32 (i32.const 55))
 (global $src/cpu_instructions/Opcode.ADD_REG_MEM i32 (i32.const 56))
 (global $src/cpu_instructions/Opcode.ADD_MEM_IMM i32 (i32.const 57))
 (global $src/cpu_instructions/Opcode.ADD_MEM_REG i32 (i32.const 58))
 (global $src/cpu_instructions/Opcode.SUB_REG_IMM i32 (i32.const 59))
 (global $src/cpu_instructions/Opcode.SUB_REG_REG i32 (i32.const 60))
 (global $src/cpu_instructions/Opcode.SUB_REG_MEM i32 (i32.const 61))
 (global $src/cpu_instructions/Opcode.SUB_MEM_IMM i32 (i32.const 62))
 (global $src/cpu_instructions/Opcode.SUB_MEM_REG i32 (i32.const 63))
 (global $src/cpu_instructions/Opcode.AND_REG_IMM i32 (i32.const 64))
 (global $src/cpu_instructions/Opcode.AND_REG_REG i32 (i32.const 65))
 (global $src/cpu_instructions/Opcode.AND_REG_MEM i32 (i32.const 66))
 (global $src/cpu_instructions/Opcode.AND_MEM_IMM i32 (i32.const 67))
 (global $src/cpu_instructions/Opcode.AND_MEM_REG i32 (i32.const 68))
 (global $src/cpu_instructions/Opcode.OR_REG_IMM i32 (i32.const 69))
 (global $src/cpu_instructions/Opcode.OR_REG_REG i32 (i32.const 70))
 (global $src/cpu_instructions/Opcode.OR_REG_MEM i32 (i32.const 71))
 (global $src/cpu_instructions/Opcode.OR_MEM_IMM i32 (i32.const 72))
 (global $src/cpu_instructions/Opcode.OR_MEM_REG i32 (i32.const 73))
 (global $src/cpu_instructions/Opcode.XOR_REG_IMM i32 (i32.const 74))
 (global $src/cpu_instructions/Opcode.XOR_REG_REG i32 (i32.const 75))
 (global $src/cpu_instructions/Opcode.XOR_REG_MEM i32 (i32.const 76))
 (global $src/cpu_instructions/Opcode.XOR_MEM_IMM i32 (i32.const 77))
 (global $src/cpu_instructions/Opcode.XOR_MEM_REG i32 (i32.const 78))
 (global $src/cpu_instructions/Opcode.CMP_REG_IMM i32 (i32.const 80))
 (global $src/cpu_instructions/Opcode.CMP_REG_REG i32 (i32.const 81))
 (global $src/cpu_instructions/Opcode.CMP_REG_MEM i32 (i32.const 82))
 (global $src/cpu_instructions/Opcode.CMP_MEM_IMM i32 (i32.const 83))
 (global $src/cpu_instructions/Opcode.TEST_REG_IMM i32 (i32.const 84))
 (global $src/cpu_instructions/Opcode.TEST_REG_REG i32 (i32.const 85))
 (global $src/cpu_instructions/Opcode.TEST_REG_MEM i32 (i32.const 86))
 (global $src/cpu_instructions/Opcode.TEST_MEM_IMM i32 (i32.const 87))
 (global $src/cpu_instructions/Opcode.ROL_REG_IMM i32 (i32.const 96))
 (global $src/cpu_instructions/Opcode.ROL_REG_REG i32 (i32.const 97))
 (global $src/cpu_instructions/Opcode.ROL_REG_MEM i32 (i32.const 98))
 (global $src/cpu_instructions/Opcode.ROL_MEM_IMM i32 (i32.const 99))
 (global $src/cpu_instructions/Opcode.ROL_MEM_REG i32 (i32.const 100))
 (global $src/cpu_instructions/Opcode.ROR_REG_IMM i32 (i32.const 101))
 (global $src/cpu_instructions/Opcode.ROR_REG_REG i32 (i32.const 102))
 (global $src/cpu_instructions/Opcode.ROR_REG_MEM i32 (i32.const 103))
 (global $src/cpu_instructions/Opcode.ROR_MEM_IMM i32 (i32.const 104))
 (global $src/cpu_instructions/Opcode.ROR_MEM_REG i32 (i32.const 105))
 (global $src/cpu_instructions/Opcode.RCL_REG_IMM i32 (i32.const 106))
 (global $src/cpu_instructions/Opcode.RCL_REG_REG i32 (i32.const 107))
 (global $src/cpu_instructions/Opcode.RCL_REG_MEM i32 (i32.const 108))
 (global $src/cpu_instructions/Opcode.RCL_MEM_IMM i32 (i32.const 109))
 (global $src/cpu_instructions/Opcode.RCL_MEM_REG i32 (i32.const 110))
 (global $src/cpu_instructions/Opcode.RCR_REG_IMM i32 (i32.const 111))
 (global $src/cpu_instructions/Opcode.RCR_REG_REG i32 (i32.const 112))
 (global $src/cpu_instructions/Opcode.RCR_REG_MEM i32 (i32.const 113))
 (global $src/cpu_instructions/Opcode.RCR_MEM_IMM i32 (i32.const 114))
 (global $src/cpu_instructions/Opcode.RCR_MEM_REG i32 (i32.const 115))
 (global $src/cpu_instructions/Opcode.SHL_REG_IMM i32 (i32.const 116))
 (global $src/cpu_instructions/Opcode.SHL_REG_REG i32 (i32.const 117))
 (global $src/cpu_instructions/Opcode.SHL_REG_MEM i32 (i32.const 118))
 (global $src/cpu_instructions/Opcode.SHL_MEM_IMM i32 (i32.const 119))
 (global $src/cpu_instructions/Opcode.SHL_MEM_REG i32 (i32.const 120))
 (global $src/cpu_instructions/Opcode.SHR_REG_IMM i32 (i32.const 121))
 (global $src/cpu_instructions/Opcode.SHR_REG_REG i32 (i32.const 122))
 (global $src/cpu_instructions/Opcode.SHR_REG_MEM i32 (i32.const 123))
 (global $src/cpu_instructions/Opcode.SHR_MEM_IMM i32 (i32.const 124))
 (global $src/cpu_instructions/Opcode.SHR_MEM_REG i32 (i32.const 125))
 (global $src/cpu_instructions/Opcode.LEA_REG_REG_IMM i32 (i32.const 128))
 (global $src/cpu_instructions/Opcode.LEA_REG_REG_MEM i32 (i32.const 129))
 (global $src/cpu_instructions/Opcode.LDI_REG_REG_REG i32 (i32.const 130))
 (global $src/cpu_instructions/Opcode.STI_REG_REG_REG i32 (i32.const 131))
 (global $src/cpu_instructions/Opcode.STI_REG_REG_IMM i32 (i32.const 132))
 (global $src/memory_map/MEMORY_MAP.RAM_START i32 (i32.const 0))
 (global $src/memory_map/MEMORY_MAP.RAM_END i32 (i32.const 61439))
 (global $src/memory_map/MEMORY_MAP.BOOTLOADER_START i32 (i32.const 0))
 (global $src/memory_map/MEMORY_MAP.DEVICE_TABLE_COUNT i32 (i32.const 1280))
 (global $src/memory_map/MEMORY_MAP.DEVICE_TABLE_START i32 (i32.const 1281))
 (global $src/memory_map/MEMORY_MAP.DEVICE_TABLE_ENTRY_SIZE i32 (i32.const 6))
 (global $src/memory_map/MEMORY_MAP.DEVICE_TABLE_MAX_ENTRIES i32 (i32.const 20))
 (global $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_START i32 (i32.const 1408))
 (global $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_END i32 (i32.const 1535))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_TABLE_COUNT i32 (i32.const 1536))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_TABLE_START i32 (i32.const 1537))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_TABLE_ENTRY_SIZE i32 (i32.const 6))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_TABLE_MAX_ENTRIES i32 (i32.const 20))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_STRINGS_START i32 (i32.const 1664))
 (global $src/memory_map/MEMORY_MAP.INTERRUPTS_STRINGS_END i32 (i32.const 1791))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_TABLE_COUNT i32 (i32.const 1792))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_TABLE_START i32 (i32.const 1793))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_TABLE_ENTRY_SIZE i32 (i32.const 6))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_TABLE_MAX_ENTRIES i32 (i32.const 20))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_STRINGS_START i32 (i32.const 1920))
 (global $src/memory_map/MEMORY_MAP.SYSCALLS_STRINGS_END i32 (i32.const 2047))
 (global $src/memory_map/MEMORY_MAP.OS_START i32 (i32.const 4096))
 (global $src/memory_map/MEMORY_MAP.STACK_START i32 (i32.const 60928))
 (global $src/memory_map/MEMORY_MAP.STACK_END i32 (i32.const 61439))
 (global $src/memory_map/MEMORY_MAP.IO_START i32 (i32.const 61440))
 (global $src/memory_map/MEMORY_MAP.IO_END i32 (i32.const 65535))
 (global $src/memory_map/IRQ_MAP.IRQ_TIMER i32 (i32.const 0))
 (global $src/memory_map/IRQ_MAP.IRQ_KEYBOARD i32 (i32.const 1))
 (global $src/memory_map/IRQ_MAP.IRQ_DISK i32 (i32.const 2))
 (global $src/memory_map/IRQ_MAP.IRQ_UART i32 (i32.const 3))
 (global $src/memory_map/IRQ_MAP.IRQ_BUTTON i32 (i32.const 4))
 (global $src/memory_map/DEVICE_TYPE_SYSTEM i32 (i32.const 0))
 (global $src/memory_map/DEVICE_TYPE_INPUT i32 (i32.const 1))
 (global $src/memory_map/DEVICE_TYPE_OUTPUT i32 (i32.const 2))
 (global $src/memory_map/DEVICE_TYPE_INPUT_OUTPUT i32 (i32.const 3))
 (global $src/memory_map/DEVICE_TYPE_STORAGE i32 (i32.const 3))
 (global $src/devices/InterruptManager/InterruptManager.type (mut i32) (i32.const 32))
 (global $src/devices/IoManager/DEVICE_PORT_SIZE i32 (i32.const 16))
 (global $src/devices/Computer/BreakpointType.NONE i32 (i32.const 0))
 (global $src/devices/Computer/BreakpointType.INT3 i32 (i32.const 1))
 (global $src/devices/Computer/BreakpointType.IDE i32 (i32.const 2))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/native/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 2))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 12400))
 (global $~lib/memory/__data_end i32 (i32.const 12552))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 45320))
 (global $~lib/memory/__heap_base i32 (i32.const 45320))
 (memory $0 1)
 (data $0 (i32.const 12) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00s\00y\00s\00t\00e\00m\00")
 (data $1 (i32.const 44) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 108) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 176) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 208) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 236) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 300) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $7 (i32.const 352) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 380) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 444) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 476) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $11 (i32.const 524) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $12 (i32.const 588) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00")
 (data $14 (i32.const 684) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00X\00\00\00R\00A\00M\00 \00n\00o\00t\00 \00a\00v\00a\00i\00l\00a\00b\00l\00e\00,\00 \00c\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00t\00a\00b\00l\00e\00\00\00\00\00")
 (data $15 (i32.const 796) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\000\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00I\00o\00M\00a\00n\00a\00g\00e\00r\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 876) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $17 (i32.const 1004) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $18 (i32.const 1068) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $19 (i32.const 1100) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $20 (i32.const 1500) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $21 (i32.const 2556) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $22 (i32.const 2652) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00<\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 \00")
 (data $23 (i32.const 2732) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $24 (i32.const 2764) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00M\00e\00m\00o\00r\00y\00.\00t\00s\00\00\00")
 (data $25 (i32.const 2828) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $26 (i32.const 2860) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $27 (i32.const 2908) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00i\00o\00M\00a\00n\00a\00g\00e\00r\00\00\00\00\00\00\00\00\00\00\00")
 (data $28 (i32.const 2972) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00C\00o\00m\00p\00u\00t\00e\00r\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 3052) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00t\00i\00m\00e\00r\000\00")
 (data $30 (i32.const 3084) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00T\00o\00o\00 \00m\00a\00n\00y\00 \00I\00O\00 \00d\00e\00v\00i\00c\00e\00s\00\00\00\00\00\00\00")
 (data $31 (i32.const 3148) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\00D\00e\00v\00i\00c\00e\00 \00s\00t\00r\00i\00n\00g\00s\00 \00m\00e\00m\00o\00r\00y\00 \00o\00v\00e\00r\00f\00l\00o\00w\00 \00(\00p\00t\00r\00=\00\00\00\00\00")
 (data $32 (i32.const 3244) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00 \00|\00 \00s\00t\00r\00l\00e\00n\00=\00\00\00\00\00\00\00\00\00")
 (data $33 (i32.const 3292) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00)\00 \00|\00 \00S\00T\00R\00I\00N\00G\00S\00_\00E\00N\00D\00=\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $34 (i32.const 3356) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\18\00\00\00`\0c\00\00\00\00\00\00\c0\0c\00\00\00\00\00\00\f0\0c\00\00\00\00\00\00\00\00\00\00")
 (data $35 (i32.const 3404) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00D\00e\00v\00i\00c\00e\00 \00#\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $36 (i32.const 3452) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00 \00\"\00\00\00\00\00\00\00\00\00")
 (data $37 (i32.const 3484) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\002\00\00\00\"\00 \00e\00n\00t\00r\00y\00 \00a\00d\00d\00e\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $38 (i32.const 3564) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00 \00(\00i\00o\00B\00a\00s\00e\00 \00=\00 \00\00\00\00\00\00\00")
 (data $39 (i32.const 3612) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00)\00\00\00\00\00\00\00\00\00\00\00")
 (data $40 (i32.const 3644) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00`\r\00\00\00\00\00\00\90\r\00\00\00\00\00\00\b0\r\00\00\00\00\00\00\00\0e\00\00\00\00\00\000\0e\00\00\00\00\00\00\00\00\00\00")
 (data $41 (i32.const 3708) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\000\001\002\003\004\005\006\007\008\009\00A\00B\00C\00D\00E\00F\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $42 (i32.const 3772) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\000\00x\00\00\00\00\00\00\00\00\00")
 (data $43 (i32.const 3804) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00C\00o\00m\00p\00u\00t\00e\00r\00 \00i\00n\00s\00t\00a\00n\00c\00i\00a\00t\00e\00d\00\00\00")
 (data $44 (i32.const 3868) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00R\00O\00M\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00\00\00")
 (data $45 (i32.const 3916) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00s\00r\00c\00/\00i\00n\00d\00e\00x\00.\00t\00s\00\00\00\00\00")
 (data $46 (i32.const 3964) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00R\00A\00M\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00\00\00")
 (data $47 (i32.const 4012) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\002\00\00\00B\00o\00o\00t\00l\00o\00a\00d\00e\00r\00 \00c\00o\00d\00e\00 \00t\00o\00o\00 \00h\00e\00a\00v\00y\00\00\00\00\00\00\00\00\00\00\00")
 (data $48 (i32.const 4092) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $49 (i32.const 4220) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00C\00P\00U\00 \00#\00\00\00")
 (data $50 (i32.const 4268) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00i\00n\00t\00e\00r\00r\00u\00p\00t\00\00\00\00\00\00\00\00\00\00\00")
 (data $51 (i32.const 4332) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00C\00p\00u\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $52 (i32.const 4396) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00\00\00\00\00\00\00\00\00")
 (data $53 (i32.const 4460) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00\00\00\00\00\00\00")
 (data $54 (i32.const 4508) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00n\00u\00m\00b\00e\00r\00")
 (data $55 (i32.const 4540) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00u\00n\00d\00e\00f\00i\00n\00e\00d\00\00\00\00\00\00\00\00\00\00\00")
 (data $56 (i32.const 4588) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00B\00u\00s\00\00\00\00\00\00\00\00\00\00\00")
 (data $57 (i32.const 4652) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00,\00\00\00W\00r\00i\00t\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"\00")
 (data $58 (i32.const 4716) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\"\00 \00(\00\00\00\00\00\00\00")
 (data $59 (i32.const 4748) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\"\00")
 (data $60 (i32.const 4796) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00 \00(\00\00\00\00\00\00\00\00\00")
 (data $61 (i32.const 4828) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00)\00\"\00\00\00\00\00\00\00\00\00")
 (data $62 (i32.const 4860) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00@\12\00\00\00\00\00\00\80\12\00\00\00\00\00\00\a0\12\00\00\00\00\00\00\d0\12\00\00\00\00\00\00\f0\12\00\00\00\00\00\00\00\00\00\00")
 (data $63 (i32.const 4924) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00L\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00")
 (data $64 (i32.const 5020) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00L\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00")
 (data $65 (i32.const 5116) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00Z\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00")
 (data $66 (i32.const 5228) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\008\00\00\00W\00r\00i\00t\00e\00 \00t\00o\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#\00\00\00\00\00")
 (data $67 (i32.const 5308) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00R\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00#\00\00\00\00\00\00\00\00\00\00\00")
 (data $68 (i32.const 5420) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00 \00o\00n\00 \00p\00o\00r\00t\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $69 (i32.const 5468) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\d0\14\00\00\00\00\00\00@\15\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $70 (i32.const 5516) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00w\00r\00i\00t\00e\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 \00\00\00\00\00")
 (data $71 (i32.const 5612) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00,\00\00\00m\00i\00s\00s\00i\00n\00g\00 \00h\00a\00n\00d\00l\00e\00r\00A\00d\00d\00r\00e\00s\00s\00")
 (data $72 (i32.const 5676) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00=\d8\04\dd \00I\00n\00t\00e\00r\00r\00u\00p\00t\00i\00o\00n\00 \00I\00R\00Q\00\00\00\00\00\00\00")
 (data $73 (i32.const 5740) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00 \00-\00>\00 \00H\00a\00n\00d\00l\00e\00r\00 \00\00\00\00\00")
 (data $74 (i32.const 5788) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00@\16\00\00\00\00\00\00\80\16\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $75 (i32.const 5836) "\1c\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data $76 (i32.const 5868) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00J\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00")
 (data $77 (i32.const 5964) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00J\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00")
 (data $78 (i32.const 6060) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00X\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00\00\00")
 (data $79 (i32.const 6172) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00:\00\00\00R\00e\00a\00d\00 \00f\00r\00o\00m\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#\00\00\00")
 (data $80 (i32.const 6252) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00P\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00d\00e\00v\00i\00c\00e\00 \00#\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $81 (i32.const 6364) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80\18\00\00\00\00\00\00@\15\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $82 (i32.const 6412) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00F\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00r\00e\00a\00d\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 \00\00\00\00\00\00\00")
 (data $83 (i32.const 6508) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00,\00\00\00R\00e\00a\00d\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"\00")
 (data $84 (i32.const 6572) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00\80\19\00\00\00\00\00\00\80\12\00\00\00\00\00\00\a0\12\00\00\00\00\00\00\d0\12\00\00\00\00\00\00\f0\12\00\00\00\00\00\00\00\00\00\00")
 (data $85 (i32.const 6636) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00>\00\00\00M\00e\00m\00o\00r\00y\00B\00u\00s\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $86 (i32.const 6732) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00m\00i\00s\00s\00i\00n\00g\00 \00b\00r\00e\00a\00k\00p\00o\00i\00n\00t\00\00\00\00\00\00\00\00\00")
 (data $87 (i32.const 6796) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00@\00\00\00C\00P\00U\00 \00B\00r\00e\00a\00k\00p\00o\00i\00n\00t\00 \00(\00I\00D\00E\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $88 (i32.const 6892) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $89 (i32.const 6956) "\1c\00\00\00\00\00\00\00\00\00\00\00\1d\00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00")
 (data $90 (i32.const 6988) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00I\00M\00M\00 \00#\00\00\00\00\00\00\00")
 (data $91 (i32.const 7036) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00 \00:\00 \00\00\00\00\00\00\00")
 (data $92 (i32.const 7068) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00`\1b\00\00\00\00\00\00\90\1b\00\00\00\00\00\00\d0\12\00\00\00\00\00\000\0e\00\00")
 (data $93 (i32.const 7116) "\1c\00\00\00\00\00\00\00\00\00\00\00\1e\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00")
 (data $94 (i32.const 7148) "\1c\00\00\00\00\00\00\00\00\00\00\00\1e\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00")
 (data $95 (i32.const 7180) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00C\00P\00U\00 \00H\00a\00l\00t\00e\00d\00\00\00\00\00\00\00\00\00")
 (data $96 (i32.const 7228) "\1c\00\00\00\00\00\00\00\00\00\00\00\1e\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00")
 (data $97 (i32.const 7260) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00`\1b\00\00\00\00\00\00\90\1b\00\00\00\00\00\00\d0\12\00\00\00\00\00\000\0e\00\00")
 (data $98 (i32.const 7308) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00")
 (data $99 (i32.const 7340) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00A\00\00\00\00\00\00\00\00\00\00\00")
 (data $100 (i32.const 7372) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00B\00\00\00\00\00\00\00\00\00\00\00")
 (data $101 (i32.const 7404) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00C\00\00\00\00\00\00\00\00\00\00\00")
 (data $102 (i32.const 7436) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00D\00\00\00\00\00\00\00\00\00\00\00")
 (data $103 (i32.const 7468) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00E\00\00\00\00\00\00\00\00\00\00\00")
 (data $104 (i32.const 7500) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00F\00\00\00\00\00\00\00\00\00\00\00")
 (data $105 (i32.const 7532) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00R\00e\00g\00i\00s\00t\00e\00r\00 \00#\00\00\00\00\00\00\00\00\00")
 (data $106 (i32.const 7580) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00,\00\00\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00")
 (data $107 (i32.const 7644) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80\1d\00\00\00\00\00\00\b0\1d\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $108 (i32.const 7692) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80\1d\00\00\00\00\00\00\b0\1d\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $109 (i32.const 7740) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00R\00E\00G\00 \00#\00\00\00\00\00\00\00")
 (data $110 (i32.const 7788) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00 \00=\00 \00\00\00\00\00\00\00")
 (data $111 (i32.const 7820) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00P\1e\00\00\00\00\00\00\90\1b\00\00\00\00\00\00\80\1e\00\00\00\00\00\00\d0\12\00\00\00\00\00\000\0e\00\00\00\00\00\00\00\00\00\00")
 (data $112 (i32.const 7884) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\07\00\00\00\00\00\00\00\00\00\00\00")
 (data $113 (i32.const 7916) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00M\00E\00M\00 \00#\00\00\00\00\00\00\00")
 (data $114 (i32.const 7964) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00 \00:\00 \00[\00\00\00\00\00")
 (data $115 (i32.const 7996) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00]\00 \00=\00 \00\00\00\00\00")
 (data $116 (i32.const 8028) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00\00\1f\00\00\00\00\00\000\1f\00\00\00\00\00\00P\1f\00\00\00\00\00\00\d0\12\00\00\00\00\00\000\0e\00\00\00\00\00\00\00\00\00\00")
 (data $117 (i32.const 8092) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00")
 (data $118 (i32.const 8124) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\t\00\00\00\00\00\00\00\00\00\00\00")
 (data $119 (i32.const 8156) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\n\00\00\00\00\00\00\00\00\00\00\00")
 (data $120 (i32.const 8188) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00i\00n\00t\00C\00o\00d\00e\00 \00=\00 \00\00\00\00\00\00\00\00\00")
 (data $121 (i32.const 8236) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\002\00\00\00i\00n\00t\00e\00r\00r\00u\00p\00t\00s\00T\00a\00b\00l\00e\00P\00o\00i\00n\00t\00e\00r\00 \00=\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $122 (i32.const 8316) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\000\00\00\00i\00n\00t\00e\00r\00r\00u\00p\00t\00T\00a\00b\00l\00e\00P\00o\00i\00n\00t\00e\00r\00 \00=\00 \00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $123 (i32.const 8396) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\006\00\00\00h\00a\00n\00d\00l\00e\00r\00A\00d\00d\00r\00e\00s\00s\00P\00o\00i\00n\00t\00e\00r\00L\00o\00w\00 \00=\00 \00\00\00\00\00\00\00")
 (data $124 (i32.const 8476) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\008\00\00\00h\00a\00n\00d\00l\00e\00r\00A\00d\00d\00r\00e\00s\00s\00P\00o\00i\00n\00t\00e\00r\00H\00i\00g\00h\00 \00=\00 \00\00\00\00\00")
 (data $125 (i32.const 8556) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00h\00a\00n\00d\00l\00e\00r\00A\00d\00d\00r\00e\00s\00s\00 \00=\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $126 (i32.const 8620) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\0b\00\00\00\00\00\00\00\00\00\00\00")
 (data $127 (i32.const 8652) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00")
 (data $128 (i32.const 8684) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00B\00\00\00C\00P\00U\00 \00B\00r\00e\00a\00k\00p\00o\00i\00n\00t\00 \00(\00I\00N\00T\003\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $129 (i32.const 8780) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\r\00\00\00\00\00\00\00\00\00\00\00")
 (data $130 (i32.const 8812) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\0e\00\00\00\00\00\00\00\00\00\00\00")
 (data $131 (i32.const 8844) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\0f\00\00\00\00\00\00\00\00\00\00\00")
 (data $132 (i32.const 8876) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80\1d\00\00\00\00\00\00\b0\1d\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $133 (i32.const 8924) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00")
 (data $134 (i32.const 8956) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00")
 (data $135 (i32.const 8988) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00")
 (data $136 (i32.const 9020) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\13\00\00\00\00\00\00\00\00\00\00\00")
 (data $137 (i32.const 9052) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\n\00\00\00c\00a\00r\00r\00y\00\00\00")
 (data $138 (i32.const 9084) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00z\00e\00r\00o\00\00\00\00\00")
 (data $139 (i32.const 9116) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00")
 (data $140 (i32.const 9148) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\15\00\00\00\00\00\00\00\00\00\00\00")
 (data $141 (i32.const 9180) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00")
 (data $142 (i32.const 9212) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\17\00\00\00\00\00\00\00\00\00\00\00")
 (data $143 (i32.const 9244) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00")
 (data $144 (i32.const 9276) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\19\00\00\00\00\00\00\00\00\00\00\00")
 (data $145 (i32.const 9308) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\1a\00\00\00\00\00\00\00\00\00\00\00")
 (data $146 (i32.const 9340) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\1b\00\00\00\00\00\00\00\00\00\00\00")
 (data $147 (i32.const 9372) "\1c\00\00\00\00\00\00\00\00\00\00\00\1d\00\00\00\08\00\00\00\1c\00\00\00\00\00\00\00\00\00\00\00")
 (data $148 (i32.const 9404) "\1c\00\00\00\00\00\00\00\00\00\00\00\1e\00\00\00\08\00\00\00\1d\00\00\00\00\00\00\00\00\00\00\00")
 (data $149 (i32.const 9436) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\1e\00\00\00\00\00\00\00\00\00\00\00")
 (data $150 (i32.const 9468) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\1f\00\00\00\00\00\00\00\00\00\00\00")
 (data $151 (i32.const 9500) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $152 (i32.const 9532) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00!\00\00\00\00\00\00\00\00\00\00\00")
 (data $153 (i32.const 9564) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\"\00\00\00\00\00\00\00\00\00\00\00")
 (data $154 (i32.const 9596) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00#\00\00\00\00\00\00\00\00\00\00\00")
 (data $155 (i32.const 9628) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00$\00\00\00\00\00\00\00\00\00\00\00")
 (data $156 (i32.const 9660) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00%\00\00\00\00\00\00\00\00\00\00\00")
 (data $157 (i32.const 9692) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00&\00\00\00\00\00\00\00\00\00\00\00")
 (data $158 (i32.const 9724) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\'\00\00\00\00\00\00\00\00\00\00\00")
 (data $159 (i32.const 9756) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00(\00\00\00\00\00\00\00\00\00\00\00")
 (data $160 (i32.const 9788) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00)\00\00\00\00\00\00\00\00\00\00\00")
 (data $161 (i32.const 9820) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00*\00\00\00\00\00\00\00\00\00\00\00")
 (data $162 (i32.const 9852) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00+\00\00\00\00\00\00\00\00\00\00\00")
 (data $163 (i32.const 9884) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00,\00\00\00\00\00\00\00\00\00\00\00")
 (data $164 (i32.const 9916) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00-\00\00\00\00\00\00\00\00\00\00\00")
 (data $165 (i32.const 9948) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00.\00\00\00\00\00\00\00\00\00\00\00")
 (data $166 (i32.const 9980) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $167 (i32.const 10012) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $168 (i32.const 10044) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\001\00\00\00\00\00\00\00\00\00\00\00")
 (data $169 (i32.const 10076) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\002\00\00\00\00\00\00\00\00\00\00\00")
 (data $170 (i32.const 10108) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\003\00\00\00\00\00\00\00\00\00\00\00")
 (data $171 (i32.const 10140) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\004\00\00\00\00\00\00\00\00\00\00\00")
 (data $172 (i32.const 10172) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\005\00\00\00\00\00\00\00\00\00\00\00")
 (data $173 (i32.const 10204) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\006\00\00\00\00\00\00\00\00\00\00\00")
 (data $174 (i32.const 10236) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\007\00\00\00\00\00\00\00\00\00\00\00")
 (data $175 (i32.const 10268) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\008\00\00\00\00\00\00\00\00\00\00\00")
 (data $176 (i32.const 10300) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\009\00\00\00\00\00\00\00\00\00\00\00")
 (data $177 (i32.const 10332) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00:\00\00\00\00\00\00\00\00\00\00\00")
 (data $178 (i32.const 10364) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00;\00\00\00\00\00\00\00\00\00\00\00")
 (data $179 (i32.const 10396) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00<\00\00\00\00\00\00\00\00\00\00\00")
 (data $180 (i32.const 10428) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00=\00\00\00\00\00\00\00\00\00\00\00")
 (data $181 (i32.const 10460) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00>\00\00\00\00\00\00\00\00\00\00\00")
 (data $182 (i32.const 10492) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00?\00\00\00\00\00\00\00\00\00\00\00")
 (data $183 (i32.const 10524) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00@\00\00\00\00\00\00\00\00\00\00\00")
 (data $184 (i32.const 10556) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00A\00\00\00\00\00\00\00\00\00\00\00")
 (data $185 (i32.const 10588) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00B\00\00\00\00\00\00\00\00\00\00\00")
 (data $186 (i32.const 10620) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00C\00\00\00\00\00\00\00\00\00\00\00")
 (data $187 (i32.const 10652) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00D\00\00\00\00\00\00\00\00\00\00\00")
 (data $188 (i32.const 10684) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00E\00\00\00\00\00\00\00\00\00\00\00")
 (data $189 (i32.const 10716) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00F\00\00\00\00\00\00\00\00\00\00\00")
 (data $190 (i32.const 10748) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00G\00\00\00\00\00\00\00\00\00\00\00")
 (data $191 (i32.const 10780) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00H\00\00\00\00\00\00\00\00\00\00\00")
 (data $192 (i32.const 10812) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00I\00\00\00\00\00\00\00\00\00\00\00")
 (data $193 (i32.const 10844) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00J\00\00\00\00\00\00\00\00\00\00\00")
 (data $194 (i32.const 10876) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00K\00\00\00\00\00\00\00\00\00\00\00")
 (data $195 (i32.const 10908) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00L\00\00\00\00\00\00\00\00\00\00\00")
 (data $196 (i32.const 10940) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00M\00\00\00\00\00\00\00\00\00\00\00")
 (data $197 (i32.const 10972) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00N\00\00\00\00\00\00\00\00\00\00\00")
 (data $198 (i32.const 11004) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00O\00\00\00\00\00\00\00\00\00\00\00")
 (data $199 (i32.const 11036) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00P\00\00\00\00\00\00\00\00\00\00\00")
 (data $200 (i32.const 11068) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00Q\00\00\00\00\00\00\00\00\00\00\00")
 (data $201 (i32.const 11100) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00R\00\00\00\00\00\00\00\00\00\00\00")
 (data $202 (i32.const 11132) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00S\00\00\00\00\00\00\00\00\00\00\00")
 (data $203 (i32.const 11164) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00T\00\00\00\00\00\00\00\00\00\00\00")
 (data $204 (i32.const 11196) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00U\00\00\00\00\00\00\00\00\00\00\00")
 (data $205 (i32.const 11228) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00V\00\00\00\00\00\00\00\00\00\00\00")
 (data $206 (i32.const 11260) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00W\00\00\00\00\00\00\00\00\00\00\00")
 (data $207 (i32.const 11292) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00X\00\00\00\00\00\00\00\00\00\00\00")
 (data $208 (i32.const 11324) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00Y\00\00\00\00\00\00\00\00\00\00\00")
 (data $209 (i32.const 11356) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00Z\00\00\00\00\00\00\00\00\00\00\00")
 (data $210 (i32.const 11388) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00I\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00:\00 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $211 (i32.const 11468) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\00\00")
 (data $212 (i32.const 11516) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\18\00\00\00\90,\00\00\00\00\00\00\d0\12\00\00\00\00\00\00\e0,\00\00\00\00\00\00\00\00\00\00")
 (data $213 (i32.const 11564) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00T\00i\00m\00e\00r\00s\00")
 (data $214 (i32.const 11612) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00T\00i\00m\00e\00r\00 \00#\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $215 (i32.const 11676) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00I\00R\00Q\00 \00n\00u\00m\00b\00e\00r\00:\00 \00\00\00\00\00")
 (data $216 (i32.const 11740) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00h\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00I\00n\00t\00e\00r\00r\00u\00p\00t\00 \00f\00o\00r\00 \00T\00i\00m\00e\00r\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00q\00u\00e\00s\00t\00I\00n\00t\00e\00r\00r\00u\00p\00t\00\00\00\00\00")
 (data $217 (i32.const 11868) "\1c\00\00\00\00\00\00\00\00\00\00\00\"\00\00\00\08\00\00\00[\00\00\00\00\00\00\00\00\00\00\00")
 (data $218 (i32.const 11900) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00I\00o\00M\00a\00n\00a\00g\00e\00r\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00\00\00\00\00\00\00")
 (data $219 (i32.const 11964) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00R\00e\00l\00o\00a\00d\00 \00D\00e\00v\00i\00c\00e\00 \00#\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $220 (i32.const 12028) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00 \00n\00a\00m\00e\00d\00 \00\"\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $221 (i32.const 12076) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00\"\00 \00(\00t\00y\00p\00e\00 \00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $222 (i32.const 12124) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00\d0.\00\00\00\00\00\00\10/\00\00\00\00\00\00@/\00\00\00\00\00\000\0e\00\00")
 (data $223 (i32.const 12172) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00m\00a\00i\00n\00.\00a\00s\00m\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $224 (i32.const 12220) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00b\00r\00e\00a\00k\00p\00o\00i\00n\00t\00s\00:\00 \00\00\00")
 (data $225 (i32.const 12268) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d\00\00\00")
 (data $226 (i32.const 12332) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d\00\00\00\00\00")
 (data $227 (i32.const 12400) "%\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00d\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02A\00\00\00\00\00\00 \00\00\00 \00\00\00\02A\00\00\00\00\00\00\10A\01\00\00\00\00\00 \00\00\00\10\c1\00\00\00\00\00\00\02A\00\00\02\t\00\00\04A\00\00\00\00\00\00\00\00\00\00A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00 \00\00\00\00\00\00\00\82\00\00\00\02A\00\00")
 (table $0 92 92 funcref)
 (elem $0 (i32.const 1) $src/devices/Memory/Memory#read $src/devices/Cpu/fetchInstructionActions~anonymous|0 $src/devices/Cpu/fetchInstructionActions~anonymous|1 $src/devices/Cpu/fetchInstructionActions~anonymous|2 $src/devices/Cpu/fetchInstructionActions~anonymous|3 $src/devices/Cpu/fetchInstructionActions~anonymous|4 $src/devices/Cpu/fetchInstructionActions~anonymous|5 $src/devices/Cpu/fetchInstructionActions~anonymous|6 $src/devices/Cpu/fetchInstructionActions~anonymous|7 $src/devices/Cpu/fetchInstructionActions~anonymous|8 $src/devices/Cpu/fetchInstructionActions~anonymous|9 $src/devices/Cpu/fetchInstructionActions~anonymous|10 $src/devices/Cpu/fetchInstructionActions~anonymous|11 $src/devices/Cpu/fetchInstructionActions~anonymous|12 $src/devices/Cpu/fetchInstructionActions~anonymous|13 $src/devices/Cpu/fetchInstructionActions~anonymous|14 $src/devices/Cpu/fetchInstructionActions~anonymous|15 $src/devices/Cpu/fetchInstructionActions~anonymous|16 $src/devices/Cpu/fetchInstructionActions~anonymous|17 $src/devices/Cpu/fetchInstructionActions~anonymous|18 $src/devices/Cpu/fetchInstructionActions~anonymous|19 $src/devices/Cpu/fetchInstructionActions~anonymous|20 $src/devices/Cpu/fetchInstructionActions~anonymous|21 $src/devices/Cpu/fetchInstructionActions~anonymous|22 $src/devices/Cpu/fetchInstructionActions~anonymous|23 $src/devices/Cpu/fetchInstructionActions~anonymous|24 $src/devices/Cpu/fetchInstructionActions~anonymous|25 $src/devices/Cpu/fetchInstructionActions~anonymous|26 $src/devices/Cpu/fetchInstructionActions~anonymous|27 $src/devices/Cpu/fetchInstructionActions~anonymous|28 $src/devices/Cpu/fetchInstructionActions~anonymous|29 $src/devices/Cpu/fetchInstructionActions~anonymous|30 $src/devices/Cpu/fetchInstructionActions~anonymous|31 $src/devices/Cpu/fetchInstructionActions~anonymous|32 $src/devices/Cpu/fetchInstructionActions~anonymous|33 $src/devices/Cpu/fetchInstructionActions~anonymous|34 $src/devices/Cpu/fetchInstructionActions~anonymous|35 $src/devices/Cpu/fetchInstructionActions~anonymous|36 $src/devices/Cpu/fetchInstructionActions~anonymous|37 $src/devices/Cpu/fetchInstructionActions~anonymous|38 $src/devices/Cpu/fetchInstructionActions~anonymous|39 $src/devices/Cpu/fetchInstructionActions~anonymous|40 $src/devices/Cpu/fetchInstructionActions~anonymous|41 $src/devices/Cpu/fetchInstructionActions~anonymous|42 $src/devices/Cpu/fetchInstructionActions~anonymous|43 $src/devices/Cpu/fetchInstructionActions~anonymous|44 $src/devices/Cpu/fetchInstructionActions~anonymous|45 $src/devices/Cpu/fetchInstructionActions~anonymous|46 $src/devices/Cpu/fetchInstructionActions~anonymous|47 $src/devices/Cpu/fetchInstructionActions~anonymous|48 $src/devices/Cpu/fetchInstructionActions~anonymous|49 $src/devices/Cpu/fetchInstructionActions~anonymous|50 $src/devices/Cpu/fetchInstructionActions~anonymous|51 $src/devices/Cpu/fetchInstructionActions~anonymous|52 $src/devices/Cpu/fetchInstructionActions~anonymous|53 $src/devices/Cpu/fetchInstructionActions~anonymous|54 $src/devices/Cpu/fetchInstructionActions~anonymous|55 $src/devices/Cpu/fetchInstructionActions~anonymous|56 $src/devices/Cpu/fetchInstructionActions~anonymous|57 $src/devices/Cpu/fetchInstructionActions~anonymous|58 $src/devices/Cpu/fetchInstructionActions~anonymous|59 $src/devices/Cpu/fetchInstructionActions~anonymous|60 $src/devices/Cpu/fetchInstructionActions~anonymous|61 $src/devices/Cpu/fetchInstructionActions~anonymous|62 $src/devices/Cpu/fetchInstructionActions~anonymous|63 $src/devices/Cpu/fetchInstructionActions~anonymous|64 $src/devices/Cpu/fetchInstructionActions~anonymous|65 $src/devices/Cpu/fetchInstructionActions~anonymous|66 $src/devices/Cpu/fetchInstructionActions~anonymous|67 $src/devices/Cpu/fetchInstructionActions~anonymous|68 $src/devices/Cpu/fetchInstructionActions~anonymous|69 $src/devices/Cpu/fetchInstructionActions~anonymous|70 $src/devices/Cpu/fetchInstructionActions~anonymous|71 $src/devices/Cpu/fetchInstructionActions~anonymous|72 $src/devices/Cpu/fetchInstructionActions~anonymous|73 $src/devices/Cpu/fetchInstructionActions~anonymous|74 $src/devices/Cpu/fetchInstructionActions~anonymous|75 $src/devices/Cpu/fetchInstructionActions~anonymous|76 $src/devices/Cpu/fetchInstructionActions~anonymous|77 $src/devices/Cpu/fetchInstructionActions~anonymous|78 $src/devices/Cpu/fetchInstructionActions~anonymous|79 $src/devices/Cpu/fetchInstructionActions~anonymous|80 $src/devices/Cpu/fetchInstructionActions~anonymous|81 $src/devices/Cpu/fetchInstructionActions~anonymous|82 $src/devices/Cpu/fetchInstructionActions~anonymous|83 $src/devices/Cpu/fetchInstructionActions~anonymous|84 $src/devices/Cpu/fetchInstructionActions~anonymous|85 $src/devices/Cpu/fetchInstructionActions~anonymous|86 $src/devices/Cpu/fetchInstructionActions~anonymous|87 $src/devices/Cpu/fetchInstructionActions~anonymous|88 $src/devices/Memory/MemoryBus#read)
 (export "instanciateComputer" (func $src/index/instanciateComputer))
 (export "allocate" (func $src/index/allocate))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "computerloadCodeInROM" (func $export:src/index/computerloadCodeInROM))
 (export "computerloadCodeInRAM" (func $export:src/index/computerloadCodeInRAM))
 (export "computerRunCycles" (func $export:src/index/computerRunCycles@varargs))
 (export "computerGetCycles" (func $export:src/index/computerGetCycles))
 (export "computerGetRegisterPC" (func $export:src/index/computerGetRegisterPC))
 (export "computerGetRegisterSP" (func $export:src/index/computerGetRegisterSP))
 (export "computerGetRegisterIR" (func $export:src/index/computerGetRegisterIR))
 (export "computerGetRegisterA" (func $export:src/index/computerGetRegisterA))
 (export "computerGetRegisterB" (func $export:src/index/computerGetRegisterB))
 (export "computerGetRegisterC" (func $export:src/index/computerGetRegisterC))
 (export "computerGetRegisterD" (func $export:src/index/computerGetRegisterD))
 (export "computerGetRegisterE" (func $export:src/index/computerGetRegisterE))
 (export "computerGetRegisterF" (func $export:src/index/computerGetRegisterF))
 (export "computerGetMemory" (func $export:src/index/computerGetMemory))
 (export "computerSetMemory" (func $export:src/index/computerSetMemory))
 (export "computerAddDevice" (func $export:src/index/computerAddDevice))
 (export "computerResetComputer" (func $export:src/index/computerResetComputer))
 (export "computerSetBreakpoints" (func $export:src/index/computerSetBreakpoints))
 (start $~start)
 (func $~lib/rt/itcms/Object#set:nextWithColor (param $this i32) (param $nextWithColor i32)
  local.get $this
  local.get $nextWithColor
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=8
 )
 (func $~lib/rt/itcms/initLazy (param $space i32) (result i32)
  local.get $space
  local.get $space
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $space
  local.get $space
  call $~lib/rt/itcms/Object#set:prev
  local.get $space
  return
 )
 (func $~lib/rt/itcms/Object#get:nextWithColor (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/itcms/Object#get:next (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  return
 )
 (func $~lib/rt/itcms/Object#get:color (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  return
 )
 (func $~lib/rt/itcms/visitRoots (param $cookie i32)
  (local $pn i32)
  (local $iter i32)
  local.get $cookie
  call $~lib/rt/__visit_globals
  global.get $~lib/rt/itcms/pinSpace
  local.set $pn
  local.get $pn
  call $~lib/rt/itcms/Object#get:next
  local.set $iter
  loop $while-continue|0
   local.get $iter
   local.get $pn
   i32.ne
   if
    i32.const 1
    drop
    local.get $iter
    call $~lib/rt/itcms/Object#get:color
    i32.const 3
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 128
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $iter
    i32.const 20
    i32.add
    local.get $cookie
    call $~lib/rt/__visit_members
    local.get $iter
    call $~lib/rt/itcms/Object#get:next
    local.set $iter
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $this i32) (param $color i32)
  local.get $this
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $color
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/itcms/Object#set:next (param $this i32) (param $obj i32)
  local.get $this
  local.get $obj
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#unlink (param $this i32)
  (local $next i32)
  (local $prev i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:next
  local.set $next
  local.get $next
  i32.const 0
  i32.eq
  if
   i32.const 1
   drop
   local.get $this
   call $~lib/rt/itcms/Object#get:prev
   i32.const 0
   i32.eq
   if (result i32)
    local.get $this
    global.get $~lib/memory/__heap_base
    i32.lt_u
   else
    i32.const 0
   end
   i32.eqz
   if
    i32.const 0
    i32.const 128
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $this
  call $~lib/rt/itcms/Object#get:prev
  local.set $prev
  i32.const 1
  drop
  local.get $prev
  i32.eqz
  if
   i32.const 0
   i32.const 128
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $next
  local.get $prev
  call $~lib/rt/itcms/Object#set:prev
  local.get $prev
  local.get $next
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/Object#get:rtId (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/shared/typeinfo/Typeinfo#get:flags (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/__typeinfo (param $id i32) (result i32)
  (local $ptr i32)
  global.get $~lib/rt/__rtti_base
  local.set $ptr
  local.get $id
  local.get $ptr
  i32.load
  i32.gt_u
  if
   i32.const 256
   i32.const 320
   i32.const 21
   i32.const 28
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.add
  local.get $id
  i32.const 4
  i32.mul
  i32.add
  call $~lib/shared/typeinfo/Typeinfo#get:flags
  return
 )
 (func $~lib/rt/itcms/Object#get:isPointerfree (param $this i32) (result i32)
  (local $rtId i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:rtId
  local.set $rtId
  local.get $rtId
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $rtId
   call $~lib/rt/__typeinfo
   i32.const 32
   i32.and
   i32.const 0
   i32.ne
  end
  return
 )
 (func $~lib/rt/itcms/Object#linkTo (param $this i32) (param $list i32) (param $withColor i32)
  (local $prev i32)
  local.get $list
  call $~lib/rt/itcms/Object#get:prev
  local.set $prev
  local.get $this
  local.get $list
  local.get $withColor
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $this
  local.get $prev
  call $~lib/rt/itcms/Object#set:prev
  local.get $prev
  local.get $this
  call $~lib/rt/itcms/Object#set:next
  local.get $list
  local.get $this
  call $~lib/rt/itcms/Object#set:prev
 )
 (func $~lib/rt/itcms/Object#makeGray (param $this i32)
  (local $1 i32)
  local.get $this
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $this
   call $~lib/rt/itcms/Object#get:prev
   local.tee $1
   i32.eqz
   if (result i32)
    i32.const 0
    i32.const 128
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   else
    local.get $1
   end
   global.set $~lib/rt/itcms/iter
  end
  local.get $this
  call $~lib/rt/itcms/Object#unlink
  local.get $this
  global.get $~lib/rt/itcms/toSpace
  local.get $this
  call $~lib/rt/itcms/Object#get:isPointerfree
  if (result i32)
   global.get $~lib/rt/itcms/white
   i32.eqz
  else
   i32.const 2
  end
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__visit (param $ptr i32) (param $cookie i32)
  (local $obj i32)
  local.get $ptr
  i32.eqz
  if
   return
  end
  local.get $ptr
  i32.const 20
  i32.sub
  local.set $obj
  i32.const 0
  drop
  local.get $obj
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $obj
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/visitStack (param $cookie i32)
  (local $ptr i32)
  global.get $~lib/memory/__stack_pointer
  local.set $ptr
  loop $while-continue|0
   local.get $ptr
   global.get $~lib/memory/__heap_base
   i32.lt_u
   if
    local.get $ptr
    i32.load
    local.get $cookie
    call $~lib/rt/itcms/__visit
    local.get $ptr
    i32.const 4
    i32.add
    local.set $ptr
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/itcms/Object#get:size (param $this i32) (result i32)
  i32.const 4
  local.get $this
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  return
 )
 (func $~lib/rt/tlsf/Root#set:flMap (param $this i32) (param $flMap i32)
  local.get $this
  local.get $flMap
  i32.store
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/tlsf/Block#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/Block#set:next (param $this i32) (param $next i32)
  local.get $this
  local.get $next
  i32.store offset=8
 )
 (func $~lib/rt/tlsf/Block#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/tlsf/Block#get:next (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/tlsf/Root#get:flMap (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/tlsf/removeBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $6 i32)
  (local $7 i32)
  (local $boundedSize i32)
  (local $prev i32)
  (local $next i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $root|14 i32)
  (local $fl|15 i32)
  (local $sl|16 i32)
  (local $head i32)
  (local $root|18 i32)
  (local $fl|19 i32)
  (local $slMap i32)
  (local $root|21 i32)
  (local $fl|22 i32)
  (local $slMap|23 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $6
   i32.const 1073741820
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/tlsf/Block#get:prev
  local.set $prev
  local.get $block
  call $~lib/rt/tlsf/Block#get:next
  local.set $next
  local.get $prev
  if
   local.get $prev
   local.get $next
   call $~lib/rt/tlsf/Block#set:next
  end
  local.get $next
  if
   local.get $next
   local.get $prev
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $block
  block $~lib/rt/tlsf/GETHEAD|inlined.0 (result i32)
   local.get $root
   local.set $root|11
   local.get $fl
   local.set $fl|12
   local.get $sl
   local.set $sl|13
   local.get $root|11
   local.get $fl|12
   i32.const 4
   i32.shl
   local.get $sl|13
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.0
  end
  i32.eq
  if
   local.get $root
   local.set $root|14
   local.get $fl
   local.set $fl|15
   local.get $sl
   local.set $sl|16
   local.get $next
   local.set $head
   local.get $root|14
   local.get $fl|15
   i32.const 4
   i32.shl
   local.get $sl|16
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $head
   i32.store offset=96
   local.get $next
   i32.eqz
   if
    block $~lib/rt/tlsf/GETSL|inlined.0 (result i32)
     local.get $root
     local.set $root|18
     local.get $fl
     local.set $fl|19
     local.get $root|18
     local.get $fl|19
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.0
    end
    local.set $slMap
    local.get $root
    local.set $root|21
    local.get $fl
    local.set $fl|22
    local.get $slMap
    i32.const 1
    local.get $sl
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $slMap
    local.set $slMap|23
    local.get $root|21
    local.get $fl|22
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap|23
    i32.store offset=4
    local.get $slMap
    i32.eqz
    if
     local.get $root
     local.get $root
     call $~lib/rt/tlsf/Root#get:flMap
     i32.const 1
     local.get $fl
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     call $~lib/rt/tlsf/Root#set:flMap
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $block|3 i32)
  (local $right i32)
  (local $rightInfo i32)
  (local $block|6 i32)
  (local $block|7 i32)
  (local $left i32)
  (local $leftInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $13 i32)
  (local $14 i32)
  (local $boundedSize i32)
  (local $root|16 i32)
  (local $fl|17 i32)
  (local $sl|18 i32)
  (local $head i32)
  (local $root|20 i32)
  (local $fl|21 i32)
  (local $sl|22 i32)
  (local $head|23 i32)
  (local $root|24 i32)
  (local $fl|25 i32)
  (local $root|26 i32)
  (local $fl|27 i32)
  (local $slMap i32)
  i32.const 1
  drop
  local.get $block
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.0 (result i32)
   local.get $block
   local.set $block|3
   local.get $block|3
   i32.const 4
   i32.add
   local.get $block|3
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   br $~lib/rt/tlsf/GETRIGHT|inlined.0
  end
  local.set $right
  local.get $right
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $rightInfo
  local.get $rightInfo
  i32.const 1
  i32.and
  if
   local.get $root
   local.get $right
   call $~lib/rt/tlsf/removeBlock
   local.get $block
   local.get $blockInfo
   i32.const 4
   i32.add
   local.get $rightInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.1 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.1
   end
   local.set $right
   local.get $right
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $rightInfo
  end
  local.get $blockInfo
  i32.const 2
  i32.and
  if
   block $~lib/rt/tlsf/GETFREELEFT|inlined.0 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.sub
    i32.load
    br $~lib/rt/tlsf/GETFREELEFT|inlined.0
   end
   local.set $left
   local.get $left
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $leftInfo
   i32.const 1
   drop
   local.get $leftInfo
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 400
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $root
   local.get $left
   call $~lib/rt/tlsf/removeBlock
   local.get $left
   local.set $block
   local.get $block
   local.get $leftInfo
   i32.const 4
   i32.add
   local.get $blockInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
  local.get $right
  local.get $rightInfo
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
  local.get $block
  i32.const 4
  i32.add
  local.get $size
  i32.add
  local.get $right
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $right
  i32.const 4
  i32.sub
  local.get $block
  i32.store
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $13
   i32.const 1073741820
   local.tee $14
   local.get $13
   local.get $14
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETHEAD|inlined.1 (result i32)
   local.get $root
   local.set $root|16
   local.get $fl
   local.set $fl|17
   local.get $sl
   local.set $sl|18
   local.get $root|16
   local.get $fl|17
   i32.const 4
   i32.shl
   local.get $sl|18
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.1
  end
  local.set $head
  local.get $block
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $block
  local.get $head
  call $~lib/rt/tlsf/Block#set:next
  local.get $head
  if
   local.get $head
   local.get $block
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $root
  local.set $root|20
  local.get $fl
  local.set $fl|21
  local.get $sl
  local.set $sl|22
  local.get $block
  local.set $head|23
  local.get $root|20
  local.get $fl|21
  i32.const 4
  i32.shl
  local.get $sl|22
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $head|23
  i32.store offset=96
  local.get $root
  local.get $root
  call $~lib/rt/tlsf/Root#get:flMap
  i32.const 1
  local.get $fl
  i32.shl
  i32.or
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|26
  local.get $fl
  local.set $fl|27
  block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
   local.get $root
   local.set $root|24
   local.get $fl
   local.set $fl|25
   local.get $root|24
   local.get $fl|25
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.1
  end
  i32.const 1
  local.get $sl
  i32.shl
  i32.or
  local.set $slMap
  local.get $root|26
  local.get $fl|27
  i32.const 2
  i32.shl
  i32.add
  local.get $slMap
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $root i32) (param $start i32) (param $endU64 i64) (result i32)
  (local $end i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $tailInfo i32)
  (local $size i32)
  (local $leftSize i32)
  (local $left i32)
  (local $root|10 i32)
  (local $tail|11 i32)
  local.get $endU64
  i32.wrap_i64
  local.set $end
  i32.const 1
  drop
  local.get $start
  i64.extend_i32_u
  local.get $endU64
  i64.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $start
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  local.set $start
  local.get $end
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $end
  block $~lib/rt/tlsf/GETTAIL|inlined.0 (result i32)
   local.get $root
   local.set $root|4
   local.get $root|4
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.0
  end
  local.set $tail
  i32.const 0
  local.set $tailInfo
  local.get $tail
  if
   i32.const 1
   drop
   local.get $start
   local.get $tail
   i32.const 4
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 400
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $start
   i32.const 16
   i32.sub
   local.get $tail
   i32.eq
   if
    local.get $start
    i32.const 16
    i32.sub
    local.set $start
    local.get $tail
    call $~lib/rt/common/BLOCK#get:mmInfo
    local.set $tailInfo
   else
   end
  else
   i32.const 1
   drop
   local.get $start
   local.get $root
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 400
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $end
  local.get $start
  i32.sub
  local.set $size
  local.get $size
  i32.const 4
  i32.const 12
  i32.add
  i32.const 4
  i32.add
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $size
  i32.const 2
  i32.const 4
  i32.mul
  i32.sub
  local.set $leftSize
  local.get $start
  local.set $left
  local.get $left
  local.get $leftSize
  i32.const 1
  i32.or
  local.get $tailInfo
  i32.const 2
  i32.and
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:next
  local.get $start
  i32.const 4
  i32.add
  local.get $leftSize
  i32.add
  local.set $tail
  local.get $tail
  i32.const 0
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.set $root|10
  local.get $tail
  local.set $tail|11
  local.get $root|10
  local.get $tail|11
  i32.store offset=1568
  local.get $root
  local.get $left
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
  return
 )
 (func $~lib/rt/tlsf/initialize
  (local $rootOffset i32)
  (local $pagesBefore i32)
  (local $pagesNeeded i32)
  (local $root i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $fl i32)
  (local $root|7 i32)
  (local $fl|8 i32)
  (local $slMap i32)
  (local $sl i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $head i32)
  (local $memStart i32)
  i32.const 0
  drop
  global.get $~lib/memory/__heap_base
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $rootOffset
  memory.size
  local.set $pagesBefore
  local.get $rootOffset
  i32.const 1572
  i32.add
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesNeeded
  local.get $pagesBefore
  i32.gt_s
  if (result i32)
   local.get $pagesNeeded
   local.get $pagesBefore
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  local.get $rootOffset
  local.set $root
  local.get $root
  i32.const 0
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|4
  i32.const 0
  local.set $tail
  local.get $root|4
  local.get $tail
  i32.store offset=1568
  i32.const 0
  local.set $fl
  loop $for-loop|0
   local.get $fl
   i32.const 23
   i32.lt_u
   if
    local.get $root
    local.set $root|7
    local.get $fl
    local.set $fl|8
    i32.const 0
    local.set $slMap
    local.get $root|7
    local.get $fl|8
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap
    i32.store offset=4
    i32.const 0
    local.set $sl
    loop $for-loop|1
     local.get $sl
     i32.const 16
     i32.lt_u
     if
      local.get $root
      local.set $root|11
      local.get $fl
      local.set $fl|12
      local.get $sl
      local.set $sl|13
      i32.const 0
      local.set $head
      local.get $root|11
      local.get $fl|12
      i32.const 4
      i32.shl
      local.get $sl|13
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.get $head
      i32.store offset=96
      local.get $sl
      i32.const 1
      i32.add
      local.set $sl
      br $for-loop|1
     end
    end
    local.get $fl
    i32.const 1
    i32.add
    local.set $fl
    br $for-loop|0
   end
  end
  local.get $rootOffset
  i32.const 1572
  i32.add
  local.set $memStart
  i32.const 0
  drop
  local.get $root
  local.get $memStart
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
  local.get $root
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/checkUsedBlock (param $ptr i32) (result i32)
  (local $block i32)
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $block
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 562
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/freeBlock (param $root i32) (param $block i32)
  i32.const 0
  drop
  local.get $block
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 1
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/__free (param $ptr i32)
  local.get $ptr
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   return
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $ptr
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/itcms/free (param $obj i32)
  local.get $obj
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   local.get $obj
   i32.const 0
   call $~lib/rt/itcms/Object#set:nextWithColor
   local.get $obj
   i32.const 0
   call $~lib/rt/itcms/Object#set:prev
  else
   global.get $~lib/rt/itcms/total
   local.get $obj
   call $~lib/rt/itcms/Object#get:size
   i32.sub
   global.set $~lib/rt/itcms/total
   i32.const 0
   drop
   local.get $obj
   i32.const 4
   i32.add
   call $~lib/rt/tlsf/__free
  end
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $obj i32)
  (local $1 i32)
  (local $black i32)
  (local $from i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      local.set $1
      local.get $1
      i32.const 0
      i32.eq
      br_if $case0|0
      local.get $1
      i32.const 1
      i32.eq
      br_if $case1|0
      local.get $1
      i32.const 2
      i32.eq
      br_if $case2|0
      br $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     i32.const 0
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     i32.const 1
     i32.mul
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $black
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $obj
    loop $while-continue|1
     local.get $obj
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $obj
      global.set $~lib/rt/itcms/iter
      local.get $obj
      call $~lib/rt/itcms/Object#get:color
      local.get $black
      i32.ne
      if
       local.get $obj
       local.get $black
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $obj
       i32.const 20
       i32.add
       i32.const 0
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       i32.const 1
       i32.mul
       return
      end
      local.get $obj
      call $~lib/rt/itcms/Object#get:next
      local.set $obj
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    i32.const 0
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $obj
    local.get $obj
    global.get $~lib/rt/itcms/toSpace
    i32.eq
    if
     i32.const 0
     call $~lib/rt/itcms/visitStack
     global.get $~lib/rt/itcms/iter
     call $~lib/rt/itcms/Object#get:next
     local.set $obj
     loop $while-continue|2
      local.get $obj
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $obj
       call $~lib/rt/itcms/Object#get:color
       local.get $black
       i32.ne
       if
        local.get $obj
        local.get $black
        call $~lib/rt/itcms/Object#set:color
        local.get $obj
        i32.const 20
        i32.add
        i32.const 0
        call $~lib/rt/__visit_members
       end
       local.get $obj
       call $~lib/rt/itcms/Object#get:next
       local.set $obj
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $from
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $from
     global.set $~lib/rt/itcms/toSpace
     local.get $black
     global.set $~lib/rt/itcms/white
     local.get $from
     call $~lib/rt/itcms/Object#get:next
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    i32.const 1
    i32.mul
    return
   end
   global.get $~lib/rt/itcms/iter
   local.set $obj
   local.get $obj
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $obj
    call $~lib/rt/itcms/Object#get:next
    global.set $~lib/rt/itcms/iter
    i32.const 1
    drop
    local.get $obj
    call $~lib/rt/itcms/Object#get:color
    global.get $~lib/rt/itcms/white
    i32.eqz
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 128
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $obj
    call $~lib/rt/itcms/free
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:nextWithColor
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:prev
   i32.const 0
   global.set $~lib/rt/itcms/state
   br $break|0
  end
  i32.const 0
  return
 )
 (func $~lib/rt/itcms/interrupt
  (local $budget i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1024
  i32.const 200
  i32.mul
  i32.const 100
  i32.div_u
  local.set $budget
  loop $do-loop|0
   local.get $budget
   call $~lib/rt/itcms/step
   i32.sub
   local.set $budget
   global.get $~lib/rt/itcms/state
   i32.const 0
   i32.eq
   if
    i32.const 0
    drop
    global.get $~lib/rt/itcms/total
    i64.extend_i32_u
    i32.const 200
    i64.extend_i32_u
    i64.mul
    i64.const 100
    i64.div_u
    i32.wrap_i64
    i32.const 1024
    i32.add
    global.set $~lib/rt/itcms/threshold
    i32.const 0
    drop
    return
   end
   local.get $budget
   i32.const 0
   i32.gt_s
   br_if $do-loop|0
  end
  i32.const 0
  drop
  global.get $~lib/rt/itcms/total
  i32.const 1024
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.sub
  i32.const 1024
  i32.lt_u
  i32.mul
  i32.add
  global.set $~lib/rt/itcms/threshold
  i32.const 0
  drop
 )
 (func $~lib/rt/tlsf/computeSize (param $size i32) (result i32)
  local.get $size
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $size
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
  end
  return
 )
 (func $~lib/rt/tlsf/prepareSize (param $size i32) (result i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 64
   i32.const 400
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  call $~lib/rt/tlsf/computeSize
  return
 )
 (func $~lib/rt/tlsf/roundSize (param $size i32) (result i32)
  local.get $size
  i32.const 536870910
  i32.lt_u
  if (result i32)
   local.get $size
   i32.const 1
   i32.const 27
   local.get $size
   i32.clz
   i32.sub
   i32.shl
   i32.add
   i32.const 1
   i32.sub
  else
   local.get $size
  end
  return
 )
 (func $~lib/rt/tlsf/searchBlock (param $root i32) (param $size i32) (result i32)
  (local $fl i32)
  (local $sl i32)
  (local $requestSize i32)
  (local $root|5 i32)
  (local $fl|6 i32)
  (local $slMap i32)
  (local $head i32)
  (local $flMap i32)
  (local $root|10 i32)
  (local $fl|11 i32)
  (local $root|12 i32)
  (local $fl|13 i32)
  (local $sl|14 i32)
  (local $root|15 i32)
  (local $fl|16 i32)
  (local $sl|17 i32)
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $requestSize
   i32.const 4
   i32.const 8
   i32.mul
   i32.const 1
   i32.sub
   local.get $requestSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $requestSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETSL|inlined.2 (result i32)
   local.get $root
   local.set $root|5
   local.get $fl
   local.set $fl|6
   local.get $root|5
   local.get $fl|6
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.2
  end
  i32.const 0
  i32.const -1
  i32.xor
  local.get $sl
  i32.shl
  i32.and
  local.set $slMap
  i32.const 0
  local.set $head
  local.get $slMap
  i32.eqz
  if
   local.get $root
   call $~lib/rt/tlsf/Root#get:flMap
   i32.const 0
   i32.const -1
   i32.xor
   local.get $fl
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $flMap
   local.get $flMap
   i32.eqz
   if
    i32.const 0
    local.set $head
   else
    local.get $flMap
    i32.ctz
    local.set $fl
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $root
     local.set $root|10
     local.get $fl
     local.set $fl|11
     local.get $root|10
     local.get $fl|11
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.3
    end
    local.set $slMap
    i32.const 1
    drop
    local.get $slMap
    i32.eqz
    if
     i32.const 0
     i32.const 400
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    block $~lib/rt/tlsf/GETHEAD|inlined.2 (result i32)
     local.get $root
     local.set $root|12
     local.get $fl
     local.set $fl|13
     local.get $slMap
     i32.ctz
     local.set $sl|14
     local.get $root|12
     local.get $fl|13
     i32.const 4
     i32.shl
     local.get $sl|14
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=96
     br $~lib/rt/tlsf/GETHEAD|inlined.2
    end
    local.set $head
   end
  else
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $root
    local.set $root|15
    local.get $fl
    local.set $fl|16
    local.get $slMap
    i32.ctz
    local.set $sl|17
    local.get $root|15
    local.get $fl|16
    i32.const 4
    i32.shl
    local.get $sl|17
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    br $~lib/rt/tlsf/GETHEAD|inlined.3
   end
   local.set $head
  end
  local.get $head
  return
 )
 (func $~lib/rt/tlsf/growMemory (param $root i32) (param $size i32)
  (local $pagesBefore i32)
  (local $root|3 i32)
  (local $pagesNeeded i32)
  (local $5 i32)
  (local $6 i32)
  (local $pagesWanted i32)
  (local $pagesAfter i32)
  i32.const 0
  drop
  local.get $size
  i32.const 256
  i32.ge_u
  if
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $size
  end
  memory.size
  local.set $pagesBefore
  local.get $size
  i32.const 4
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 4
  i32.sub
  block $~lib/rt/tlsf/GETTAIL|inlined.1 (result i32)
   local.get $root
   local.set $root|3
   local.get $root|3
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.1
  end
  i32.ne
  i32.shl
  i32.add
  local.set $size
  local.get $size
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesBefore
  local.tee $5
  local.get $pagesNeeded
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_s
  select
  local.set $pagesWanted
  local.get $pagesWanted
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $pagesNeeded
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $pagesAfter
  local.get $root
  local.get $pagesBefore
  i32.const 16
  i32.shl
  local.get $pagesAfter
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (param $root i32) (param $block i32) (param $size i32)
  (local $blockInfo i32)
  (local $remaining i32)
  (local $spare i32)
  (local $block|6 i32)
  (local $block|7 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $size
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $size
  i32.sub
  local.set $remaining
  local.get $remaining
  i32.const 4
  i32.const 12
  i32.add
  i32.ge_u
  if
   local.get $block
   local.get $size
   local.get $blockInfo
   i32.const 2
   i32.and
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $block
   i32.const 4
   i32.add
   local.get $size
   i32.add
   local.set $spare
   local.get $spare
   local.get $remaining
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $root
   local.get $spare
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $block
   local.get $blockInfo
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.3 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.add
    local.get $block|7
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.3
   end
   block $~lib/rt/tlsf/GETRIGHT|inlined.2 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.2
   end
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $root i32) (param $size i32) (result i32)
  (local $payloadSize i32)
  (local $block i32)
  local.get $size
  call $~lib/rt/tlsf/prepareSize
  local.set $payloadSize
  local.get $root
  local.get $payloadSize
  call $~lib/rt/tlsf/searchBlock
  local.set $block
  local.get $block
  i32.eqz
  if
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/growMemory
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/searchBlock
   local.set $block
   i32.const 1
   drop
   local.get $block
   i32.eqz
   if
    i32.const 0
    i32.const 400
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  i32.const 1
  drop
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $payloadSize
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 400
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/removeBlock
  local.get $root
  local.get $block
  local.get $payloadSize
  call $~lib/rt/tlsf/prepareBlock
  i32.const 0
  drop
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/__alloc (param $size i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $size
  call $~lib/rt/tlsf/allocateBlock
  i32.const 4
  i32.add
  return
 )
 (func $~lib/rt/itcms/Object#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/itcms/Object#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/itcms/__new (param $size i32) (param $id i32) (result i32)
  (local $obj i32)
  (local $ptr i32)
  local.get $size
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 64
   i32.const 128
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   call $~lib/rt/itcms/interrupt
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/tlsf/__alloc
  i32.const 4
  i32.sub
  local.set $obj
  local.get $obj
  local.get $id
  call $~lib/rt/itcms/Object#set:rtId
  local.get $obj
  local.get $size
  call $~lib/rt/itcms/Object#set:rtSize
  local.get $obj
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $obj
  call $~lib/rt/itcms/Object#get:size
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $obj
  i32.const 20
  i32.add
  local.set $ptr
  local.get $ptr
  i32.const 0
  local.get $size
  memory.fill
  local.get $ptr
  return
 )
 (func $~lib/rt/itcms/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
  (local $child i32)
  (local $parent i32)
  (local $parentColor i32)
  local.get $childPtr
  i32.eqz
  if
   return
  end
  i32.const 1
  drop
  local.get $parentPtr
  i32.eqz
  if
   i32.const 0
   i32.const 128
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $childPtr
  i32.const 20
  i32.sub
  local.set $child
  local.get $child
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $parentPtr
   i32.const 20
   i32.sub
   local.set $parent
   local.get $parent
   call $~lib/rt/itcms/Object#get:color
   local.set $parentColor
   local.get $parentColor
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $expectMultiple
    if
     local.get $parent
     call $~lib/rt/itcms/Object#makeGray
    else
     local.get $child
     call $~lib/rt/itcms/Object#makeGray
    end
   else
    local.get $parentColor
    i32.const 3
    i32.eq
    if (result i32)
     global.get $~lib/rt/itcms/state
     i32.const 1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $child
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $src/devices/Computer/Computer#set:memoryBus (param $this i32) (param $memoryBus i32)
  local.get $this
  local.get $memoryBus
  i32.store
  local.get $this
  local.get $memoryBus
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Computer#set:rom (param $this i32) (param $rom i32)
  local.get $this
  local.get $rom
  i32.store offset=4
  local.get $this
  local.get $rom
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Computer#set:ram (param $this i32) (param $ram i32)
  local.get $this
  local.get $ram
  i32.store offset=8
  local.get $this
  local.get $ram
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Computer#set:ioManager (param $this i32) (param $ioManager i32)
  local.get $this
  local.get $ioManager
  i32.store offset=12
  local.get $this
  local.get $ioManager
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/rt/__newBuffer (param $size i32) (param $id i32) (param $data i32) (result i32)
  (local $buffer i32)
  local.get $size
  local.get $id
  call $~lib/rt/itcms/__new
  local.set $buffer
  local.get $data
  if
   local.get $buffer
   local.get $data
   local.get $size
   memory.copy
  end
  local.get $buffer
  return
 )
 (func $src/devices/Computer/Computer#set:cpus (param $this i32) (param $cpus i32)
  local.get $this
  local.get $cpus
  i32.store offset=16
  local.get $this
  local.get $cpus
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $src/devices/Computer/Computer#set:breakpoints (param $this i32) (param $breakpoints i32)
  local.get $this
  local.get $breakpoints
  i32.store offset=20
  local.get $this
  local.get $breakpoints
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Computer#set:pendingBreakpointType (param $this i32) (param $pendingBreakpointType i32)
  local.get $this
  local.get $pendingBreakpointType
  i32.store offset=24
 )
 (func $src/devices/Computer/Computer#set:interruptManager (param $this i32) (param $interruptManager i32)
  local.get $this
  local.get $interruptManager
  i32.store offset=28
  local.get $this
  local.get $interruptManager
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Computer#set:timers (param $this i32) (param $timers i32)
  local.get $this
  local.get $timers
  i32.store offset=32
  local.get $this
  local.get $timers
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Memory/MemoryBus#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Memory/MemoryBus#set:verbose (param $this i32) (param $verbose i32)
  local.get $this
  local.get $verbose
  i32.store8 offset=4
 )
 (func $src/devices/Memory/Memory#set:storage (param $this i32) (param $storage i32)
  local.get $this
  local.get $storage
  i32.store
  local.get $this
  local.get $storage
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Memory/Memory#set:size (param $this i32) (param $size i32)
  local.get $this
  local.get $size
  i32.store offset=4
 )
 (func $~lib/math/ipow32 (param $x i32) (param $e i32) (result i32)
  (local $out i32)
  (local $log i32)
  (local $4 i32)
  i32.const 1
  local.set $out
  i32.const 0
  i32.const 1
  i32.lt_s
  drop
  local.get $x
  i32.const 2
  i32.eq
  if
   i32.const 1
   local.get $e
   i32.shl
   i32.const 0
   local.get $e
   i32.const 32
   i32.lt_u
   select
   return
  end
  local.get $e
  i32.const 0
  i32.le_s
  if
   local.get $x
   i32.const -1
   i32.eq
   if
    i32.const -1
    i32.const 1
    local.get $e
    i32.const 1
    i32.and
    select
    return
   end
   local.get $e
   i32.const 0
   i32.eq
   local.get $x
   i32.const 1
   i32.eq
   i32.or
   return
  else
   local.get $e
   i32.const 1
   i32.eq
   if
    local.get $x
    return
   else
    local.get $e
    i32.const 2
    i32.eq
    if
     local.get $x
     local.get $x
     i32.mul
     return
    else
     local.get $e
     i32.const 32
     i32.lt_s
     if
      i32.const 32
      local.get $e
      i32.clz
      i32.sub
      local.set $log
      block $break|0
       block $case4|0
        block $case3|0
         block $case2|0
          block $case1|0
           block $case0|0
            local.get $log
            local.set $4
            local.get $4
            i32.const 5
            i32.eq
            br_if $case0|0
            local.get $4
            i32.const 4
            i32.eq
            br_if $case1|0
            local.get $4
            i32.const 3
            i32.eq
            br_if $case2|0
            local.get $4
            i32.const 2
            i32.eq
            br_if $case3|0
            local.get $4
            i32.const 1
            i32.eq
            br_if $case4|0
            br $break|0
           end
           local.get $e
           i32.const 1
           i32.and
           if
            local.get $out
            local.get $x
            i32.mul
            local.set $out
           end
           local.get $e
           i32.const 1
           i32.shr_u
           local.set $e
           local.get $x
           local.get $x
           i32.mul
           local.set $x
          end
          local.get $e
          i32.const 1
          i32.and
          if
           local.get $out
           local.get $x
           i32.mul
           local.set $out
          end
          local.get $e
          i32.const 1
          i32.shr_u
          local.set $e
          local.get $x
          local.get $x
          i32.mul
          local.set $x
         end
         local.get $e
         i32.const 1
         i32.and
         if
          local.get $out
          local.get $x
          i32.mul
          local.set $out
         end
         local.get $e
         i32.const 1
         i32.shr_u
         local.set $e
         local.get $x
         local.get $x
         i32.mul
         local.set $x
        end
        local.get $e
        i32.const 1
        i32.and
        if
         local.get $out
         local.get $x
         i32.mul
         local.set $out
        end
        local.get $e
        i32.const 1
        i32.shr_u
        local.set $e
        local.get $x
        local.get $x
        i32.mul
        local.set $x
       end
       local.get $e
       i32.const 1
       i32.and
       if
        local.get $out
        local.get $x
        i32.mul
        local.set $out
       end
      end
      local.get $out
      return
     end
    end
   end
  end
  loop $while-continue|1
   local.get $e
   if
    local.get $e
    i32.const 1
    i32.and
    if
     local.get $out
     local.get $x
     i32.mul
     local.set $out
    end
    local.get $e
    i32.const 1
    i32.shr_u
    local.set $e
    local.get $x
    local.get $x
    i32.mul
    local.set $x
    br $while-continue|1
   end
  end
  local.get $out
  return
 )
 (func $src/devices/Memory/Ram#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store offset=8
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Memory/Rom#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store offset=8
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/IoManager/IoManager#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/IoManager/IoManager#get:computer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/devices/Computer/Computer#get:ram (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $src/devices/Memory/Memory#get:storage (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/staticarray/StaticArray<u8>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 0
  i32.shr_u
  return
 )
 (func $~lib/util/number/decimalCount32 (param $value i32) (result i32)
  local.get $value
  i32.const 100000
  i32.lt_u
  if
   local.get $value
   i32.const 100
   i32.lt_u
   if
    i32.const 1
    local.get $value
    i32.const 10
    i32.ge_u
    i32.add
    return
   else
    i32.const 3
    local.get $value
    i32.const 10000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 1000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $value
   i32.const 10000000
   i32.lt_u
   if
    i32.const 6
    local.get $value
    i32.const 1000000
    i32.ge_u
    i32.add
    return
   else
    i32.const 8
    local.get $value
    i32.const 1000000000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 100000000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa32_dec_lut (param $buffer i32) (param $num i32) (param $offset i32)
  (local $t i32)
  (local $r i32)
  (local $d1 i32)
  (local $d2 i32)
  (local $digits1 i64)
  (local $digits2 i64)
  (local $t|9 i32)
  (local $d1|10 i32)
  (local $digits i32)
  (local $digits|12 i32)
  (local $digit i32)
  loop $while-continue|0
   local.get $num
   i32.const 10000
   i32.ge_u
   if
    local.get $num
    i32.const 10000
    i32.div_u
    local.set $t
    local.get $num
    i32.const 10000
    i32.rem_u
    local.set $r
    local.get $t
    local.set $num
    local.get $r
    i32.const 100
    i32.div_u
    local.set $d1
    local.get $r
    i32.const 100
    i32.rem_u
    local.set $d2
    i32.const 1100
    local.get $d1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 1100
    local.get $d2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $num
  i32.const 100
  i32.ge_u
  if
   local.get $num
   i32.const 100
   i32.div_u
   local.set $t|9
   local.get $num
   i32.const 100
   i32.rem_u
   local.set $d1|10
   local.get $t|9
   local.set $num
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 1100
   local.get $d1|10
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits
   i32.store
  end
  local.get $num
  i32.const 10
  i32.ge_u
  if
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 1100
   local.get $num
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits|12
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits|12
   i32.store
  else
   local.get $offset
   i32.const 1
   i32.sub
   local.set $offset
   i32.const 48
   local.get $num
   i32.add
   local.set $digit
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digit
   i32.store16
  end
 )
 (func $~lib/util/number/utoa_hex_lut (param $buffer i32) (param $num i64) (param $offset i32)
  loop $while-continue|0
   local.get $offset
   i32.const 2
   i32.ge_u
   if
    local.get $offset
    i32.const 2
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 1520
    local.get $num
    i32.wrap_i64
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store
    local.get $num
    i64.const 8
    i64.shr_u
    local.set $num
    br $while-continue|0
   end
  end
  local.get $offset
  i32.const 1
  i32.and
  if
   local.get $buffer
   i32.const 1520
   local.get $num
   i32.wrap_i64
   i32.const 6
   i32.shl
   i32.add
   i32.load16_u
   i32.store16
  end
 )
 (func $~lib/util/number/ulog_base (param $num i64) (param $base i32) (result i32)
  (local $value i32)
  (local $b64 i64)
  (local $b i64)
  (local $e i32)
  block $~lib/util/number/isPowerOf2<i32>|inlined.0 (result i32)
   local.get $base
   local.set $value
   local.get $value
   i32.popcnt
   i32.const 1
   i32.eq
   br $~lib/util/number/isPowerOf2<i32>|inlined.0
  end
  if
   i32.const 63
   local.get $num
   i64.clz
   i32.wrap_i64
   i32.sub
   i32.const 31
   local.get $base
   i32.clz
   i32.sub
   i32.div_u
   i32.const 1
   i32.add
   return
  end
  local.get $base
  i64.extend_i32_s
  local.set $b64
  local.get $b64
  local.set $b
  i32.const 1
  local.set $e
  loop $while-continue|0
   local.get $num
   local.get $b
   i64.ge_u
   if
    local.get $num
    local.get $b
    i64.div_u
    local.set $num
    local.get $b
    local.get $b
    i64.mul
    local.set $b
    local.get $e
    i32.const 1
    i32.shl
    local.set $e
    br $while-continue|0
   end
  end
  loop $while-continue|1
   local.get $num
   i64.const 1
   i64.ge_u
   if
    local.get $num
    local.get $b64
    i64.div_u
    local.set $num
    local.get $e
    i32.const 1
    i32.add
    local.set $e
    br $while-continue|1
   end
  end
  local.get $e
  i32.const 1
  i32.sub
  return
 )
 (func $~lib/util/number/utoa64_any_core (param $buffer i32) (param $num i64) (param $offset i32) (param $radix i32)
  (local $base i64)
  (local $shift i64)
  (local $mask i64)
  (local $q i64)
  local.get $radix
  i64.extend_i32_s
  local.set $base
  local.get $radix
  local.get $radix
  i32.const 1
  i32.sub
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $radix
   i32.ctz
   i32.const 7
   i32.and
   i64.extend_i32_s
   local.set $shift
   local.get $base
   i64.const 1
   i64.sub
   local.set $mask
   loop $do-loop|0
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 2576
    local.get $num
    local.get $mask
    i64.and
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $num
    local.get $shift
    i64.shr_u
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  else
   loop $do-loop|1
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $num
    local.get $base
    i64.div_u
    local.set $q
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 2576
    local.get $num
    local.get $q
    local.get $base
    i64.mul
    i64.sub
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $q
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|1
   end
  end
 )
 (func $~lib/number/U16#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  i32.const 65535
  i32.and
  local.get $radix
  call $~lib/util/number/utoa32
  return
 )
 (func $~lib/string/String#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 1
  i32.shr_u
  return
 )
 (func $~lib/staticarray/StaticArray<u8>#__uset (param $this i32) (param $index i32) (param $value i32)
  local.get $this
  local.get $index
  i32.const 0
  i32.shl
  i32.add
  local.get $value
  i32.store8
  i32.const 0
  drop
 )
 (func $src/devices/IoManager/IoManager#set:devices (param $this i32) (param $devices i32)
  local.get $this
  local.get $devices
  i32.store offset=4
  local.get $this
  local.get $devices
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/IoManager/IoManager#set:stringCursor (param $this i32) (param $stringCursor i32)
  local.get $this
  local.get $stringCursor
  i32.store16 offset=8
 )
 (func $src/devices/Computer/Computer#get:cpus (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $src/devices/Cpu/Cpu#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/CpuRegisters#set:A (param $this i32) (param $A i32)
  local.get $this
  local.get $A
  i32.store8
 )
 (func $src/devices/Cpu/CpuRegisters#set:B (param $this i32) (param $B i32)
  local.get $this
  local.get $B
  i32.store8 offset=1
 )
 (func $src/devices/Cpu/CpuRegisters#set:C (param $this i32) (param $C i32)
  local.get $this
  local.get $C
  i32.store8 offset=2
 )
 (func $src/devices/Cpu/CpuRegisters#set:D (param $this i32) (param $D i32)
  local.get $this
  local.get $D
  i32.store8 offset=3
 )
 (func $src/devices/Cpu/CpuRegisters#set:E (param $this i32) (param $E i32)
  local.get $this
  local.get $E
  i32.store8 offset=4
 )
 (func $src/devices/Cpu/CpuRegisters#set:F (param $this i32) (param $F i32)
  local.get $this
  local.get $F
  i32.store8 offset=5
 )
 (func $src/devices/Cpu/CpuRegisters#set:PC (param $this i32) (param $PC i32)
  local.get $this
  local.get $PC
  i32.store16 offset=6
 )
 (func $src/devices/Cpu/CpuRegisters#set:IR (param $this i32) (param $IR i32)
  local.get $this
  local.get $IR
  i32.store8 offset=8
 )
 (func $src/devices/Cpu/CpuRegisters#set:SP (param $this i32) (param $SP i32)
  local.get $this
  local.get $SP
  i32.store16 offset=10
 )
 (func $src/devices/Cpu/CpuRegisters#set:FLAGS (param $this i32) (param $FLAGS i32)
  local.get $this
  local.get $FLAGS
  i32.store8 offset=12
 )
 (func $src/devices/Cpu/Cpu#set:registers (param $this i32) (param $registers i32)
  local.get $this
  local.get $registers
  i32.store offset=4
  local.get $this
  local.get $registers
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/Cpu#set:halted (param $this i32) (param $halted i32)
  local.get $this
  local.get $halted
  i32.store8 offset=8
 )
 (func $src/devices/Cpu/Cpu#set:cycles (param $this i32) (param $cycles i64)
  local.get $this
  local.get $cycles
  i64.store offset=16
 )
 (func $src/devices/Cpu/Cpu#set:alu (param $this i32) (param $alu i32)
  local.get $this
  local.get $alu
  i32.store offset=24
  local.get $this
  local.get $alu
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/Cpu#set:isOnBreakpoint (param $this i32) (param $isOnBreakpoint i32)
  local.get $this
  local.get $isOnBreakpoint
  i32.store8 offset=28
 )
 (func $src/devices/Cpu/Cpu#set:interruptsEnabled (param $this i32) (param $interruptsEnabled i32)
  local.get $this
  local.get $interruptsEnabled
  i32.store8 offset=29
 )
 (func $src/devices/Cpu/Cpu#set:inInterruptHandler (param $this i32) (param $inInterruptHandler i32)
  local.get $this
  local.get $inInterruptHandler
  i32.store8 offset=30
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/itcms/Object#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/rt/itcms/__renew (param $oldPtr i32) (param $size i32) (result i32)
  (local $oldObj i32)
  (local $newPtr i32)
  (local $4 i32)
  (local $5 i32)
  local.get $oldPtr
  i32.const 20
  i32.sub
  local.set $oldObj
  local.get $size
  local.get $oldObj
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.sub
  i32.le_u
  if
   local.get $oldObj
   local.get $size
   call $~lib/rt/itcms/Object#set:rtSize
   local.get $oldPtr
   return
  end
  local.get $size
  local.get $oldObj
  call $~lib/rt/itcms/Object#get:rtId
  call $~lib/rt/itcms/__new
  local.set $newPtr
  local.get $newPtr
  local.get $oldPtr
  local.get $size
  local.tee $4
  local.get $oldObj
  call $~lib/rt/itcms/Object#get:rtSize
  local.tee $5
  local.get $4
  local.get $5
  i32.lt_u
  select
  memory.copy
  local.get $newPtr
  return
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $src/devices/InterruptManager/CpuCoreInfo#set:cpu (param $this i32) (param $cpu f64)
  local.get $this
  local.get $cpu
  f64.store
 )
 (func $src/devices/InterruptManager/CpuCoreInfo#set:core (param $this i32) (param $core f64)
  local.get $this
  local.get $core
  f64.store offset=8
 )
 (func $src/devices/InterruptManager/InterruptManager#set:defaultIrqCpuHandler (param $this i32) (param $defaultIrqCpuHandler i32)
  local.get $this
  local.get $defaultIrqCpuHandler
  i32.store offset=8
  local.get $this
  local.get $defaultIrqCpuHandler
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $src/devices/InterruptManager/InterruptManager#set:irqsCpuHandler (param $this i32) (param $irqsCpuHandler i32)
  local.get $this
  local.get $irqsCpuHandler
  i32.store offset=12
  local.get $this
  local.get $irqsCpuHandler
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/InterruptManager/InterruptManager#set:enabled (param $this i32) (param $enabled i32)
  local.get $this
  local.get $enabled
  i32.store8
 )
 (func $src/devices/InterruptManager/InterruptManager#set:pending (param $this i32) (param $pending i32)
  local.get $this
  local.get $pending
  i32.store8 offset=1
 )
 (func $src/devices/InterruptManager/InterruptManager#set:mask (param $this i32) (param $mask i32)
  local.get $this
  local.get $mask
  i32.store8 offset=2
 )
 (func $src/devices/InterruptManager/InterruptManager#set:handlerAddr (param $this i32) (param $handlerAddr i32)
  local.get $this
  local.get $handlerAddr
  i32.store16 offset=4
 )
 (func $src/devices/Computer/Computer#get:ioManager (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#set:computer (param $this i32) (param $computer i32)
  local.get $this
  local.get $computer
  i32.store
  local.get $this
  local.get $computer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#set:counter (param $this i32) (param $counter i32)
  local.get $this
  local.get $counter
  i32.store8 offset=4
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#set:period (param $this i32) (param $period i32)
  local.get $this
  local.get $period
  i32.store8 offset=5
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#set:enabled (param $this i32) (param $enabled i32)
  local.get $this
  local.get $enabled
  i32.store8 offset=6
 )
 (func $src/devices/IoManager/IoManager#get:devices (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $src/devices/IoManager/IoDevice#set:idx (param $this i32) (param $idx i32)
  local.get $this
  local.get $idx
  i32.store8
 )
 (func $src/devices/IoManager/IoDevice#set:name (param $this i32) (param $name i32)
  local.get $this
  local.get $name
  i32.store offset=4
  local.get $this
  local.get $name
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/IoManager/IoDevice#set:typeId (param $this i32) (param $typeId i32)
  local.get $this
  local.get $typeId
  i32.store8 offset=8
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $src/devices/IoManager/IoManager#get:stringCursor (param $this i32) (result i32)
  local.get $this
  i32.load16_u offset=8
 )
 (func $~lib/number/I32#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/itoa32
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__uset (param $this i32) (param $index i32) (param $value i32)
  local.get $this
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 2
  i32.shr_u
  return
 )
 (func $~lib/number/U8#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  i32.const 255
  i32.and
  local.get $radix
  call $~lib/util/number/utoa32
  return
 )
 (func $~lib/math/NativeMath.round (param $x f64) (result f64)
  (local $roundUp f64)
  i32.const 0
  i32.const 0
  i32.gt_s
  drop
  local.get $x
  f64.ceil
  local.set $roundUp
  local.get $roundUp
  local.get $roundUp
  f64.const 1
  f64.sub
  local.get $roundUp
  f64.const 0.5
  f64.sub
  local.get $x
  f64.le
  select
  return
 )
 (func $src/devices/Computer/Computer#get:timers (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $src/devices/Computer/Computer#get:rom (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Cpu/Cpu#get:isOnBreakpoint (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=28
 )
 (func $src/devices/Cpu/Cpu#get:halted (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=8
 )
 (func $src/devices/Cpu/Cpu#get:computer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/devices/Computer/Computer#get:interruptManager (param $this i32) (result i32)
  local.get $this
  i32.load offset=28
 )
 (func $src/devices/Cpu/Cpu#get:interruptsEnabled (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=29
 )
 (func $src/devices/Cpu/Cpu#get:inInterruptHandler (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=30
 )
 (func $src/devices/InterruptManager/InterruptManager#get:pending (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=1
 )
 (func $src/devices/InterruptManager/InterruptManager#get:enabled (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $src/devices/InterruptManager/InterruptManager#get:mask (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=2
 )
 (func $src/devices/InterruptManager/InterruptManager#get:irqsCpuHandler (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/util/hash/HASH<u8> (param $key i32) (result i32)
  (local $key|1 i32)
  (local $len i32)
  (local $h i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  i32.const 4
  i32.le_u
  drop
  block $~lib/util/hash/hash32|inlined.0 (result i32)
   local.get $key
   i32.const 255
   i32.and
   local.set $key|1
   i32.const 1
   local.set $len
   i32.const 0
   i32.const 374761393
   i32.add
   local.get $len
   i32.add
   local.set $h
   local.get $h
   local.get $key|1
   i32.const -1028477379
   i32.mul
   i32.add
   local.set $h
   local.get $h
   i32.const 17
   i32.rotl
   i32.const 668265263
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 15
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -2048144777
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 13
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -1028477379
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 16
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   br $~lib/util/hash/hash32|inlined.0
  end
  return
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/util/string/compareImpl (param $str1 i32) (param $index1 i32) (param $str2 i32) (param $index2 i32) (param $len i32) (result i32)
  (local $ptr1 i32)
  (local $ptr2 i32)
  (local $7 i32)
  (local $a i32)
  (local $b i32)
  local.get $str1
  local.get $index1
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr1
  local.get $str2
  local.get $index2
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr2
  i32.const 0
  i32.const 2
  i32.lt_s
  drop
  local.get $len
  i32.const 4
  i32.ge_u
  if (result i32)
   local.get $ptr1
   i32.const 7
   i32.and
   local.get $ptr2
   i32.const 7
   i32.and
   i32.or
   i32.eqz
  else
   i32.const 0
  end
  if
   block $do-break|0
    loop $do-loop|0
     local.get $ptr1
     i64.load
     local.get $ptr2
     i64.load
     i64.ne
     if
      br $do-break|0
     end
     local.get $ptr1
     i32.const 8
     i32.add
     local.set $ptr1
     local.get $ptr2
     i32.const 8
     i32.add
     local.set $ptr2
     local.get $len
     i32.const 4
     i32.sub
     local.set $len
     local.get $len
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  loop $while-continue|1
   local.get $len
   local.tee $7
   i32.const 1
   i32.sub
   local.set $len
   local.get $7
   if
    local.get $ptr1
    i32.load16_u
    local.set $a
    local.get $ptr2
    i32.load16_u
    local.set $b
    local.get $a
    local.get $b
    i32.ne
    if
     local.get $a
     local.get $b
     i32.sub
     return
    end
    local.get $ptr1
    i32.const 2
    i32.add
    local.set $ptr1
    local.get $ptr2
    i32.const 2
    i32.add
    local.set $ptr2
    br $while-continue|1
   end
  end
  i32.const 0
  return
 )
 (func $src/devices/InterruptManager/CpuCoreInfo#get:cpu (param $this i32) (result f64)
  local.get $this
  f64.load
 )
 (func $src/devices/InterruptManager/CpuCoreInfo#get:core (param $this i32) (result f64)
  local.get $this
  f64.load offset=8
 )
 (func $src/devices/Cpu/Cpu#get:registers (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Cpu/CpuRegisters#get:SP (param $this i32) (result i32)
  local.get $this
  i32.load16_u offset=10
 )
 (func $src/devices/Cpu/CpuRegisters#get:PC (param $this i32) (result i32)
  local.get $this
  i32.load16_u offset=6
 )
 (func $src/devices/Cpu/CpuRegisters#get:FLAGS (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=12
 )
 (func $src/devices/Computer/Computer#get:memoryBus (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/devices/Memory/MemoryBus#get:verbose (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=4
 )
 (func $src/memory_map/isRomAddress (param $address i32) (result i32)
  i32.const 0
  return
 )
 (func $src/devices/Memory/MemoryBus#get:computer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/memory_map/isRamAddress (param $address i32) (result i32)
  local.get $address
  i32.const 65535
  i32.and
  global.get $src/memory_map/MEMORY_MAP.RAM_START
  i32.ge_u
  if (result i32)
   local.get $address
   i32.const 65535
   i32.and
   global.get $src/memory_map/MEMORY_MAP.RAM_END
   i32.le_u
  else
   i32.const 0
  end
  return
 )
 (func $src/memory_map/isIoAddress (param $address i32) (result i32)
  local.get $address
  i32.const 65535
  i32.and
  global.get $src/memory_map/MEMORY_MAP.IO_START
  i32.ge_u
  if (result i32)
   local.get $address
   i32.const 65535
   i32.and
   global.get $src/memory_map/MEMORY_MAP.IO_END
   i32.le_u
  else
   i32.const 0
  end
  return
 )
 (func $src/devices/InterruptManager/InterruptManager#get:handlerAddr (param $this i32) (result i32)
  local.get $this
  i32.load16_u offset=4
 )
 (func $src/devices/Computer/Computer#get:pendingBreakpointType (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $src/devices/Cpu/Cpu#get:cycles (param $this i32) (result i64)
  local.get $this
  i64.load offset=16
 )
 (func $src/devices/Cpu/CpuRegisters#get:IR (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=8
 )
 (func $src/devices/Computer/Computer#get:breakpoints (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $~lib/util/hash/HASH<u16> (param $key i32) (result i32)
  (local $key|1 i32)
  (local $len i32)
  (local $h i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 2
  i32.const 4
  i32.le_u
  drop
  block $~lib/util/hash/hash32|inlined.1 (result i32)
   local.get $key
   i32.const 65535
   i32.and
   local.set $key|1
   i32.const 2
   local.set $len
   i32.const 0
   i32.const 374761393
   i32.add
   local.get $len
   i32.add
   local.set $h
   local.get $h
   local.get $key|1
   i32.const -1028477379
   i32.mul
   i32.add
   local.set $h
   local.get $h
   i32.const 17
   i32.rotl
   i32.const 668265263
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 15
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -2048144777
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 13
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -1028477379
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 16
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   br $~lib/util/hash/hash32|inlined.1
  end
  return
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load16_u
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Cpu/CpuRegisters#get:A (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $src/devices/Cpu/CpuRegisters#get:B (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=1
 )
 (func $src/devices/Cpu/CpuRegisters#get:C (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=2
 )
 (func $src/devices/Cpu/CpuRegisters#get:D (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=3
 )
 (func $src/devices/Cpu/CpuRegisters#get:E (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=4
 )
 (func $src/devices/Cpu/CpuRegisters#get:F (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=5
 )
 (func $src/utils/low16 (param $value i32) (result i32)
  local.get $value
  i32.const 255
  i32.and
  return
 )
 (func $src/utils/high16 (param $value i32) (result i32)
  local.get $value
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  return
 )
 (func $src/devices/Cpu/Cpu#get:alu (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $src/devices/Cpu/Flags#set:zero (param $this i32) (param $zero i32)
  local.get $this
  local.get $zero
  i32.store8
 )
 (func $src/devices/Cpu/Flags#set:carry (param $this i32) (param $carry i32)
  local.get $this
  local.get $carry
  i32.store8 offset=1
 )
 (func $src/devices/Cpu/AluResult#set:result (param $this i32) (param $result i32)
  local.get $this
  local.get $result
  i32.store8
 )
 (func $src/devices/Cpu/AluResult#set:flags (param $this i32) (param $flags i32)
  local.get $this
  local.get $flags
  i32.store offset=4
  local.get $this
  local.get $flags
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/AluResult#get:flags (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Cpu/Flags#get:zero (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $src/devices/Cpu/Flags#get:carry (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=1
 )
 (func $src/devices/Cpu/AluResult#get:result (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $src/devices/Cpu/InstructionActions#set:run (param $this i32) (param $run i32)
  local.get $this
  local.get $run
  i32.store
  local.get $this
  local.get $run
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/InstructionActions#set:fetch (param $this i32) (param $fetch i32)
  local.get $this
  local.get $fetch
  i32.store offset=4
  local.get $this
  local.get $fetch
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/InstructionActions#set:execute (param $this i32) (param $execute i32)
  local.get $this
  local.get $execute
  i32.store offset=8
  local.get $this
  local.get $execute
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Cpu/InstructionActions#get:execute (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $src/devices/Cpu/InstructionActions#get:fetch (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Cpu/InstructionActions#get:run (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#get:enabled (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=6
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#get:counter (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=4
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#get:period (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=5
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#get:computer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $src/devices/InterruptManager/InterruptManager#get:defaultIrqCpuHandler (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store8
 )
 (func $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $~lib/string/String.fromCharCode@varargs (param $unit i32) (param $surr i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $surr
  end
  local.get $unit
  local.get $surr
  call $~lib/string/String.fromCharCode
 )
 (func $src/devices/Memory/Memory#get:size (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/IoManager/IoDevice#get:typeId (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=8
 )
 (func $src/devices/IoManager/IoDevice#get:idx (param $this i32) (result i32)
  local.get $this
  i32.load8_u
 )
 (func $src/devices/IoManager/IoDevice#get:name (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<u16>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<u16>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/string/String>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $src/devices/Computer/Breakpoint#set:address (param $this i32) (param $address i32)
  local.get $this
  local.get $address
  i32.store16
 )
 (func $src/devices/Computer/Breakpoint#set:file (param $this i32) (param $file i32)
  local.get $this
  local.get $file
  i32.store offset=4
  local.get $this
  local.get $file
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $src/devices/Computer/Breakpoint#set:line (param $this i32) (param $line i32)
  local.get $this
  local.get $line
  i32.store16 offset=8
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store16
 )
 (func $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $~lib/rt/itcms/__pin (param $ptr i32) (result i32)
  (local $obj i32)
  local.get $ptr
  if
   local.get $ptr
   i32.const 20
   i32.sub
   local.set $obj
   local.get $obj
   call $~lib/rt/itcms/Object#get:color
   i32.const 3
   i32.eq
   if
    i32.const 12288
    i32.const 128
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $obj
   call $~lib/rt/itcms/Object#unlink
   local.get $obj
   global.get $~lib/rt/itcms/pinSpace
   i32.const 3
   call $~lib/rt/itcms/Object#linkTo
  end
  local.get $ptr
  return
 )
 (func $~lib/rt/itcms/__unpin (param $ptr i32)
  (local $obj i32)
  local.get $ptr
  i32.eqz
  if
   return
  end
  local.get $ptr
  i32.const 20
  i32.sub
  local.set $obj
  local.get $obj
  call $~lib/rt/itcms/Object#get:color
  i32.const 3
  i32.ne
  if
   i32.const 12352
   i32.const 128
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $obj
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $obj
   call $~lib/rt/itcms/Object#unlink
   local.get $obj
   global.get $~lib/rt/itcms/fromSpace
   global.get $~lib/rt/itcms/white
   call $~lib/rt/itcms/Object#linkTo
  end
 )
 (func $~lib/rt/itcms/__collect
  i32.const 0
  drop
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
    i32.const 0
    i32.ne
    if
     call $~lib/rt/itcms/step
     drop
     br $while-continue|0
    end
   end
  end
  call $~lib/rt/itcms/step
  drop
  loop $while-continue|1
   global.get $~lib/rt/itcms/state
   i32.const 0
   i32.ne
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i32.const 200
  i64.extend_i32_u
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
  i32.const 0
  drop
  i32.const 0
  drop
 )
 (func $~lib/rt/__visit_globals (param $0 i32)
  (local $1 i32)
  i32.const 256
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 496
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 4112
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 4416
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 64
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 12288
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 12352
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 1520
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 2576
  local.get $0
  call $~lib/rt/itcms/__visit
  global.get $src/devices/InterruptManager/InterruptManager.type
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/object/Object~visit (param $0 i32) (param $1 i32)
 )
 (func $src/devices/Computer/Computer~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=12
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=16
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=28
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=32
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/Memory/MemoryBus~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/Memory/Rom~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $src/devices/Memory/Memory~visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/Memory/Memory~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/Memory/Ram~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $src/devices/Memory/Memory~visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/IoManager/IoManager~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $src/devices/IoManager/IoDevice~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#__visit
 )
 (func $src/devices/Cpu/Cpu~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<src/devices/Cpu/Cpu>#__visit
 )
 (func $src/devices/Computer/Breakpoint~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>~visit" (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#__visit"
 )
 (func $src/devices/InterruptManager/InterruptManager~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=12
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>~visit" (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#__visit"
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#__visit
 )
 (func $~lib/array/Array<i32>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<i32>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<i32>#__visit
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  i32.const 1
  drop
  local.get $this
  local.set $cur
  local.get $cur
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__visit
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>#get:_env (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>#__visit
 )
 (func $src/devices/Cpu/InstructionActions~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/typedarray/Uint8Array~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView~visit
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>#get:_env (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>#__visit
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>#get:_env (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>#__visit
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>#get:_env (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>#__visit
 )
 (func $src/devices/Cpu/AluResult~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>#get:_env (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>#__visit
 )
 (func $~lib/array/Array<u16>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<u16>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<u16>#__visit
 )
 (func $~lib/array/Array<~lib/string/String>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/string/String>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  block $invalid
   block $~lib/array/Array<~lib/string/String>
    block $~lib/array/Array<u16>
     block $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>
      block $src/devices/Cpu/Flags
       block $src/devices/Cpu/AluResult
        block $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>
         block $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>
          block $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>
           block $~lib/typedarray/Uint8Array
            block $src/devices/Cpu/InstructionActions
             block $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>
              block $~lib/staticarray/StaticArray<~lib/string/String>
               block $~lib/array/Array<i32>
                block $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>
                 block $src/devices/interrupt_timer/InterruptTimerDevice
                  block $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>"
                   block $src/devices/InterruptManager/CpuCoreInfo
                    block $src/devices/InterruptManager/InterruptManager
                     block $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>"
                      block $src/devices/Computer/Breakpoint
                       block $~lib/array/Array<src/devices/Cpu/Cpu>
                        block $src/devices/Cpu/ALU
                         block $src/devices/Cpu/CpuRegisters
                          block $src/devices/Cpu/Cpu
                           block $~lib/array/Array<src/devices/IoManager/IoDevice>
                            block $src/devices/IoManager/IoDevice
                             block $src/devices/IoManager/IoManager
                              block $src/devices/Memory/Ram
                               block $~lib/staticarray/StaticArray<u8>
                                block $src/devices/Memory/Memory
                                 block $src/devices/Memory/Rom
                                  block $src/devices/Memory/MemoryBus
                                   block $src/devices/Computer/Computer
                                    block $~lib/arraybuffer/ArrayBufferView
                                     block $~lib/string/String
                                      block $~lib/arraybuffer/ArrayBuffer
                                       block $~lib/object/Object
                                        local.get $0
                                        i32.const 8
                                        i32.sub
                                        i32.load
                                        br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $src/devices/Computer/Computer $src/devices/Memory/MemoryBus $src/devices/Memory/Rom $src/devices/Memory/Memory $~lib/staticarray/StaticArray<u8> $src/devices/Memory/Ram $src/devices/IoManager/IoManager $src/devices/IoManager/IoDevice $~lib/array/Array<src/devices/IoManager/IoDevice> $src/devices/Cpu/Cpu $src/devices/Cpu/CpuRegisters $src/devices/Cpu/ALU $~lib/array/Array<src/devices/Cpu/Cpu> $src/devices/Computer/Breakpoint $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>" $src/devices/InterruptManager/InterruptManager $src/devices/InterruptManager/CpuCoreInfo $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>" $src/devices/interrupt_timer/InterruptTimerDevice $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice> $~lib/array/Array<i32> $~lib/staticarray/StaticArray<~lib/string/String> $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8> $src/devices/Cpu/InstructionActions $~lib/typedarray/Uint8Array $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array> $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void> $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void> $src/devices/Cpu/AluResult $src/devices/Cpu/Flags $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8> $~lib/array/Array<u16> $~lib/array/Array<~lib/string/String> $invalid
                                       end
                                       return
                                      end
                                      return
                                     end
                                     return
                                    end
                                    local.get $0
                                    local.get $1
                                    call $~lib/arraybuffer/ArrayBufferView~visit
                                    return
                                   end
                                   local.get $0
                                   local.get $1
                                   call $src/devices/Computer/Computer~visit
                                   return
                                  end
                                  local.get $0
                                  local.get $1
                                  call $src/devices/Memory/MemoryBus~visit
                                  return
                                 end
                                 local.get $0
                                 local.get $1
                                 call $src/devices/Memory/Rom~visit
                                 return
                                end
                                local.get $0
                                local.get $1
                                call $src/devices/Memory/Memory~visit
                                return
                               end
                               return
                              end
                              local.get $0
                              local.get $1
                              call $src/devices/Memory/Ram~visit
                              return
                             end
                             local.get $0
                             local.get $1
                             call $src/devices/IoManager/IoManager~visit
                             return
                            end
                            local.get $0
                            local.get $1
                            call $src/devices/IoManager/IoDevice~visit
                            return
                           end
                           local.get $0
                           local.get $1
                           call $~lib/array/Array<src/devices/IoManager/IoDevice>~visit
                           return
                          end
                          local.get $0
                          local.get $1
                          call $src/devices/Cpu/Cpu~visit
                          return
                         end
                         return
                        end
                        return
                       end
                       local.get $0
                       local.get $1
                       call $~lib/array/Array<src/devices/Cpu/Cpu>~visit
                       return
                      end
                      local.get $0
                      local.get $1
                      call $src/devices/Computer/Breakpoint~visit
                      return
                     end
                     local.get $0
                     local.get $1
                     call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>~visit"
                     return
                    end
                    local.get $0
                    local.get $1
                    call $src/devices/InterruptManager/InterruptManager~visit
                    return
                   end
                   return
                  end
                  local.get $0
                  local.get $1
                  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>~visit"
                  return
                 end
                 local.get $0
                 local.get $1
                 call $src/devices/interrupt_timer/InterruptTimerDevice~visit
                 return
                end
                local.get $0
                local.get $1
                call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>~visit
                return
               end
               local.get $0
               local.get $1
               call $~lib/array/Array<i32>~visit
               return
              end
              local.get $0
              local.get $1
              call $~lib/staticarray/StaticArray<~lib/string/String>~visit
              return
             end
             local.get $0
             local.get $1
             call $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>~visit
             return
            end
            local.get $0
            local.get $1
            call $src/devices/Cpu/InstructionActions~visit
            return
           end
           local.get $0
           local.get $1
           call $~lib/typedarray/Uint8Array~visit
           return
          end
          local.get $0
          local.get $1
          call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>~visit
          return
         end
         local.get $0
         local.get $1
         call $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>~visit
         return
        end
        local.get $0
        local.get $1
        call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>~visit
        return
       end
       local.get $0
       local.get $1
       call $src/devices/Cpu/AluResult~visit
       return
      end
      return
     end
     local.get $0
     local.get $1
     call $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>~visit
     return
    end
    local.get $0
    local.get $1
    call $~lib/array/Array<u16>~visit
    return
   end
   local.get $0
   local.get $1
   call $~lib/array/Array<~lib/string/String>~visit
   return
  end
  unreachable
 )
 (func $~setArgumentsLength (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~start
  memory.size
  i32.const 16
  i32.shl
  global.get $~lib/memory/__heap_base
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 176
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 208
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  i32.const 352
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 45344
   i32.const 45392
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor" (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 18
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:buckets"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:bucketsMask"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entries"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 4
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCapacity"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesOffset"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCount"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Computer/Computer#constructor (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 36
   i32.const 4
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/Computer/Computer#set:memoryBus
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/Computer/Computer#set:rom
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/Computer/Computer#set:ram
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/Computer/Computer#set:ioManager
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.const 2
  i32.const 16
  i32.const 464
  call $~lib/rt/__newArray
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Computer/Computer#set:cpus
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor"
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Computer/Computer#set:breakpoints
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  global.get $src/devices/Computer/BreakpointType.NONE
  call $src/devices/Computer/Computer#set:pendingBreakpointType
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/Computer/Computer#set:interruptManager
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.const 2
  i32.const 23
  i32.const 608
  call $~lib/rt/__newArray
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Computer/Computer#set:timers
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $src/devices/Memory/MemoryBus#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 5
   i32.const 5
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/MemoryBus#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/MemoryBus#set:verbose
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Memory/MemoryBus#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Computer/Computer#addMemoryBus (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Memory/MemoryBus#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#set:memoryBus
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Memory/Memory#constructor (param $this i32) (param $size i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.const 7
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/Memory#set:storage
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/Memory#set:size
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  local.get $size
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Memory/Memory#set:storage
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $size
  call $src/devices/Memory/Memory#set:size
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Memory/Ram#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 9
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/Ram#set:computer
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 2
  i32.const 16
  call $~lib/math/ipow32
  call $src/devices/Memory/Memory#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Memory/Ram#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Computer/Computer#addRam (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Memory/Ram#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#set:ram
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Memory/Rom#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 6
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Memory/Rom#set:computer
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 2
  i32.const 16
  call $~lib/math/ipow32
  call $src/devices/Memory/Memory#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Memory/Rom#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Computer/Computer#addRom (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Memory/Rom#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#set:rom
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String#concat (param $this i32) (param $other i32) (result i32)
  (local $thisSize i32)
  (local $otherSize i32)
  (local $outSize i32)
  (local $out i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $thisSize
  local.get $other
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $otherSize
  local.get $thisSize
  local.get $otherSize
  i32.add
  local.set $outSize
  local.get $outSize
  i32.const 0
  i32.eq
  if
   i32.const 2752
   local.set $6
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $6
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $outSize
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store offset=4
  local.get $out
  local.get $this
  local.get $thisSize
  memory.copy
  local.get $out
  local.get $thisSize
  i32.add
  local.get $other
  local.get $otherSize
  memory.copy
  local.get $out
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $~lib/staticarray/StaticArray<u8>#__set (param $this i32) (param $index i32) (param $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/staticarray/StaticArray<u8>#get:length
  i32.ge_u
  if
   i32.const 256
   i32.const 640
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $index
  local.get $value
  call $~lib/staticarray/StaticArray<u8>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Memory/Memory#write (param $this i32) (param $address i32) (param $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $address
  i32.const 65535
  i32.and
  i32.const 0
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $address
   i32.const 65535
   i32.and
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $src/devices/Memory/Memory#get:storage
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $~lib/staticarray/StaticArray<u8>#get:length
   i32.const 1
   i32.sub
   i32.const 65535
   i32.and
   i32.gt_u
  end
  if
   i32.const 2672
   local.get $address
   i32.const 10
   call $~lib/number/U16#toString
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $~lib/string/String#concat
   i32.const 2784
   i32.const 129
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Memory/Memory#get:storage
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $address
  i32.const 65535
  i32.and
  local.get $value
  call $~lib/staticarray/StaticArray<u8>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#writeRam (param $this i32) (param $address i32) (param $value i32)
  (local $ram i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/IoManager/IoManager#get:computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:ram
  local.tee $ram
  i32.store offset=8
  local.get $ram
  i32.eqz
  if
   i32.const 704
   i32.const 816
   i32.const 142
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ram
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $address
  local.get $value
  call $src/devices/Memory/Memory#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 10
   i32.const 10
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $src/devices/IoManager/IoManager#set:computer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.const 2
  i32.const 12
  i32.const 2848
  call $~lib/rt/__newArray
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/IoManager/IoManager#set:devices
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  global.get $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_START
  call $src/devices/IoManager/IoManager#set:stringCursor
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/IoManager/IoManager#set:computer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  global.get $src/memory_map/MEMORY_MAP.DEVICE_TABLE_COUNT
  i32.const 0
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $src/devices/Computer/Computer#addIoManager (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/IoManager/IoManager#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#set:ioManager
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/CpuRegisters#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 13
   i32.const 14
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:A
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:B
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:C
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:D
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:E
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:F
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:PC
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:IR
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#set:FLAGS
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Cpu/ALU#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 15
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Cpu/Cpu#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 31
   i32.const 13
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:registers
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:halted
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i64.const 0
  call $src/devices/Cpu/Cpu#set:cycles
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/ALU#constructor
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#set:alu
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:isOnBreakpoint
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Cpu#set:inInterruptHandler
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#constructor
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#set:registers
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/array/ensureCapacity (param $array i32) (param $newSize i32) (param $alignLog2 i32) (param $canGrow i32)
  (local $oldCapacity i32)
  (local $oldData i32)
  (local $6 i32)
  (local $7 i32)
  (local $newCapacity i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $newData i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $array
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store
  local.get $14
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  local.set $oldCapacity
  local.get $newSize
  local.get $oldCapacity
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   local.get $newSize
   i32.const 1073741820
   local.get $alignLog2
   i32.shr_u
   i32.gt_u
   if
    i32.const 496
    i32.const 2880
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $array
   local.set $14
   global.get $~lib/memory/__stack_pointer
   local.get $14
   i32.store
   local.get $14
   call $~lib/arraybuffer/ArrayBufferView#get:buffer
   local.set $oldData
   local.get $newSize
   local.tee $6
   i32.const 8
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_u
   select
   local.get $alignLog2
   i32.shl
   local.set $newCapacity
   local.get $canGrow
   if
    local.get $oldCapacity
    i32.const 1
    i32.shl
    local.tee $9
    i32.const 1073741820
    local.tee $10
    local.get $9
    local.get $10
    i32.lt_u
    select
    local.tee $11
    local.get $newCapacity
    local.tee $12
    local.get $11
    local.get $12
    i32.gt_u
    select
    local.set $newCapacity
   end
   local.get $oldData
   local.get $newCapacity
   call $~lib/rt/itcms/__renew
   local.set $newData
   i32.const 2
   global.get $~lib/shared/runtime/Runtime.Incremental
   i32.ne
   drop
   local.get $newData
   local.get $oldData
   i32.ne
   if
    local.get $array
    local.get $newData
    i32.store
    local.get $array
    local.get $newData
    i32.store offset=4
    local.get $array
    local.get $newData
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $array
   local.get $newCapacity
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $len
  call $~lib/array/Array<src/devices/Cpu/Cpu>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $src/devices/Computer/Computer#addCpu (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Computer/Computer#get:cpus
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Cpu/Cpu#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/array/Array<src/devices/Cpu/Cpu>#push
  drop
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/InterruptManager/CpuCoreInfo#constructor (param $this i32) (param $cpu f64) (param $core f64) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 20
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  f64.const 0
  call $src/devices/InterruptManager/CpuCoreInfo#set:cpu
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  f64.const 0
  call $src/devices/InterruptManager/CpuCoreInfo#set:core
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $cpu
  call $src/devices/InterruptManager/CpuCoreInfo#set:cpu
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $core
  call $src/devices/InterruptManager/CpuCoreInfo#set:core
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#constructor" (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 21
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:buckets"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:bucketsMask"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entries"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 4
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCapacity"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesOffset"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCount"
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/InterruptManager/InterruptManager#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 19
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#set:enabled
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#set:pending
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#set:mask
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  global.get $src/memory_map/MEMORY_MAP.OS_START
  call $src/devices/InterruptManager/InterruptManager#set:handlerAddr
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#set:defaultIrqCpuHandler
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#set:irqsCpuHandler
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  f64.const 0
  f64.const 0
  call $src/devices/InterruptManager/CpuCoreInfo#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/InterruptManager/InterruptManager#set:defaultIrqCpuHandler
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#constructor"
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/InterruptManager/InterruptManager#set:irqsCpuHandler
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Computer/Computer#addInterruptManager (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/InterruptManager/InterruptManager#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#set:interruptManager
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#constructor (param $this i32) (param $computer i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 7
   i32.const 22
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:counter
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 10
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:period
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:enabled
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:computer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $src/devices/IoManager/IoDevice#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 9
   i32.const 11
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/IoManager/IoDevice#set:idx
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 2752
  call $src/devices/IoManager/IoDevice#set:name
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/IoManager/IoDevice#set:typeId
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $len
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/util/string/joinStringArray (param $dataStart i32) (param $length i32) (param $separator i32) (result i32)
  (local $lastIndex i32)
  (local $4 i32)
  (local $estLen i32)
  (local $value i32)
  (local $i i32)
  (local $offset i32)
  (local $sepLen i32)
  (local $result i32)
  (local $i|11 i32)
  (local $valueLen i32)
  (local $13 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $length
  i32.const 1
  i32.sub
  local.set $lastIndex
  local.get $lastIndex
  i32.const 0
  i32.lt_s
  if
   i32.const 2752
   local.set $13
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $13
   return
  end
  local.get $lastIndex
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   local.get $dataStart
   i32.load
   local.tee $4
   i32.store
   local.get $4
   if (result i32)
    local.get $4
   else
    i32.const 2752
   end
   local.set $13
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $13
   return
  end
  i32.const 0
  local.set $estLen
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $length
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $value
    i32.store offset=4
    local.get $value
    i32.const 0
    i32.ne
    if
     local.get $estLen
     local.get $value
     local.set $13
     global.get $~lib/memory/__stack_pointer
     local.get $13
     i32.store offset=8
     local.get $13
     call $~lib/string/String#get:length
     i32.add
     local.set $estLen
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $offset
  local.get $separator
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=8
  local.get $13
  call $~lib/string/String#get:length
  local.set $sepLen
  global.get $~lib/memory/__stack_pointer
  local.get $estLen
  local.get $sepLen
  local.get $lastIndex
  i32.mul
  i32.add
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $result
  i32.store offset=12
  i32.const 0
  local.set $i|11
  loop $for-loop|1
   local.get $i|11
   local.get $lastIndex
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $dataStart
    local.get $i|11
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $value
    i32.store offset=4
    local.get $value
    i32.const 0
    i32.ne
    if
     local.get $value
     local.set $13
     global.get $~lib/memory/__stack_pointer
     local.get $13
     i32.store offset=8
     local.get $13
     call $~lib/string/String#get:length
     local.set $valueLen
     local.get $result
     local.get $offset
     i32.const 1
     i32.shl
     i32.add
     local.get $value
     local.get $valueLen
     i32.const 1
     i32.shl
     memory.copy
     local.get $offset
     local.get $valueLen
     i32.add
     local.set $offset
    end
    local.get $sepLen
    if
     local.get $result
     local.get $offset
     i32.const 1
     i32.shl
     i32.add
     local.get $separator
     local.get $sepLen
     i32.const 1
     i32.shl
     memory.copy
     local.get $offset
     local.get $sepLen
     i32.add
     local.set $offset
    end
    local.get $i|11
    i32.const 1
    i32.add
    local.set $i|11
    br $for-loop|1
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $dataStart
  local.get $lastIndex
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  local.get $value
  i32.const 0
  i32.ne
  if
   local.get $result
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $value
   local.get $value
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=8
   local.get $13
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   memory.copy
  end
  local.get $result
  local.set $13
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $13
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $this i32) (param $separator i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.lt_s
  drop
  i32.const 1
  drop
  local.get $this
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#get:length
  local.get $separator
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/util/string/joinStringArray
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $~lib/string/String#charCodeAt (param $this i32) (param $pos i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $pos
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/string/String#get:length
  i32.ge_u
  if
   i32.const -1
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  local.get $this
  local.get $pos
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/devices/IoManager/IoManager#writeString (param $this i32) (param $str i32) (result i32)
  (local $ptr i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $i i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/devices/IoManager/IoManager#get:stringCursor
  local.set $ptr
  local.get $ptr
  i32.const 65535
  i32.and
  local.get $str
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/string/String#get:length
  i32.add
  i32.const 1
  i32.add
  i32.const 65535
  i32.and
  global.get $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_END
  i32.gt_u
  if
   global.get $~lib/memory/__stack_pointer
   local.get $ptr
   i32.const 10
   call $~lib/number/U16#toString
   local.tee $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $str
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   call $~lib/string/String#get:length
   i32.const 10
   call $~lib/number/I32#toString
   local.tee $4
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   global.get $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_END
   i32.const 10
   call $~lib/number/U16#toString
   local.tee $5
   i32.store offset=12
   i32.const 3376
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   i32.const 1
   local.get $3
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=16
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 3376
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   i32.const 3
   local.get $4
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=16
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 3376
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   i32.const 5
   local.get $5
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=16
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 3376
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   i32.const 2752
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 816
   i32.const 121
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $str
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   call $~lib/string/String#get:length
   i32.lt_s
   if
    local.get $this
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $this
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=16
    local.get $7
    call $src/devices/IoManager/IoManager#get:stringCursor
    local.get $str
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=16
    local.get $7
    local.get $i
    call $~lib/string/String#charCodeAt
    call $src/devices/IoManager/IoManager#writeRam
    local.get $this
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $this
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=16
    local.get $7
    call $src/devices/IoManager/IoManager#get:stringCursor
    i32.const 1
    i32.add
    call $src/devices/IoManager/IoManager#set:stringCursor
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/IoManager/IoManager#get:stringCursor
  i32.const 0
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/IoManager/IoManager#get:stringCursor
  i32.const 1
  i32.add
  call $src/devices/IoManager/IoManager#set:stringCursor
  local.get $ptr
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $~lib/string/String#charAt (param $this i32) (param $pos i32) (result i32)
  (local $out i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $pos
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/string/String#get:length
  i32.ge_u
  if
   i32.const 2752
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store offset=4
  local.get $out
  local.get $this
  local.get $pos
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  i32.store16
  local.get $out
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/string/String.__concat (param $left i32) (param $right i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $left
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $right
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/string/String#concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/utils/toHex (param $intValue i32) (param $padleft i32) (result i32)
  (local $result i32)
  (local $n i32)
  (local $remainder i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2752
  local.tee $result
  i32.store
  local.get $intValue
  i32.const 0
  i32.eq
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1088
   local.tee $result
   i32.store
  else
   local.get $intValue
   local.set $n
   loop $while-continue|0
    local.get $n
    i32.const 0
    i32.gt_s
    if
     local.get $n
     i32.const 16
     i32.rem_s
     local.set $remainder
     global.get $~lib/memory/__stack_pointer
     i32.const 3728
     local.get $remainder
     call $~lib/string/String#charAt
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     local.get $result
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=8
     local.get $5
     call $~lib/string/String.__concat
     local.tee $result
     i32.store
     local.get $n
     i32.const 16
     i32.div_s
     f64.convert_i32_s
     call $~lib/math/NativeMath.round
     i32.trunc_sat_f64_s
     local.set $n
     br $while-continue|0
    end
   end
  end
  local.get $result
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $~lib/string/String#get:length
  i32.const 2
  i32.rem_s
  i32.const 1
  i32.eq
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1088
   local.get $result
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $~lib/string/String.__concat
   local.tee $result
   i32.store
  end
  local.get $padleft
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $result
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $~lib/string/String#get:length
   local.get $padleft
   i32.lt_s
  else
   i32.const 0
  end
  if
   loop $while-continue|1
    local.get $result
    local.set $5
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=4
    local.get $5
    call $~lib/string/String#get:length
    local.get $padleft
    i32.lt_s
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 1088
     local.get $result
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     call $~lib/string/String.__concat
     local.tee $result
     i32.store
     br $while-continue|1
    end
   end
  end
  i32.const 3792
  local.get $result
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $~lib/string/String.__concat
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
  return
 )
 (func $src/devices/IoManager/IoManager#writeDeviceTableEntry (param $this i32) (param $deviceIdx i32) (param $name i32) (param $typeId i32)
  (local $namePtr i32)
  (local $deviceOffset i32)
  (local $entryAddr i32)
  (local $ioBase i32)
  (local $typeCode i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $name
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/IoManager/IoManager#writeString
  local.set $namePtr
  local.get $deviceIdx
  i32.const 255
  i32.and
  global.get $src/memory_map/MEMORY_MAP.DEVICE_TABLE_ENTRY_SIZE
  i32.mul
  local.set $deviceOffset
  global.get $src/memory_map/MEMORY_MAP.DEVICE_TABLE_START
  local.get $deviceOffset
  i32.add
  local.set $entryAddr
  global.get $src/memory_map/MEMORY_MAP.IO_START
  local.get $deviceIdx
  i32.const 255
  i32.and
  global.get $src/devices/IoManager/DEVICE_PORT_SIZE
  i32.mul
  i32.add
  local.set $ioBase
  local.get $typeId
  local.set $typeCode
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 0
  i32.add
  local.get $deviceIdx
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 1
  i32.add
  local.get $typeCode
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 2
  i32.add
  local.get $ioBase
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 3
  i32.add
  local.get $ioBase
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 4
  i32.add
  local.get $namePtr
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $entryAddr
  i32.const 5
  i32.add
  local.get $namePtr
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  global.get $src/memory_map/MEMORY_MAP.DEVICE_TABLE_COUNT
  local.get $deviceIdx
  i32.const 1
  i32.add
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $deviceIdx
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $9
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $name
  local.tee $10
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $entryAddr
  i32.const 65535
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $11
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $ioBase
  i32.const 65535
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $12
  i32.store offset=20
  i32.const 3664
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  i32.const 1
  local.get $9
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=24
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3664
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  i32.const 3
  local.get $10
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=24
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3664
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  i32.const 5
  local.get $11
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=24
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3664
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  i32.const 7
  local.get $12
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=24
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3664
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#addDevice (param $this i32) (param $name i32) (param $typeId i32) (result i32)
  (local $deviceIdx i32)
  (local $4 i32)
  (local $device i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/IoManager/IoManager#get:devices
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
  local.set $deviceIdx
  local.get $deviceIdx
  i32.const 255
  i32.and
  global.get $src/memory_map/MEMORY_MAP.DEVICE_TABLE_MAX_ENTRIES
  i32.ge_u
  if
   i32.const 3104
   i32.const 816
   i32.const 34
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $deviceIdx
  i32.const 255
  i32.and
  i32.const 255
  i32.gt_u
  if
   i32.const 3104
   i32.const 816
   i32.const 38
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/IoManager/IoDevice#constructor
  local.tee $4
  i32.store offset=8
  local.get $4
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $deviceIdx
  call $src/devices/IoManager/IoDevice#set:idx
  local.get $4
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $name
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/IoManager/IoDevice#set:name
  local.get $4
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $typeId
  call $src/devices/IoManager/IoDevice#set:typeId
  local.get $4
  local.tee $device
  i32.store offset=12
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=16
  local.get $6
  call $src/devices/IoManager/IoManager#get:devices
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $device
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#push
  drop
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $deviceIdx
  local.get $name
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $typeId
  call $src/devices/IoManager/IoManager#writeDeviceTableEntry
  local.get $deviceIdx
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $len
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $src/devices/Computer/Computer#addTimer (param $this i32)
  (local $ioManager i32)
  (local $timer i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Computer/Computer#get:ioManager
  local.tee $ioManager
  i32.store offset=4
  local.get $ioManager
  i32.eqz
  if
   i32.const 2928
   i32.const 2992
   i32.const 64
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/interrupt_timer/InterruptTimerDevice#constructor
  local.tee $timer
  i32.store offset=8
  local.get $ioManager
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.const 3072
  i32.const 0
  call $src/devices/IoManager/IoManager#addDevice
  drop
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=16
  local.get $3
  call $src/devices/Computer/Computer#get:timers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $timer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#push
  drop
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/instanciateComputer (result i32)
  (local $computer i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Computer/Computer#constructor
  local.tee $computer
  i32.store
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addMemoryBus
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addRam
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addRom
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addIoManager
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addCpu
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addInterruptManager
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Computer/Computer#addTimer
  i32.const 3824
  call $src/external_functions/console.log
  local.get $computer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $src/index/computerloadCodeInROM (param $computer i32) (param $valPtr i32) (param $dataLen i32)
  (local $rom i32)
  (local $i i32)
  (local $addr i32)
  (local $val i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/devices/Computer/Computer#get:rom
  local.tee $rom
  i32.store offset=4
  local.get $rom
  i32.eqz
  if
   i32.const 3888
   i32.const 3936
   i32.const 34
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $dataLen
   i32.lt_s
   if
    local.get $i
    local.set $addr
    local.get $valPtr
    local.get $i
    i32.add
    i32.load8_u
    local.set $val
    local.get $rom
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $addr
    local.get $val
    call $src/devices/Memory/Memory#write
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerloadCodeInRAM (param $computer i32) (param $valPtr i32) (param $dataLen i32)
  (local $ram i32)
  (local $i i32)
  (local $addr i32)
  (local $val i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/devices/Computer/Computer#get:ram
  local.tee $ram
  i32.store offset=4
  local.get $ram
  i32.eqz
  if
   i32.const 3984
   i32.const 3936
   i32.const 56
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  local.get $dataLen
  global.get $src/memory_map/MEMORY_MAP.RAM_END
  i32.const 1
  i32.add
  i32.const 65535
  i32.and
  i32.gt_s
  if
   i32.const 4032
   i32.const 3936
   i32.const 60
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $dataLen
   i32.lt_s
   if
    local.get $i
    local.set $addr
    local.get $valPtr
    local.get $i
    i32.add
    i32.load8_u
    local.set $val
    local.get $ram
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $addr
    local.get $val
    call $src/devices/Memory/Memory#write
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length_
  i32.ge_u
  if
   i32.const 256
   i32.const 2880
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4112
   i32.const 2880
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/devices/InterruptManager/InterruptManager#hasPendingInterrupt (param $this i32) (result i32)
  (local $active i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:pending
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:enabled
  i32.and
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:mask
  i32.const -1
  i32.xor
  i32.and
  local.set $active
  local.get $active
  i32.const 255
  i32.and
  i32.const 0
  i32.ne
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:buckets"
  local.get $hashCode
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:bucketsMask"
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $entry
  loop $while-continue|0
   local.get $entry
   if
    local.get $entry
    call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:key"
     i32.const 255
     i32.and
     local.get $key
     i32.const 255
     i32.and
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $entry
     local.set $5
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $5
     return
    end
    local.get $taggedNext
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $entry
    br $while-continue|0
   end
  end
  i32.const 0
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
  return
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u8>
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 4416
   i32.const 4480
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:value"
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/string/String.__eq (param $left i32) (param $right i32) (result i32)
  (local $leftLength i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $left
  local.get $right
  i32.eq
  if
   i32.const 1
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  local.get $left
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $right
   i32.const 0
   i32.eq
  end
  if
   i32.const 0
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  local.get $left
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/string/String#get:length
  local.set $leftLength
  local.get $leftLength
  local.get $right
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/string/String#get:length
  i32.ne
  if
   i32.const 0
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  local.get $left
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.const 0
  local.get $right
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  local.get $leftLength
  call $~lib/util/string/compareImpl
  i32.eqz
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/string/String.__ne (param $left i32) (param $right i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $left
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $right
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/string/String.__eq
  i32.eqz
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/devices/InterruptManager/InterruptManager#getPendingIRQ (param $this i32) (param $callerCpuIdx f64) (param $callerCoreIdx f64) (result i32)
  (local $active i32)
  (local $irq i32)
  (local $irqCpuHandler i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $src/devices/InterruptManager/InterruptManager#get:pending
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $src/devices/InterruptManager/InterruptManager#get:enabled
  i32.and
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $src/devices/InterruptManager/InterruptManager#get:mask
  i32.const -1
  i32.xor
  i32.and
  local.set $active
  local.get $active
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  if
   i32.const 255
   local.set $6
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $6
   return
  end
  i32.const 0
  local.set $irq
  loop $for-loop|0
   local.get $irq
   i32.const 8
   i32.lt_s
   if
    block $for-continue|0
     global.get $~lib/memory/__stack_pointer
     local.get $this
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     call $src/devices/InterruptManager/InterruptManager#get:irqsCpuHandler
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     local.get $irq
     call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get"
     local.tee $irqCpuHandler
     i32.store offset=8
     local.get $callerCpuIdx
     drop
     i32.const 4528
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     i32.const 4560
     call $~lib/string/String.__ne
     if (result i32)
      local.get $irqCpuHandler
     else
      i32.const 0
     end
     if (result i32)
      local.get $callerCpuIdx
      local.get $irqCpuHandler
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store
      local.get $6
      call $src/devices/InterruptManager/CpuCoreInfo#get:cpu
      f64.ne
     else
      i32.const 0
     end
     if
      br $for-continue|0
     end
     local.get $callerCoreIdx
     drop
     i32.const 4528
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     i32.const 4560
     call $~lib/string/String.__ne
     if (result i32)
      local.get $irqCpuHandler
     else
      i32.const 0
     end
     if (result i32)
      local.get $callerCoreIdx
      local.get $irqCpuHandler
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store
      local.get $6
      call $src/devices/InterruptManager/CpuCoreInfo#get:core
      f64.ne
     else
      i32.const 0
     end
     if
      br $for-continue|0
     end
     local.get $active
     i32.const 1
     local.get $irq
     i32.const 7
     i32.and
     i32.shl
     i32.and
     i32.const 255
     i32.and
     if
      local.get $irq
      local.set $6
      global.get $~lib/memory/__stack_pointer
      i32.const 12
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $6
      return
     end
    end
    local.get $irq
    i32.const 1
    i32.add
    local.set $irq
    br $for-loop|0
   end
  end
  i32.const 255
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length_
  i32.ge_u
  if
   i32.const 256
   i32.const 2880
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4112
   i32.const 2880
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/devices/IoManager/IoManager#write (param $this i32) (param $ioRelativeAddress i32) (param $value i32)
  (local $x f64)
  (local $ioDevice i32)
  (local $ioPort i32)
  (local $device i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  block $~lib/math/NativeMath.floor|inlined.0 (result f64)
   local.get $ioRelativeAddress
   i32.const 65535
   i32.and
   global.get $src/devices/IoManager/DEVICE_PORT_SIZE
   i32.div_u
   f64.convert_i32_u
   local.set $x
   local.get $x
   f64.floor
   br $~lib/math/NativeMath.floor|inlined.0
  end
  i32.trunc_sat_f64_u
  local.set $ioDevice
  local.get $ioRelativeAddress
  i32.const 65535
  i32.and
  global.get $src/devices/IoManager/DEVICE_PORT_SIZE
  i32.rem_u
  local.set $ioPort
  local.get $ioDevice
  i32.const 255
  i32.and
  i32.const 0
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $ioDevice
   i32.const 255
   i32.and
   local.get $this
   local.set $9
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store offset=4
   local.get $9
   call $src/devices/IoManager/IoManager#get:devices
   local.set $9
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store
   local.get $9
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
   i32.const 1
   i32.sub
   i32.const 255
   i32.and
   i32.gt_u
  end
  if
   i32.const 5248
   local.get $ioDevice
   i32.const 10
   call $~lib/number/U8#toString
   local.set $9
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store
   local.get $9
   call $~lib/string/String#concat
   i32.const 816
   i32.const 175
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/IoManager/IoManager#get:devices
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $ioDevice
  i32.const 255
  i32.and
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#__get
  local.tee $device
  i32.store offset=8
  local.get $device
  if
   local.get $ioDevice
   local.get $ioPort
   local.get $value
   call $src/external_functions/jsIo.write
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $ioDevice
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $7
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $ioPort
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $8
  i32.store offset=16
  i32.const 5488
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 1
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=20
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 5488
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 3
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=20
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 5488
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/external_functions/console.warn
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  return
 )
 (func $src/devices/Memory/MemoryBus#write (param $this i32) (param $address i32) (param $value i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $rom i32)
  (local $ram i32)
  (local $ioManager i32)
  (local $ioRelativeAddress i32)
  (local $11 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  local.get $this
  local.set $11
  global.get $~lib/memory/__stack_pointer
  local.get $11
  i32.store
  local.get $11
  call $src/devices/Memory/MemoryBus#get:verbose
  if (result i32)
   local.get $address
   call $src/memory_map/isRomAddress
   i32.eqz
  else
   i32.const 0
  end
  if
   global.get $~lib/memory/__stack_pointer
   local.get $value
   i32.const 255
   i32.and
   i32.const 0
   call $src/utils/toHex
   local.tee $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $value
   i32.const 10
   call $~lib/number/U8#toString
   local.tee $4
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $address
   i32.const 65535
   i32.and
   i32.const 0
   call $src/utils/toHex
   local.tee $5
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $address
   i32.const 10
   call $~lib/number/U16#toString
   local.tee $6
   i32.store offset=16
   i32.const 4880
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   i32.const 1
   local.get $3
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=24
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 4880
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   i32.const 3
   local.get $4
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=24
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 4880
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   i32.const 5
   local.get $5
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=24
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 4880
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   i32.const 7
   local.get $6
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=24
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 4880
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   i32.const 2752
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/external_functions/console.log
  end
  local.get $address
  call $src/memory_map/isRomAddress
  if
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   call $src/devices/Memory/MemoryBus#get:computer
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/devices/Computer/Computer#get:rom
   local.tee $rom
   i32.store offset=28
   local.get $rom
   i32.eqz
   if
    i32.const 4944
    local.get $address
    i32.const 65535
    i32.and
    i32.const 0
    call $src/utils/toHex
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    call $~lib/string/String#concat
    i32.const 2784
    i32.const 70
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   local.get $rom
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   local.get $address
   local.get $value
   call $src/devices/Memory/Memory#write
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $address
  call $src/memory_map/isRamAddress
  if
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   call $src/devices/Memory/MemoryBus#get:computer
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/devices/Computer/Computer#get:ram
   local.tee $ram
   i32.store offset=32
   local.get $ram
   i32.eqz
   if
    i32.const 5040
    local.get $address
    i32.const 65535
    i32.and
    i32.const 0
    call $src/utils/toHex
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    call $~lib/string/String#concat
    i32.const 2784
    i32.const 85
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   local.get $ram
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   local.get $address
   local.get $value
   call $src/devices/Memory/Memory#write
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $address
  call $src/memory_map/isIoAddress
  if
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=20
   local.get $11
   call $src/devices/Memory/MemoryBus#get:computer
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/devices/Computer/Computer#get:ioManager
   local.tee $ioManager
   i32.store offset=36
   local.get $ioManager
   i32.eqz
   if
    i32.const 5136
    local.get $address
    i32.const 65535
    i32.and
    i32.const 0
    call $src/utils/toHex
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    call $~lib/string/String#concat
    i32.const 2784
    i32.const 96
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   local.get $address
   global.get $src/memory_map/MEMORY_MAP.IO_START
   i32.sub
   local.set $ioRelativeAddress
   local.get $ioManager
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   local.get $ioRelativeAddress
   local.get $value
   call $src/devices/IoManager/IoManager#write
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 5536
  local.get $address
  i32.const 65535
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.set $11
  global.get $~lib/memory/__stack_pointer
  local.get $11
  i32.store
  local.get $11
  call $~lib/string/String#concat
  i32.const 2784
  i32.const 105
  i32.const 9
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#writeMemory (param $this i32) (param $address i32) (param $value i32)
  (local $memoryBus i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 207
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $memoryBus
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $address
  local.get $value
  call $src/devices/Memory/MemoryBus#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/InterruptManager/InterruptManager#acknowledgeInterrupt (param $this i32) (param $irq i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:pending
  i32.const 1
  local.get $irq
  i32.const 7
  i32.and
  i32.shl
  i32.const -1
  i32.xor
  i32.and
  call $src/devices/InterruptManager/InterruptManager#set:pending
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#handleInterrupt (param $this i32)
  (local $interrupt i32)
  (local $irq i32)
  (local $sp i32)
  (local $pc i32)
  (local $flags i32)
  (local $handlerAddress i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:computer
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/devices/Computer/Computer#get:interruptManager
  local.tee $interrupt
  i32.store offset=8
  local.get $interrupt
  i32.eqz
  if
   i32.const 4288
   i32.const 4352
   i32.const 241
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $interrupt
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  f64.const 0
  f64.const 0
  call $src/devices/InterruptManager/InterruptManager#getPendingIRQ
  local.set $irq
  local.get $irq
  i32.const 255
  i32.eq
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  i32.const 0
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  i32.const 1
  call $src/devices/Cpu/Cpu#set:inInterruptHandler
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:SP
  local.set $sp
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:PC
  local.set $pc
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:FLAGS
  local.set $flags
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $sp
  local.get $flags
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $sp
  i32.const 1
  i32.sub
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $sp
  i32.const 1
  i32.sub
  local.get $pc
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $sp
  i32.const 2
  i32.sub
  local.get $pc
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $sp
  i32.const 3
  i32.sub
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $interrupt
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $irq
  call $src/devices/InterruptManager/InterruptManager#acknowledgeInterrupt
  local.get $interrupt
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/devices/InterruptManager/InterruptManager#get:handlerAddr
  local.set $handlerAddress
  local.get $handlerAddress
  i32.const 65535
  i32.and
  i32.const 0
  i32.eq
  if
   i32.const 5632
   i32.const 4352
   i32.const 274
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $handlerAddress
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  local.get $irq
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $7
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $handlerAddress
  i32.const 65535
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $8
  i32.store offset=16
  i32.const 5808
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 1
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=20
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 5808
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 3
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=20
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 5808
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/staticarray/StaticArray<u8>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/staticarray/StaticArray<u8>#get:length
  i32.ge_u
  if
   i32.const 256
   i32.const 640
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.get $index
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
  local.set $value
  i32.const 0
  drop
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/devices/Memory/Memory#read (param $this i32) (param $address i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $address
  i32.const 65535
  i32.and
  i32.const 0
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $address
   i32.const 65535
   i32.and
   local.get $this
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Memory/Memory#get:storage
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $~lib/staticarray/StaticArray<u8>#get:length
   i32.const 1
   i32.sub
   i32.const 65535
   i32.and
   i32.gt_u
  end
  if
   i32.const 2672
   local.get $address
   i32.const 10
   call $~lib/number/U16#toString
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $~lib/string/String#concat
   i32.const 2784
   i32.const 121
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Memory/Memory#get:storage
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $address
  i32.const 65535
  i32.and
  call $~lib/staticarray/StaticArray<u8>#__get
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/devices/IoManager/IoManager#read (param $this i32) (param $ioRelativeAddress i32) (result i32)
  (local $x f64)
  (local $ioDevice i32)
  (local $ioPort i32)
  (local $device i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  block $~lib/math/NativeMath.floor|inlined.1 (result f64)
   local.get $ioRelativeAddress
   i32.const 65535
   i32.and
   global.get $src/devices/IoManager/DEVICE_PORT_SIZE
   i32.div_u
   f64.convert_i32_u
   local.set $x
   local.get $x
   f64.floor
   br $~lib/math/NativeMath.floor|inlined.1
  end
  i32.trunc_sat_f64_u
  local.set $ioDevice
  local.get $ioRelativeAddress
  i32.const 65535
  i32.and
  global.get $src/devices/IoManager/DEVICE_PORT_SIZE
  i32.rem_u
  local.set $ioPort
  local.get $ioDevice
  i32.const 255
  i32.and
  i32.const 0
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $ioDevice
   i32.const 255
   i32.and
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=4
   local.get $8
   call $src/devices/IoManager/IoManager#get:devices
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
   i32.const 1
   i32.sub
   i32.const 255
   i32.and
   i32.gt_u
  end
  if
   i32.const 6192
   local.get $ioDevice
   i32.const 10
   call $~lib/number/U8#toString
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $~lib/string/String#concat
   i32.const 816
   i32.const 154
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/IoManager/IoManager#get:devices
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $ioDevice
  i32.const 255
  i32.and
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#__get
  local.tee $device
  i32.store offset=8
  local.get $device
  if
   local.get $ioDevice
   local.get $ioPort
   call $src/external_functions/jsIo.read
   local.set $8
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $8
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $ioDevice
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $6
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $ioPort
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $7
  i32.store offset=16
  i32.const 6384
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 1
  local.get $6
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=20
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 6384
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 3
  local.get $7
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=20
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 6384
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  call $src/external_functions/console.warn
  i32.const 0
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $8
  return
 )
 (func $src/devices/Memory/MemoryBus#read (param $this i32) (param $address i32) (result i32)
  (local $value i32)
  (local $rom i32)
  (local $ram i32)
  (local $ioManager i32)
  (local $ioRelativeAddress i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  i32.const 0
  local.set $value
  local.get $address
  call $src/memory_map/isRomAddress
  if
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   call $src/devices/Memory/MemoryBus#get:computer
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/devices/Computer/Computer#get:rom
   local.tee $rom
   i32.store offset=8
   local.get $rom
   i32.eqz
   if (result i32)
    i32.const 1
   else
    i32.const 5856
    i32.eqz
   end
   if
    i32.const 5888
    local.get $address
    i32.const 65535
    i32.and
    i32.const 0
    call $src/utils/toHex
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    call $~lib/string/String#concat
    i32.const 2784
    i32.const 25
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   local.get $rom
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   local.get $address
   call $src/devices/Memory/Memory#read
   local.set $value
  else
   local.get $address
   call $src/memory_map/isRamAddress
   if
    global.get $~lib/memory/__stack_pointer
    local.get $this
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store offset=4
    local.get $11
    call $src/devices/Memory/MemoryBus#get:computer
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    call $src/devices/Computer/Computer#get:ram
    local.tee $ram
    i32.store offset=12
    local.get $ram
    i32.eqz
    if
     i32.const 5984
     local.get $address
     i32.const 65535
     i32.and
     i32.const 0
     call $src/utils/toHex
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $11
     i32.store
     local.get $11
     call $~lib/string/String#concat
     i32.const 2784
     i32.const 34
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
    local.get $ram
    local.set $11
    global.get $~lib/memory/__stack_pointer
    local.get $11
    i32.store
    local.get $11
    local.get $address
    call $src/devices/Memory/Memory#read
    local.set $value
   else
    local.get $address
    call $src/memory_map/isIoAddress
    if
     global.get $~lib/memory/__stack_pointer
     local.get $this
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $11
     i32.store offset=4
     local.get $11
     call $src/devices/Memory/MemoryBus#get:computer
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $11
     i32.store
     local.get $11
     call $src/devices/Computer/Computer#get:ioManager
     local.tee $ioManager
     i32.store offset=16
     local.get $ioManager
     i32.eqz
     if
      i32.const 6080
      local.get $address
      i32.const 65535
      i32.and
      i32.const 0
      call $src/utils/toHex
      local.set $11
      global.get $~lib/memory/__stack_pointer
      local.get $11
      i32.store
      local.get $11
      call $~lib/string/String#concat
      i32.const 2784
      i32.const 43
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     local.get $address
     global.get $src/memory_map/MEMORY_MAP.IO_START
     i32.sub
     local.set $ioRelativeAddress
     local.get $ioManager
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $11
     i32.store
     local.get $11
     local.get $ioRelativeAddress
     call $src/devices/IoManager/IoManager#read
     local.set $value
    else
     i32.const 6432
     local.get $address
     i32.const 65535
     i32.and
     i32.const 0
     call $src/utils/toHex
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $11
     i32.store
     local.get $11
     call $~lib/string/String#concat
     i32.const 2784
     i32.const 51
     i32.const 13
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $this
  local.set $11
  global.get $~lib/memory/__stack_pointer
  local.get $11
  i32.store
  local.get $11
  call $src/devices/Memory/MemoryBus#get:verbose
  if
   global.get $~lib/memory/__stack_pointer
   local.get $value
   i32.const 0
   call $src/utils/toHex
   local.tee $7
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $value
   i32.const 10
   call $~lib/number/U8#toString
   local.tee $8
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $address
   i32.const 65535
   i32.and
   i32.const 0
   call $src/utils/toHex
   local.tee $9
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $address
   i32.const 10
   call $~lib/number/U16#toString
   local.tee $10
   i32.store offset=32
   i32.const 6592
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   i32.const 1
   local.get $7
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=36
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 6592
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   i32.const 3
   local.get $8
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=36
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 6592
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   i32.const 5
   local.get $9
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=36
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 6592
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   i32.const 7
   local.get $10
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=36
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 6592
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=4
   local.get $11
   i32.const 2752
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $11
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store
   local.get $11
   call $src/external_functions/console.log
  end
  local.get $value
  local.set $11
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $11
  return
 )
 (func $src/devices/Cpu/Cpu#readMemory (param $this i32) (param $address i32) (result i32)
  (local $memoryBus i32)
  (local $value i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 198
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $memoryBus
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $address
  call $src/devices/Memory/MemoryBus#read
  local.set $value
  local.get $value
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $src/devices/Cpu/Cpu#fetchInstruction (param $this i32)
  (local $opcode i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMemory
  local.set $opcode
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $opcode
  call $src/devices/Cpu/CpuRegisters#set:IR
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:buckets"
  local.get $hashCode
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:bucketsMask"
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $entry
  loop $while-continue|0
   local.get $entry
   if
    local.get $entry
    call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:key"
     i32.const 65535
     i32.and
     local.get $key
     i32.const 65535
     i32.and
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $entry
     local.set $5
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $5
     return
    end
    local.get $taggedNext
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $entry
    br $while-continue|0
   end
  end
  i32.const 0
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
  return
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#has" (param $this i32) (param $key i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u16>
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
  i32.const 0
  i32.ne
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u16>
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 4416
   i32.const 4480
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:value"
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (param $this i32) (param $length i32) (param $alignLog2 i32) (result i32)
  (local $buffer i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 3
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:buffer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:dataStart
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:byteLength
  local.get $length
  i32.const 1073741820
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   i32.const 496
   i32.const 544
   i32.const 19
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $length
  local.get $alignLog2
  i32.shl
  local.tee $length
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $buffer
  i32.store offset=8
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $buffer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $4
  call $~lib/arraybuffer/ArrayBufferView#set:buffer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $buffer
  call $~lib/arraybuffer/ArrayBufferView#set:dataStart
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $length
  call $~lib/arraybuffer/ArrayBufferView#set:byteLength
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/typedarray/Uint8Array#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 28
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $length
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Cpu/Cpu#readMem8 (param $this i32) (param $pc i32) (result i32)
  (local $memoryBus i32)
  (local $value i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 176
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $pc
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  local.set $value
  local.get $value
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/typedarray/Uint8Array#__set (param $this i32) (param $index i32) (param $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.ge_u
  if
   i32.const 256
   i32.const 6912
   i32.const 178
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $index
  i32.add
  local.get $value
  i32.store8
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|0 (param $cpu i32) (result i32)
  (local $data i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 2
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $data
  i32.store
  local.get $data
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  local.get $data
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 1
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  local.get $data
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $~lib/typedarray/Uint8Array#__get (param $this i32) (param $index i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $index
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.ge_u
  if
   i32.const 256
   i32.const 6912
   i32.const 167
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $index
  i32.add
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|1 (param $cpu i32) (param $data i32)
  (local $debugId i32)
  (local $debugValue i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  local.get $data
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  local.set $debugId
  local.get $data
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  local.set $debugValue
  global.get $~lib/memory/__stack_pointer
  local.get $debugId
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 0
  call $src/utils/toHex
  local.tee $5
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $6
  i32.store offset=12
  i32.const 7088
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  i32.const 1
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=20
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7088
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  i32.const 3
  local.get $5
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=20
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7088
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  i32.const 5
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=20
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7088
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=20
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|2 (param $cpu i32) (param $$1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|3 (param $cpu i32) (param $$1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 1
  call $src/devices/Cpu/Cpu#set:halted
  i32.const 7200
  call $src/external_functions/console.log
  call $src/external_functions/jsCpu.halted
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|4 (param $cpu i32)
  (local $debugId i32)
  (local $debugValue i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $debugId
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $debugValue
  global.get $~lib/memory/__stack_pointer
  local.get $debugId
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 0
  call $src/utils/toHex
  local.tee $4
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $5
  i32.store offset=20
  i32.const 7280
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 1
  local.get $3
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7280
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 3
  local.get $4
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7280
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 5
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7280
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $src/external_functions/console.log
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#getRegisterNameByIdx (param $this i32) (param $regIdx i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 1
  i32.eq
  if
   i32.const 7360
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 2
  i32.eq
  if
   i32.const 7392
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 3
  i32.eq
  if
   i32.const 7424
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 4
  i32.eq
  if
   i32.const 7456
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 5
  i32.eq
  if
   i32.const 7488
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 6
  i32.eq
  if
   i32.const 7520
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $regIdx
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $3
  i32.store offset=12
  i32.const 7664
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 1
  local.get $2
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7664
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 3
  local.get $3
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7664
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 4352
  i32.const 292
  i32.const 9
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#getRegisterValueByIdx (param $this i32) (param $regIdx i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 1
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:A
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 2
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:B
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 3
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:C
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 4
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:D
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 5
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:E
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 6
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=4
   local.get $4
   call $src/devices/Cpu/Cpu#get:registers
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   call $src/devices/Cpu/CpuRegisters#get:F
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $regIdx
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $3
  i32.store offset=12
  i32.const 7712
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  i32.const 1
  local.get $2
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7712
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  i32.const 3
  local.get $3
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7712
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 4352
  i32.const 305
  i32.const 9
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|5 (param $cpu i32)
  (local $debugId i32)
  (local $regIdx i32)
  (local $regName i32)
  (local $debugValue i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 32
  memory.fill
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $debugId
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterNameByIdx
  local.tee $regName
  i32.store offset=12
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $debugValue
  global.get $~lib/memory/__stack_pointer
  local.get $debugId
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $5
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $regName
  local.tee $6
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 255
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $7
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $8
  i32.store offset=28
  i32.const 7840
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 1
  local.get $5
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7840
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 3
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7840
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 5
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7840
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 7
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 7840
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $src/external_functions/console.log
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  local.get $cpu
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $src/devices/Cpu/Cpu#get:registers
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#readMem16 (param $this i32) (param $pc i32) (result i32)
  (local $memoryBus i32)
  (local $low i32)
  (local $high i32)
  (local $value i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:computer
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 185
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $pc
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  local.set $low
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $pc
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  local.set $high
  local.get $high
  i32.const 256
  i32.mul
  local.get $low
  i32.add
  local.set $value
  local.get $value
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|6 (param $cpu i32)
  (local $debugId i32)
  (local $memAddress i32)
  (local $debugValue i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $debugId
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $debugValue
  global.get $~lib/memory/__stack_pointer
  local.get $debugId
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $4
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $memAddress
  i32.const 65535
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $5
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 0
  call $src/utils/toHex
  local.tee $6
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $debugValue
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $7
  i32.store offset=24
  i32.const 8048
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 1
  local.get $4
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8048
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 3
  local.get $5
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8048
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 5
  local.get $6
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8048
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 7
  local.get $7
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8048
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  call $src/external_functions/console.log
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|7 (param $cpu i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 1
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Cpu/Cpu#get:registers
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Cpu/Cpu#get:registers
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|8 (param $cpu i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Cpu/Cpu#get:registers
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  local.get $cpu
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Cpu/Cpu#get:registers
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#pushValue (param $this i32) (param $value i32)
  (local $memoryBus i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 215
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:SP
  local.get $value
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:SP
  i32.const 1
  i32.sub
  i32.const 65535
  i32.and
  call $src/devices/Cpu/CpuRegisters#set:SP
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|9 (param $cpu i32)
  (local $intCode i32)
  (local $interruptTablePointer i32)
  (local $handlerAddressLow i32)
  (local $handlerAddressHigh i32)
  (local $handlerAddress i32)
  (local $returnAddr i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $intCode
  i32.const 8208
  local.get $intCode
  i32.const 0
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  i32.const 1537
  local.get $intCode
  global.get $src/memory_map/MEMORY_MAP.INTERRUPTS_TABLE_ENTRY_SIZE
  i32.mul
  i32.const 255
  i32.and
  i32.add
  local.set $interruptTablePointer
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $interruptTablePointer
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  local.set $handlerAddressLow
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $interruptTablePointer
  i32.const 3
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  local.set $handlerAddressHigh
  local.get $handlerAddressLow
  i32.const 256
  local.get $handlerAddressHigh
  i32.mul
  i32.add
  local.set $handlerAddress
  i32.const 8256
  i32.const 1537
  i32.const 4
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  i32.const 8336
  local.get $interruptTablePointer
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  i32.const 8416
  local.get $handlerAddressLow
  i32.const 0
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  i32.const 8496
  local.get $handlerAddressHigh
  i32.const 0
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  i32.const 8576
  local.get $handlerAddress
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $~lib/string/String#concat
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/external_functions/console.log
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  local.set $returnAddr
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $returnAddr
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#pushValue
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $returnAddr
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#pushValue
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $handlerAddress
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#popValue (param $this i32) (result i32)
  (local $memoryBus i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  local.get $memoryBus
  i32.eqz
  if
   i32.const 4608
   i32.const 4352
   i32.const 227
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:SP
  i32.const 1
  i32.add
  i32.const 65535
  i32.and
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:SP
  call $src/devices/Cpu/Cpu#readMemory
  local.set $value
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|10 (param $cpu i32)
  (local $pcLow i32)
  (local $pcHigh i32)
  (local $returnAddr i32)
  (local $flags i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/Cpu#popValue
  local.set $pcLow
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/Cpu#popValue
  local.set $pcHigh
  local.get $pcHigh
  i32.const 8
  i32.const 7
  i32.and
  i32.shl
  local.get $pcLow
  i32.or
  i32.const 255
  i32.and
  local.set $returnAddr
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/Cpu#popValue
  local.set $flags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $returnAddr
  call $src/devices/Cpu/CpuRegisters#set:PC
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $flags
  call $src/devices/Cpu/CpuRegisters#set:FLAGS
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  i32.const 1
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  i32.const 0
  call $src/devices/Cpu/Cpu#set:inInterruptHandler
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|11 (param $cpu i32)
  (local $PcHex i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $PcHex
  i32.store offset=8
  i32.const 8704
  local.get $PcHex
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/string/String#concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $src/external_functions/console.log
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 1
  call $src/devices/Cpu/Cpu#set:isOnBreakpoint
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  global.get $src/devices/Computer/BreakpointType.INT3
  call $src/devices/Computer/Computer#set:pendingBreakpointType
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  call $src/external_functions/jsCpu.breakpoint
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|12 (param $cpu i32)
  (local $imm16 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $imm16
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $imm16
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|13 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $regLowValue i32)
  (local $regHighValue i32)
  (local $spValue i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regLowIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regLowValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regHighIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regHighValue
  local.get $regHighValue
  i32.const 255
  i32.and
  i32.const 256
  i32.mul
  local.get $regLowValue
  i32.const 255
  i32.and
  i32.add
  local.set $spValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $spValue
  call $src/devices/Cpu/CpuRegisters#set:SP
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#setRegisterValueByIdx (param $this i32) (param $regIdx i32) (param $value i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 1
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:A
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 2
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:B
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 3
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:C
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 4
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:D
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 5
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:E
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $regIdx
  i32.const 255
  i32.and
  i32.const 6
  i32.eq
  if
   local.get $this
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $5
   call $src/devices/Cpu/Cpu#get:registers
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   local.get $value
   call $src/devices/Cpu/CpuRegisters#set:F
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $regIdx
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $4
  i32.store offset=12
  i32.const 8896
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  i32.const 1
  local.get $3
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8896
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  i32.const 3
  local.get $4
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 8896
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 4352
  i32.const 339
  i32.const 9
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|14 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $regLowValue i32)
  (local $regHighValue i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:SP
  call $src/utils/low16
  local.set $regLowValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:SP
  call $src/utils/high16
  local.set $regHighValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regLowIdx
  local.get $regLowValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regHighIdx
  local.get $regHighValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|15 (param $cpu i32)
  (local $returnAddr i32)
  (local $callAddr i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  local.set $returnAddr
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $returnAddr
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#pushValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $returnAddr
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#pushValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $callAddr
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $callAddr
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|16 (param $cpu i32)
  (local $low i32)
  (local $high i32)
  (local $retAddr i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Cpu/Cpu#popValue
  local.set $low
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Cpu/Cpu#popValue
  local.set $high
  local.get $high
  i32.const 256
  i32.mul
  local.get $low
  i32.add
  local.set $retAddr
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $retAddr
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|17 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Cpu/Cpu#get:registers
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $memAddress
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#getFlag (param $this i32) (param $flag i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $flag
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $~lib/string/String.__eq
  if (result i32)
   local.get $this
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:FLAGS
   i32.const 2
   i32.and
   i32.eqz
   i32.eqz
  else
   local.get $this
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:FLAGS
   i32.const 1
   i32.and
   i32.eqz
   i32.eqz
  end
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|18 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9072
  call $src/devices/Cpu/Cpu#getFlag
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|19 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9072
  call $src/devices/Cpu/Cpu#getFlag
  i32.eqz
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|20 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|21 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  i32.eqz
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|22 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  i32.eqz
  if (result i32)
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 9072
   call $src/devices/Cpu/Cpu#getFlag
  else
   i32.const 0
  end
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|23 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 9072
   call $src/devices/Cpu/Cpu#getFlag
  end
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|24 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  i32.eqz
  if (result i32)
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 9072
   call $src/devices/Cpu/Cpu#getFlag
   i32.eqz
  else
   i32.const 0
  end
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|25 (param $cpu i32)
  (local $memAddress i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 9104
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 9072
   call $src/devices/Cpu/Cpu#getFlag
   i32.eqz
  end
  if
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   call $src/devices/Cpu/Cpu#readMem16
   local.set $memAddress
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $memAddress
   call $src/devices/Cpu/CpuRegisters#set:PC
  else
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 3
   i32.add
   call $src/devices/Cpu/CpuRegisters#set:PC
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|26 (param $cpu i32) (result i32)
  (local $data i32)
  (local $2 i32)
  (local $3 i32)
  (local $reg1Idx i32)
  (local $5 i32)
  (local $6 i32)
  (local $reg2Idx i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 4
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $data
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $data
  local.tee $2
  i32.store offset=8
  local.get $2
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 0
  local.tee $3
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=12
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=20
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=16
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  local.get $2
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $3
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg1Idx
  global.get $~lib/memory/__stack_pointer
  local.get $data
  local.tee $5
  i32.store offset=24
  local.get $5
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 1
  local.tee $6
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=12
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=20
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=16
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  local.get $5
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $6
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg2Idx
  local.get $data
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 2
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=12
  local.get $8
  local.get $reg1Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  local.get $data
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  i32.const 3
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=12
  local.get $8
  local.get $reg2Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  local.get $data
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $8
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|27 (param $cpu i32) (param $data i32)
  (local $reg1Idx i32)
  (local $reg2Idx i32)
  (local $reg1OldValue i32)
  (local $reg2OldValue i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $data
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg1Idx
  local.get $data
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg2Idx
  local.get $data
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  i32.const 2
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg1OldValue
  local.get $data
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  i32.const 3
  call $~lib/typedarray/Uint8Array#__get
  local.set $reg2OldValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg1Idx
  local.get $reg2OldValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg2Idx
  local.get $reg1OldValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|28 (param $cpu i32)
  (local $memAddress i32)
  (local $immValue i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $memAddress
  local.get $immValue
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|29 (param $cpu i32)
  (local $regIdx i32)
  (local $immValue i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $regIdx
  local.get $immValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|30 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $targetRegIdx
  local.get $sourceRegValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|31 (param $cpu i32)
  (local $regIdx i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  local.get $memValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|32 (param $cpu i32)
  (local $memAddress i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  local.get $regValue
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|33 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $regValue
  call $src/devices/Cpu/Cpu#pushValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|34 (param $cpu i32)
  (local $regIdx i32)
  (local $popValue i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Cpu/Cpu#popValue
  local.set $popValue
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $regIdx
  local.get $popValue
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cpu
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Flags#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 2
   i32.const 33
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Flags#set:zero
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Cpu/AluResult#constructor (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.const 32
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $src/devices/Cpu/AluResult#set:result
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $1
  i32.store offset=12
  local.get $1
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Flags#set:zero
  local.get $1
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $1
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/Cpu/AluResult#set:flags
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/devices/Cpu/ALU#inc (param $this i32) (param $value i32) (result i32)
  (local $result i32)
  (local $3 i32)
  (local $flags i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $value
  i32.const 1
  i32.add
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $3
  i32.store
  local.get $3
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $3
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  local.get $value
  i32.const 255
  i32.and
  i32.lt_u
  call $src/devices/Cpu/Flags#set:carry
  local.get $3
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $5
  i32.store offset=12
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=16
  local.get $6
  call $src/devices/Cpu/AluResult#set:flags
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $src/devices/Cpu/Cpu#setFlags (param $this i32) (param $zero i32) (param $carry i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $zero
  if (result i32)
   i32.const 2
  else
   i32.const 0
  end
  local.get $carry
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  i32.or
  call $src/devices/Cpu/CpuRegisters#set:FLAGS
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|35 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regValue
  call $src/devices/Cpu/ALU#inc
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|36 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memValue
  call $src/devices/Cpu/ALU#inc
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#dec (param $this i32) (param $value i32) (result i32)
  (local $result i32)
  (local $3 i32)
  (local $flags i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $value
  i32.const 1
  i32.sub
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $3
  i32.store
  local.get $3
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $3
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  local.get $value
  i32.const 255
  i32.and
  i32.gt_u
  call $src/devices/Cpu/Flags#set:carry
  local.get $3
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $5
  i32.store offset=12
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=16
  local.get $6
  call $src/devices/Cpu/AluResult#set:flags
  local.get $5
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|37 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regValue
  call $src/devices/Cpu/ALU#dec
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|38 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memValue
  call $src/devices/Cpu/ALU#dec
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#not (param $this i32) (param $a i32) (result i32)
  (local $result i32)
  (local $carry i32)
  (local $zero i32)
  (local $5 i32)
  (local $flags i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  i32.const -1
  i32.xor
  i32.const 255
  i32.and
  local.set $result
  local.get $a
  i32.const -1
  i32.xor
  i32.const 255
  i32.and
  i32.const 255
  i32.gt_u
  local.set $carry
  local.get $result
  i32.const 0
  i32.eq
  local.set $zero
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $5
  i32.store
  local.get $5
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $5
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $5
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $7
  i32.store offset=12
  local.get $7
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $7
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  local.get $flags
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=16
  local.get $8
  call $src/devices/Cpu/AluResult#set:flags
  local.get $7
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $8
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|39 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regValue
  call $src/devices/Cpu/ALU#not
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regIdx
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|40 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:alu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memValue
  call $src/devices/Cpu/ALU#not
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/AluResult#get:flags
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $memAddress
  local.get $aluResult
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#add (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $carry i32)
  (local $zero i32)
  (local $6 i32)
  (local $flags i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.add
  i32.const 255
  i32.and
  local.set $result
  local.get $result
  local.get $a
  i32.const 255
  i32.and
  i32.lt_u
  local.set $carry
  local.get $result
  i32.const 0
  i32.eq
  local.set $zero
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $6
  i32.store
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $6
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $8
  i32.store offset=12
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $flags
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  call $src/devices/Cpu/AluResult#set:flags
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $9
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|41 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#add
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|42 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $targetRegValue i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $targetRegValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegValue
  local.get $sourceRegValue
  call $src/devices/Cpu/ALU#add
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|43 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#add
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|44 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#add
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|45 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $regValue
  call $src/devices/Cpu/ALU#add
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#sub (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $zero i32)
  (local $carry i32)
  (local $6 i32)
  (local $flags i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.sub
  i32.const 255
  i32.and
  local.set $result
  local.get $result
  i32.const 0
  i32.eq
  local.set $zero
  local.get $a
  i32.const 255
  i32.and
  local.get $b
  i32.const 255
  i32.and
  i32.lt_u
  local.set $carry
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $6
  i32.store
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $6
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $8
  i32.store offset=12
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $flags
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  call $src/devices/Cpu/AluResult#set:flags
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $9
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|46 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#sub
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|47 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $targetRegValue i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $targetRegValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegValue
  local.get $sourceRegValue
  call $src/devices/Cpu/ALU#sub
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|48 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#sub
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|49 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#sub
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|50 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $regValue
  call $src/devices/Cpu/ALU#sub
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#and (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $4 i32)
  (local $flags i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.and
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $4
  i32.store
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $4
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $6
  i32.store offset=12
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $flags
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/AluResult#set:flags
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|51 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#and
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|52 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $targetRegValue i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $targetRegValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegValue
  local.get $sourceRegValue
  call $src/devices/Cpu/ALU#and
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|53 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#and
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|54 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#and
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|55 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $regValue
  call $src/devices/Cpu/ALU#and
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#or (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $4 i32)
  (local $flags i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.or
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $4
  i32.store
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $4
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $6
  i32.store offset=12
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $flags
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/AluResult#set:flags
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|56 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#or
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|57 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $targetRegValue i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $targetRegValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegValue
  local.get $sourceRegValue
  call $src/devices/Cpu/ALU#or
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|58 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#or
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|59 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#or
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|60 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $regValue
  call $src/devices/Cpu/ALU#or
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#xor (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $4 i32)
  (local $flags i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.xor
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $4
  i32.store
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $4
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $6
  i32.store offset=12
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $flags
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/AluResult#set:flags
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|61 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#xor
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|62 (param $cpu i32)
  (local $targetRegIdx i32)
  (local $targetRegValue i32)
  (local $sourceRegIdx i32)
  (local $sourceRegValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $targetRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $targetRegValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $sourceRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $sourceRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $sourceRegValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegValue
  local.get $sourceRegValue
  call $src/devices/Cpu/ALU#xor
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $targetRegIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|63 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#xor
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|64 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#xor
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|65 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $regValue
  call $src/devices/Cpu/ALU#xor
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#cmp (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $zero i32)
  (local $carry i32)
  (local $6 i32)
  (local $flags i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.sub
  i32.const 255
  i32.and
  local.set $result
  local.get $result
  i32.const 0
  i32.eq
  local.set $zero
  local.get $a
  i32.const 255
  i32.and
  local.get $b
  i32.const 255
  i32.and
  i32.lt_u
  local.set $carry
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $6
  i32.store
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $6
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $6
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $8
  i32.store offset=12
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  i32.const 0
  call $src/devices/Cpu/AluResult#set:result
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $flags
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  call $src/devices/Cpu/AluResult#set:flags
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $9
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|66 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#cmp
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|67 (param $cpu i32)
  (local $reg1Idx i32)
  (local $reg1Value i32)
  (local $reg2Idx i32)
  (local $reg2Value i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $reg1Idx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg1Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $reg1Value
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $reg2Idx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg2Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $reg2Value
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg1Value
  local.get $reg2Value
  call $src/devices/Cpu/ALU#cmp
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|68 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#cmp
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|69 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#cmp
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#test (param $this i32) (param $a i32) (param $b i32) (result i32)
  (local $result i32)
  (local $4 i32)
  (local $flags i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $a
  local.get $b
  i32.and
  i32.const 255
  i32.and
  local.set $result
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $4
  i32.store
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $result
  i32.const 0
  i32.eq
  call $src/devices/Cpu/Flags#set:zero
  local.get $4
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  i32.const 0
  call $src/devices/Cpu/Flags#set:carry
  local.get $4
  local.tee $flags
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $6
  i32.store offset=12
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  i32.const 0
  call $src/devices/Cpu/AluResult#set:result
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  local.get $flags
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=16
  local.get $7
  call $src/devices/Cpu/AluResult#set:flags
  local.get $6
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|70 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $immValue
  call $src/devices/Cpu/ALU#test
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|71 (param $cpu i32)
  (local $reg1Idx i32)
  (local $reg1Value i32)
  (local $reg2Idx i32)
  (local $reg2Value i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $reg1Idx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg1Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $reg1Value
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $reg2Idx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg2Idx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $reg2Value
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $reg1Value
  local.get $reg2Value
  call $src/devices/Cpu/ALU#test
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|72 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $memValue
  call $src/devices/Cpu/ALU#test
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|73 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $immValue i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $immValue
  call $src/devices/Cpu/ALU#test
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#shl (param $this i32) (param $value i32) (param $count i32) (result i32)
  (local $result i32)
  (local $carry i32)
  (local $i i32)
  (local $zero i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $value
  local.set $result
  i32.const 0
  local.set $carry
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $count
   i32.const 255
   i32.and
   i32.lt_u
   if
    local.get $result
    i32.const 128
    i32.and
    i32.eqz
    i32.eqz
    local.set $carry
    local.get $result
    i32.const 1
    i32.const 7
    i32.and
    i32.shl
    i32.const 255
    i32.and
    local.set $result
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  local.set $zero
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $7
  i32.store
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $8
  i32.store offset=12
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $src/devices/Cpu/AluResult#set:flags
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $9
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|74 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $imm i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $imm
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $imm
  call $src/devices/Cpu/ALU#shl
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|75 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $countRegIdx i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $countRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $countRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $count
  call $src/devices/Cpu/ALU#shl
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|76 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $count
  call $src/devices/Cpu/ALU#shl
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|77 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $imm i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $imm
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $imm
  call $src/devices/Cpu/ALU#shl
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|78 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $countRegIdx i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $countRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $countRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $count
  call $src/devices/Cpu/ALU#shl
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/ALU#shr (param $this i32) (param $value i32) (param $count i32) (result i32)
  (local $result i32)
  (local $carry i32)
  (local $i i32)
  (local $zero i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  local.get $value
  local.set $result
  i32.const 0
  local.set $carry
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $count
   i32.const 255
   i32.and
   i32.lt_u
   if
    local.get $result
    i32.const 1
    i32.and
    i32.eqz
    i32.eqz
    local.set $carry
    local.get $result
    i32.const 255
    i32.and
    i32.const 1
    i32.const 7
    i32.and
    i32.shr_u
    i32.const 255
    i32.and
    local.set $result
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  local.set $zero
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/AluResult#constructor
  local.tee $7
  i32.store
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  local.get $result
  call $src/devices/Cpu/AluResult#set:result
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $src/devices/Cpu/Flags#constructor
  local.tee $8
  i32.store offset=12
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  local.get $zero
  call $src/devices/Cpu/Flags#set:zero
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  local.get $carry
  call $src/devices/Cpu/Flags#set:carry
  local.get $8
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=8
  local.get $9
  call $src/devices/Cpu/AluResult#set:flags
  local.get $7
  local.set $9
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $9
  return
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|79 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $imm i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $imm
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regValue
  local.get $imm
  call $src/devices/Cpu/ALU#shr
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $regIdx
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|80 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $countRegIdx i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $countRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $countRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $count
  call $src/devices/Cpu/ALU#shr
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 3
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|81 (param $cpu i32)
  (local $regIdx i32)
  (local $regValue i32)
  (local $memAddress i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $regValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regValue
  local.get $count
  call $src/devices/Cpu/ALU#shr
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regIdx
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|82 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $imm i32)
  (local $aluResult i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $imm
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:alu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memValue
  local.get $imm
  call $src/devices/Cpu/ALU#shr
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/AluResult#get:flags
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $memAddress
  local.get $aluResult
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $cpu
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=8
  local.get $5
  call $src/devices/Cpu/Cpu#get:registers
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  local.get $5
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|83 (param $cpu i32)
  (local $memAddress i32)
  (local $memValue i32)
  (local $countRegIdx i32)
  (local $count i32)
  (local $aluResult i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  call $src/devices/Cpu/Cpu#readMemory
  local.set $memValue
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $countRegIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $countRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $count
  global.get $~lib/memory/__stack_pointer
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:alu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memValue
  local.get $count
  call $src/devices/Cpu/ALU#shr
  local.tee $aluResult
  i32.store offset=12
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:zero
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/AluResult#get:flags
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Flags#get:carry
  call $src/devices/Cpu/Cpu#setFlags
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $memAddress
  local.get $aluResult
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/AluResult#get:result
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|84 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $imm16 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $imm16
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regHighIdx
  local.get $imm16
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $regLowIdx
  local.get $imm16
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $cpu
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/Cpu#get:registers
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 5
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|85 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $memAddress i32)
  (local $low i32)
  (local $high i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem16
  local.set $memAddress
  local.get $memAddress
  i32.const 255
  i32.and
  local.set $low
  local.get $memAddress
  i32.const 65535
  i32.and
  i32.const 8
  i32.const 15
  i32.and
  i32.shr_u
  i32.const 255
  i32.and
  local.set $high
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regLowIdx
  local.get $low
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $regHighIdx
  local.get $high
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $cpu
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=8
  local.get $6
  call $src/devices/Cpu/Cpu#get:registers
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 5
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|86 (param $cpu i32)
  (local $destRegIdx i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $low i32)
  (local $high i32)
  (local $address i32)
  (local $value i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $destRegIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $regLowIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $low
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $regHighIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $high
  local.get $high
  i32.const 255
  i32.and
  i32.const 256
  i32.mul
  local.get $low
  i32.const 255
  i32.and
  i32.add
  local.set $address
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $address
  call $src/devices/Cpu/Cpu#readMemory
  local.set $value
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $destRegIdx
  local.get $value
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|87 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $srcRegIdx i32)
  (local $low i32)
  (local $high i32)
  (local $address i32)
  (local $value i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $srcRegIdx
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $regLowIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $low
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $regHighIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $high
  local.get $high
  i32.const 255
  i32.and
  i32.const 256
  i32.mul
  local.get $low
  i32.const 255
  i32.and
  i32.add
  local.set $address
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $srcRegIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $value
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $address
  local.get $value
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $cpu
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=8
  local.get $8
  call $src/devices/Cpu/Cpu#get:registers
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  local.get $8
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|88 (param $cpu i32)
  (local $regLowIdx i32)
  (local $regHighIdx i32)
  (local $immValue i32)
  (local $low i32)
  (local $high i32)
  (local $address i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regLowIdx
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 1
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $regHighIdx
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMem8
  local.set $immValue
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $regLowIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $low
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $regHighIdx
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $high
  local.get $high
  i32.const 255
  i32.and
  i32.const 256
  i32.mul
  local.get $low
  i32.const 255
  i32.and
  i32.add
  local.set $address
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $address
  local.get $immValue
  call $src/devices/Cpu/Cpu#writeMemory
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $cpu
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $7
  call $src/devices/Cpu/Cpu#get:registers
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=4
  local.get $7
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 4
  i32.add
  call $src/devices/Cpu/CpuRegisters#set:PC
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/InstructionActions#constructor (param $this i32) (param $run i32) (param $fetch i32) (param $execute i32) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 27
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $src/devices/Cpu/InstructionActions#set:run
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $src/devices/Cpu/InstructionActions#set:fetch
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $src/devices/Cpu/InstructionActions#set:execute
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $run
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/InstructionActions#set:run
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $fetch
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/InstructionActions#set:fetch
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $execute
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Cpu/InstructionActions#set:execute
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $src/devices/Cpu/fetchInstructionActions (param $opcode i32) (result i32)
  (local $run i32)
  (local $fetch i32)
  (local $execute i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  i32.const 0
  local.set $run
  i32.const 0
  local.set $fetch
  i32.const 0
  local.set $execute
  block $break|0
   block $case86|0
    block $case85|0
     block $case84|0
      block $case83|0
       block $case82|0
        block $case81|0
         block $case80|0
          block $case79|0
           block $case78|0
            block $case77|0
             block $case76|0
              block $case75|0
               block $case74|0
                block $case73|0
                 block $case72|0
                  block $case71|0
                   block $case70|0
                    block $case69|0
                     block $case68|0
                      block $case67|0
                       block $case66|0
                        block $case65|0
                         block $case64|0
                          block $case63|0
                           block $case62|0
                            block $case61|0
                             block $case60|0
                              block $case59|0
                               block $case58|0
                                block $case57|0
                                 block $case56|0
                                  block $case55|0
                                   block $case54|0
                                    block $case53|0
                                     block $case52|0
                                      block $case51|0
                                       block $case50|0
                                        block $case49|0
                                         block $case48|0
                                          block $case47|0
                                           block $case46|0
                                            block $case45|0
                                             block $case44|0
                                              block $case43|0
                                               block $case42|0
                                                block $case41|0
                                                 block $case40|0
                                                  block $case39|0
                                                   block $case38|0
                                                    block $case37|0
                                                     block $case36|0
                                                      block $case35|0
                                                       block $case34|0
                                                        block $case33|0
                                                         block $case32|0
                                                          block $case31|0
                                                           block $case30|0
                                                            block $case29|0
                                                             block $case28|0
                                                              block $case27|0
                                                               block $case26|0
                                                                block $case25|0
                                                                 block $case24|0
                                                                  block $case23|0
                                                                   block $case22|0
                                                                    block $case21|0
                                                                     block $case20|0
                                                                      block $case19|0
                                                                       block $case18|0
                                                                        block $case17|0
                                                                         block $case16|0
                                                                          block $case15|0
                                                                           block $case14|0
                                                                            block $case13|0
                                                                             block $case12|0
                                                                              block $case11|0
                                                                               block $case10|0
                                                                                block $case9|0
                                                                                 block $case8|0
                                                                                  block $case7|0
                                                                                   block $case6|0
                                                                                    block $case5|0
                                                                                     block $case4|0
                                                                                      block $case3|0
                                                                                       block $case2|0
                                                                                        block $case1|0
                                                                                         block $case0|0
                                                                                          local.get $opcode
                                                                                          local.set $4
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEBUG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case0|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.NOP
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case1|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.HALT
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case2|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEBUG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case3|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEBUG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case4|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEBUG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case5|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.EI
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case6|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DI
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case7|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.INT
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case8|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.IRET
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case9|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.INT3
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case10|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SET_SP_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case11|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SET_SP_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case12|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.GET_SP_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case13|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.CALL
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case14|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.RET
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case15|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JMP
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case16|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JC
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case17|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JNC
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case18|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JZ
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case19|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JNZ
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case20|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JL
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case21|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JLE
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case22|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case23|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.JGE
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case24|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XCHG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case25|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.MOV_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case26|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.MOV_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case27|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.MOV_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case28|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.MOV_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case29|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.MOV_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case30|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.PUSH_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case31|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.POP_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case32|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.INC_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case33|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.INC_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case34|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEC_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case35|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.DEC_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case36|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.NOT_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case37|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.NOT_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case38|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.ADD_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case39|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.ADD_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case40|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.ADD_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case41|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.ADD_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case42|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.ADD_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case43|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SUB_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case44|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SUB_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case45|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SUB_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case46|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SUB_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case47|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SUB_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case48|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.AND_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case49|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.AND_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case50|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.AND_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case51|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.AND_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case52|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.AND_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case53|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.OR_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case54|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.OR_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case55|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.OR_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case56|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.OR_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case57|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.OR_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case58|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XOR_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case59|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XOR_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case60|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XOR_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case61|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XOR_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case62|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.XOR_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case63|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.CMP_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case64|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.CMP_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case65|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.CMP_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case66|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.CMP_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case67|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.TEST_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case68|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.TEST_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case69|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.TEST_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case70|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.TEST_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case71|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHL_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case72|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHL_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case73|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHL_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case74|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHL_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case75|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHL_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case76|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHR_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case77|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHR_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case78|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHR_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case79|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHR_MEM_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case80|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.SHR_MEM_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case81|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.LEA_REG_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case82|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.LEA_REG_REG_MEM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case83|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.LDI_REG_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case84|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.STI_REG_REG_REG
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case85|0
                                                                                          local.get $4
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          global.get $src/cpu_instructions/Opcode.STI_REG_REG_IMM
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          i32.eq
                                                                                          br_if $case86|0
                                                                                          br $break|0
                                                                                         end
                                                                                         global.get $~lib/memory/__stack_pointer
                                                                                         i32.const 6976
                                                                                         local.tee $fetch
                                                                                         i32.store
                                                                                         global.get $~lib/memory/__stack_pointer
                                                                                         i32.const 7136
                                                                                         local.tee $execute
                                                                                         i32.store offset=4
                                                                                         br $break|0
                                                                                        end
                                                                                        global.get $~lib/memory/__stack_pointer
                                                                                        i32.const 7168
                                                                                        local.tee $execute
                                                                                        i32.store offset=4
                                                                                        br $break|0
                                                                                       end
                                                                                       global.get $~lib/memory/__stack_pointer
                                                                                       i32.const 7248
                                                                                       local.tee $execute
                                                                                       i32.store offset=4
                                                                                       br $break|0
                                                                                      end
                                                                                      global.get $~lib/memory/__stack_pointer
                                                                                      i32.const 7328
                                                                                      local.tee $run
                                                                                      i32.store offset=8
                                                                                      br $break|0
                                                                                     end
                                                                                     global.get $~lib/memory/__stack_pointer
                                                                                     i32.const 7904
                                                                                     local.tee $run
                                                                                     i32.store offset=8
                                                                                     br $break|0
                                                                                    end
                                                                                    global.get $~lib/memory/__stack_pointer
                                                                                    i32.const 8112
                                                                                    local.tee $run
                                                                                    i32.store offset=8
                                                                                    br $break|0
                                                                                   end
                                                                                   global.get $~lib/memory/__stack_pointer
                                                                                   i32.const 8144
                                                                                   local.tee $run
                                                                                   i32.store offset=8
                                                                                   br $break|0
                                                                                  end
                                                                                  global.get $~lib/memory/__stack_pointer
                                                                                  i32.const 8176
                                                                                  local.tee $run
                                                                                  i32.store offset=8
                                                                                  br $break|0
                                                                                 end
                                                                                 global.get $~lib/memory/__stack_pointer
                                                                                 i32.const 8640
                                                                                 local.tee $run
                                                                                 i32.store offset=8
                                                                                 br $break|0
                                                                                end
                                                                                global.get $~lib/memory/__stack_pointer
                                                                                i32.const 8672
                                                                                local.tee $run
                                                                                i32.store offset=8
                                                                                br $break|0
                                                                               end
                                                                               global.get $~lib/memory/__stack_pointer
                                                                               i32.const 8800
                                                                               local.tee $run
                                                                               i32.store offset=8
                                                                               br $break|0
                                                                              end
                                                                              global.get $~lib/memory/__stack_pointer
                                                                              i32.const 8832
                                                                              local.tee $run
                                                                              i32.store offset=8
                                                                              br $break|0
                                                                             end
                                                                             global.get $~lib/memory/__stack_pointer
                                                                             i32.const 8864
                                                                             local.tee $run
                                                                             i32.store offset=8
                                                                             br $break|0
                                                                            end
                                                                            global.get $~lib/memory/__stack_pointer
                                                                            i32.const 8944
                                                                            local.tee $run
                                                                            i32.store offset=8
                                                                            br $break|0
                                                                           end
                                                                           global.get $~lib/memory/__stack_pointer
                                                                           i32.const 8976
                                                                           local.tee $run
                                                                           i32.store offset=8
                                                                           br $break|0
                                                                          end
                                                                          global.get $~lib/memory/__stack_pointer
                                                                          i32.const 9008
                                                                          local.tee $run
                                                                          i32.store offset=8
                                                                          br $break|0
                                                                         end
                                                                         global.get $~lib/memory/__stack_pointer
                                                                         i32.const 9040
                                                                         local.tee $run
                                                                         i32.store offset=8
                                                                         br $break|0
                                                                        end
                                                                        global.get $~lib/memory/__stack_pointer
                                                                        i32.const 9136
                                                                        local.tee $run
                                                                        i32.store offset=8
                                                                        br $break|0
                                                                       end
                                                                       global.get $~lib/memory/__stack_pointer
                                                                       i32.const 9168
                                                                       local.tee $run
                                                                       i32.store offset=8
                                                                       br $break|0
                                                                      end
                                                                      global.get $~lib/memory/__stack_pointer
                                                                      i32.const 9200
                                                                      local.tee $run
                                                                      i32.store offset=8
                                                                      br $break|0
                                                                     end
                                                                     global.get $~lib/memory/__stack_pointer
                                                                     i32.const 9232
                                                                     local.tee $run
                                                                     i32.store offset=8
                                                                     br $break|0
                                                                    end
                                                                    global.get $~lib/memory/__stack_pointer
                                                                    i32.const 9264
                                                                    local.tee $run
                                                                    i32.store offset=8
                                                                    br $break|0
                                                                   end
                                                                   global.get $~lib/memory/__stack_pointer
                                                                   i32.const 9296
                                                                   local.tee $run
                                                                   i32.store offset=8
                                                                   br $break|0
                                                                  end
                                                                  global.get $~lib/memory/__stack_pointer
                                                                  i32.const 9328
                                                                  local.tee $run
                                                                  i32.store offset=8
                                                                  br $break|0
                                                                 end
                                                                 global.get $~lib/memory/__stack_pointer
                                                                 i32.const 9360
                                                                 local.tee $run
                                                                 i32.store offset=8
                                                                 br $break|0
                                                                end
                                                                global.get $~lib/memory/__stack_pointer
                                                                i32.const 9392
                                                                local.tee $fetch
                                                                i32.store
                                                                global.get $~lib/memory/__stack_pointer
                                                                i32.const 9424
                                                                local.tee $execute
                                                                i32.store offset=4
                                                                br $break|0
                                                               end
                                                               global.get $~lib/memory/__stack_pointer
                                                               i32.const 9456
                                                               local.tee $run
                                                               i32.store offset=8
                                                               br $break|0
                                                              end
                                                              global.get $~lib/memory/__stack_pointer
                                                              i32.const 9488
                                                              local.tee $run
                                                              i32.store offset=8
                                                              br $break|0
                                                             end
                                                             global.get $~lib/memory/__stack_pointer
                                                             i32.const 9520
                                                             local.tee $run
                                                             i32.store offset=8
                                                             br $break|0
                                                            end
                                                            global.get $~lib/memory/__stack_pointer
                                                            i32.const 9552
                                                            local.tee $run
                                                            i32.store offset=8
                                                            br $break|0
                                                           end
                                                           global.get $~lib/memory/__stack_pointer
                                                           i32.const 9584
                                                           local.tee $run
                                                           i32.store offset=8
                                                           br $break|0
                                                          end
                                                          global.get $~lib/memory/__stack_pointer
                                                          i32.const 9616
                                                          local.tee $run
                                                          i32.store offset=8
                                                          br $break|0
                                                         end
                                                         global.get $~lib/memory/__stack_pointer
                                                         i32.const 9648
                                                         local.tee $run
                                                         i32.store offset=8
                                                         br $break|0
                                                        end
                                                        global.get $~lib/memory/__stack_pointer
                                                        i32.const 9680
                                                        local.tee $run
                                                        i32.store offset=8
                                                        br $break|0
                                                       end
                                                       global.get $~lib/memory/__stack_pointer
                                                       i32.const 9712
                                                       local.tee $run
                                                       i32.store offset=8
                                                       br $break|0
                                                      end
                                                      global.get $~lib/memory/__stack_pointer
                                                      i32.const 9744
                                                      local.tee $run
                                                      i32.store offset=8
                                                      br $break|0
                                                     end
                                                     global.get $~lib/memory/__stack_pointer
                                                     i32.const 9776
                                                     local.tee $run
                                                     i32.store offset=8
                                                     br $break|0
                                                    end
                                                    global.get $~lib/memory/__stack_pointer
                                                    i32.const 9808
                                                    local.tee $run
                                                    i32.store offset=8
                                                    br $break|0
                                                   end
                                                   global.get $~lib/memory/__stack_pointer
                                                   i32.const 9840
                                                   local.tee $run
                                                   i32.store offset=8
                                                   br $break|0
                                                  end
                                                  global.get $~lib/memory/__stack_pointer
                                                  i32.const 9872
                                                  local.tee $run
                                                  i32.store offset=8
                                                  br $break|0
                                                 end
                                                 global.get $~lib/memory/__stack_pointer
                                                 i32.const 9904
                                                 local.tee $run
                                                 i32.store offset=8
                                                 br $break|0
                                                end
                                                global.get $~lib/memory/__stack_pointer
                                                i32.const 9936
                                                local.tee $run
                                                i32.store offset=8
                                                br $break|0
                                               end
                                               global.get $~lib/memory/__stack_pointer
                                               i32.const 9968
                                               local.tee $run
                                               i32.store offset=8
                                               br $break|0
                                              end
                                              global.get $~lib/memory/__stack_pointer
                                              i32.const 10000
                                              local.tee $run
                                              i32.store offset=8
                                              br $break|0
                                             end
                                             global.get $~lib/memory/__stack_pointer
                                             i32.const 10032
                                             local.tee $run
                                             i32.store offset=8
                                             br $break|0
                                            end
                                            global.get $~lib/memory/__stack_pointer
                                            i32.const 10064
                                            local.tee $run
                                            i32.store offset=8
                                            br $break|0
                                           end
                                           global.get $~lib/memory/__stack_pointer
                                           i32.const 10096
                                           local.tee $run
                                           i32.store offset=8
                                           br $break|0
                                          end
                                          global.get $~lib/memory/__stack_pointer
                                          i32.const 10128
                                          local.tee $run
                                          i32.store offset=8
                                          br $break|0
                                         end
                                         global.get $~lib/memory/__stack_pointer
                                         i32.const 10160
                                         local.tee $run
                                         i32.store offset=8
                                         br $break|0
                                        end
                                        global.get $~lib/memory/__stack_pointer
                                        i32.const 10192
                                        local.tee $run
                                        i32.store offset=8
                                        br $break|0
                                       end
                                       global.get $~lib/memory/__stack_pointer
                                       i32.const 10224
                                       local.tee $run
                                       i32.store offset=8
                                       br $break|0
                                      end
                                      global.get $~lib/memory/__stack_pointer
                                      i32.const 10256
                                      local.tee $run
                                      i32.store offset=8
                                      br $break|0
                                     end
                                     global.get $~lib/memory/__stack_pointer
                                     i32.const 10288
                                     local.tee $run
                                     i32.store offset=8
                                     br $break|0
                                    end
                                    global.get $~lib/memory/__stack_pointer
                                    i32.const 10320
                                    local.tee $run
                                    i32.store offset=8
                                    br $break|0
                                   end
                                   global.get $~lib/memory/__stack_pointer
                                   i32.const 10352
                                   local.tee $run
                                   i32.store offset=8
                                   br $break|0
                                  end
                                  global.get $~lib/memory/__stack_pointer
                                  i32.const 10384
                                  local.tee $run
                                  i32.store offset=8
                                  br $break|0
                                 end
                                 global.get $~lib/memory/__stack_pointer
                                 i32.const 10416
                                 local.tee $run
                                 i32.store offset=8
                                 br $break|0
                                end
                                global.get $~lib/memory/__stack_pointer
                                i32.const 10448
                                local.tee $run
                                i32.store offset=8
                                br $break|0
                               end
                               global.get $~lib/memory/__stack_pointer
                               i32.const 10480
                               local.tee $run
                               i32.store offset=8
                               br $break|0
                              end
                              global.get $~lib/memory/__stack_pointer
                              i32.const 10512
                              local.tee $run
                              i32.store offset=8
                              br $break|0
                             end
                             global.get $~lib/memory/__stack_pointer
                             i32.const 10544
                             local.tee $run
                             i32.store offset=8
                             br $break|0
                            end
                            global.get $~lib/memory/__stack_pointer
                            i32.const 10576
                            local.tee $run
                            i32.store offset=8
                            br $break|0
                           end
                           global.get $~lib/memory/__stack_pointer
                           i32.const 10608
                           local.tee $run
                           i32.store offset=8
                           br $break|0
                          end
                          global.get $~lib/memory/__stack_pointer
                          i32.const 10640
                          local.tee $run
                          i32.store offset=8
                          br $break|0
                         end
                         global.get $~lib/memory/__stack_pointer
                         i32.const 10672
                         local.tee $run
                         i32.store offset=8
                         br $break|0
                        end
                        global.get $~lib/memory/__stack_pointer
                        i32.const 10704
                        local.tee $run
                        i32.store offset=8
                        br $break|0
                       end
                       global.get $~lib/memory/__stack_pointer
                       i32.const 10736
                       local.tee $run
                       i32.store offset=8
                       br $break|0
                      end
                      global.get $~lib/memory/__stack_pointer
                      i32.const 10768
                      local.tee $run
                      i32.store offset=8
                      br $break|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     i32.const 10800
                     local.tee $run
                     i32.store offset=8
                     br $break|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    i32.const 10832
                    local.tee $run
                    i32.store offset=8
                    br $break|0
                   end
                   global.get $~lib/memory/__stack_pointer
                   i32.const 10864
                   local.tee $run
                   i32.store offset=8
                   br $break|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  i32.const 10896
                  local.tee $run
                  i32.store offset=8
                  br $break|0
                 end
                 global.get $~lib/memory/__stack_pointer
                 i32.const 10928
                 local.tee $run
                 i32.store offset=8
                 br $break|0
                end
                global.get $~lib/memory/__stack_pointer
                i32.const 10960
                local.tee $run
                i32.store offset=8
                br $break|0
               end
               global.get $~lib/memory/__stack_pointer
               i32.const 10992
               local.tee $run
               i32.store offset=8
               br $break|0
              end
              global.get $~lib/memory/__stack_pointer
              i32.const 11024
              local.tee $run
              i32.store offset=8
              br $break|0
             end
             global.get $~lib/memory/__stack_pointer
             i32.const 11056
             local.tee $run
             i32.store offset=8
             br $break|0
            end
            global.get $~lib/memory/__stack_pointer
            i32.const 11088
            local.tee $run
            i32.store offset=8
            br $break|0
           end
           global.get $~lib/memory/__stack_pointer
           i32.const 11120
           local.tee $run
           i32.store offset=8
           br $break|0
          end
          global.get $~lib/memory/__stack_pointer
          i32.const 11152
          local.tee $run
          i32.store offset=8
          br $break|0
         end
         global.get $~lib/memory/__stack_pointer
         i32.const 11184
         local.tee $run
         i32.store offset=8
         br $break|0
        end
        global.get $~lib/memory/__stack_pointer
        i32.const 11216
        local.tee $run
        i32.store offset=8
        br $break|0
       end
       global.get $~lib/memory/__stack_pointer
       i32.const 11248
       local.tee $run
       i32.store offset=8
       br $break|0
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 11280
      local.tee $run
      i32.store offset=8
      br $break|0
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 11312
     local.tee $run
     i32.store offset=8
     br $break|0
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 11344
    local.tee $run
    i32.store offset=8
    br $break|0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 11376
   local.tee $run
   i32.store offset=8
   br $break|0
  end
  i32.const 0
  local.get $run
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=12
  local.get $5
  local.get $fetch
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=16
  local.get $5
  local.get $execute
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=20
  local.get $5
  call $src/devices/Cpu/InstructionActions#constructor
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
  return
 )
 (func $src/devices/Cpu/Cpu#executeInstruction (param $this i32) (param $opcode i32) (param $skipBreakpoints i32)
  (local $memoryBus i32)
  (local $PcHex i32)
  (local $PC i32)
  (local $breakpoints i32)
  (local $breakpoint i32)
  (local $actions i32)
  (local $data i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 48
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/Cpu/Cpu#get:computer
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/Cpu/Cpu#get:registers
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $PcHex
  i32.store offset=12
  local.get $memoryBus
  i32.eqz
  if
   i32.const 6656
   local.get $PcHex
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=4
   local.get $13
   call $~lib/string/String#concat
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   call $src/external_functions/console.warn
   global.get $~lib/memory/__stack_pointer
   i32.const 48
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/Cpu/Cpu#get:registers
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Cpu/CpuRegisters#get:PC
  local.set $PC
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/Cpu/Cpu#get:computer
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Computer/Computer#get:breakpoints
  local.tee $breakpoints
  i32.store offset=16
  local.get $breakpoints
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  local.get $PC
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#has"
  if
   global.get $~lib/memory/__stack_pointer
   local.get $breakpoints
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   local.get $PC
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get"
   local.tee $breakpoint
   i32.store offset=20
   local.get $breakpoint
   i32.eqz
   if
    i32.const 6752
    i32.const 4352
    i32.const 107
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=4
   local.get $13
   call $src/devices/Cpu/Cpu#get:computer
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   call $src/devices/Computer/Computer#get:pendingBreakpointType
   global.get $src/devices/Computer/BreakpointType.NONE
   i32.eq
   if (result i32)
    local.get $skipBreakpoints
    i32.eqz
   else
    i32.const 0
   end
   if
    i32.const 6816
    local.get $PcHex
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $~lib/string/String#concat
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    call $src/external_functions/console.log
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $src/devices/Cpu/Cpu#get:computer
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    global.get $src/devices/Computer/BreakpointType.IDE
    call $src/devices/Computer/Computer#set:pendingBreakpointType
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    i32.const 1
    call $src/devices/Cpu/Cpu#set:isOnBreakpoint
    call $src/external_functions/jsCpu.breakpoint
    global.get $~lib/memory/__stack_pointer
    i32.const 48
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   else
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $src/devices/Cpu/Cpu#get:computer
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    global.get $src/devices/Computer/BreakpointType.NONE
    call $src/devices/Computer/Computer#set:pendingBreakpointType
   end
  else
   local.get $this
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=4
   local.get $13
   call $src/devices/Cpu/Cpu#get:computer
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   call $src/devices/Computer/Computer#get:pendingBreakpointType
   global.get $src/devices/Computer/BreakpointType.IDE
   i32.eq
   if
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $src/devices/Cpu/Cpu#get:computer
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    global.get $src/devices/Computer/BreakpointType.NONE
    call $src/devices/Computer/Computer#set:pendingBreakpointType
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $opcode
  call $src/devices/Cpu/fetchInstructionActions
  local.tee $actions
  i32.store offset=24
  local.get $actions
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Cpu/InstructionActions#get:execute
  if
   global.get $~lib/memory/__stack_pointer
   local.get $actions
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   call $src/devices/Cpu/InstructionActions#get:fetch
   if (result i32)
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    i32.const 1
    global.set $~argumentsLength
    local.get $actions
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $src/devices/Cpu/InstructionActions#get:fetch
    i32.load
    call_indirect (type $0)
   else
    i32.const 0
    i32.const 0
    call $~lib/typedarray/Uint8Array#constructor
   end
   local.tee $data
   i32.store offset=28
   local.get $this
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   local.get $data
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=4
   local.get $13
   i32.const 2
   global.set $~argumentsLength
   local.get $actions
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=32
   local.get $13
   call $src/devices/Cpu/InstructionActions#get:execute
   i32.load
   call_indirect (type $1)
   global.get $~lib/memory/__stack_pointer
   i32.const 48
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  else
   local.get $actions
   local.set $13
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store
   local.get $13
   call $src/devices/Cpu/InstructionActions#get:run
   if
    local.get $this
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store
    local.get $13
    i32.const 1
    global.set $~argumentsLength
    local.get $actions
    local.set $13
    global.get $~lib/memory/__stack_pointer
    local.get $13
    i32.store offset=4
    local.get $13
    call $src/devices/Cpu/InstructionActions#get:run
    i32.load
    call_indirect (type $2)
    global.get $~lib/memory/__stack_pointer
    i32.const 48
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $opcode
  i32.const 255
  i32.and
  i32.const 0
  call $src/utils/toHex
  local.tee $10
  i32.store offset=36
  global.get $~lib/memory/__stack_pointer
  local.get $opcode
  i32.const 10
  call $~lib/number/U8#toString
  local.tee $11
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $src/devices/Cpu/Cpu#get:registers
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  call $src/devices/Cpu/CpuRegisters#get:PC
  i32.const 65535
  i32.and
  i32.const 4
  call $src/utils/toHex
  local.tee $12
  i32.store offset=44
  i32.const 11536
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  i32.const 1
  local.get $10
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 11536
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  i32.const 3
  local.get $11
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 11536
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  i32.const 5
  local.get $12
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store offset=4
  local.get $13
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 11536
  local.set $13
  global.get $~lib/memory/__stack_pointer
  local.get $13
  i32.store
  local.get $13
  i32.const 2752
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 4352
  i32.const 152
  i32.const 9
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#runCpuCycle (param $this i32) (param $skipBreakpoints i32)
  (local $interrupt i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Cpu/Cpu#get:halted
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Computer/Computer#get:interruptManager
  local.tee $interrupt
  i32.store offset=8
  local.get $interrupt
  i32.eqz
  if
   i32.const 4288
   i32.const 4352
   i32.const 53
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  local.get $interrupt
  if (result i32)
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $src/devices/Cpu/Cpu#get:interruptsEnabled
  else
   i32.const 0
  end
  if (result i32)
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $src/devices/Cpu/Cpu#get:inInterruptHandler
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $interrupt
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $src/devices/InterruptManager/InterruptManager#hasPendingInterrupt
  else
   i32.const 0
  end
  if
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $src/devices/Cpu/Cpu#handleInterrupt
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Computer/Computer#get:pendingBreakpointType
  global.get $src/devices/Computer/BreakpointType.INT3
  i32.eq
  if
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $src/devices/Cpu/Cpu#get:computer
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   global.get $src/devices/Computer/BreakpointType.NONE
   call $src/devices/Computer/Computer#set:pendingBreakpointType
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/Cpu#get:cycles
  i64.const 1
  i64.add
  call $src/devices/Cpu/Cpu#set:cycles
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/Cpu/Cpu#fetchInstruction
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  call $src/devices/Cpu/Cpu#get:registers
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  call $src/devices/Cpu/CpuRegisters#get:IR
  local.get $skipBreakpoints
  call $src/devices/Cpu/Cpu#executeInstruction
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length_
  i32.ge_u
  if
   i32.const 256
   i32.const 2880
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4112
   i32.const 2880
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/console/console.warn (param $message i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $message
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/bindings/dom/console.warn
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#rehash" (param $this i32) (param $newBucketsMask i32)
  (local $newBucketsCapacity i32)
  (local $newBuckets i32)
  (local $newEntriesCapacity i32)
  (local $newEntries i32)
  (local $oldPtr i32)
  (local $oldEnd i32)
  (local $newPtr i32)
  (local $oldEntry i32)
  (local $newEntry i32)
  (local $oldEntryKey i32)
  (local $newBucketIndex i32)
  (local $newBucketPtrBase i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $newBucketsMask
  i32.const 1
  i32.add
  local.set $newBucketsCapacity
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $newBucketsCapacity
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $newBuckets
  i32.store
  local.get $newBucketsCapacity
  i32.const 8
  i32.mul
  i32.const 3
  i32.div_s
  local.set $newEntriesCapacity
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $newEntriesCapacity
  block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $newEntries
  i32.store offset=4
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.2"
  end
  i32.mul
  i32.add
  local.set $oldEnd
  local.get $newEntries
  local.set $newPtr
  loop $while-continue|0
   local.get $oldPtr
   local.get $oldEnd
   i32.ne
   if
    local.get $oldPtr
    local.set $oldEntry
    local.get $oldEntry
    call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:value"
     local.set $14
     global.get $~lib/memory/__stack_pointer
     local.get $14
     i32.store offset=8
     local.get $14
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:value"
     local.get $oldEntryKey
     call $~lib/util/hash/HASH<u8>
     local.get $newBucketsMask
     i32.and
     local.set $newBucketIndex
     local.get $newBuckets
     local.get $newBucketIndex
     i32.const 4
     i32.mul
     i32.add
     local.set $newBucketPtrBase
     local.get $newEntry
     local.get $newBucketPtrBase
     i32.load
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newBuckets
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:buckets"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newBucketsMask
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:bucketsMask"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newEntries
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entries"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newEntriesCapacity
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCapacity"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCount"
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesOffset"
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
  (local $hashCode i32)
  (local $entry i32)
  (local $entries i32)
  (local $6 i32)
  (local $bucketPtrBase i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $key
  call $~lib/util/hash/HASH<u8>
  local.set $hashCode
  local.get $this
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $key
  local.get $hashCode
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/itcms/__link
  else
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesOffset"
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    local.get $8
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store offset=4
    local.get $8
    call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCount"
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store offset=4
    local.get $8
    call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     local.set $8
     global.get $~lib/memory/__stack_pointer
     local.get $8
     i32.store offset=4
     local.get $8
     call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:bucketsMask"
    else
     local.get $this
     local.set $8
     global.get $~lib/memory/__stack_pointer
     local.get $8
     i32.store offset=4
     local.get $8
     call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#rehash"
   end
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entries"
   local.tee $entries
   i32.store offset=8
   local.get $entries
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=4
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:key"
   i32.const 0
   drop
   local.get $entry
   local.get $value
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/itcms/__link
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=4
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set:entriesCount"
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:buckets"
   local.get $hashCode
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $8
  return
 )
 (func $src/devices/InterruptManager/InterruptManager#requestInterrupt (param $this i32) (param $irq i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $irq
  i32.const 255
  i32.and
  i32.const 0
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $irq
   i32.const 255
   i32.and
   i32.const 7
   i32.gt_u
  end
  if
   i32.const 11696
   local.get $irq
   i32.const 10
   call $~lib/number/U8#toString
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $~lib/string/String#concat
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $~lib/console/console.warn
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:irqsCpuHandler
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $irq
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:defaultIrqCpuHandler
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#set"
  drop
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/InterruptManager/InterruptManager#get:pending
  i32.const 1
  local.get $irq
  i32.const 7
  i32.and
  i32.shl
  i32.or
  call $src/devices/InterruptManager/InterruptManager#set:pending
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#tick (param $this i32)
  (local $newVal i32)
  (local $interrupt i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/interrupt_timer/InterruptTimerDevice#get:enabled
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/interrupt_timer/InterruptTimerDevice#get:counter
  i32.const 1
  i32.add
  local.set $newVal
  local.get $newVal
  i32.const 255
  i32.and
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $src/devices/interrupt_timer/InterruptTimerDevice#get:period
  i32.const 255
  i32.and
  i32.ge_u
  if
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $src/devices/interrupt_timer/InterruptTimerDevice#get:computer
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $src/devices/Computer/Computer#get:interruptManager
   local.tee $interrupt
   i32.store offset=8
   local.get $interrupt
   if
    local.get $interrupt
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    global.get $src/memory_map/IRQ_MAP.IRQ_TIMER
    call $src/devices/InterruptManager/InterruptManager#requestInterrupt
   else
    i32.const 11760
    call $~lib/console/console.warn
   end
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   i32.const 0
   call $src/devices/interrupt_timer/InterruptTimerDevice#set:counter
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $newVal
  call $src/devices/interrupt_timer/InterruptTimerDevice#set:counter
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerRunCycles (param $computer i32) (param $cycles i32) (param $skipBreakpoints i32) (result i32)
  (local $canContinue i32)
  (local $i i32)
  (local $cpu i32)
  (local $i|6 i32)
  (local $i|7 i32)
  (local $cpu|8 i32)
  (local $timers i32)
  (local $i|10 i32)
  (local $timer i32)
  (local $12 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  i32.const 1
  local.set $canContinue
  local.get $computer
  local.set $12
  global.get $~lib/memory/__stack_pointer
  local.get $12
  i32.store offset=4
  local.get $12
  call $src/devices/Computer/Computer#get:cpus
  local.set $12
  global.get $~lib/memory/__stack_pointer
  local.get $12
  i32.store
  local.get $12
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   i32.const 0
   local.set $i
   loop $for-loop|0
    local.get $i
    local.get $computer
    local.set $12
    global.get $~lib/memory/__stack_pointer
    local.get $12
    i32.store offset=4
    local.get $12
    call $src/devices/Computer/Computer#get:cpus
    local.set $12
    global.get $~lib/memory/__stack_pointer
    local.get $12
    i32.store
    local.get $12
    call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
    i32.lt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $computer
     local.set $12
     global.get $~lib/memory/__stack_pointer
     local.get $12
     i32.store offset=4
     local.get $12
     call $src/devices/Computer/Computer#get:cpus
     local.set $12
     global.get $~lib/memory/__stack_pointer
     local.get $12
     i32.store
     local.get $12
     local.get $i
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
     local.tee $cpu
     i32.store offset=8
     local.get $cpu
     local.set $12
     global.get $~lib/memory/__stack_pointer
     local.get $12
     i32.store
     local.get $12
     i32.const 0
     call $src/devices/Cpu/Cpu#set:isOnBreakpoint
     local.get $i
     i32.const 1
     i32.add
     local.set $i
     br $for-loop|0
    end
   end
   i32.const 0
   local.set $i|6
   loop $for-loop|1
    local.get $i|6
    local.get $cycles
    i32.lt_u
    if
     i32.const 0
     local.set $i|7
     loop $for-loop|2
      local.get $i|7
      local.get $computer
      local.set $12
      global.get $~lib/memory/__stack_pointer
      local.get $12
      i32.store offset=4
      local.get $12
      call $src/devices/Computer/Computer#get:cpus
      local.set $12
      global.get $~lib/memory/__stack_pointer
      local.get $12
      i32.store
      local.get $12
      call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
      i32.lt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $computer
       local.set $12
       global.get $~lib/memory/__stack_pointer
       local.get $12
       i32.store offset=4
       local.get $12
       call $src/devices/Computer/Computer#get:cpus
       local.set $12
       global.get $~lib/memory/__stack_pointer
       local.get $12
       i32.store
       local.get $12
       local.get $i|7
       call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
       local.tee $cpu|8
       i32.store offset=12
       local.get $cpu|8
       i32.eqz
       if
        i32.const 4240
        local.get $i|7
        i32.const 10
        call $~lib/number/I32#toString
        local.set $12
        global.get $~lib/memory/__stack_pointer
        local.get $12
        i32.store
        local.get $12
        call $~lib/string/String#concat
        i32.const 3936
        i32.const 89
        i32.const 27
        call $~lib/builtins/abort
        unreachable
       end
       local.get $cpu|8
       local.set $12
       global.get $~lib/memory/__stack_pointer
       local.get $12
       i32.store
       local.get $12
       call $src/devices/Cpu/Cpu#get:isOnBreakpoint
       if (result i32)
        i32.const 1
       else
        local.get $cpu|8
        local.set $12
        global.get $~lib/memory/__stack_pointer
        local.get $12
        i32.store
        local.get $12
        call $src/devices/Cpu/Cpu#get:halted
       end
       if
        i32.const 0
        local.set $canContinue
       else
        local.get $cpu|8
        local.set $12
        global.get $~lib/memory/__stack_pointer
        local.get $12
        i32.store
        local.get $12
        local.get $skipBreakpoints
        call $src/devices/Cpu/Cpu#runCpuCycle
       end
       local.get $i|7
       i32.const 1
       i32.add
       local.set $i|7
       br $for-loop|2
      end
     end
     local.get $i|6
     i32.const 1
     i32.add
     local.set $i|6
     br $for-loop|1
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $12
   global.get $~lib/memory/__stack_pointer
   local.get $12
   i32.store
   local.get $12
   call $src/devices/Computer/Computer#get:timers
   local.tee $timers
   i32.store offset=16
   local.get $timers
   i32.eqz
   if
    i32.const 11584
    i32.const 3936
    i32.const 102
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 0
   local.set $i|10
   loop $for-loop|3
    local.get $i|10
    local.get $timers
    local.set $12
    global.get $~lib/memory/__stack_pointer
    local.get $12
    i32.store
    local.get $12
    call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length
    i32.lt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $timers
     local.set $12
     global.get $~lib/memory/__stack_pointer
     local.get $12
     i32.store
     local.get $12
     local.get $i|10
     call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#__get
     local.tee $timer
     i32.store offset=20
     local.get $timer
     i32.eqz
     if
      i32.const 11632
      local.get $i|10
      i32.const 10
      call $~lib/number/I32#toString
      local.set $12
      global.get $~lib/memory/__stack_pointer
      local.get $12
      i32.store
      local.get $12
      call $~lib/string/String#concat
      i32.const 3936
      i32.const 106
      i32.const 25
      call $~lib/builtins/abort
      unreachable
     end
     local.get $timer
     local.set $12
     global.get $~lib/memory/__stack_pointer
     local.get $12
     i32.store
     local.get $12
     call $src/devices/interrupt_timer/InterruptTimerDevice#tick
     local.get $i|10
     i32.const 1
     i32.add
     local.set $i|10
     br $for-loop|3
    end
   end
  end
  local.get $canContinue
  local.set $12
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $12
  return
 )
 (func $src/index/computerRunCycles@varargs (param $computer i32) (param $cycles i32) (param $skipBreakpoints i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 2
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   local.set $skipBreakpoints
  end
  local.get $computer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $cycles
  local.get $skipBreakpoints
  call $src/index/computerRunCycles
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $src/devices/Cpu/Cpu#getCpuCycles (param $this i32) (result i64)
  (local $1 i32)
  (local $2 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $src/devices/Cpu/Cpu#get:cycles
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetCycles (param $computer i32) (result i64)
  (local $cpu i32)
  (local $2 i32)
  (local $3 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/Cpu#getCpuCycles
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  i64.const 0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/index/computerGetRegisterPC (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:PC
   i32.const 65535
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterSP (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:SP
   i32.const 65535
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterIR (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:IR
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterA (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:A
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterB (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:B
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterC (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:C
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterD (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:D
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterE (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:E
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetRegisterF (param $computer i32) (result i32)
  (local $cpu i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $computer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $src/devices/Computer/Computer#get:cpus
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $computer
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Computer/Computer#get:cpus
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.const 0
   call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
   local.tee $cpu
   i32.store offset=8
   local.get $cpu
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $src/devices/Cpu/Cpu#get:registers
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   call $src/devices/Cpu/CpuRegisters#get:F
   i32.const 255
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $src/index/computerGetMemory (param $computer i32) (param $address i32) (result i32)
  (local $memoryBus i32)
  (local $value i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=4
  local.get $memoryBus
  if (result i32)
   i32.const 11888
  else
   i32.const 0
  end
  if
   local.get $memoryBus
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   local.get $address
   call $src/devices/Memory/MemoryBus#read
   local.set $value
   local.get $value
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  i32.const 0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $src/index/computerSetMemory (param $computer i32) (param $address i32) (param $value i32)
  (local $memoryBus i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $src/devices/Computer/Computer#get:memoryBus
  local.tee $memoryBus
  i32.store offset=4
  local.get $memoryBus
  if
   local.get $memoryBus
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   local.get $4
   local.get $address
   local.get $value
   call $src/devices/Memory/MemoryBus#write
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerAddDevice (param $computer i32) (param $namePtr i32) (param $nameLen i32) (param $typeId i32) (result i32)
  (local $ioManager i32)
  (local $name i32)
  (local $i i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $src/devices/Computer/Computer#get:ioManager
  local.tee $ioManager
  i32.store offset=4
  local.get $ioManager
  i32.eqz
  if
   i32.const 11920
   i32.const 3936
   i32.const 240
   i32.const 21
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2752
  local.tee $name
  i32.store offset=8
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $nameLen
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $name
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $namePtr
    local.get $i
    i32.add
    i32.load8_u
    i32.const 1
    global.set $~argumentsLength
    i32.const 0
    call $~lib/string/String.fromCharCode@varargs
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=12
    local.get $7
    call $~lib/string/String.__concat
    local.tee $name
    i32.store offset=8
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $ioManager
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  local.get $name
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=12
  local.get $7
  local.get $typeId
  call $src/devices/IoManager/IoManager#addDevice
  i32.const 255
  i32.and
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/devices/Memory/Memory#reset (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $src/devices/Memory/Memory#get:size
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Memory/Memory#set:storage
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#resetDevices (param $this i32)
  (local $i i32)
  (local $device i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $src/devices/IoManager/IoManager#get:devices
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   local.get $3
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
   i32.lt_s
   if
    block $for-continue|0
     global.get $~lib/memory/__stack_pointer
     local.get $this
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $3
     call $src/devices/IoManager/IoManager#get:devices
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     local.get $i
     call $~lib/array/Array<src/devices/IoManager/IoDevice>#__get
     local.tee $device
     i32.store offset=8
     local.get $device
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     call $src/devices/IoManager/IoDevice#get:typeId
     i32.const 255
     i32.and
     i32.const 0
     i32.eq
     if
      br $for-continue|0
     end
     local.get $device
     if
      local.get $i
      call $src/external_functions/jsIo.reset
     end
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#resetCpu (param $this i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/Cpu/CpuRegisters#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $src/devices/Cpu/Cpu#set:registers
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Cpu#set:halted
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i64.const 0
  call $src/devices/Cpu/Cpu#set:cycles
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Cpu#set:isOnBreakpoint
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 1
  call $src/devices/Cpu/Cpu#set:interruptsEnabled
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $src/devices/Cpu/Cpu#set:inInterruptHandler
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#reloadDevices (param $this i32)
  (local $i i32)
  (local $device i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  global.get $src/memory_map/MEMORY_MAP.DEVICE_STRINGS_START
  call $src/devices/IoManager/IoManager#set:stringCursor
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   local.set $6
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   local.get $6
   call $src/devices/IoManager/IoManager#get:devices
   local.set $6
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   local.get $6
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $this
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    call $src/devices/IoManager/IoManager#get:devices
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $i
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#__get
    local.tee $device
    i32.store offset=8
    local.get $device
    if
     global.get $~lib/memory/__stack_pointer
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     call $src/devices/IoManager/IoDevice#get:idx
     i32.const 10
     call $~lib/number/U8#toString
     local.tee $3
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     call $src/devices/IoManager/IoDevice#get:name
     local.tee $4
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     call $src/devices/IoManager/IoDevice#get:typeId
     i32.const 10
     call $~lib/number/U8#toString
     local.tee $5
     i32.store offset=20
     i32.const 12144
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     i32.const 1
     local.get $3
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 12144
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     i32.const 3
     local.get $4
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 12144
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     i32.const 5
     local.get $5
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 12144
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     i32.const 2752
     call $~lib/staticarray/StaticArray<~lib/string/String>#join
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     call $src/external_functions/console.log
     local.get $this
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $src/devices/IoManager/IoDevice#get:idx
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $src/devices/IoManager/IoDevice#get:name
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     local.get $6
     local.get $device
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=24
     local.get $6
     call $src/devices/IoManager/IoDevice#get:typeId
     call $src/devices/IoManager/IoManager#writeDeviceTableEntry
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerResetComputer (param $computer i32)
  (local $ram i32)
  (local $ioManager i32)
  (local $i i32)
  (local $cpu i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Computer/Computer#get:ram
  local.tee $ram
  i32.store offset=4
  local.get $ram
  if
   local.get $ram
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $src/devices/Memory/Memory#reset
  end
  global.get $~lib/memory/__stack_pointer
  local.get $computer
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $src/devices/Computer/Computer#get:ioManager
  local.tee $ioManager
  i32.store offset=8
  local.get $ioManager
  if
   local.get $ioManager
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $src/devices/IoManager/IoManager#resetDevices
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $computer
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=12
   local.get $5
   call $src/devices/Computer/Computer#get:cpus
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $computer
    local.set $5
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=12
    local.get $5
    call $src/devices/Computer/Computer#get:cpus
    local.set $5
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store
    local.get $5
    local.get $i
    call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
    local.tee $cpu
    i32.store offset=16
    local.get $cpu
    local.set $5
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store
    local.get $5
    call $src/devices/Cpu/Cpu#resetCpu
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $ioManager
  if
   local.get $ioManager
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $src/devices/IoManager/IoManager#reloadDevices
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<u16>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<u16>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<u16>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<u16>#get:length_
  i32.ge_u
  if
   i32.const 256
   i32.const 2880
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<u16>#get:dataStart
  local.get $index
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  local.set $value
  i32.const 0
  drop
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/array/Array<~lib/string/String>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<~lib/string/String>#get:length_
  i32.ge_u
  if
   i32.const 256
   i32.const 2880
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<~lib/string/String>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4112
   i32.const 2880
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $src/devices/Computer/Breakpoint#constructor (param $this i32) (param $address i32) (param $file i32) (param $line i32) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 10
   i32.const 17
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $src/devices/Computer/Breakpoint#set:address
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 12192
  call $src/devices/Computer/Breakpoint#set:file
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $src/devices/Computer/Breakpoint#set:line
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $address
  call $src/devices/Computer/Breakpoint#set:address
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $file
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  call $src/devices/Computer/Breakpoint#set:file
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $line
  call $src/devices/Computer/Breakpoint#set:line
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#rehash" (param $this i32) (param $newBucketsMask i32)
  (local $newBucketsCapacity i32)
  (local $newBuckets i32)
  (local $newEntriesCapacity i32)
  (local $newEntries i32)
  (local $oldPtr i32)
  (local $oldEnd i32)
  (local $newPtr i32)
  (local $oldEntry i32)
  (local $newEntry i32)
  (local $oldEntryKey i32)
  (local $newBucketIndex i32)
  (local $newBucketPtrBase i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $newBucketsMask
  i32.const 1
  i32.add
  local.set $newBucketsCapacity
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $newBucketsCapacity
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $newBuckets
  i32.store
  local.get $newBucketsCapacity
  i32.const 8
  i32.mul
  i32.const 3
  i32.div_s
  local.set $newEntriesCapacity
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $newEntriesCapacity
  block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $newEntries
  i32.store offset=4
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.2"
  end
  i32.mul
  i32.add
  local.set $oldEnd
  local.get $newEntries
  local.set $newPtr
  loop $while-continue|0
   local.get $oldPtr
   local.get $oldEnd
   i32.ne
   if
    local.get $oldPtr
    local.set $oldEntry
    local.get $oldEntry
    call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:value"
     local.set $14
     global.get $~lib/memory/__stack_pointer
     local.get $14
     i32.store offset=8
     local.get $14
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:value"
     local.get $oldEntryKey
     call $~lib/util/hash/HASH<u16>
     local.get $newBucketsMask
     i32.and
     local.set $newBucketIndex
     local.get $newBuckets
     local.get $newBucketIndex
     i32.const 4
     i32.mul
     i32.add
     local.set $newBucketPtrBase
     local.get $newEntry
     local.get $newBucketPtrBase
     i32.load
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newBuckets
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:buckets"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newBucketsMask
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:bucketsMask"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newEntries
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entries"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $newEntriesCapacity
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCapacity"
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=8
  local.get $14
  local.get $this
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store offset=12
  local.get $14
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCount"
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesOffset"
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
  (local $hashCode i32)
  (local $entry i32)
  (local $entries i32)
  (local $6 i32)
  (local $bucketPtrBase i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $key
  call $~lib/util/hash/HASH<u16>
  local.set $hashCode
  local.get $this
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $key
  local.get $hashCode
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/itcms/__link
  else
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesOffset"
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    local.get $8
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store offset=4
    local.get $8
    call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCount"
    local.get $this
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store offset=4
    local.get $8
    call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     local.set $8
     global.get $~lib/memory/__stack_pointer
     local.get $8
     i32.store offset=4
     local.get $8
     call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:bucketsMask"
    else
     local.get $this
     local.set $8
     global.get $~lib/memory/__stack_pointer
     local.get $8
     i32.store offset=4
     local.get $8
     call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#rehash"
   end
   global.get $~lib/memory/__stack_pointer
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entries"
   local.tee $entries
   i32.store offset=8
   local.get $entries
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=4
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:key"
   i32.const 0
   drop
   local.get $entry
   local.get $value
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/itcms/__link
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=4
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set:entriesCount"
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:buckets"
   local.get $hashCode
   local.get $this
   local.set $8
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   local.get $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $8
  return
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:size" (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesCount"
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/console/console.log (param $message i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $message
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/bindings/dom/console.log
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Computer/Computer#setBreakpoints (param $this i32) (param $addresses i32) (param $files i32) (param $lines i32)
  (local $i i32)
  (local $address i32)
  (local $file i32)
  (local $line i32)
  (local $breakpoint i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  i32.const 0
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor"
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $src/devices/Computer/Computer#set:breakpoints
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $addresses
   local.set $9
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store
   local.get $9
   call $~lib/array/Array<u16>#get:length
   i32.lt_s
   if
    local.get $addresses
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store
    local.get $9
    local.get $i
    call $~lib/array/Array<u16>#__get
    local.set $address
    global.get $~lib/memory/__stack_pointer
    local.get $files
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store
    local.get $9
    local.get $i
    call $~lib/array/Array<~lib/string/String>#__get
    local.tee $file
    i32.store offset=8
    local.get $lines
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store
    local.get $9
    local.get $i
    call $~lib/array/Array<u16>#__get
    local.set $line
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    local.get $address
    local.get $file
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store
    local.get $9
    local.get $line
    call $src/devices/Computer/Breakpoint#constructor
    local.tee $breakpoint
    i32.store offset=12
    local.get $this
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store offset=16
    local.get $9
    call $src/devices/Computer/Computer#get:breakpoints
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store
    local.get $9
    local.get $address
    local.get $breakpoint
    local.set $9
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store offset=4
    local.get $9
    call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set"
    drop
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 12240
  local.get $this
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=20
  local.get $9
  call $src/devices/Computer/Computer#get:breakpoints
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=16
  local.get $9
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:size"
  i32.const 10
  call $~lib/number/I32#toString
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=4
  local.get $9
  call $~lib/string/String#concat
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store
  local.get $9
  call $~lib/console/console.log
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerSetBreakpoints (param $computer i32) (param $addresses i32) (param $files i32) (param $lines i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $computer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $addresses
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $files
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  local.get $4
  local.get $lines
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $4
  call $src/devices/Computer/Computer#setBreakpoints
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/Cpu/Cpu>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#__visit" (param $this i32) (param $cookie i32)
  (local $entries i32)
  (local $cur i32)
  (local $end i32)
  (local $entry i32)
  (local $val i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:buckets"
  local.get $cookie
  call $~lib/rt/itcms/__visit
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entries"
  local.set $entries
  i32.const 1
  drop
  local.get $entries
  local.set $cur
  local.get $cur
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.6" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.6"
  end
  i32.mul
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     i32.const 0
     drop
     i32.const 1
     drop
     local.get $entry
     call $"~lib/map/MapEntry<u16,src/devices/Computer/Breakpoint>#get:value"
     local.set $val
     i32.const 0
     drop
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    block $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.7" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u16,src/devices/Computer/Breakpoint>|inlined.7"
    end
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $entries
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#__visit" (param $this i32) (param $cookie i32)
  (local $entries i32)
  (local $cur i32)
  (local $end i32)
  (local $entry i32)
  (local $val i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:buckets"
  local.get $cookie
  call $~lib/rt/itcms/__visit
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entries"
  local.set $entries
  i32.const 1
  drop
  local.get $entries
  local.set $cur
  local.get $cur
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.6" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.6"
  end
  i32.mul
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     i32.const 0
     drop
     i32.const 1
     drop
     local.get $entry
     call $"~lib/map/MapEntry<u8,src/devices/InterruptManager/CpuCoreInfo>#get:value"
     local.set $val
     i32.const 0
     drop
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    block $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.7" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u8,src/devices/InterruptManager/CpuCoreInfo>|inlined.7"
    end
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $entries
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<src/devices/interrupt_timer/InterruptTimerDevice>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<i32>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 0
  drop
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<i32>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/function/Function<%28this:src/devices/Memory/Memory%2Cu16%29=>u8>#get:_env
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>~lib/typedarray/Uint8Array>#get:_env
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%2C~lib/typedarray/Uint8Array%29=>void>#get:_env
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/function/Function<%28src/devices/Cpu/Cpu%29=>void>#get:_env
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/function/Function<%28this:src/devices/Memory/MemoryBus%2Cu16%29=>u8>#get:_env
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<u16>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 0
  drop
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<u16>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<~lib/string/String>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<~lib/string/String>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<~lib/string/String>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<~lib/string/String>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/rt/__newArray (param $length i32) (param $alignLog2 i32) (param $id i32) (param $data i32) (result i32)
  (local $bufferSize i32)
  (local $buffer i32)
  (local $array i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $length
  local.get $alignLog2
  i32.shl
  local.set $bufferSize
  global.get $~lib/memory/__stack_pointer
  local.get $bufferSize
  i32.const 1
  local.get $data
  call $~lib/rt/__newBuffer
  local.tee $buffer
  i32.store
  i32.const 16
  local.get $id
  call $~lib/rt/itcms/__new
  local.set $array
  local.get $array
  local.get $buffer
  i32.store
  local.get $array
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $array
  local.get $buffer
  i32.store offset=4
  local.get $array
  local.get $bufferSize
  i32.store offset=8
  local.get $array
  local.get $length
  i32.store offset=12
  local.get $array
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $this i32) (param $length i32) (result i32)
  (local $buffer i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $length
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 496
   i32.const 544
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $length
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $buffer
  i32.store
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/staticarray/StaticArray<u8>#constructor (param $this i32) (param $length i32) (result i32)
  (local $outSize i32)
  (local $out i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $length
  i32.const 1073741820
  i32.const 0
  i32.shr_u
  i32.gt_u
  if
   i32.const 496
   i32.const 640
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  i32.const 0
  i32.shl
  local.set $outSize
  global.get $~lib/memory/__stack_pointer
  local.get $outSize
  i32.const 8
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $out
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/util/number/utoa32 (param $value i32) (param $radix i32) (result i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|7 i32)
  (local $buffer|8 i32)
  (local $num|9 i32)
  (local $offset|10 i32)
  (local $decimals|11 i32)
  (local $12 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 896
   i32.const 1024
   i32.const 350
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 1088
   local.set $12
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $12
   return
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   call $~lib/util/number/decimalCount32
   local.set $decimals
   global.get $~lib/memory/__stack_pointer
   local.get $decimals
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $out
   i32.store
   local.get $out
   local.set $buffer
   local.get $value
   local.set $num
   local.get $decimals
   local.set $offset
   i32.const 0
   i32.const 1
   i32.ge_s
   drop
   local.get $buffer
   local.get $num
   local.get $offset
   call $~lib/util/number/utoa32_dec_lut
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 31
    local.get $value
    i32.clz
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|7
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|7
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.set $buffer|8
    local.get $value
    local.set $num|9
    local.get $decimals|7
    local.set $offset|10
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|8
    local.get $num|9
    i64.extend_i32_u
    local.get $offset|10
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|11
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|11
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.get $value
    i64.extend_i32_u
    local.get $decimals|11
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $out
  local.set $12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $12
  return
 )
 (func $~lib/object/Object#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/util/number/itoa32 (param $value i32) (param $radix i32) (result i32)
  (local $sign i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|8 i32)
  (local $buffer|9 i32)
  (local $num|10 i32)
  (local $offset|11 i32)
  (local $val32 i32)
  (local $decimals|13 i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 896
   i32.const 1024
   i32.const 373
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 1088
   local.set $14
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $14
   return
  end
  local.get $value
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.shl
  local.set $sign
  local.get $sign
  if
   i32.const 0
   local.get $value
   i32.sub
   local.set $value
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   call $~lib/util/number/decimalCount32
   local.set $decimals
   global.get $~lib/memory/__stack_pointer
   local.get $decimals
   i32.const 1
   i32.shl
   local.get $sign
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $out
   i32.store
   local.get $out
   local.get $sign
   i32.add
   local.set $buffer
   local.get $value
   local.set $num
   local.get $decimals
   local.set $offset
   i32.const 0
   i32.const 1
   i32.ge_s
   drop
   local.get $buffer
   local.get $num
   local.get $offset
   call $~lib/util/number/utoa32_dec_lut
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 31
    local.get $value
    i32.clz
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|8
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|8
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.get $sign
    i32.add
    local.set $buffer|9
    local.get $value
    local.set $num|10
    local.get $decimals|8
    local.set $offset|11
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|9
    local.get $num|10
    i64.extend_i32_u
    local.get $offset|11
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    local.set $val32
    local.get $val32
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|13
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|13
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.get $sign
    i32.add
    local.get $val32
    i64.extend_i32_u
    local.get $decimals|13
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $sign
  if
   local.get $out
   i32.const 45
   i32.store16
  end
  local.get $out
  local.set $14
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $14
  return
 )
 (func $src/index/allocate (param $size i32) (result i32)
  (local $buf i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $size
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $buf
  i32.store
  local.get $buf
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $~lib/string/String.fromCharCode (param $unit i32) (param $surr i32) (result i32)
  (local $hasSur i32)
  (local $out i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $surr
  i32.const 0
  i32.gt_s
  local.set $hasSur
  global.get $~lib/memory/__stack_pointer
  i32.const 2
  local.get $hasSur
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store
  local.get $out
  local.get $unit
  i32.store16
  local.get $hasSur
  if
   local.get $out
   local.get $surr
   i32.store16 offset=2
  end
  local.get $out
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $export:src/index/computerloadCodeInROM (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/index/computerloadCodeInROM
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:src/index/computerloadCodeInRAM (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/index/computerloadCodeInRAM
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:src/index/computerRunCycles@varargs (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/index/computerRunCycles@varargs
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $export:src/index/computerGetCycles (param $0 i32) (result i64)
  (local $1 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetCycles
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterPC (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterPC
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterSP (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterSP
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterIR (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterIR
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterA (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterA
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterB (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterB
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterC (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterC
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterD (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterD
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterE (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterE
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetRegisterF (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerGetRegisterF
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:src/index/computerGetMemory (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/index/computerGetMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:src/index/computerSetMemory (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/index/computerSetMemory
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:src/index/computerAddDevice (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $src/index/computerAddDevice
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $export:src/index/computerResetComputer (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/index/computerResetComputer
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:src/index/computerSetBreakpoints (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $src/index/computerSetBreakpoints
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
