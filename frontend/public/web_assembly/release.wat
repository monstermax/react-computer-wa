(module
 (type $0 (func (param i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32) (result i32)))
 (type $3 (func (param i32 i32 i32)))
 (type $4 (func (param i32 i32)))
 (type $5 (func))
 (type $6 (func (result i32)))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i64)))
 (type $9 (func (param i32) (result i64)))
 (type $10 (func (param i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "wasmConsoleLog" (func $src/external_functions/console.log (param i32)))
 (import "env" "jsIoWrite" (func $src/external_functions/jsIo.write (param i32 i32 i32)))
 (import "env" "wasmConsoleWarn" (func $src/external_functions/console.warn (param i32)))
 (import "env" "jsIoRead" (func $src/external_functions/jsIo.read (param i32 i32) (result i32)))
 (import "env" "jsCpuHalted" (func $src/external_functions/jsCpu.halted))
 (import "env" "jsCpuBreakpoint" (func $src/external_functions/jsCpu.breakpoint))
 (import "env" "jsIoReset" (func $src/external_functions/jsIo.reset (param i32)))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 10752))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 43636))
 (memory $0 1)
 (data $0 (i32.const 1036) "<")
 (data $0.1 (i32.const 1048) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $1 (i32.const 1100) "<")
 (data $1.1 (i32.const 1112) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $4 (i32.const 1228) "<")
 (data $4.1 (i32.const 1240) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $5 (i32.const 1292) ",")
 (data $5.1 (i32.const 1304) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $7 (i32.const 1372) "<")
 (data $7.1 (i32.const 1384) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $8 (i32.const 1436) "\1c")
 (data $8.1 (i32.const 1448) "\01")
 (data $9 (i32.const 1468) ",")
 (data $9.1 (i32.const 1480) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $10 (i32.const 1516) "<")
 (data $10.1 (i32.const 1528) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $11 (i32.const 1580) "l")
 (data $11.1 (i32.const 1592) "\02\00\00\00X\00\00\00R\00A\00M\00 \00n\00o\00t\00 \00a\00v\00a\00i\00l\00a\00b\00l\00e\00,\00 \00c\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00t\00a\00b\00l\00e")
 (data $12 (i32.const 1692) "<")
 (data $12.1 (i32.const 1704) "\02\00\00\00 \00\00\00s\00r\00c\00/\00I\00o\00M\00a\00n\00a\00g\00e\00r\00.\00t\00s")
 (data $13 (i32.const 1756) "|")
 (data $13.1 (i32.const 1768) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $14 (i32.const 1884) "<")
 (data $14.1 (i32.const 1896) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $15 (i32.const 1948) "\1c")
 (data $15.1 (i32.const 1960) "\02\00\00\00\02\00\00\000")
 (data $16 (i32.const 1980) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $17 (i32.const 2380) "\1c\04")
 (data $17.1 (i32.const 2392) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $18 (i32.const 3436) "\\")
 (data $18.1 (i32.const 3448) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $19 (i32.const 3532) "L")
 (data $19.1 (i32.const 3544) "\02\00\00\00<\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $20 (i32.const 3612) "\1c")
 (data $20.1 (i32.const 3624) "\02")
 (data $21 (i32.const 3644) ",")
 (data $21.1 (i32.const 3656) "\02\00\00\00\1a\00\00\00s\00r\00c\00/\00M\00e\00m\00o\00r\00y\00.\00t\00s")
 (data $22 (i32.const 3692) "\1c")
 (data $22.1 (i32.const 3704) "\01")
 (data $23 (i32.const 3724) ",")
 (data $23.1 (i32.const 3736) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $24 (i32.const 3772) "<")
 (data $24.1 (i32.const 3784) "\02\00\00\00*\00\00\00C\00o\00m\00p\00u\00t\00e\00r\00 \00i\00n\00s\00t\00a\00n\00c\00i\00a\00t\00e\00d")
 (data $25 (i32.const 3836) "<")
 (data $25.1 (i32.const 3848) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $26 (i32.const 3900) "<")
 (data $26.1 (i32.const 3912) "\02\00\00\00(\00\00\00M\00e\00m\00o\00r\00y\00 \00B\00u\00s\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $27 (i32.const 3964) ",")
 (data $27.1 (i32.const 3976) "\02\00\00\00\18\00\00\00s\00r\00c\00/\00i\00n\00d\00e\00x\00.\00t\00s")
 (data $28 (i32.const 4012) "L")
 (data $28.1 (i32.const 4024) "\02\00\00\002\00\00\00B\00o\00o\00t\00l\00o\00a\00d\00e\00r\00 \00c\00o\00d\00e\00 \00t\00o\00o\00 \00h\00e\00a\00v\00y")
 (data $29 (i32.const 4092) "<")
 (data $29.1 (i32.const 4104) "\02\00\00\00,\00\00\00W\00r\00i\00t\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"")
 (data $30 (i32.const 4156) "\1c")
 (data $30.1 (i32.const 4168) "\02\00\00\00\06\00\00\00\"\00 \00(")
 (data $31 (i32.const 4188) ",")
 (data $31.1 (i32.const 4200) "\02\00\00\00\1c\00\00\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\"")
 (data $32 (i32.const 4236) "\1c")
 (data $32.1 (i32.const 4248) "\02\00\00\00\04\00\00\00 \00(")
 (data $33 (i32.const 4268) "\1c")
 (data $33.1 (i32.const 4280) "\02\00\00\00\04\00\00\00)\00\"")
 (data $34 (i32.const 4300) "<\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00$\00\00\00\10\10\00\00\00\00\00\00P\10\00\00\00\00\00\00p\10\00\00\00\00\00\00\a0\10\00\00\00\00\00\00\c0\10")
 (data $35 (i32.const 4364) "<")
 (data $35.1 (i32.const 4376) "\02\00\00\00 \00\00\000\001\002\003\004\005\006\007\008\009\00A\00B\00C\00D\00E\00F")
 (data $36 (i32.const 4428) "\1c")
 (data $36.1 (i32.const 4440) "\02\00\00\00\04\00\00\000\00x")
 (data $37 (i32.const 4460) "\\")
 (data $37.1 (i32.const 4472) "\02\00\00\00L\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $38 (i32.const 4556) "\\")
 (data $38.1 (i32.const 4568) "\02\00\00\00L\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $39 (i32.const 4652) "l")
 (data $39.1 (i32.const 4664) "\02\00\00\00Z\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $40 (i32.const 4764) "L")
 (data $40.1 (i32.const 4776) "\02\00\00\008\00\00\00W\00r\00i\00t\00e\00 \00t\00o\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#")
 (data $41 (i32.const 4844) "|")
 (data $41.1 (i32.const 4856) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $42 (i32.const 4972) "l")
 (data $42.1 (i32.const 4984) "\02\00\00\00R\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00#")
 (data $43 (i32.const 5084) ",")
 (data $43.1 (i32.const 5096) "\02\00\00\00\12\00\00\00 \00o\00n\00 \00p\00o\00r\00t\00 ")
 (data $44 (i32.const 5132) ",\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\10\00\00\00\80\13\00\00\00\00\00\00\f0\13")
 (data $45 (i32.const 5180) "\\")
 (data $45.1 (i32.const 5192) "\02\00\00\00H\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00w\00r\00i\00t\00e\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $46 (i32.const 5276) "<")
 (data $46.1 (i32.const 5288) "\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00B\00u\00s")
 (data $47 (i32.const 5340) ",")
 (data $47.1 (i32.const 5352) "\02\00\00\00\14\00\00\00s\00r\00c\00/\00C\00p\00u\00.\00t\00s")
 (data $48 (i32.const 5388) "\1c")
 (data $48.1 (i32.const 5400) "\13\00\00\00\08\00\00\00\01")
 (data $49 (i32.const 5420) "\\")
 (data $49.1 (i32.const 5432) "\02\00\00\00J\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $50 (i32.const 5516) "\\")
 (data $50.1 (i32.const 5528) "\02\00\00\00J\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $51 (i32.const 5612) "l")
 (data $51.1 (i32.const 5624) "\02\00\00\00X\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $52 (i32.const 5724) "L")
 (data $52.1 (i32.const 5736) "\02\00\00\00:\00\00\00R\00e\00a\00d\00 \00f\00r\00o\00m\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#")
 (data $53 (i32.const 5804) "l")
 (data $53.1 (i32.const 5816) "\02\00\00\00P\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00d\00e\00v\00i\00c\00e\00 \00#")
 (data $54 (i32.const 5916) ",\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\10\00\00\00\c0\16\00\00\00\00\00\00\f0\13")
 (data $55 (i32.const 5964) "\\")
 (data $55.1 (i32.const 5976) "\02\00\00\00F\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00r\00e\00a\00d\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $56 (i32.const 6060) "<")
 (data $56.1 (i32.const 6072) "\02\00\00\00,\00\00\00R\00e\00a\00d\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"")
 (data $57 (i32.const 6124) "<\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00$\00\00\00\c0\17\00\00\00\00\00\00P\10\00\00\00\00\00\00p\10\00\00\00\00\00\00\a0\10\00\00\00\00\00\00\c0\10")
 (data $58 (i32.const 6188) "<")
 (data $58.1 (i32.const 6200) "\02\00\00\00&\00\00\00M\00e\00m\00o\00r\00y\00B\00u\00s\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $59 (i32.const 6252) "<")
 (data $59.1 (i32.const 6264) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $60 (i32.const 6316) "\1c")
 (data $60.1 (i32.const 6328) "\16\00\00\00\08\00\00\00\02")
 (data $61 (i32.const 6348) ",")
 (data $61.1 (i32.const 6360) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00I\00M\00M\00 \00#")
 (data $62 (i32.const 6396) "\1c")
 (data $62.1 (i32.const 6408) "\02\00\00\00\06\00\00\00 \00:\00 ")
 (data $63 (i32.const 6428) "\1c")
 (data $63.1 (i32.const 6440) "\02\00\00\00\02\00\00\00)")
 (data $64 (i32.const 6460) ",\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\1c\00\00\00\e0\18\00\00\00\00\00\00\10\19\00\00\00\00\00\00\a0\10\00\00\00\00\00\000\19")
 (data $65 (i32.const 6508) "\1c")
 (data $65.1 (i32.const 6520) "\17\00\00\00\08\00\00\00\03")
 (data $66 (i32.const 6540) "\1c")
 (data $66.1 (i32.const 6552) "\18\00\00\00\08\00\00\00\04")
 (data $67 (i32.const 6572) ",")
 (data $67.1 (i32.const 6584) "\02\00\00\00\14\00\00\00C\00P\00U\00 \00H\00a\00l\00t\00e\00d")
 (data $68 (i32.const 6620) "\1c")
 (data $68.1 (i32.const 6632) "\18\00\00\00\08\00\00\00\05")
 (data $69 (i32.const 6652) ",\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\1c\00\00\00\e0\18\00\00\00\00\00\00\10\19\00\00\00\00\00\00\a0\10\00\00\00\00\00\000\19")
 (data $70 (i32.const 6700) "\1c")
 (data $70.1 (i32.const 6712) "\18\00\00\00\08\00\00\00\06")
 (data $71 (i32.const 6732) "\1c")
 (data $71.1 (i32.const 6744) "\02\00\00\00\02\00\00\00A")
 (data $72 (i32.const 6764) "\1c")
 (data $72.1 (i32.const 6776) "\02\00\00\00\02\00\00\00B")
 (data $73 (i32.const 6796) "\1c")
 (data $73.1 (i32.const 6808) "\02\00\00\00\02\00\00\00C")
 (data $74 (i32.const 6828) "\1c")
 (data $74.1 (i32.const 6840) "\02\00\00\00\02\00\00\00D")
 (data $75 (i32.const 6860) "\1c")
 (data $75.1 (i32.const 6872) "\02\00\00\00\02\00\00\00E")
 (data $76 (i32.const 6892) "\1c")
 (data $76.1 (i32.const 6904) "\02\00\00\00\02\00\00\00F")
 (data $77 (i32.const 6924) ",")
 (data $77.1 (i32.const 6936) "\02\00\00\00\14\00\00\00R\00e\00g\00i\00s\00t\00e\00r\00 \00#")
 (data $78 (i32.const 6972) ",")
 (data $78.1 (i32.const 6984) "\02\00\00\00\14\00\00\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $79 (i32.const 7020) "\1c\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\0c\00\00\00 \1b\00\00\00\00\00\00P\1b")
 (data $80 (i32.const 7052) "\1c\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\0c\00\00\00 \1b\00\00\00\00\00\00P\1b")
 (data $81 (i32.const 7084) ",")
 (data $81.1 (i32.const 7096) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00R\00E\00G\00 \00#")
 (data $82 (i32.const 7132) "\1c")
 (data $82.1 (i32.const 7144) "\02\00\00\00\06\00\00\00 \00=\00 ")
 (data $83 (i32.const 7164) "<\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00$\00\00\00\c0\1b\00\00\00\00\00\00\10\19\00\00\00\00\00\00\f0\1b\00\00\00\00\00\00\a0\10\00\00\00\00\00\000\19")
 (data $84 (i32.const 7228) "\1c")
 (data $84.1 (i32.const 7240) "\18\00\00\00\08\00\00\00\07")
 (data $85 (i32.const 7260) ",")
 (data $85.1 (i32.const 7272) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00M\00E\00M\00 \00#")
 (data $86 (i32.const 7308) "\1c")
 (data $86.1 (i32.const 7320) "\02\00\00\00\08\00\00\00 \00:\00 \00[")
 (data $87 (i32.const 7340) "\1c")
 (data $87.1 (i32.const 7352) "\02\00\00\00\08\00\00\00]\00 \00=\00 ")
 (data $88 (i32.const 7372) "<\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00$\00\00\00p\1c\00\00\00\00\00\00\a0\1c\00\00\00\00\00\00\c0\1c\00\00\00\00\00\00\a0\10\00\00\00\00\00\000\19")
 (data $89 (i32.const 7436) "\1c")
 (data $89.1 (i32.const 7448) "\18\00\00\00\08\00\00\00\08")
 (data $90 (i32.const 7468) ",")
 (data $90.1 (i32.const 7480) "\02\00\00\00\1c\00\00\00C\00P\00U\00 \00B\00r\00e\00a\00k\00p\00o\00i\00n\00t")
 (data $91 (i32.const 7516) "\1c")
 (data $91.1 (i32.const 7528) "\18\00\00\00\08\00\00\00\t")
 (data $92 (i32.const 7548) "\1c")
 (data $92.1 (i32.const 7560) "\18\00\00\00\08\00\00\00\n")
 (data $93 (i32.const 7580) "\1c")
 (data $93.1 (i32.const 7592) "\18\00\00\00\08\00\00\00\0b")
 (data $94 (i32.const 7612) "\1c")
 (data $94.1 (i32.const 7624) "\18\00\00\00\08\00\00\00\0c")
 (data $95 (i32.const 7644) "\1c")
 (data $95.1 (i32.const 7656) "\18\00\00\00\08\00\00\00\r")
 (data $96 (i32.const 7676) "\1c")
 (data $96.1 (i32.const 7688) "\02\00\00\00\n\00\00\00c\00a\00r\00r\00y")
 (data $97 (i32.const 7708) "\1c")
 (data $97.1 (i32.const 7720) "\02\00\00\00\08\00\00\00z\00e\00r\00o")
 (data $98 (i32.const 7740) "\1c")
 (data $98.1 (i32.const 7752) "\18\00\00\00\08\00\00\00\0e")
 (data $99 (i32.const 7772) "\1c")
 (data $99.1 (i32.const 7784) "\18\00\00\00\08\00\00\00\0f")
 (data $100 (i32.const 7804) "\1c")
 (data $100.1 (i32.const 7816) "\18\00\00\00\08\00\00\00\10")
 (data $101 (i32.const 7836) "\1c")
 (data $101.1 (i32.const 7848) "\18\00\00\00\08\00\00\00\11")
 (data $102 (i32.const 7868) "\1c")
 (data $102.1 (i32.const 7880) "\18\00\00\00\08\00\00\00\12")
 (data $103 (i32.const 7900) "\1c")
 (data $103.1 (i32.const 7912) "\18\00\00\00\08\00\00\00\13")
 (data $104 (i32.const 7932) "\1c")
 (data $104.1 (i32.const 7944) "\18\00\00\00\08\00\00\00\14")
 (data $105 (i32.const 7964) "\1c")
 (data $105.1 (i32.const 7976) "\18\00\00\00\08\00\00\00\15")
 (data $106 (i32.const 7996) "\1c")
 (data $106.1 (i32.const 8008) "\16\00\00\00\08\00\00\00\16")
 (data $107 (i32.const 8028) "\1c\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\0c\00\00\00 \1b\00\00\00\00\00\00P\1b")
 (data $108 (i32.const 8060) "\1c")
 (data $108.1 (i32.const 8072) "\17\00\00\00\08\00\00\00\17")
 (data $109 (i32.const 8092) "\1c")
 (data $109.1 (i32.const 8104) "\18\00\00\00\08\00\00\00\18")
 (data $110 (i32.const 8124) "\1c")
 (data $110.1 (i32.const 8136) "\18\00\00\00\08\00\00\00\19")
 (data $111 (i32.const 8156) "\1c")
 (data $111.1 (i32.const 8168) "\18\00\00\00\08\00\00\00\1a")
 (data $112 (i32.const 8188) "\1c")
 (data $112.1 (i32.const 8200) "\18\00\00\00\08\00\00\00\1b")
 (data $113 (i32.const 8220) "\1c")
 (data $113.1 (i32.const 8232) "\18\00\00\00\08\00\00\00\1c")
 (data $114 (i32.const 8252) "\1c")
 (data $114.1 (i32.const 8264) "\18\00\00\00\08\00\00\00\1d")
 (data $115 (i32.const 8284) "\1c")
 (data $115.1 (i32.const 8296) "\18\00\00\00\08\00\00\00\1e")
 (data $116 (i32.const 8316) "\1c")
 (data $116.1 (i32.const 8328) "\18\00\00\00\08\00\00\00\1f")
 (data $117 (i32.const 8348) "\1c")
 (data $117.1 (i32.const 8360) "\18\00\00\00\08\00\00\00 ")
 (data $118 (i32.const 8380) "\1c")
 (data $118.1 (i32.const 8392) "\18\00\00\00\08\00\00\00!")
 (data $119 (i32.const 8412) "\1c")
 (data $119.1 (i32.const 8424) "\18\00\00\00\08\00\00\00\"")
 (data $120 (i32.const 8444) "\1c")
 (data $120.1 (i32.const 8456) "\18\00\00\00\08\00\00\00#")
 (data $121 (i32.const 8476) "\1c")
 (data $121.1 (i32.const 8488) "\18\00\00\00\08\00\00\00$")
 (data $122 (i32.const 8508) "\1c")
 (data $122.1 (i32.const 8520) "\18\00\00\00\08\00\00\00%")
 (data $123 (i32.const 8540) "\1c")
 (data $123.1 (i32.const 8552) "\18\00\00\00\08\00\00\00&")
 (data $124 (i32.const 8572) "\1c")
 (data $124.1 (i32.const 8584) "\18\00\00\00\08\00\00\00\'")
 (data $125 (i32.const 8604) "\1c")
 (data $125.1 (i32.const 8616) "\18\00\00\00\08\00\00\00(")
 (data $126 (i32.const 8636) "\1c")
 (data $126.1 (i32.const 8648) "\18\00\00\00\08\00\00\00)")
 (data $127 (i32.const 8668) "\1c")
 (data $127.1 (i32.const 8680) "\18\00\00\00\08\00\00\00*")
 (data $128 (i32.const 8700) "\1c")
 (data $128.1 (i32.const 8712) "\18\00\00\00\08\00\00\00+")
 (data $129 (i32.const 8732) "\1c")
 (data $129.1 (i32.const 8744) "\18\00\00\00\08\00\00\00,")
 (data $130 (i32.const 8764) "\1c")
 (data $130.1 (i32.const 8776) "\18\00\00\00\08\00\00\00-")
 (data $131 (i32.const 8796) "\1c")
 (data $131.1 (i32.const 8808) "\18\00\00\00\08\00\00\00.")
 (data $132 (i32.const 8828) "\1c")
 (data $132.1 (i32.const 8840) "\18\00\00\00\08\00\00\00/")
 (data $133 (i32.const 8860) "\1c")
 (data $133.1 (i32.const 8872) "\18\00\00\00\08\00\00\000")
 (data $134 (i32.const 8892) "\1c")
 (data $134.1 (i32.const 8904) "\18\00\00\00\08\00\00\001")
 (data $135 (i32.const 8924) "\1c")
 (data $135.1 (i32.const 8936) "\18\00\00\00\08\00\00\002")
 (data $136 (i32.const 8956) "\1c")
 (data $136.1 (i32.const 8968) "\18\00\00\00\08\00\00\003")
 (data $137 (i32.const 8988) "\1c")
 (data $137.1 (i32.const 9000) "\18\00\00\00\08\00\00\004")
 (data $138 (i32.const 9020) "\1c")
 (data $138.1 (i32.const 9032) "\18\00\00\00\08\00\00\005")
 (data $139 (i32.const 9052) "\1c")
 (data $139.1 (i32.const 9064) "\18\00\00\00\08\00\00\006")
 (data $140 (i32.const 9084) "\1c")
 (data $140.1 (i32.const 9096) "\18\00\00\00\08\00\00\007")
 (data $141 (i32.const 9116) "\1c")
 (data $141.1 (i32.const 9128) "\18\00\00\00\08\00\00\008")
 (data $142 (i32.const 9148) "\1c")
 (data $142.1 (i32.const 9160) "\18\00\00\00\08\00\00\009")
 (data $143 (i32.const 9180) "\1c")
 (data $143.1 (i32.const 9192) "\18\00\00\00\08\00\00\00:")
 (data $144 (i32.const 9212) "\1c")
 (data $144.1 (i32.const 9224) "\18\00\00\00\08\00\00\00;")
 (data $145 (i32.const 9244) "\1c")
 (data $145.1 (i32.const 9256) "\18\00\00\00\08\00\00\00<")
 (data $146 (i32.const 9276) "\1c")
 (data $146.1 (i32.const 9288) "\18\00\00\00\08\00\00\00=")
 (data $147 (i32.const 9308) "\1c")
 (data $147.1 (i32.const 9320) "\18\00\00\00\08\00\00\00>")
 (data $148 (i32.const 9340) "\1c")
 (data $148.1 (i32.const 9352) "\18\00\00\00\08\00\00\00?")
 (data $149 (i32.const 9372) "\1c")
 (data $149.1 (i32.const 9384) "\18\00\00\00\08\00\00\00@")
 (data $150 (i32.const 9404) "\1c")
 (data $150.1 (i32.const 9416) "\18\00\00\00\08\00\00\00A")
 (data $151 (i32.const 9436) "\1c")
 (data $151.1 (i32.const 9448) "\18\00\00\00\08\00\00\00B")
 (data $152 (i32.const 9468) "\1c")
 (data $152.1 (i32.const 9480) "\18\00\00\00\08\00\00\00C")
 (data $153 (i32.const 9500) "\1c")
 (data $153.1 (i32.const 9512) "\18\00\00\00\08\00\00\00D")
 (data $154 (i32.const 9532) "\1c")
 (data $154.1 (i32.const 9544) "\18\00\00\00\08\00\00\00E")
 (data $155 (i32.const 9564) "\1c")
 (data $155.1 (i32.const 9576) "\18\00\00\00\08\00\00\00F")
 (data $156 (i32.const 9596) "\1c")
 (data $156.1 (i32.const 9608) "\18\00\00\00\08\00\00\00G")
 (data $157 (i32.const 9628) "\1c")
 (data $157.1 (i32.const 9640) "\18\00\00\00\08\00\00\00H")
 (data $158 (i32.const 9660) "\1c")
 (data $158.1 (i32.const 9672) "\18\00\00\00\08\00\00\00I")
 (data $159 (i32.const 9692) "\1c")
 (data $159.1 (i32.const 9704) "\18\00\00\00\08\00\00\00J")
 (data $160 (i32.const 9724) "\1c")
 (data $160.1 (i32.const 9736) "\18\00\00\00\08\00\00\00K")
 (data $161 (i32.const 9756) "\1c")
 (data $161.1 (i32.const 9768) "\18\00\00\00\08\00\00\00L")
 (data $162 (i32.const 9788) "\1c")
 (data $162.1 (i32.const 9800) "\18\00\00\00\08\00\00\00M")
 (data $163 (i32.const 9820) "\1c")
 (data $163.1 (i32.const 9832) "\18\00\00\00\08\00\00\00N")
 (data $164 (i32.const 9852) "\1c")
 (data $164.1 (i32.const 9864) "\18\00\00\00\08\00\00\00O")
 (data $165 (i32.const 9884) "\1c")
 (data $165.1 (i32.const 9896) "\18\00\00\00\08\00\00\00P")
 (data $166 (i32.const 9916) "\1c")
 (data $166.1 (i32.const 9928) "\18\00\00\00\08\00\00\00Q")
 (data $167 (i32.const 9948) "\1c")
 (data $167.1 (i32.const 9960) "\18\00\00\00\08\00\00\00R")
 (data $168 (i32.const 9980) "L")
 (data $168.1 (i32.const 9992) "\02\00\00\00.\00\00\00I\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00:\00 ")
 (data $169 (i32.const 10060) ",\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00\14\00\00\00\10\'\00\00\00\00\00\00\a0\10\00\00\00\00\00\000\19")
 (data $170 (i32.const 10108) "\1c")
 (data $170.1 (i32.const 10120) "\1b\00\00\00\08\00\00\00S")
 (data $171 (i32.const 10140) "<")
 (data $171.1 (i32.const 10152) "\02\00\00\00&\00\00\00I\00o\00M\00a\00n\00a\00g\00e\00r\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $172 (i32.const 10204) "<")
 (data $172.1 (i32.const 10216) "\02\00\00\00&\00\00\00T\00o\00o\00 \00m\00a\00n\00y\00 \00I\00O\00 \00d\00e\00v\00i\00c\00e\00s")
 (data $173 (i32.const 10268) "L")
 (data $173.1 (i32.const 10280) "\02\00\00\00<\00\00\00D\00e\00v\00i\00c\00e\00 \00s\00t\00r\00i\00n\00g\00s\00 \00m\00e\00m\00o\00r\00y\00 \00o\00v\00e\00r\00f\00l\00o\00w")
 (data $174 (i32.const 10348) ",")
 (data $174.1 (i32.const 10360) "\02\00\00\00\10\00\00\00D\00e\00v\00i\00c\00e\00 \00#")
 (data $175 (i32.const 10396) "\1c")
 (data $175.1 (i32.const 10408) "\02\00\00\00\04\00\00\00 \00\"")
 (data $176 (i32.const 10428) "L")
 (data $176.1 (i32.const 10440) "\02\00\00\002\00\00\00\"\00 \00e\00n\00t\00r\00y\00 \00a\00d\00d\00e\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $177 (i32.const 10508) ",")
 (data $177.1 (i32.const 10520) "\02\00\00\00\16\00\00\00 \00(\00i\00o\00B\00a\00s\00e\00 \00=\00 ")
 (data $178 (i32.const 10556) "<\00\00\00\03\00\00\00\00\00\00\00\12\00\00\00$\00\00\00\80(\00\00\00\00\00\00\b0(\00\00\00\00\00\00\d0(\00\00\00\00\00\00 )\00\00\00\00\00\000\19")
 (data $179 (i32.const 10620) "<")
 (data $179.1 (i32.const 10632) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $180 (i32.const 10684) "<")
 (data $180.1 (i32.const 10696) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $181 (i32.const 10752) "\1c\00\00\00 \00\00\00 \00\00\00 ")
 (data $181.1 (i32.const 10788) "d")
 (data $181.2 (i32.const 10804) "\02A\00\00\00\00\00\00 \00\00\00 \00\00\00\02A\00\00\02\t\00\00\04A")
 (data $181.3 (i32.const 10840) "A")
 (data $181.4 (i32.const 10860) " ")
 (table $0 84 84 funcref)
 (elem $0 (i32.const 1) $src/Memory/Memory#read $src/Cpu/fetchInstructionActions~anonymous|0 $src/Cpu/fetchInstructionActions~anonymous|1 $src/Cpu/fetchInstructionActions~anonymous|2 $src/Cpu/fetchInstructionActions~anonymous|3 $src/Cpu/fetchInstructionActions~anonymous|4 $src/Cpu/fetchInstructionActions~anonymous|5 $src/Cpu/fetchInstructionActions~anonymous|6 $src/Cpu/fetchInstructionActions~anonymous|7 $src/Cpu/fetchInstructionActions~anonymous|8 $src/Cpu/fetchInstructionActions~anonymous|9 $src/Cpu/fetchInstructionActions~anonymous|10 $src/Cpu/fetchInstructionActions~anonymous|11 $src/Cpu/fetchInstructionActions~anonymous|12 $src/Cpu/fetchInstructionActions~anonymous|13 $src/Cpu/fetchInstructionActions~anonymous|14 $src/Cpu/fetchInstructionActions~anonymous|15 $src/Cpu/fetchInstructionActions~anonymous|16 $src/Cpu/fetchInstructionActions~anonymous|17 $src/Cpu/fetchInstructionActions~anonymous|18 $src/Cpu/fetchInstructionActions~anonymous|19 $src/Cpu/fetchInstructionActions~anonymous|20 $src/Cpu/fetchInstructionActions~anonymous|21 $src/Cpu/fetchInstructionActions~anonymous|22 $src/Cpu/fetchInstructionActions~anonymous|23 $src/Cpu/fetchInstructionActions~anonymous|24 $src/Cpu/fetchInstructionActions~anonymous|25 $src/Cpu/fetchInstructionActions~anonymous|26 $src/Cpu/fetchInstructionActions~anonymous|27 $src/Cpu/fetchInstructionActions~anonymous|28 $src/Cpu/fetchInstructionActions~anonymous|29 $src/Cpu/fetchInstructionActions~anonymous|30 $src/Cpu/fetchInstructionActions~anonymous|31 $src/Cpu/fetchInstructionActions~anonymous|32 $src/Cpu/fetchInstructionActions~anonymous|33 $src/Cpu/fetchInstructionActions~anonymous|34 $src/Cpu/fetchInstructionActions~anonymous|35 $src/Cpu/fetchInstructionActions~anonymous|36 $src/Cpu/fetchInstructionActions~anonymous|37 $src/Cpu/fetchInstructionActions~anonymous|38 $src/Cpu/fetchInstructionActions~anonymous|39 $src/Cpu/fetchInstructionActions~anonymous|40 $src/Cpu/fetchInstructionActions~anonymous|41 $src/Cpu/fetchInstructionActions~anonymous|42 $src/Cpu/fetchInstructionActions~anonymous|43 $src/Cpu/fetchInstructionActions~anonymous|44 $src/Cpu/fetchInstructionActions~anonymous|45 $src/Cpu/fetchInstructionActions~anonymous|46 $src/Cpu/fetchInstructionActions~anonymous|47 $src/Cpu/fetchInstructionActions~anonymous|48 $src/Cpu/fetchInstructionActions~anonymous|49 $src/Cpu/fetchInstructionActions~anonymous|50 $src/Cpu/fetchInstructionActions~anonymous|51 $src/Cpu/fetchInstructionActions~anonymous|52 $src/Cpu/fetchInstructionActions~anonymous|53 $src/Cpu/fetchInstructionActions~anonymous|54 $src/Cpu/fetchInstructionActions~anonymous|55 $src/Cpu/fetchInstructionActions~anonymous|56 $src/Cpu/fetchInstructionActions~anonymous|57 $src/Cpu/fetchInstructionActions~anonymous|58 $src/Cpu/fetchInstructionActions~anonymous|59 $src/Cpu/fetchInstructionActions~anonymous|60 $src/Cpu/fetchInstructionActions~anonymous|61 $src/Cpu/fetchInstructionActions~anonymous|62 $src/Cpu/fetchInstructionActions~anonymous|63 $src/Cpu/fetchInstructionActions~anonymous|64 $src/Cpu/fetchInstructionActions~anonymous|65 $src/Cpu/fetchInstructionActions~anonymous|66 $src/Cpu/fetchInstructionActions~anonymous|67 $src/Cpu/fetchInstructionActions~anonymous|68 $src/Cpu/fetchInstructionActions~anonymous|69 $src/Cpu/fetchInstructionActions~anonymous|70 $src/Cpu/fetchInstructionActions~anonymous|71 $src/Cpu/fetchInstructionActions~anonymous|72 $src/Cpu/fetchInstructionActions~anonymous|73 $src/Cpu/fetchInstructionActions~anonymous|74 $src/Cpu/fetchInstructionActions~anonymous|75 $src/Cpu/fetchInstructionActions~anonymous|76 $src/Cpu/fetchInstructionActions~anonymous|77 $src/Cpu/fetchInstructionActions~anonymous|78 $src/Cpu/fetchInstructionActions~anonymous|79 $src/Cpu/fetchInstructionActions~anonymous|80 $src/Memory/MemoryBus#read)
 (export "instanciateComputer" (func $src/index/instanciateComputer))
 (export "allocate" (func $src/index/allocate))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "computerloadCode" (func $export:src/index/computerloadCode))
 (export "computerRunCycles" (func $export:src/index/computerRunCycles))
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
 (start $~start)
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  i32.const 1248
  call $~lib/rt/itcms/__visit
  i32.const 1488
  call $~lib/rt/itcms/__visit
  i32.const 4864
  call $~lib/rt/itcms/__visit
  i32.const 1056
  call $~lib/rt/itcms/__visit
  i32.const 10640
  call $~lib/rt/itcms/__visit
  i32.const 10704
  call $~lib/rt/itcms/__visit
  i32.const 2400
  call $~lib/rt/itcms/__visit
  i32.const 3456
  call $~lib/rt/itcms/__visit
  global.get $~lib/rt/itcms/pinSpace
  local.tee $1
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    i32.load offset=4
    i32.const 3
    i32.and
    i32.const 3
    i32.ne
    if
     i32.const 0
     i32.const 1120
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#unlink (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
  local.tee $1
  i32.eqz
  if
   local.get $0
   i32.load offset=8
   i32.eqz
   local.get $0
   i32.const 43636
   i32.lt_u
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1120
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 1120
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 1120
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  local.get $0
  call $~lib/rt/itcms/Object#unlink
  global.get $~lib/rt/itcms/toSpace
  local.set $1
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $2
   i32.const 10752
   i32.load
   i32.gt_u
   if
    i32.const 1248
    i32.const 1312
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 2
   i32.shl
   i32.const 10756
   i32.add
   i32.load
   i32.const 32
   i32.and
  end
  local.set $3
  local.get $1
  i32.load offset=8
  local.set $2
  local.get $0
  global.get $~lib/rt/itcms/white
  i32.eqz
  i32.const 2
  local.get $3
  select
  local.get $1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $2
  local.get $0
  local.get $2
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=8
 )
 (func $~lib/rt/itcms/__visit (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  global.get $~lib/rt/itcms/white
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $3
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $3
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $4
  if
   local.get $4
   local.get $5
   i32.store offset=8
  end
  local.get $5
  if
   local.get $5
   local.get $4
   i32.store offset=4
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $3
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $3
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  i32.store
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $1
  i32.const 4
  i32.add
  local.get $2
  i32.add
  i32.ne
  if
   i32.const 0
   i32.const 1392
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  i32.const 16
  i32.lt_u
  local.get $5
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $3
  if
   local.get $3
   local.get $1
   i32.store offset=4
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  local.get $1
  i64.extend_i32_u
  i64.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $3
   i32.const 4
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  else
   local.get $0
   i32.const 1572
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  i32.store
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $1
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $1
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
  i32.const 43648
  i32.const 0
  i32.store
  i32.const 45216
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $0
   i32.const 23
   i32.lt_u
   if
    local.get $0
    i32.const 2
    i32.shl
    i32.const 43648
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $1
    loop $for-loop|1
     local.get $1
     i32.const 16
     i32.lt_u
     if
      local.get $0
      i32.const 4
      i32.shl
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.const 43648
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|1
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const 43648
  i32.const 45220
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 43648
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      br_table $case0|0 $case1|0 $case2|0 $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $1
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $1
      local.get $0
      i32.load offset=4
      local.tee $2
      i32.const 3
      i32.and
      i32.ne
      if
       local.get $0
       local.get $2
       i32.const -4
       i32.and
       local.get $1
       i32.or
       i32.store offset=4
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       return
      end
      local.get $0
      i32.load offset=4
      i32.const -4
      i32.and
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/toSpace
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $0
     loop $while-continue|0
      local.get $0
      i32.const 43636
      i32.lt_u
      if
       local.get $0
       i32.load
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.const 4
       i32.add
       local.set $0
       br $while-continue|0
      end
     end
     global.get $~lib/rt/itcms/iter
     i32.load offset=4
     i32.const -4
     i32.and
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $1
       local.get $0
       i32.load offset=4
       local.tee $2
       i32.const 3
       i32.and
       i32.ne
       if
        local.get $0
        local.get $2
        i32.const -4
        i32.and
        local.get $1
        i32.or
        i32.store offset=4
        local.get $0
        i32.const 20
        i32.add
        call $~lib/rt/__visit_members
       end
       local.get $0
       i32.load offset=4
       i32.const -4
       i32.and
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $0
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $0
     global.set $~lib/rt/itcms/toSpace
     local.get $1
     global.set $~lib/rt/itcms/white
     local.get $0
     i32.load offset=4
     i32.const -4
     i32.and
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    return
   end
   global.get $~lib/rt/itcms/iter
   local.tee $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    i32.load offset=4
    local.tee $1
    i32.const -4
    i32.and
    global.set $~lib/rt/itcms/iter
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.get $1
    i32.const 3
    i32.and
    i32.ne
    if
     i32.const 0
     i32.const 1120
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 43636
    i32.lt_u
    if
     local.get $0
     i32.const 0
     i32.store offset=4
     local.get $0
     i32.const 0
     i32.store offset=8
    else
     global.get $~lib/rt/itcms/total
     local.get $0
     i32.load
     i32.const -4
     i32.and
     i32.const 4
     i32.add
     i32.sub
     global.set $~lib/rt/itcms/total
     local.get $0
     i32.const 4
     i32.add
     local.tee $0
     i32.const 43636
     i32.ge_u
     if
      global.get $~lib/rt/tlsf/ROOT
      i32.eqz
      if
       call $~lib/rt/tlsf/initialize
      end
      global.get $~lib/rt/tlsf/ROOT
      local.get $0
      i32.const 4
      i32.sub
      local.set $2
      local.get $0
      i32.const 15
      i32.and
      i32.const 1
      local.get $0
      select
      if (result i32)
       i32.const 1
      else
       local.get $2
       i32.load
       i32.const 1
       i32.and
      end
      if
       i32.const 0
       i32.const 1392
       i32.const 562
       i32.const 3
       call $~lib/builtins/abort
       unreachable
      end
      local.get $2
      local.get $2
      i32.load
      i32.const 1
      i32.or
      i32.store
      local.get $2
      call $~lib/rt/tlsf/insertBlock
     end
    end
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=4
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=8
   i32.const 0
   global.set $~lib/rt/itcms/state
  end
  i32.const 0
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $1
  else
   local.get $1
   i32.const 536870910
   i32.lt_u
   if
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
    local.set $1
   end
   local.get $1
   i32.const 31
   local.get $1
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $1
   local.get $2
   i32.const 7
   i32.sub
   local.set $2
  end
  local.get $1
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 1392
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 1056
   i32.const 1120
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   block $__inlined_func$~lib/rt/itcms/interrupt$69
    i32.const 2048
    local.set $2
    loop $do-loop|0
     local.get $2
     call $~lib/rt/itcms/step
     i32.sub
     local.set $2
     global.get $~lib/rt/itcms/state
     i32.eqz
     if
      global.get $~lib/rt/itcms/total
      i64.extend_i32_u
      i64.const 200
      i64.mul
      i64.const 100
      i64.div_u
      i32.wrap_i64
      i32.const 1024
      i32.add
      global.set $~lib/rt/itcms/threshold
      br $__inlined_func$~lib/rt/itcms/interrupt$69
     end
     local.get $2
     i32.const 0
     i32.gt_s
     br_if $do-loop|0
    end
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/threshold
    i32.sub
    i32.const 1024
    i32.lt_u
    i32.const 10
    i32.shl
    i32.add
    global.set $~lib/rt/itcms/threshold
   end
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.set $4
  local.get $0
  i32.const 16
  i32.add
  local.tee $2
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1056
   i32.const 1392
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $2
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $2
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
  end
  local.tee $5
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   memory.size
   local.tee $2
   local.get $5
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $5
    i32.const 536870910
    i32.lt_u
    if (result i32)
     local.get $5
     i32.const 1
     i32.const 27
     local.get $5
     i32.clz
     i32.sub
     i32.shl
     i32.add
     i32.const 1
     i32.sub
    else
     local.get $5
    end
   else
    local.get $5
   end
   i32.const 4
   local.get $4
   i32.load offset=1568
   local.get $2
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $3
   local.get $2
   local.get $3
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $3
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $4
   local.get $2
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/searchBlock
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $5
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.gt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.set $6
  local.get $5
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 1392
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $6
  i32.const -4
  i32.and
  local.get $5
  i32.sub
  local.tee $3
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $5
   local.get $6
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $5
   i32.add
   local.tee $5
   local.get $3
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $6
   i32.const -2
   i32.and
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   local.get $3
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  global.get $~lib/rt/itcms/fromSpace
  local.tee $1
  i32.load offset=8
  local.set $3
  local.get $2
  local.get $1
  global.get $~lib/rt/itcms/white
  i32.or
  i32.store offset=4
  local.get $2
  local.get $3
  i32.store offset=8
  local.get $3
  local.get $2
  local.get $3
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  global.get $~lib/rt/itcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 1120
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/white
  local.get $1
  i32.const 20
  i32.sub
  local.tee $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   i32.load offset=4
   i32.const 3
   i32.and
   local.tee $3
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    select
    call $~lib/rt/itcms/Object#makeGray
   else
    global.get $~lib/rt/itcms/state
    i32.const 1
    i32.eq
    local.get $3
    i32.const 3
    i32.eq
    i32.and
    if
     local.get $1
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $~lib/rt/itcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 3
   i32.eq
   if
    i32.const 10640
    i32.const 1120
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   global.get $~lib/rt/itcms/pinSpace
   local.tee $3
   i32.load offset=8
   local.set $2
   local.get $1
   local.get $3
   i32.const 3
   i32.or
   i32.store offset=4
   local.get $1
   local.get $2
   i32.store offset=8
   local.get $2
   local.get $1
   local.get $2
   i32.load offset=4
   i32.const 3
   i32.and
   i32.or
   i32.store offset=4
   local.get $3
   local.get $1
   i32.store offset=8
  end
  local.get $0
 )
 (func $~lib/rt/itcms/__unpin (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.const 3
  i32.ne
  if
   i32.const 10704
   i32.const 1120
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $1
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   global.get $~lib/rt/itcms/fromSpace
   local.tee $0
   i32.load offset=8
   local.set $2
   local.get $1
   local.get $0
   global.get $~lib/rt/itcms/white
   i32.or
   i32.store offset=4
   local.get $1
   local.get $2
   i32.store offset=8
   local.get $2
   local.get $1
   local.get $2
   i32.load offset=4
   i32.const 3
   i32.and
   i32.or
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=8
  end
 )
 (func $~lib/rt/itcms/__collect
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
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
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i64.const 200
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
 )
 (func $~lib/array/Array<src/IoManager/IoDevice>~visit (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $2
  loop $while-continue|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $1
    i32.load
    local.tee $3
    if
     local.get $3
     call $~lib/rt/itcms/__visit
    end
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $folding-inner4
   block $folding-inner3
    block $folding-inner2
     block $folding-inner1
      block $folding-inner0
       block $invalid
        block $src/Cpu/Flags
         block $src/Cpu/InstructionActions
          block $~lib/staticarray/StaticArray<~lib/string/String>
           block $~lib/array/Array<i32>
            block $~lib/array/Array<src/Cpu/Cpu>
             block $src/Cpu/ALU
              block $src/Cpu/CpuRegisters
               block $src/Cpu/Cpu
                block $~lib/array/Array<src/IoManager/IoDevice>
                 block $src/IoManager/IoManager
                  block $~lib/staticarray/StaticArray<u8>
                   block $src/Computer/Computer
                    block $~lib/string/String
                     block $~lib/arraybuffer/ArrayBuffer
                      block $~lib/object/Object
                       local.get $0
                       i32.const 8
                       i32.sub
                       i32.load
                       br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $folding-inner0 $src/Computer/Computer $folding-inner0 $folding-inner1 $folding-inner0 $~lib/staticarray/StaticArray<u8> $folding-inner1 $src/IoManager/IoManager $folding-inner2 $~lib/array/Array<src/IoManager/IoDevice> $src/Cpu/Cpu $src/Cpu/CpuRegisters $src/Cpu/ALU $~lib/array/Array<src/Cpu/Cpu> $~lib/array/Array<i32> $~lib/staticarray/StaticArray<~lib/string/String> $folding-inner3 $src/Cpu/InstructionActions $folding-inner0 $folding-inner3 $folding-inner3 $folding-inner3 $folding-inner2 $src/Cpu/Flags $folding-inner3 $invalid
                      end
                      return
                     end
                     return
                    end
                    return
                   end
                   local.get $0
                   i32.load
                   call $~lib/rt/itcms/__visit
                   local.get $0
                   i32.load offset=4
                   call $~lib/rt/itcms/__visit
                   local.get $0
                   i32.load offset=8
                   call $~lib/rt/itcms/__visit
                   local.get $0
                   i32.load offset=12
                   call $~lib/rt/itcms/__visit
                   local.get $0
                   i32.load offset=16
                   call $~lib/rt/itcms/__visit
                   return
                  end
                  return
                 end
                 local.get $0
                 i32.load
                 call $~lib/rt/itcms/__visit
                 br $folding-inner2
                end
                local.get $0
                call $~lib/array/Array<src/IoManager/IoDevice>~visit
                return
               end
               local.get $0
               i32.load
               call $~lib/rt/itcms/__visit
               local.get $0
               i32.load offset=4
               call $~lib/rt/itcms/__visit
               local.get $0
               i32.load offset=24
               call $~lib/rt/itcms/__visit
               return
              end
              return
             end
             return
            end
            local.get $0
            call $~lib/array/Array<src/IoManager/IoDevice>~visit
            return
           end
           global.get $~lib/memory/__stack_pointer
           i32.const 4
           i32.sub
           global.set $~lib/memory/__stack_pointer
           global.get $~lib/memory/__stack_pointer
           i32.const 10868
           i32.lt_s
           br_if $folding-inner4
           global.get $~lib/memory/__stack_pointer
           i32.const 0
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load
           call $~lib/rt/itcms/__visit
           global.get $~lib/memory/__stack_pointer
           i32.const 4
           i32.add
           global.set $~lib/memory/__stack_pointer
           return
          end
          local.get $0
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.add
          local.set $1
          loop $while-continue|0
           local.get $0
           local.get $1
           i32.lt_u
           if
            local.get $0
            i32.load
            local.tee $2
            if
             local.get $2
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.const 4
            i32.add
            local.set $0
            br $while-continue|0
           end
          end
          return
         end
         local.get $0
         i32.load
         call $~lib/rt/itcms/__visit
         local.get $0
         i32.load offset=4
         call $~lib/rt/itcms/__visit
         local.get $0
         i32.load offset=8
         call $~lib/rt/itcms/__visit
         return
        end
        return
       end
       unreachable
      end
      local.get $0
      i32.load
      call $~lib/rt/itcms/__visit
      return
     end
     local.get $0
     i32.load
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=8
     call $~lib/rt/itcms/__visit
     return
    end
    local.get $0
    i32.load offset=4
    call $~lib/rt/itcms/__visit
    return
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner4
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   call $~lib/rt/itcms/__visit
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~start
  memory.size
  i32.const 16
  i32.shl
  i32.const 43636
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1172
  i32.const 1168
  i32.store
  i32.const 1176
  i32.const 1168
  i32.store
  i32.const 1168
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1204
  i32.const 1200
  i32.store
  i32.const 1208
  i32.const 1200
  i32.store
  i32.const 1200
  global.set $~lib/rt/itcms/toSpace
  i32.const 1348
  i32.const 1344
  i32.store
  i32.const 1352
  i32.const 1344
  i32.store
  i32.const 1344
  global.set $~lib/rt/itcms/fromSpace
 )
 (func $src/Memory/Memory#constructor (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.const 7
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  i32.const 65536
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 65536
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.tee $3
  local.get $2
  i32.add
  local.tee $4
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 3632
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store offset=4
  local.get $4
  local.get $0
  local.get $2
  memory.copy
  local.get $2
  local.get $4
  i32.add
  local.get $1
  local.get $3
  memory.copy
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $src/Memory/Memory#write (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $3
   i32.store
   local.get $3
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.sub
   i32.const 65535
   i32.and
   local.get $1
   i32.const 65535
   i32.and
   local.tee $3
   i32.lt_u
   if
    local.get $3
    call $~lib/util/number/utoa32
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    i32.const 3552
    local.get $0
    call $~lib/string/String#concat
    i32.const 3664
    i32.const 125
    i32.const 13
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $1
   i32.const 65535
   i32.and
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.ge_u
   if
    i32.const 1248
    i32.const 1536
    i32.const 93
    i32.const 41
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.get $2
   i32.store8
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/IoManager/IoManager#writeRam (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=8
  local.tee $0
  i32.store offset=8
  local.get $0
  i32.eqz
  if
   i32.const 1600
   i32.const 1712
   i32.const 118
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Memory/Memory#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/CpuRegisters#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 13
  i32.const 14
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/object/Object#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<src/Cpu/Cpu>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=12
   local.tee $6
   i32.const 1
   i32.add
   local.tee $5
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $2
   local.get $0
   i32.load offset=8
   local.tee $3
   i32.const 2
   i32.shr_u
   i32.gt_u
   if
    local.get $2
    i32.const 268435455
    i32.gt_u
    if
     i32.const 1488
     i32.const 3744
     i32.const 19
     i32.const 48
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $__inlined_func$~lib/rt/itcms/__renew$1594
     i32.const 1073741820
     local.get $3
     i32.const 1
     i32.shl
     local.tee $3
     local.get $3
     i32.const 1073741820
     i32.ge_u
     select
     local.tee $3
     i32.const 8
     local.get $2
     local.get $2
     i32.const 8
     i32.le_u
     select
     i32.const 2
     i32.shl
     local.tee $2
     local.get $2
     local.get $3
     i32.lt_u
     select
     local.tee $4
     local.get $0
     i32.load
     local.tee $3
     i32.const 20
     i32.sub
     local.tee $7
     i32.load
     i32.const -4
     i32.and
     i32.const 16
     i32.sub
     i32.le_u
     if
      local.get $7
      local.get $4
      i32.store offset=16
      local.get $3
      local.set $2
      br $__inlined_func$~lib/rt/itcms/__renew$1594
     end
     local.get $4
     local.get $7
     i32.load offset=12
     call $~lib/rt/itcms/__new
     local.tee $2
     local.get $3
     local.get $4
     local.get $7
     i32.load offset=16
     local.tee $7
     local.get $4
     local.get $7
     i32.lt_u
     select
     memory.copy
    end
    local.get $2
    local.get $3
    i32.ne
    if
     local.get $0
     local.get $2
     i32.store
     local.get $0
     local.get $2
     i32.store offset=4
     local.get $0
     local.get $2
     i32.const 0
     call $~lib/rt/itcms/__link
    end
    local.get $0
    local.get $4
    i32.store offset=8
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   local.get $6
   i32.const 2
   i32.shl
   i32.add
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $5
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/index/instanciateComputer (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.const 4
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 16
   i32.const 1456
   call $~lib/rt/__newArray
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   i32.store offset=16
   local.get $0
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 5
   i32.const 5
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.store
   local.get $1
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 9
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=8
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $src/Memory/Memory#constructor
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 6
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=8
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $src/Memory/Memory#constructor
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 10
   i32.const 10
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 12
   i32.const 3712
   call $~lib/rt/__newArray
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=4
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1408
   i32.store16 offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   i32.store
   local.get $1
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1280
   i32.const 0
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=12
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   block $__inlined_func$src/Cpu/Cpu#constructor$3 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    block $folding-inner01
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner01
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 29
     i32.const 13
     call $~lib/rt/itcms/__new
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.store
     local.get $2
     i32.const 0
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.store8 offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i64.const 0
     i64.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner01
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.const 15
     call $~lib/rt/itcms/__new
     local.tee $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     call $~lib/object/Object#constructor
     local.tee $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=8
     local.get $2
     local.get $3
     i32.store offset=24
     local.get $2
     local.get $3
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $2
     local.get $0
     i32.store
     local.get $2
     local.get $0
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     call $src/Cpu/CpuRegisters#constructor
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=8
     local.get $2
     local.get $3
     i32.store offset=4
     local.get $2
     local.get $3
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $2
     br $__inlined_func$src/Cpu/Cpu#constructor$3
    end
    br $folding-inner1
   end
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $1
   local.get $2
   call $~lib/array/Array<src/Cpu/Cpu>#push
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 3792
   call $src/external_functions/console.log
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/string/String#concat
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/lib/lib_numbers/toHex (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 f64)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   i32.const 3632
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 3632
   i32.store
   local.get $0
   if
    loop $while-continue|0
     local.get $0
     i32.const 0
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 8
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 10868
      i32.lt_s
      br_if $folding-inner0
      global.get $~lib/memory/__stack_pointer
      i64.const 0
      i64.store
      global.get $~lib/memory/__stack_pointer
      i32.const 4384
      i32.store
      block $__inlined_func$~lib/string/String#charAt$1650
       local.get $0
       i32.const 16
       i32.rem_s
       local.tee $3
       i32.const 4380
       i32.load
       i32.const 1
       i32.shr_u
       i32.ge_u
       if
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        i32.const 3632
        local.set $2
        br $__inlined_func$~lib/string/String#charAt$1650
       end
       global.get $~lib/memory/__stack_pointer
       i32.const 2
       i32.const 2
       call $~lib/rt/itcms/__new
       local.tee $2
       i32.store offset=4
       local.get $2
       local.get $3
       i32.const 1
       i32.shl
       i32.const 4384
       i32.add
       i32.load16_u
       i32.store16
       global.get $~lib/memory/__stack_pointer
       i32.const 8
       i32.add
       global.set $~lib/memory/__stack_pointer
      end
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $2
      local.get $1
      call $~lib/string/String.__concat
      local.tee $1
      i32.store
      local.get $0
      i32.const 16
      i32.div_s
      f64.convert_i32_s
      local.tee $6
      f64.ceil
      local.tee $4
      local.get $4
      f64.const -1
      f64.add
      local.get $4
      f64.const -0.5
      f64.add
      local.get $6
      f64.le
      select
      i32.trunc_sat_f64_s
      local.set $0
      br $while-continue|0
     end
    end
   else
    i32.const 1968
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 1968
    i32.store
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.const 1
   i32.and
   if
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 1968
    local.get $1
    call $~lib/string/String.__concat
    local.tee $1
    i32.store
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 4448
   local.get $1
   call $~lib/string/String.__concat
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/util/string/joinStringArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $1
  i32.const 1
  i32.sub
  local.tee $4
  i32.const 0
  i32.lt_s
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 3632
   return
  end
  local.get $4
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.const 3632
   local.get $0
   select
   return
  end
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    local.get $3
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $5
    i32.store offset=4
    local.get $5
    if
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=8
     local.get $2
     local.get $5
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.add
     local.set $2
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 3632
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 3628
  i32.load
  i32.const 1
  i32.shr_u
  local.tee $1
  local.get $4
  i32.mul
  i32.add
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $5
  i32.store offset=12
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $4
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $6
    i32.store offset=4
    local.get $6
    if
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=8
     local.get $5
     local.get $3
     i32.const 1
     i32.shl
     i32.add
     local.get $6
     local.get $6
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     local.tee $6
     i32.const 1
     i32.shl
     memory.copy
     local.get $3
     local.get $6
     i32.add
     local.set $3
    end
    local.get $1
    if
     local.get $5
     local.get $3
     i32.const 1
     i32.shl
     i32.add
     i32.const 3632
     local.get $1
     i32.const 1
     i32.shl
     memory.copy
     local.get $1
     local.get $3
     i32.add
     local.set $3
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.store offset=4
  local.get $0
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $5
   local.get $3
   i32.const 1
   i32.shl
   i32.add
   local.get $0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const -2
   i32.and
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 3632
  i32.store
  local.get $0
  local.get $1
  call $~lib/util/string/joinStringArray
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/IoManager/IoDevice>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<src/IoManager/IoDevice>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1248
   i32.const 3744
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.store offset=4
  local.get $0
  i32.eqz
  if
   i32.const 4864
   i32.const 3744
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Memory/MemoryBus#write (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 40
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $1
   i32.const 65535
   i32.and
   local.tee $4
   i32.const 1279
   i32.le_u
   i32.const 1
   local.get $0
   i32.load8_u offset=4
   select
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 255
    i32.and
    local.tee $3
    call $src/lib/lib_numbers/toHex
    local.tee $5
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $3
    call $~lib/util/number/utoa32
    local.tee $6
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $4
    call $src/lib/lib_numbers/toHex
    local.tee $3
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $4
    call $~lib/util/number/utoa32
    local.tee $4
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    i32.const 4320
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=24
    i32.const 4324
    local.get $5
    i32.store
    i32.const 4320
    local.get $5
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4320
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=24
    i32.const 4332
    local.get $6
    i32.store
    i32.const 4320
    local.get $6
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4320
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=24
    i32.const 4340
    local.get $3
    i32.store
    i32.const 4320
    local.get $3
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4320
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=24
    i32.const 4348
    local.get $4
    i32.store
    i32.const 4320
    local.get $4
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4320
    i32.store offset=20
    i32.const 4320
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    call $src/external_functions/console.log
   end
   block $folding-inner0
    local.get $1
    i32.const 65535
    i32.and
    local.tee $3
    i32.const 1279
    i32.le_u
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store offset=28
     local.get $0
     i32.eqz
     if
      local.get $3
      call $src/lib/lib_numbers/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 4480
      local.get $0
      call $~lib/string/String#concat
      i32.const 3664
      i32.const 70
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     br $folding-inner0
    end
    local.get $1
    i32.const 65535
    i32.and
    local.tee $3
    i32.const 61439
    i32.le_u
    local.get $3
    i32.const 1280
    i32.ge_u
    i32.and
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $0
     i32.store offset=32
     local.get $0
     i32.eqz
     if
      local.get $3
      call $src/lib/lib_numbers/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 4576
      local.get $0
      call $~lib/string/String#concat
      i32.const 3664
      i32.const 81
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     br $folding-inner0
    end
    local.get $1
    i32.const 65535
    i32.and
    local.tee $3
    i32.const 65535
    i32.le_u
    local.get $3
    i32.const 61440
    i32.ge_u
    i32.and
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=12
     local.tee $0
     i32.store offset=36
     local.get $0
     i32.eqz
     if
      local.get $3
      call $src/lib/lib_numbers/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 4672
      local.get $0
      call $~lib/string/String#concat
      i32.const 3664
      i32.const 92
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 24
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner1
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.const 24
     memory.fill
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $3
     i32.store
     local.get $1
     i32.const 61440
     i32.sub
     local.tee $1
     i32.const 65535
     i32.and
     i32.const 4
     i32.shr_u
     local.tee $4
     i32.const 255
     i32.and
     local.tee $5
     local.get $3
     call $~lib/array/Array<src/IoManager/IoDevice>#get:length
     i32.const 1
     i32.sub
     i32.const 255
     i32.and
     i32.gt_u
     if
      local.get $5
      call $~lib/util/number/utoa32
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 4784
      local.get $0
      call $~lib/string/String#concat
      i32.const 1712
      i32.const 151
      i32.const 13
      call $~lib/builtins/abort
      unreachable
     end
     local.get $1
     i32.const 15
     i32.and
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $4
     i32.const 255
     i32.and
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     block $__inlined_func$src/IoManager/IoManager#write$43
      local.get $0
      if
       local.get $4
       local.get $1
       local.get $2
       call $src/external_functions/jsIo.write
       br $__inlined_func$src/IoManager/IoManager#write$43
      end
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.const 255
      i32.and
      call $~lib/util/number/utoa32
      local.tee $0
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      call $~lib/util/number/utoa32
      local.tee $1
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      i32.const 5152
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=20
      i32.const 5156
      local.get $0
      i32.store
      i32.const 5152
      local.get $0
      i32.const 1
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      i32.const 5152
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=20
      i32.const 5164
      local.get $1
      i32.store
      i32.const 5152
      local.get $1
      i32.const 1
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      i32.const 5152
      i32.store offset=4
      i32.const 5152
      call $~lib/staticarray/StaticArray<~lib/string/String>#join
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      call $src/external_functions/console.warn
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 24
     i32.add
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 40
     i32.add
     global.set $~lib/memory/__stack_pointer
     return
    end
    local.get $1
    i32.const 65535
    i32.and
    call $src/lib/lib_numbers/toHex
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    i32.const 5200
    local.get $0
    call $~lib/string/String#concat
    i32.const 3664
    i32.const 101
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   local.get $2
   call $src/Memory/Memory#write
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Memory/Memory#read (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $2
   i32.store
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.sub
   i32.const 65535
   i32.and
   local.get $1
   i32.const 65535
   i32.and
   local.tee $2
   i32.lt_u
   if
    local.get $2
    call $~lib/util/number/utoa32
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    i32.const 3552
    local.get $0
    call $~lib/string/String#concat
    i32.const 3664
    i32.const 117
    i32.const 13
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $1
   i32.const 65535
   i32.and
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.ge_u
   if
    i32.const 1248
    i32.const 1536
    i32.const 78
    i32.const 41
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.add
   i32.load8_u
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Memory/MemoryBus#read (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 40
   memory.fill
   local.get $1
   i32.const 65535
   i32.and
   local.tee $2
   i32.const 1279
   i32.le_u
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load
    local.tee $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.load offset=4
    local.tee $3
    i32.store offset=8
    local.get $3
    i32.eqz
    if
     local.get $2
     call $src/lib/lib_numbers/toHex
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 5440
     local.get $0
     call $~lib/string/String#concat
     i32.const 3664
     i32.const 25
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    local.get $1
    call $src/Memory/Memory#read
   else
    local.get $1
    i32.const 65535
    i32.and
    local.tee $2
    i32.const 61439
    i32.le_u
    local.get $2
    i32.const 1280
    i32.ge_u
    i32.and
    if (result i32)
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=8
     local.tee $3
     i32.store offset=12
     local.get $3
     i32.eqz
     if
      local.get $2
      call $src/lib/lib_numbers/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 5536
      local.get $0
      call $~lib/string/String#concat
      i32.const 3664
      i32.const 34
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     local.get $1
     call $src/Memory/Memory#read
    else
     local.get $1
     i32.const 65535
     i32.and
     local.tee $2
     i32.const 65535
     i32.le_u
     local.get $2
     i32.const 61440
     i32.ge_u
     i32.and
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load
      local.tee $3
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=12
      local.tee $4
      i32.store offset=16
      local.get $4
      i32.eqz
      if
       local.get $2
       call $src/lib/lib_numbers/toHex
       local.set $0
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       i32.const 5632
       local.get $0
       call $~lib/string/String#concat
       i32.const 3664
       i32.const 43
       i32.const 17
       call $~lib/builtins/abort
       unreachable
      end
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store
      block $__inlined_func$src/IoManager/IoManager#read$44 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 24
       i32.sub
       global.set $~lib/memory/__stack_pointer
       global.get $~lib/memory/__stack_pointer
       i32.const 10868
       i32.lt_s
       br_if $folding-inner0
       global.get $~lib/memory/__stack_pointer
       i32.const 0
       i32.const 24
       memory.fill
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.load offset=4
       local.tee $5
       i32.store
       local.get $1
       i32.const 61440
       i32.sub
       local.tee $2
       i32.const 65535
       i32.and
       i32.const 4
       i32.shr_u
       local.tee $3
       i32.const 255
       i32.and
       local.tee $6
       local.get $5
       call $~lib/array/Array<src/IoManager/IoDevice>#get:length
       i32.const 1
       i32.sub
       i32.const 255
       i32.and
       i32.gt_u
       if
        local.get $6
        call $~lib/util/number/utoa32
        local.set $0
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        i32.const 5744
        local.get $0
        call $~lib/string/String#concat
        i32.const 1712
        i32.const 130
        i32.const 13
        call $~lib/builtins/abort
        unreachable
       end
       local.get $2
       i32.const 15
       i32.and
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.load offset=4
       local.tee $4
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $4
       local.get $3
       i32.const 255
       i32.and
       call $~lib/array/Array<src/IoManager/IoDevice>#__get
       local.tee $4
       i32.store offset=8
       local.get $4
       if
        local.get $3
        local.get $2
        call $src/external_functions/jsIo.read
        global.get $~lib/memory/__stack_pointer
        i32.const 24
        i32.add
        global.set $~lib/memory/__stack_pointer
        br $__inlined_func$src/IoManager/IoManager#read$44
       end
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.const 255
       i32.and
       call $~lib/util/number/utoa32
       local.tee $3
       i32.store offset=12
       global.get $~lib/memory/__stack_pointer
       local.get $2
       call $~lib/util/number/utoa32
       local.tee $2
       i32.store offset=16
       global.get $~lib/memory/__stack_pointer
       i32.const 5936
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.store offset=20
       i32.const 5940
       local.get $3
       i32.store
       i32.const 5936
       local.get $3
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       i32.const 5936
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=20
       i32.const 5948
       local.get $2
       i32.store
       i32.const 5936
       local.get $2
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       i32.const 5936
       i32.store offset=4
       i32.const 5936
       call $~lib/staticarray/StaticArray<~lib/string/String>#join
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       call $src/external_functions/console.warn
       global.get $~lib/memory/__stack_pointer
       i32.const 24
       i32.add
       global.set $~lib/memory/__stack_pointer
       i32.const 0
      end
     else
      local.get $1
      i32.const 65535
      i32.and
      call $src/lib/lib_numbers/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 5984
      local.get $0
      call $~lib/string/String#concat
      i32.const 3664
      i32.const 51
      i32.const 13
      call $~lib/builtins/abort
      unreachable
     end
    end
   end
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load8_u offset=4
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    call $src/lib/lib_numbers/toHex
    local.tee $0
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 255
    i32.and
    call $~lib/util/number/utoa32
    local.tee $3
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 65535
    i32.and
    local.tee $1
    call $src/lib/lib_numbers/toHex
    local.tee $4
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa32
    local.tee $1
    i32.store offset=32
    global.get $~lib/memory/__stack_pointer
    i32.const 6144
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=36
    i32.const 6148
    local.get $0
    i32.store
    i32.const 6144
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 6144
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=36
    i32.const 6156
    local.get $3
    i32.store
    i32.const 6144
    local.get $3
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 6144
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=36
    i32.const 6164
    local.get $4
    i32.store
    i32.const 6144
    local.get $4
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 6144
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=36
    i32.const 6172
    local.get $1
    i32.store
    i32.const 6144
    local.get $1
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 6144
    i32.store offset=4
    i32.const 6144
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $src/external_functions/console.log
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/Cpu#readMemory (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $0
  i32.store offset=8
  local.get $0
  i32.eqz
  if
   i32.const 5296
   i32.const 5360
   i32.const 107
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Memory/MemoryBus#read
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/typedarray/Uint8Array#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 21
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   local.get $1
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.const 3
    call $~lib/rt/itcms/__new
    local.tee $1
    i32.store
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 1073741820
   i32.gt_u
   if
    i32.const 1488
    i32.const 3856
    i32.const 19
    i32.const 57
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=12
   local.get $1
   local.get $2
   i32.store
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/Cpu#readMem8 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.load
  local.tee $2
  i32.store offset=8
  local.get $2
  i32.eqz
  if
   i32.const 5296
   i32.const 5360
   i32.const 85
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMemory
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/typedarray/Uint8Array#__set (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 1248
   i32.const 6272
   i32.const 178
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  local.get $2
  i32.store8
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|0 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 2
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=12
  local.get $1
  i32.const 0
  local.get $0
  local.get $2
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=12
  local.get $1
  i32.const 1
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/typedarray/Uint8Array#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 1248
   i32.const 6272
   i32.const 167
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.load8_u
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|1 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  call $src/lib/lib_numbers/toHex
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 6480
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=20
  i32.const 6484
  local.get $2
  i32.store
  i32.const 6480
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6480
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=20
  i32.const 6492
  local.get $1
  i32.store
  i32.const 6480
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6480
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=20
  i32.const 6500
  local.get $3
  i32.store
  i32.const 6480
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6480
  i32.store offset=16
  i32.const 6480
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=16
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|2 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 1
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|3 (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 1
  i32.store8 offset=8
  i32.const 6592
  call $src/external_functions/console.log
  call $src/external_functions/jsCpu.halted
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|4 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $src/lib/lib_numbers/toHex
  local.tee $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $2
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  i32.const 6672
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  i32.const 6676
  local.get $3
  i32.store
  i32.const 6672
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6672
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  i32.const 6684
  local.get $1
  i32.store
  i32.const 6672
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6672
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  i32.const 6692
  local.get $2
  i32.store
  i32.const 6672
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 6672
  i32.store offset=4
  i32.const 6672
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/Cpu#getRegisterValueByIdx (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $folding-inner0
   local.get $1
   i32.const 255
   i32.and
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u
    local.set $0
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 2
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=1
    local.set $0
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 3
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=2
    local.set $0
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 4
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=3
    local.set $0
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 5
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=4
    local.set $0
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 6
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=5
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.const 255
   i32.and
   call $~lib/util/number/utoa32
   local.tee $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 7072
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 7076
   local.get $0
   i32.store
   i32.const 7072
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 7072
   i32.store
   i32.const 7072
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 5360
   i32.const 168
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|5 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 32
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem8
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   i32.const 1
   i32.add
   call $src/Cpu/Cpu#readMem8
   local.set $3
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   block $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    local.get $3
    i32.const 255
    i32.and
    i32.const 1
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6752
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    local.get $3
    i32.const 255
    i32.and
    i32.const 2
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6784
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    local.get $3
    i32.const 255
    i32.and
    i32.const 3
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6816
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    local.get $3
    i32.const 255
    i32.and
    i32.const 4
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6848
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    local.get $3
    i32.const 255
    i32.and
    i32.const 5
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6880
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    local.get $3
    i32.const 255
    i32.and
    i32.const 6
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 6912
     local.set $1
     br $__inlined_func$src/Cpu/Cpu#getRegisterNameByIdx$1609
    end
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.const 255
    i32.and
    call $~lib/util/number/utoa32
    local.tee $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 7040
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    i32.const 7044
    local.get $0
    i32.store
    i32.const 7040
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 7040
    i32.store offset=4
    i32.const 7040
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 5360
    i32.const 156
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   call $src/Cpu/Cpu#getRegisterValueByIdx
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 255
   i32.and
   call $~lib/util/number/utoa32
   local.tee $2
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.const 255
   i32.and
   local.tee $3
   call $src/lib/lib_numbers/toHex
   local.tee $4
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $3
   call $~lib/util/number/utoa32
   local.tee $3
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 7184
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   i32.const 7188
   local.get $2
   i32.store
   i32.const 7184
   local.get $2
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 7184
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   i32.const 7196
   local.get $1
   i32.store
   i32.const 7184
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 7184
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=8
   i32.const 7204
   local.get $4
   i32.store
   i32.const 7184
   local.get $4
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 7184
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   i32.const 7212
   local.get $3
   i32.store
   i32.const 7184
   local.get $3
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 7184
   i32.store offset=4
   i32.const 7184
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   call $src/external_functions/console.log
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/Cpu#readMem16 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.load
  local.tee $2
  i32.store offset=8
  local.get $2
  i32.eqz
  if
   i32.const 5296
   i32.const 5360
   i32.const 94
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|6 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $4
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 65535
  i32.and
  call $src/lib/lib_numbers/toHex
  local.tee $2
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  call $src/lib/lib_numbers/toHex
  local.tee $1
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 255
  i32.and
  call $~lib/util/number/utoa32
  local.tee $3
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 7392
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  i32.const 7396
  local.get $4
  i32.store
  i32.const 7392
  local.get $4
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 7392
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  i32.const 7404
  local.get $2
  i32.store
  i32.const 7392
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 7392
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  i32.const 7412
  local.get $1
  i32.store
  i32.const 7392
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 7392
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  i32.const 7420
  local.get $3
  i32.store
  i32.const 7392
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 7392
  i32.store offset=4
  i32.const 7392
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|7 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  i32.const 7488
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 1
  i32.store8 offset=28
  call $src/external_functions/jsCpu.breakpoint
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 1
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|8 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  local.get $1
  local.get $2
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/Cpu#writeMemory (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $0
  i32.store offset=8
  local.get $0
  i32.eqz
  if
   i32.const 5296
   i32.const 5360
   i32.const 115
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Memory/MemoryBus#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|9 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  local.get $1
  i32.load16_u offset=6
  i32.const 3
  i32.add
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=10
  local.get $2
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $1
  local.get $3
  i32.load16_u offset=10
  i32.const 1
  i32.sub
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=10
  local.get $2
  i32.const 255
  i32.and
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.load16_u offset=10
  i32.const 1
  i32.sub
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  local.get $1
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|10 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.load16_u offset=10
  i32.const 1
  i32.add
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=10
  call $src/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $3
  local.get $1
  i32.load16_u offset=10
  i32.const 1
  i32.add
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=10
  call $src/Cpu/Cpu#readMemory
  i32.const 8
  i32.shl
  local.get $2
  i32.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  local.get $1
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|11 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  local.get $1
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/Cpu#getFlag (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   block $__inlined_func$~lib/string/String.__eq$32 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 10868
    i32.lt_s
    br_if $folding-inner1
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    local.get $1
    i32.const 7728
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1
     br $__inlined_func$~lib/string/String.__eq$32
    end
    block $folding-inner0
     local.get $1
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     local.get $1
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     local.set $3
     global.get $~lib/memory/__stack_pointer
     i32.const 7728
     i32.store
     local.get $3
     i32.const 7724
     i32.load
     i32.const 1
     i32.shr_u
     i32.ne
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     i32.const 7728
     local.set $4
     global.get $~lib/memory/__stack_pointer
     i32.const 7728
     i32.store offset=4
     i32.const 1
     local.get $1
     local.tee $2
     i32.const 7
     i32.and
     local.get $3
     local.tee $1
     i32.const 4
     i32.lt_u
     select
     i32.eqz
     if
      loop $do-loop|0
       local.get $2
       i64.load
       local.get $4
       i64.load
       i64.eq
       if
        local.get $2
        i32.const 8
        i32.add
        local.set $2
        local.get $4
        i32.const 8
        i32.add
        local.set $4
        local.get $1
        i32.const 4
        i32.sub
        local.tee $1
        i32.const 4
        i32.ge_u
        br_if $do-loop|0
       end
      end
     end
     block $__inlined_func$~lib/util/string/compareImpl$384
      loop $while-continue|1
       local.get $1
       local.tee $3
       i32.const 1
       i32.sub
       local.set $1
       local.get $3
       if
        local.get $2
        i32.load16_u
        local.tee $5
        local.get $4
        i32.load16_u
        local.tee $6
        i32.sub
        local.set $3
        local.get $5
        local.get $6
        i32.ne
        br_if $__inlined_func$~lib/util/string/compareImpl$384
        local.get $2
        i32.const 2
        i32.add
        local.set $2
        local.get $4
        i32.const 2
        i32.add
        local.set $4
        br $while-continue|1
       end
      end
      i32.const 0
      local.set $3
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $3
     i32.eqz
     br $__inlined_func$~lib/string/String.__eq$32
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
   end
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=12
    i32.const 2
    i32.and
    i32.const 0
    i32.ne
   else
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    i32.load8_u offset=12
    i32.const 1
    i32.and
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|12 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7696
  call $src/Cpu/Cpu#getFlag
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|13 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7696
  call $src/Cpu/Cpu#getFlag
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|14 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|15 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|16 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 0
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 7696
   call $src/Cpu/Cpu#getFlag
  end
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|17 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 7696
   call $src/Cpu/Cpu#getFlag
  end
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|18 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 7696
   call $src/Cpu/Cpu#getFlag
  end
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|19 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 7728
  call $src/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 0
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 7696
   call $src/Cpu/Cpu#getFlag
  end
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 3
   i32.add
   i32.store16 offset=6
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem16
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.store16 offset=6
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|20 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=16
  local.get $1
  i32.const 0
  local.get $0
  local.get $2
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=16
  local.get $1
  i32.const 1
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $1
  i32.const 2
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $1
  i32.const 3
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/Cpu#setRegisterValueByIdx (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $folding-inner0
   local.get $1
   i32.const 255
   i32.and
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 2
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8 offset=1
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 3
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8 offset=2
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 4
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8 offset=3
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 5
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8 offset=4
    br $folding-inner0
   end
   local.get $1
   i32.const 255
   i32.and
   i32.const 6
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store
    local.get $0
    local.get $2
    i32.store8 offset=5
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.const 255
   i32.and
   call $~lib/util/number/utoa32
   local.tee $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 8048
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 8052
   local.get $0
   i32.store
   i32.const 8048
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8048
   i32.store
   i32.const 8048
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 5360
   i32.const 201
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|21 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 2
  call $~lib/typedarray/Uint8Array#__get
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 3
  call $~lib/typedarray/Uint8Array#__get
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  local.get $4
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|22 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|23 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|24 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|25 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|26 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|27 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem8
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $src/Cpu/Cpu#getRegisterValueByIdx
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.load
   local.tee $2
   i32.store offset=8
   local.get $2
   i32.eqz
   if
    i32.const 5296
    i32.const 5360
    i32.const 123
    i32.const 25
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.store offset=4
   local.get $0
   local.get $2
   i32.load16_u offset=10
   local.get $1
   call $src/Cpu/Cpu#writeMemory
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.store offset=4
   local.get $1
   local.get $2
   i32.load16_u offset=10
   i32.const 1
   i32.sub
   i32.store16 offset=10
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 2
   i32.add
   i32.store16 offset=6
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|28 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=6
   call $src/Cpu/Cpu#readMem8
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.load
   local.tee $1
   i32.store offset=8
   local.get $1
   i32.eqz
   if
    i32.const 5296
    i32.const 5360
    i32.const 135
    i32.const 25
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store offset=4
   local.get $1
   local.get $3
   i32.load16_u offset=10
   i32.const 1
   i32.add
   i32.store16 offset=10
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.load16_u offset=10
   call $src/Cpu/Cpu#readMemory
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $2
   local.get $1
   call $src/Cpu/Cpu#setRegisterValueByIdx
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 2
   i32.add
   i32.store16 offset=6
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/Cpu/Flags#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2
  i32.const 26
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/object/Object#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/AluResult#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 25
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/object/Object#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store8 offset=1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/ALU#inc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.const 1
  i32.add
  i32.const 255
  i32.and
  local.tee $2
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  i32.lt_u
  i32.store8 offset=1
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=16
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/Cpu#setFlags (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  local.get $2
  i32.const 0
  i32.ne
  i32.const 2
  i32.const 0
  local.get $1
  select
  i32.or
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|29 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#inc
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 2
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|30 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#inc
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#dec (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.const 1
  i32.sub
  i32.const 255
  i32.and
  local.tee $2
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  i32.gt_u
  i32.store8 offset=1
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=16
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|31 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#dec
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 2
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|32 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#dec
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#not (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.const -1
  i32.xor
  i32.const 255
  i32.and
  local.tee $0
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.const 255
  i32.gt_u
  i32.store8 offset=1
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=16
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|33 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#not
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 2
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|34 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $src/Cpu/ALU#not
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $2
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  local.get $1
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#add (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.add
  i32.const 255
  i32.and
  local.tee $1
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $1
  local.get $0
  i32.const 255
  i32.and
  i32.lt_u
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|35 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#add
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|36 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#add
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|37 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#add
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|38 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#add
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|39 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#add
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#sub (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.sub
  i32.const 255
  i32.and
  local.tee $4
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.lt_u
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $4
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|40 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#sub
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|41 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#sub
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|42 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#sub
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|43 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#sub
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|44 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#sub
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#and (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.and
  i32.const 255
  i32.and
  local.tee $0
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|45 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#and
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|46 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#and
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|47 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#and
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|48 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#and
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|49 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#and
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#or (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.or
  i32.const 255
  i32.and
  local.tee $0
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|50 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#or
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|51 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#or
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|52 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#or
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|53 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#or
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|54 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#or
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#xor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.xor
  i32.const 255
  i32.and
  local.tee $0
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|55 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#xor
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|56 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#xor
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|57 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#xor
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|58 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#xor
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|59 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#xor
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#cmp (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.sub
  i32.const 255
  i32.and
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.lt_u
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|60 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#cmp
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|61 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#cmp
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|62 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#cmp
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#test (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  local.get $1
  i32.and
  i32.const 255
  i32.and
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=1
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|63 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#test
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|64 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#test
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|65 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  call $src/Cpu/ALU#test
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $2
  i32.load8_u
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#shl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  loop $for-loop|0
   local.get $2
   local.get $1
   i32.const 255
   i32.and
   i32.lt_u
   if
    local.get $0
    i32.const 128
    i32.and
    i32.const 0
    i32.ne
    local.set $3
    local.get $0
    i32.const 1
    i32.shl
    i32.const 255
    i32.and
    local.set $0
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  local.get $3
  i32.store8 offset=1
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|66 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shl
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|67 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shl
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|68 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shl
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|69 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shl
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|70 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shl
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/ALU#shr (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  loop $for-loop|0
   local.get $2
   local.get $1
   i32.const 255
   i32.and
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.and
    local.set $3
    local.get $0
    i32.const 255
    i32.and
    i32.const 1
    i32.shr_u
    local.set $0
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/AluResult#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  call $src/Cpu/Flags#constructor
  local.tee $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  local.get $0
  i32.const 255
  i32.and
  i32.eqz
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $2
  local.get $3
  i32.store8 offset=1
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|71 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shr
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|72 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shr
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 3
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|73 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#readMemory
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shr
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|74 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shr
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|75 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=24
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $3
  call $src/Cpu/ALU#shr
  local.tee $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  i32.load8_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $4
  local.get $1
  i32.load8_u offset=1
  call $src/Cpu/Cpu#setFlags
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  local.get $3
  i32.load8_u
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|76 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $3
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  i32.const 255
  i32.and
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 5
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|77 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  i32.const 255
  i32.and
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $3
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 5
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|78 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.add
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|79 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions~anonymous|80 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=4
  local.get $0
  local.get $3
  i32.load16_u offset=6
  i32.const 2
  i32.add
  call $src/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  call $src/Cpu/Cpu#writeMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 4
  i32.add
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/Cpu/fetchInstructionActions (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 24
   memory.fill
   block $break|0
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
                                                                                  local.get $0
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  local.tee $0
                                                                                  i32.const 4
                                                                                  i32.ne
                                                                                  if
                                                                                   local.get $0
                                                                                   br_table $case1|0 $case2|0 $case8|0 $case9|0 $case3|0 $case4|0 $case5|0 $break|0 $break|0 $case6|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case10|0 $case13|0 $case14|0 $case11|0 $case12|0 $case15|0 $case16|0 $case17|0 $case18|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case21|0 $case22|0 $case23|0 $case24|0 $case20|0 $case19|0 $case25|0 $case26|0 $case7|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case27|0 $case28|0 $case29|0 $case30|0 $case31|0 $case32|0 $case33|0 $case34|0 $case35|0 $case36|0 $case37|0 $case38|0 $case39|0 $case40|0 $case41|0 $case42|0 $case43|0 $case44|0 $case45|0 $case46|0 $case47|0 $case48|0 $case49|0 $case50|0 $case51|0 $case52|0 $case53|0 $case54|0 $case55|0 $case56|0 $case57|0 $break|0 $case58|0 $case59|0 $case60|0 $case61|0 $case62|0 $case63|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case64|0 $case65|0 $case66|0 $case67|0 $case68|0 $case69|0 $case70|0 $case71|0 $case72|0 $case73|0 $break|0 $break|0 $case74|0 $case75|0 $case76|0 $case77|0 $case78|0 $break|0
                                                                                  end
                                                                                  i32.const 6336
                                                                                  local.set $2
                                                                                  global.get $~lib/memory/__stack_pointer
                                                                                  i32.const 6336
                                                                                  i32.store
                                                                                  i32.const 6528
                                                                                  local.set $3
                                                                                  global.get $~lib/memory/__stack_pointer
                                                                                  i32.const 6528
                                                                                  i32.store offset=4
                                                                                  br $break|0
                                                                                 end
                                                                                 i32.const 6560
                                                                                 local.set $1
                                                                                 global.get $~lib/memory/__stack_pointer
                                                                                 i32.const 6560
                                                                                 i32.store offset=8
                                                                                 br $break|0
                                                                                end
                                                                                i32.const 6640
                                                                                local.set $1
                                                                                global.get $~lib/memory/__stack_pointer
                                                                                i32.const 6640
                                                                                i32.store offset=8
                                                                                br $break|0
                                                                               end
                                                                               i32.const 6720
                                                                               local.set $1
                                                                               global.get $~lib/memory/__stack_pointer
                                                                               i32.const 6720
                                                                               i32.store offset=8
                                                                               br $break|0
                                                                              end
                                                                              i32.const 7248
                                                                              local.set $1
                                                                              global.get $~lib/memory/__stack_pointer
                                                                              i32.const 7248
                                                                              i32.store offset=8
                                                                              br $break|0
                                                                             end
                                                                             i32.const 7456
                                                                             local.set $1
                                                                             global.get $~lib/memory/__stack_pointer
                                                                             i32.const 7456
                                                                             i32.store offset=8
                                                                             br $break|0
                                                                            end
                                                                            i32.const 7536
                                                                            local.set $1
                                                                            global.get $~lib/memory/__stack_pointer
                                                                            i32.const 7536
                                                                            i32.store offset=8
                                                                            br $break|0
                                                                           end
                                                                           i32.const 7568
                                                                           local.set $1
                                                                           global.get $~lib/memory/__stack_pointer
                                                                           i32.const 7568
                                                                           i32.store offset=8
                                                                           br $break|0
                                                                          end
                                                                          i32.const 7600
                                                                          local.set $1
                                                                          global.get $~lib/memory/__stack_pointer
                                                                          i32.const 7600
                                                                          i32.store offset=8
                                                                          br $break|0
                                                                         end
                                                                         i32.const 7632
                                                                         local.set $1
                                                                         global.get $~lib/memory/__stack_pointer
                                                                         i32.const 7632
                                                                         i32.store offset=8
                                                                         br $break|0
                                                                        end
                                                                        i32.const 7664
                                                                        local.set $1
                                                                        global.get $~lib/memory/__stack_pointer
                                                                        i32.const 7664
                                                                        i32.store offset=8
                                                                        br $break|0
                                                                       end
                                                                       i32.const 7760
                                                                       local.set $1
                                                                       global.get $~lib/memory/__stack_pointer
                                                                       i32.const 7760
                                                                       i32.store offset=8
                                                                       br $break|0
                                                                      end
                                                                      i32.const 7792
                                                                      local.set $1
                                                                      global.get $~lib/memory/__stack_pointer
                                                                      i32.const 7792
                                                                      i32.store offset=8
                                                                      br $break|0
                                                                     end
                                                                     i32.const 7824
                                                                     local.set $1
                                                                     global.get $~lib/memory/__stack_pointer
                                                                     i32.const 7824
                                                                     i32.store offset=8
                                                                     br $break|0
                                                                    end
                                                                    i32.const 7856
                                                                    local.set $1
                                                                    global.get $~lib/memory/__stack_pointer
                                                                    i32.const 7856
                                                                    i32.store offset=8
                                                                    br $break|0
                                                                   end
                                                                   i32.const 7888
                                                                   local.set $1
                                                                   global.get $~lib/memory/__stack_pointer
                                                                   i32.const 7888
                                                                   i32.store offset=8
                                                                   br $break|0
                                                                  end
                                                                  i32.const 7920
                                                                  local.set $1
                                                                  global.get $~lib/memory/__stack_pointer
                                                                  i32.const 7920
                                                                  i32.store offset=8
                                                                  br $break|0
                                                                 end
                                                                 i32.const 7952
                                                                 local.set $1
                                                                 global.get $~lib/memory/__stack_pointer
                                                                 i32.const 7952
                                                                 i32.store offset=8
                                                                 br $break|0
                                                                end
                                                                i32.const 7984
                                                                local.set $1
                                                                global.get $~lib/memory/__stack_pointer
                                                                i32.const 7984
                                                                i32.store offset=8
                                                                br $break|0
                                                               end
                                                               i32.const 8016
                                                               local.set $2
                                                               global.get $~lib/memory/__stack_pointer
                                                               i32.const 8016
                                                               i32.store
                                                               i32.const 8080
                                                               local.set $3
                                                               global.get $~lib/memory/__stack_pointer
                                                               i32.const 8080
                                                               i32.store offset=4
                                                               br $break|0
                                                              end
                                                              i32.const 8112
                                                              local.set $1
                                                              global.get $~lib/memory/__stack_pointer
                                                              i32.const 8112
                                                              i32.store offset=8
                                                              br $break|0
                                                             end
                                                             i32.const 8144
                                                             local.set $1
                                                             global.get $~lib/memory/__stack_pointer
                                                             i32.const 8144
                                                             i32.store offset=8
                                                             br $break|0
                                                            end
                                                            i32.const 8176
                                                            local.set $1
                                                            global.get $~lib/memory/__stack_pointer
                                                            i32.const 8176
                                                            i32.store offset=8
                                                            br $break|0
                                                           end
                                                           i32.const 8208
                                                           local.set $1
                                                           global.get $~lib/memory/__stack_pointer
                                                           i32.const 8208
                                                           i32.store offset=8
                                                           br $break|0
                                                          end
                                                          i32.const 8240
                                                          local.set $1
                                                          global.get $~lib/memory/__stack_pointer
                                                          i32.const 8240
                                                          i32.store offset=8
                                                          br $break|0
                                                         end
                                                         i32.const 8272
                                                         local.set $1
                                                         global.get $~lib/memory/__stack_pointer
                                                         i32.const 8272
                                                         i32.store offset=8
                                                         br $break|0
                                                        end
                                                        i32.const 8304
                                                        local.set $1
                                                        global.get $~lib/memory/__stack_pointer
                                                        i32.const 8304
                                                        i32.store offset=8
                                                        br $break|0
                                                       end
                                                       i32.const 8336
                                                       local.set $1
                                                       global.get $~lib/memory/__stack_pointer
                                                       i32.const 8336
                                                       i32.store offset=8
                                                       br $break|0
                                                      end
                                                      i32.const 8368
                                                      local.set $1
                                                      global.get $~lib/memory/__stack_pointer
                                                      i32.const 8368
                                                      i32.store offset=8
                                                      br $break|0
                                                     end
                                                     i32.const 8400
                                                     local.set $1
                                                     global.get $~lib/memory/__stack_pointer
                                                     i32.const 8400
                                                     i32.store offset=8
                                                     br $break|0
                                                    end
                                                    i32.const 8432
                                                    local.set $1
                                                    global.get $~lib/memory/__stack_pointer
                                                    i32.const 8432
                                                    i32.store offset=8
                                                    br $break|0
                                                   end
                                                   i32.const 8464
                                                   local.set $1
                                                   global.get $~lib/memory/__stack_pointer
                                                   i32.const 8464
                                                   i32.store offset=8
                                                   br $break|0
                                                  end
                                                  i32.const 8496
                                                  local.set $1
                                                  global.get $~lib/memory/__stack_pointer
                                                  i32.const 8496
                                                  i32.store offset=8
                                                  br $break|0
                                                 end
                                                 i32.const 8528
                                                 local.set $1
                                                 global.get $~lib/memory/__stack_pointer
                                                 i32.const 8528
                                                 i32.store offset=8
                                                 br $break|0
                                                end
                                                i32.const 8560
                                                local.set $1
                                                global.get $~lib/memory/__stack_pointer
                                                i32.const 8560
                                                i32.store offset=8
                                                br $break|0
                                               end
                                               i32.const 8592
                                               local.set $1
                                               global.get $~lib/memory/__stack_pointer
                                               i32.const 8592
                                               i32.store offset=8
                                               br $break|0
                                              end
                                              i32.const 8624
                                              local.set $1
                                              global.get $~lib/memory/__stack_pointer
                                              i32.const 8624
                                              i32.store offset=8
                                              br $break|0
                                             end
                                             i32.const 8656
                                             local.set $1
                                             global.get $~lib/memory/__stack_pointer
                                             i32.const 8656
                                             i32.store offset=8
                                             br $break|0
                                            end
                                            i32.const 8688
                                            local.set $1
                                            global.get $~lib/memory/__stack_pointer
                                            i32.const 8688
                                            i32.store offset=8
                                            br $break|0
                                           end
                                           i32.const 8720
                                           local.set $1
                                           global.get $~lib/memory/__stack_pointer
                                           i32.const 8720
                                           i32.store offset=8
                                           br $break|0
                                          end
                                          i32.const 8752
                                          local.set $1
                                          global.get $~lib/memory/__stack_pointer
                                          i32.const 8752
                                          i32.store offset=8
                                          br $break|0
                                         end
                                         i32.const 8784
                                         local.set $1
                                         global.get $~lib/memory/__stack_pointer
                                         i32.const 8784
                                         i32.store offset=8
                                         br $break|0
                                        end
                                        i32.const 8816
                                        local.set $1
                                        global.get $~lib/memory/__stack_pointer
                                        i32.const 8816
                                        i32.store offset=8
                                        br $break|0
                                       end
                                       i32.const 8848
                                       local.set $1
                                       global.get $~lib/memory/__stack_pointer
                                       i32.const 8848
                                       i32.store offset=8
                                       br $break|0
                                      end
                                      i32.const 8880
                                      local.set $1
                                      global.get $~lib/memory/__stack_pointer
                                      i32.const 8880
                                      i32.store offset=8
                                      br $break|0
                                     end
                                     i32.const 8912
                                     local.set $1
                                     global.get $~lib/memory/__stack_pointer
                                     i32.const 8912
                                     i32.store offset=8
                                     br $break|0
                                    end
                                    i32.const 8944
                                    local.set $1
                                    global.get $~lib/memory/__stack_pointer
                                    i32.const 8944
                                    i32.store offset=8
                                    br $break|0
                                   end
                                   i32.const 8976
                                   local.set $1
                                   global.get $~lib/memory/__stack_pointer
                                   i32.const 8976
                                   i32.store offset=8
                                   br $break|0
                                  end
                                  i32.const 9008
                                  local.set $1
                                  global.get $~lib/memory/__stack_pointer
                                  i32.const 9008
                                  i32.store offset=8
                                  br $break|0
                                 end
                                 i32.const 9040
                                 local.set $1
                                 global.get $~lib/memory/__stack_pointer
                                 i32.const 9040
                                 i32.store offset=8
                                 br $break|0
                                end
                                i32.const 9072
                                local.set $1
                                global.get $~lib/memory/__stack_pointer
                                i32.const 9072
                                i32.store offset=8
                                br $break|0
                               end
                               i32.const 9104
                               local.set $1
                               global.get $~lib/memory/__stack_pointer
                               i32.const 9104
                               i32.store offset=8
                               br $break|0
                              end
                              i32.const 9136
                              local.set $1
                              global.get $~lib/memory/__stack_pointer
                              i32.const 9136
                              i32.store offset=8
                              br $break|0
                             end
                             i32.const 9168
                             local.set $1
                             global.get $~lib/memory/__stack_pointer
                             i32.const 9168
                             i32.store offset=8
                             br $break|0
                            end
                            i32.const 9200
                            local.set $1
                            global.get $~lib/memory/__stack_pointer
                            i32.const 9200
                            i32.store offset=8
                            br $break|0
                           end
                           i32.const 9232
                           local.set $1
                           global.get $~lib/memory/__stack_pointer
                           i32.const 9232
                           i32.store offset=8
                           br $break|0
                          end
                          i32.const 9264
                          local.set $1
                          global.get $~lib/memory/__stack_pointer
                          i32.const 9264
                          i32.store offset=8
                          br $break|0
                         end
                         i32.const 9296
                         local.set $1
                         global.get $~lib/memory/__stack_pointer
                         i32.const 9296
                         i32.store offset=8
                         br $break|0
                        end
                        i32.const 9328
                        local.set $1
                        global.get $~lib/memory/__stack_pointer
                        i32.const 9328
                        i32.store offset=8
                        br $break|0
                       end
                       i32.const 9360
                       local.set $1
                       global.get $~lib/memory/__stack_pointer
                       i32.const 9360
                       i32.store offset=8
                       br $break|0
                      end
                      i32.const 9392
                      local.set $1
                      global.get $~lib/memory/__stack_pointer
                      i32.const 9392
                      i32.store offset=8
                      br $break|0
                     end
                     i32.const 9424
                     local.set $1
                     global.get $~lib/memory/__stack_pointer
                     i32.const 9424
                     i32.store offset=8
                     br $break|0
                    end
                    i32.const 9456
                    local.set $1
                    global.get $~lib/memory/__stack_pointer
                    i32.const 9456
                    i32.store offset=8
                    br $break|0
                   end
                   i32.const 9488
                   local.set $1
                   global.get $~lib/memory/__stack_pointer
                   i32.const 9488
                   i32.store offset=8
                   br $break|0
                  end
                  i32.const 9520
                  local.set $1
                  global.get $~lib/memory/__stack_pointer
                  i32.const 9520
                  i32.store offset=8
                  br $break|0
                 end
                 i32.const 9552
                 local.set $1
                 global.get $~lib/memory/__stack_pointer
                 i32.const 9552
                 i32.store offset=8
                 br $break|0
                end
                i32.const 9584
                local.set $1
                global.get $~lib/memory/__stack_pointer
                i32.const 9584
                i32.store offset=8
                br $break|0
               end
               i32.const 9616
               local.set $1
               global.get $~lib/memory/__stack_pointer
               i32.const 9616
               i32.store offset=8
               br $break|0
              end
              i32.const 9648
              local.set $1
              global.get $~lib/memory/__stack_pointer
              i32.const 9648
              i32.store offset=8
              br $break|0
             end
             i32.const 9680
             local.set $1
             global.get $~lib/memory/__stack_pointer
             i32.const 9680
             i32.store offset=8
             br $break|0
            end
            i32.const 9712
            local.set $1
            global.get $~lib/memory/__stack_pointer
            i32.const 9712
            i32.store offset=8
            br $break|0
           end
           i32.const 9744
           local.set $1
           global.get $~lib/memory/__stack_pointer
           i32.const 9744
           i32.store offset=8
           br $break|0
          end
          i32.const 9776
          local.set $1
          global.get $~lib/memory/__stack_pointer
          i32.const 9776
          i32.store offset=8
          br $break|0
         end
         i32.const 9808
         local.set $1
         global.get $~lib/memory/__stack_pointer
         i32.const 9808
         i32.store offset=8
         br $break|0
        end
        i32.const 9840
        local.set $1
        global.get $~lib/memory/__stack_pointer
        i32.const 9840
        i32.store offset=8
        br $break|0
       end
       i32.const 9872
       local.set $1
       global.get $~lib/memory/__stack_pointer
       i32.const 9872
       i32.store offset=8
       br $break|0
      end
      i32.const 9904
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 9904
      i32.store offset=8
      br $break|0
     end
     i32.const 9936
     local.set $1
     global.get $~lib/memory/__stack_pointer
     i32.const 9936
     i32.store offset=8
     br $break|0
    end
    i32.const 9968
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 9968
    i32.store offset=8
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 20
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/index/computerRunCycles (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.store
   local.get $4
   call $~lib/array/Array<src/IoManager/IoDevice>#get:length
   i32.const 0
   i32.gt_s
   if
    loop $for-loop|0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $4
     i32.store
     local.get $4
     call $~lib/array/Array<src/IoManager/IoDevice>#get:length
     local.get $2
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=16
      local.tee $4
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $4
      local.get $2
      call $~lib/array/Array<src/IoManager/IoDevice>#__get
      local.tee $4
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store
      local.get $4
      i32.const 0
      i32.store8 offset=28
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|0
     end
    end
    loop $for-loop|1
     local.get $1
     local.get $3
     i32.gt_u
     if
      i32.const 0
      local.set $2
      loop $for-loop|2
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=16
       local.tee $4
       i32.store
       local.get $4
       call $~lib/array/Array<src/IoManager/IoDevice>#get:length
       local.get $2
       i32.gt_s
       if
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.load offset=16
        local.tee $4
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        local.get $2
        call $~lib/array/Array<src/IoManager/IoDevice>#__get
        local.tee $4
        i32.store offset=12
        local.get $4
        if (result i32)
         global.get $~lib/memory/__stack_pointer
         local.get $4
         i32.store
         local.get $4
         i32.load8_u offset=28
        else
         i32.const 1
        end
        i32.eqz
        if
         global.get $~lib/memory/__stack_pointer
         local.get $4
         i32.store
         global.get $~lib/memory/__stack_pointer
         i32.const 12
         i32.sub
         global.set $~lib/memory/__stack_pointer
         global.get $~lib/memory/__stack_pointer
         i32.const 10868
         i32.lt_s
         br_if $folding-inner2
         global.get $~lib/memory/__stack_pointer
         i64.const 0
         i64.store
         global.get $~lib/memory/__stack_pointer
         i32.const 0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $4
         i32.store
         local.get $4
         i32.load8_u offset=8
         i32.eqz
         if
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store offset=4
          local.get $4
          local.get $4
          i64.load offset=16
          i64.const 1
          i64.add
          i64.store offset=16
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store
          global.get $~lib/memory/__stack_pointer
          i32.const 8
          i32.sub
          global.set $~lib/memory/__stack_pointer
          global.get $~lib/memory/__stack_pointer
          i32.const 10868
          i32.lt_s
          br_if $folding-inner2
          global.get $~lib/memory/__stack_pointer
          i64.const 0
          i64.store
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store offset=4
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.load offset=4
          local.tee $5
          i32.store
          local.get $5
          i32.load16_u offset=6
          local.set $5
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store
          local.get $4
          local.get $5
          call $src/Cpu/Cpu#readMemory
          local.set $5
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store offset=4
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.load offset=4
          local.tee $6
          i32.store
          local.get $6
          local.get $5
          i32.store8 offset=8
          global.get $~lib/memory/__stack_pointer
          i32.const 8
          i32.add
          global.set $~lib/memory/__stack_pointer
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store offset=8
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.load offset=4
          local.tee $5
          i32.store offset=4
          local.get $5
          i32.load8_u offset=8
          local.set $5
          global.get $~lib/memory/__stack_pointer
          i32.const 32
          i32.sub
          global.set $~lib/memory/__stack_pointer
          global.get $~lib/memory/__stack_pointer
          i32.const 10868
          i32.lt_s
          br_if $folding-inner2
          global.get $~lib/memory/__stack_pointer
          i32.const 0
          i32.const 32
          memory.fill
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.store offset=4
          global.get $~lib/memory/__stack_pointer
          local.get $4
          i32.load
          local.tee $6
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $6
          i32.load
          local.tee $6
          i32.store offset=8
          block $folding-inner00
           local.get $6
           i32.eqz
           if
            i32.const 6208
            call $src/external_functions/console.warn
            br $folding-inner00
           end
           global.get $~lib/memory/__stack_pointer
           local.get $5
           call $src/Cpu/fetchInstructionActions
           local.tee $6
           i32.store offset=12
           global.get $~lib/memory/__stack_pointer
           local.get $6
           i32.store
           local.get $6
           i32.load offset=4
           if (result i32)
            global.get $~lib/memory/__stack_pointer
            local.get $6
            i32.store
            local.get $6
            i32.load offset=8
           else
            i32.const 0
           end
           if
            global.get $~lib/memory/__stack_pointer
            local.get $4
            i32.store
            global.get $~lib/memory/__stack_pointer
            local.get $6
            i32.store offset=4
            global.get $~lib/memory/__stack_pointer
            local.get $4
            local.get $6
            i32.load offset=4
            i32.load
            call_indirect (type $2)
            local.tee $5
            i32.store offset=16
            global.get $~lib/memory/__stack_pointer
            local.get $4
            i32.store
            global.get $~lib/memory/__stack_pointer
            local.get $5
            i32.store offset=4
            global.get $~lib/memory/__stack_pointer
            local.get $6
            i32.store offset=20
            local.get $4
            local.get $5
            local.get $6
            i32.load offset=8
            i32.load
            call_indirect (type $4)
            br $folding-inner00
           else
            global.get $~lib/memory/__stack_pointer
            local.get $6
            i32.store
            local.get $6
            i32.load
            if
             global.get $~lib/memory/__stack_pointer
             local.get $4
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $6
             i32.store offset=4
             local.get $4
             local.get $6
             i32.load
             i32.load
             call_indirect (type $0)
             br $folding-inner00
            end
           end
           global.get $~lib/memory/__stack_pointer
           local.get $5
           call $src/lib/lib_numbers/toHex
           local.tee $0
           i32.store offset=24
           global.get $~lib/memory/__stack_pointer
           local.get $5
           call $~lib/util/number/utoa32
           local.tee $1
           i32.store offset=28
           global.get $~lib/memory/__stack_pointer
           i32.const 10080
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=4
           i32.const 10084
           local.get $0
           i32.store
           i32.const 10080
           local.get $0
           i32.const 1
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           i32.const 10080
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $1
           i32.store offset=4
           i32.const 10092
           local.get $1
           i32.store
           i32.const 10080
           local.get $1
           i32.const 1
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           i32.const 10080
           i32.store
           i32.const 10080
           call $~lib/staticarray/StaticArray<~lib/string/String>#join
           i32.const 5360
           i32.const 233
           i32.const 9
           call $~lib/builtins/abort
           unreachable
          end
          global.get $~lib/memory/__stack_pointer
          i32.const 32
          i32.add
          global.set $~lib/memory/__stack_pointer
         end
         global.get $~lib/memory/__stack_pointer
         i32.const 12
         i32.add
         global.set $~lib/memory/__stack_pointer
        end
        local.get $2
        i32.const 1
        i32.add
        local.set $2
        br $for-loop|2
       end
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|1
     end
    end
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/IoManager/IoManager#writeDeviceTableEntry (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 28
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   block $__inlined_func$src/IoManager/IoManager#writeString$37 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.sub
    global.set $~lib/memory/__stack_pointer
    block $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load16_u offset=8
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $6
     local.get $2
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.add
     i32.const 1
     i32.add
     i32.const 65535
     i32.and
     i32.const 1535
     i32.gt_u
     if
      i32.const 10288
      i32.const 1712
      i32.const 97
      i32.const 13
      call $~lib/builtins/abort
      unreachable
     end
     loop $for-loop|0
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $5
      local.get $2
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.lt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       i32.load16_u offset=8
       local.set $7
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       i32.const 4
       i32.sub
       global.set $~lib/memory/__stack_pointer
       global.get $~lib/memory/__stack_pointer
       i32.const 10868
       i32.lt_s
       br_if $folding-inner0
       global.get $~lib/memory/__stack_pointer
       i32.const 0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       block $__inlined_func$~lib/string/String#charCodeAt$1652
        local.get $5
        local.get $2
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 1
        i32.shr_u
        i32.ge_u
        if
         global.get $~lib/memory/__stack_pointer
         i32.const 4
         i32.add
         global.set $~lib/memory/__stack_pointer
         i32.const -1
         local.set $4
         br $__inlined_func$~lib/string/String#charCodeAt$1652
        end
        local.get $2
        local.get $5
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
        local.set $4
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.add
        global.set $~lib/memory/__stack_pointer
       end
       local.get $0
       local.get $7
       local.get $4
       call $src/IoManager/IoManager#writeRam
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       local.get $0
       i32.load16_u offset=8
       i32.const 1
       i32.add
       i32.store16 offset=8
       local.get $5
       i32.const 1
       i32.add
       local.set $5
       br $for-loop|0
      end
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load16_u offset=8
     i32.const 0
     call $src/IoManager/IoManager#writeRam
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load16_u offset=8
     i32.const 1
     i32.add
     i32.store16 offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $6
     br $__inlined_func$src/IoManager/IoManager#writeString$37
    end
    br $folding-inner1
   end
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.const 255
   i32.and
   local.tee $5
   i32.const 6
   i32.mul
   i32.const 1281
   i32.add
   local.tee $6
   local.get $1
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.const 1
   i32.add
   local.get $3
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.const 2
   i32.add
   local.get $5
   i32.const 4
   i32.shl
   i32.const 61440
   i32.add
   local.tee $3
   i32.const 255
   i32.and
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.const 3
   i32.add
   local.get $3
   i32.const 65535
   i32.and
   local.tee $3
   i32.const 8
   i32.shr_u
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.const 4
   i32.add
   local.get $4
   i32.const 255
   i32.and
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.const 5
   i32.add
   local.get $4
   i32.const 65535
   i32.and
   i32.const 8
   i32.shr_u
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 1280
   local.get $1
   i32.const 1
   i32.add
   call $src/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $5
   call $~lib/util/number/utoa32
   local.tee $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $src/lib/lib_numbers/toHex
   local.tee $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   call $src/lib/lib_numbers/toHex
   local.tee $3
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 10576
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 10580
   local.get $0
   i32.store
   i32.const 10576
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 10576
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=24
   i32.const 10588
   local.get $2
   i32.store
   i32.const 10576
   local.get $2
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 10576
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=24
   i32.const 10596
   local.get $1
   i32.store
   i32.const 10576
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 10576
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=24
   i32.const 10604
   local.get $3
   i32.store
   i32.const 10576
   local.get $3
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 10576
   i32.store offset=4
   i32.const 10576
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $src/external_functions/console.log
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/index/computerResetComputer (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 20
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=8
   local.tee $2
   i32.store offset=4
   local.get $2
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 10868
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=8
    local.get $2
    i32.load offset=4
    call $~lib/staticarray/StaticArray<u8>#constructor
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $2
    local.get $3
    i32.store
    local.get $2
    local.get $3
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=12
   local.tee $2
   i32.store offset=8
   local.get $2
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 10868
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    loop $for-loop|0
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.load offset=4
     local.tee $3
     i32.store
     local.get $3
     call $~lib/array/Array<src/IoManager/IoDevice>#get:length
     local.get $1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.load offset=4
      local.tee $3
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $3
      local.get $1
      call $~lib/array/Array<src/IoManager/IoDevice>#__get
      local.tee $3
      i32.store offset=8
      local.get $3
      if
       local.get $1
       call $src/external_functions/jsIo.reset
      end
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|0
     end
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   i32.const 0
   local.set $1
   loop $for-loop|00
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $2
    i32.store
    local.get $2
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    local.get $1
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     local.get $1
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $2
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     call $src/Cpu/CpuRegisters#constructor
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $2
     local.get $3
     i32.store offset=4
     local.get $2
     local.get $3
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     i32.const 0
     i32.store8 offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     i64.const 0
     i64.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|00
    end
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 1
  call $~lib/rt/itcms/__new
  local.set $2
  local.get $1
  if
   local.get $2
   local.get $1
   i32.const 0
   memory.copy
  end
  local.get $2
  i32.store
  i32.const 16
  local.get $0
  call $~lib/rt/itcms/__new
  local.tee $0
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/staticarray/StaticArray<u8>#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1488
   i32.const 1536
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 8
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/util/number/utoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1968
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 100000
  i32.lt_u
  if (result i32)
   local.get $0
   i32.const 100
   i32.lt_u
   if (result i32)
    local.get $0
    i32.const 10
    i32.ge_u
    i32.const 1
    i32.add
   else
    local.get $0
    i32.const 10000
    i32.ge_u
    i32.const 3
    i32.add
    local.get $0
    i32.const 1000
    i32.ge_u
    i32.add
   end
  else
   local.get $0
   i32.const 10000000
   i32.lt_u
   if (result i32)
    local.get $0
    i32.const 1000000
    i32.ge_u
    i32.const 6
    i32.add
   else
    local.get $0
    i32.const 1000000000
    i32.ge_u
    i32.const 8
    i32.add
    local.get $0
    i32.const 100000000
    i32.ge_u
    i32.add
   end
  end
  local.tee $1
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  loop $while-continue|0
   local.get $0
   i32.const 10000
   i32.ge_u
   if
    local.get $0
    i32.const 10000
    i32.rem_u
    local.set $3
    local.get $0
    i32.const 10000
    i32.div_u
    local.set $0
    local.get $2
    local.get $1
    i32.const 4
    i32.sub
    local.tee $1
    i32.const 1
    i32.shl
    i32.add
    local.get $3
    i32.const 100
    i32.div_u
    i32.const 2
    i32.shl
    i32.const 1980
    i32.add
    i64.load32_u
    local.get $3
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 1980
    i32.add
    i64.load32_u
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $0
  i32.const 100
  i32.ge_u
  if
   local.get $2
   local.get $1
   i32.const 2
   i32.sub
   local.tee $1
   i32.const 1
   i32.shl
   i32.add
   local.get $0
   i32.const 100
   i32.rem_u
   i32.const 2
   i32.shl
   i32.const 1980
   i32.add
   i32.load
   i32.store
   local.get $0
   i32.const 100
   i32.div_u
   local.set $0
  end
  local.get $0
  i32.const 10
  i32.ge_u
  if
   local.get $2
   local.get $1
   i32.const 2
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $0
   i32.const 2
   i32.shl
   i32.const 1980
   i32.add
   i32.load
   i32.store
  else
   local.get $2
   local.get $1
   i32.const 1
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $0
   i32.const 48
   i32.add
   i32.store16
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/index/allocate (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   local.get $0
   i32.const 1073741820
   i32.gt_u
   if
    i32.const 1488
    i32.const 3856
    i32.const 52
    i32.const 43
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerloadCode (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store offset=4
   local.get $0
   i32.eqz
   if
    i32.const 3920
    i32.const 3984
    i32.const 36
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 1280
   i32.gt_s
   if
    i32.const 4032
    i32.const 3984
    i32.const 40
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   loop $for-loop|0
    local.get $2
    local.get $3
    i32.gt_s
    if
     local.get $1
     local.get $3
     i32.add
     i32.load8_u
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     local.get $3
     local.get $4
     call $src/Memory/MemoryBus#write
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerRunCycles (param $0 i32) (param $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/index/computerRunCycles
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:src/index/computerGetCycles (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $2
   i32.store
   local.get $2
   call $~lib/array/Array<src/IoManager/IoDevice>#get:length
   i32.const 0
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.const 0
    call $~lib/array/Array<src/IoManager/IoDevice>#__get
    local.tee $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 10868
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i64.load offset=16
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterPC (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterPC$1626
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load16_u offset=6
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterPC$1626
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterSP (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterSP$1627
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load16_u offset=10
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterSP$1627
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterIR (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterIR$1628
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=8
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterIR$1628
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterA (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterA$1629
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterA$1629
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterB (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterB$1630
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=1
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterB$1630
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterC (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterC$1631
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=2
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterC$1631
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterD (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterD$1632
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=3
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterD$1632
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterE (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterE$1633
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=4
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterE$1633
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetRegisterF (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=16
   local.tee $1
   i32.store
   block $__inlined_func$src/index/computerGetRegisterF$1634
    local.get $1
    call $~lib/array/Array<src/IoManager/IoDevice>#get:length
    i32.const 0
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.const 0
     call $~lib/array/Array<src/IoManager/IoDevice>#__get
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     i32.load8_u offset=5
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetRegisterF$1634
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerGetMemory (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store offset=4
   block $__inlined_func$src/index/computerGetMemory$1635
    i32.const 10128
    i32.const 0
    local.get $0
    select
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     local.get $1
     call $src/Memory/MemoryBus#read
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetMemory$1635
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 0
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerSetMemory (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $0
   i32.store offset=4
   local.get $0
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    local.get $1
    local.get $2
    call $src/Memory/MemoryBus#write
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerAddDevice (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 10868
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=12
   local.tee $6
   i32.store offset=4
   local.get $6
   i32.eqz
   if
    i32.const 10160
    i32.const 3984
    i32.const 200
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.set $0
   i32.const 3632
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 3632
   i32.store offset=8
   loop $for-loop|0
    local.get $2
    local.get $4
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $4
     i32.add
     i32.load8_u
     local.set $5
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner1
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 2
     i32.const 2
     call $~lib/rt/itcms/__new
     local.tee $7
     i32.store
     local.get $7
     local.get $5
     i32.store16
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store offset=12
     local.get $1
     local.get $7
     call $~lib/string/String.__concat
     local.tee $1
     i32.store offset=8
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   block $__inlined_func$src/IoManager/IoManager#addDevice$42 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 20
    i32.sub
    global.set $~lib/memory/__stack_pointer
    block $folding-inner00
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner00
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.const 20
     memory.fill
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     call $~lib/array/Array<src/IoManager/IoDevice>#get:length
     local.tee $0
     i32.const 255
     i32.and
     i32.const 20
     i32.ge_u
     if
      i32.const 10224
      i32.const 1712
      i32.const 28
      i32.const 13
      call $~lib/builtins/abort
      unreachable
     end
     local.get $0
     i32.const 255
     i32.and
     i32.const 255
     i32.gt_u
     if
      i32.const 10224
      i32.const 1712
      i32.const 32
      i32.const 13
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 10868
     i32.lt_s
     br_if $folding-inner00
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i32.const 9
     i32.const 11
     call $~lib/rt/itcms/__new
     local.tee $5
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $5
     call $~lib/object/Object#constructor
     local.tee $5
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     i32.const 0
     i32.store8
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     i32.const 3632
     i32.store offset=4
     local.get $5
     i32.const 3632
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     i32.const 0
     i32.store8 offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store
     local.get $5
     local.get $0
     i32.store8
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $5
     local.get $1
     i32.store offset=4
     local.get $5
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store
     local.get $5
     local.get $3
     i32.store8 offset=8
     local.get $5
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.load offset=4
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $2
     local.get $5
     call $~lib/array/Array<src/Cpu/Cpu>#push
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $6
     local.get $0
     local.get $1
     local.get $3
     call $src/IoManager/IoManager#writeDeviceTableEntry
     global.get $~lib/memory/__stack_pointer
     i32.const 20
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $0
     br $__inlined_func$src/IoManager/IoManager#addDevice$42
    end
    br $folding-inner1
   end
   i32.const 255
   i32.and
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 43664
  i32.const 43712
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerResetComputer (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 10868
  i32.lt_s
  if
   i32.const 43664
   i32.const 43712
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
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
)
