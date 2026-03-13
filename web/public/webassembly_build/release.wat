(module
 (type $0 (func (param i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32) (result i32)))
 (type $3 (func (param i32 i32 i32)))
 (type $4 (func (param i32 i32)))
 (type $5 (func (result i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32 i32) (result i32)))
 (type $8 (func (param i32 i32 i32 i32)))
 (type $9 (func (param i32 i32 i64)))
 (type $10 (func (param i32) (result i64)))
 (type $11 (func (param i32 i32 i32 i32) (result i32)))
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
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 12992))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 45912))
 (memory $0 1)
 (data $0 (i32.const 1036) "\1c")
 (data $0.1 (i32.const 1048) "\02\00\00\00\0c\00\00\00s\00y\00s\00t\00e\00m")
 (data $1 (i32.const 1068) "<")
 (data $1.1 (i32.const 1080) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $5 (i32.const 1260) "<")
 (data $5.1 (i32.const 1272) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $6 (i32.const 1324) ",")
 (data $6.1 (i32.const 1336) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $8 (i32.const 1404) "<")
 (data $8.1 (i32.const 1416) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $9 (i32.const 1468) "\1c")
 (data $9.1 (i32.const 1480) "\01")
 (data $10 (i32.const 1500) ",")
 (data $10.1 (i32.const 1512) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $11 (i32.const 1548) "<")
 (data $11.1 (i32.const 1560) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $12 (i32.const 1612) "\1c")
 (data $12.1 (i32.const 1624) "\01")
 (data $13 (i32.const 1644) "<")
 (data $13.1 (i32.const 1656) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $14 (i32.const 1708) "l")
 (data $14.1 (i32.const 1720) "\02\00\00\00X\00\00\00R\00A\00M\00 \00n\00o\00t\00 \00a\00v\00a\00i\00l\00a\00b\00l\00e\00,\00 \00c\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00t\00a\00b\00l\00e")
 (data $15 (i32.const 1820) "L")
 (data $15.1 (i32.const 1832) "\02\00\00\000\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00I\00o\00M\00a\00n\00a\00g\00e\00r\00.\00t\00s")
 (data $16 (i32.const 1900) "|")
 (data $16.1 (i32.const 1912) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $17 (i32.const 2028) "<")
 (data $17.1 (i32.const 2040) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $18 (i32.const 2092) "\1c")
 (data $18.1 (i32.const 2104) "\02\00\00\00\02\00\00\000")
 (data $19 (i32.const 2124) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $20 (i32.const 2524) "\1c\04")
 (data $20.1 (i32.const 2536) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $21 (i32.const 3580) "\\")
 (data $21.1 (i32.const 3592) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $22 (i32.const 3676) "L")
 (data $22.1 (i32.const 3688) "\02\00\00\00<\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $23 (i32.const 3756) "\1c")
 (data $23.1 (i32.const 3768) "\02")
 (data $24 (i32.const 3788) "<")
 (data $24.1 (i32.const 3800) "\02\00\00\00*\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00M\00e\00m\00o\00r\00y\00.\00t\00s")
 (data $25 (i32.const 3852) "\1c")
 (data $25.1 (i32.const 3864) "\01")
 (data $26 (i32.const 3884) ",")
 (data $26.1 (i32.const 3896) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $27 (i32.const 3932) "<")
 (data $27.1 (i32.const 3944) "\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00i\00o\00M\00a\00n\00a\00g\00e\00r")
 (data $28 (i32.const 3996) "L")
 (data $28.1 (i32.const 4008) "\02\00\00\00.\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00C\00o\00m\00p\00u\00t\00e\00r\00.\00t\00s")
 (data $29 (i32.const 4076) "\1c")
 (data $29.1 (i32.const 4088) "\02\00\00\00\0c\00\00\00t\00i\00m\00e\00r\000")
 (data $30 (i32.const 4108) "<")
 (data $30.1 (i32.const 4120) "\02\00\00\00&\00\00\00T\00o\00o\00 \00m\00a\00n\00y\00 \00I\00O\00 \00d\00e\00v\00i\00c\00e\00s")
 (data $31 (i32.const 4172) "\\")
 (data $31.1 (i32.const 4184) "\02\00\00\00H\00\00\00D\00e\00v\00i\00c\00e\00 \00s\00t\00r\00i\00n\00g\00s\00 \00m\00e\00m\00o\00r\00y\00 \00o\00v\00e\00r\00f\00l\00o\00w\00 \00(\00p\00t\00r\00=")
 (data $32 (i32.const 4268) ",")
 (data $32.1 (i32.const 4280) "\02\00\00\00\14\00\00\00 \00|\00 \00s\00t\00r\00l\00e\00n\00=")
 (data $33 (i32.const 4316) "<")
 (data $33.1 (i32.const 4328) "\02\00\00\00 \00\00\00)\00 \00|\00 \00S\00T\00R\00I\00N\00G\00S\00_\00E\00N\00D\00=")
 (data $34 (i32.const 4380) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\18\00\00\00`\10\00\00\00\00\00\00\c0\10\00\00\00\00\00\00\f0\10")
 (data $35 (i32.const 4428) ",")
 (data $35.1 (i32.const 4440) "\02\00\00\00\10\00\00\00D\00e\00v\00i\00c\00e\00 \00#")
 (data $36 (i32.const 4476) "\1c")
 (data $36.1 (i32.const 4488) "\02\00\00\00\04\00\00\00 \00\"")
 (data $37 (i32.const 4508) "L")
 (data $37.1 (i32.const 4520) "\02\00\00\002\00\00\00\"\00 \00e\00n\00t\00r\00y\00 \00a\00d\00d\00e\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $38 (i32.const 4588) ",")
 (data $38.1 (i32.const 4600) "\02\00\00\00\16\00\00\00 \00(\00i\00o\00B\00a\00s\00e\00 \00=\00 ")
 (data $39 (i32.const 4636) "\1c")
 (data $39.1 (i32.const 4648) "\02\00\00\00\02\00\00\00)")
 (data $40 (i32.const 4668) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00`\11\00\00\00\00\00\00\90\11\00\00\00\00\00\00\b0\11\00\00\00\00\00\00\00\12\00\00\00\00\00\000\12")
 (data $41 (i32.const 4732) "<")
 (data $41.1 (i32.const 4744) "\02\00\00\00 \00\00\000\001\002\003\004\005\006\007\008\009\00A\00B\00C\00D\00E\00F")
 (data $42 (i32.const 4796) "\1c")
 (data $42.1 (i32.const 4808) "\02\00\00\00\04\00\00\000\00x")
 (data $43 (i32.const 4828) "<")
 (data $43.1 (i32.const 4840) "\02\00\00\00*\00\00\00C\00o\00m\00p\00u\00t\00e\00r\00 \00i\00n\00s\00t\00a\00n\00c\00i\00a\00t\00e\00d")
 (data $44 (i32.const 4892) ",")
 (data $44.1 (i32.const 4904) "\02\00\00\00\1a\00\00\00R\00O\00M\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $45 (i32.const 4940) ",")
 (data $45.1 (i32.const 4952) "\02\00\00\00\18\00\00\00s\00r\00c\00/\00i\00n\00d\00e\00x\00.\00t\00s")
 (data $46 (i32.const 4988) ",")
 (data $46.1 (i32.const 5000) "\02\00\00\00\1a\00\00\00R\00A\00M\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $47 (i32.const 5036) "L")
 (data $47.1 (i32.const 5048) "\02\00\00\002\00\00\00B\00o\00o\00t\00l\00o\00a\00d\00e\00r\00 \00c\00o\00d\00e\00 \00t\00o\00o\00 \00h\00e\00a\00v\00y")
 (data $48 (i32.const 5116) "|")
 (data $48.1 (i32.const 5128) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $49 (i32.const 5244) ",")
 (data $49.1 (i32.const 5256) "\02\00\00\00\1a\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00C\00P\00U\00 \00#")
 (data $50 (i32.const 5292) "<")
 (data $50.1 (i32.const 5304) "\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00i\00n\00t\00e\00r\00r\00u\00p\00t")
 (data $51 (i32.const 5356) "<")
 (data $51.1 (i32.const 5368) "\02\00\00\00$\00\00\00s\00r\00c\00/\00d\00e\00v\00i\00c\00e\00s\00/\00C\00p\00u\00.\00t\00s")
 (data $52 (i32.const 5420) "<")
 (data $52.1 (i32.const 5432) "\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data $53 (i32.const 5484) ",")
 (data $53.1 (i32.const 5496) "\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s")
 (data $54 (i32.const 5532) "\1c")
 (data $54.1 (i32.const 5544) "\02\00\00\00\0c\00\00\00n\00u\00m\00b\00e\00r")
 (data $55 (i32.const 5564) ",")
 (data $55.1 (i32.const 5576) "\02\00\00\00\12\00\00\00u\00n\00d\00e\00f\00i\00n\00e\00d")
 (data $56 (i32.const 5612) "<")
 (data $56.1 (i32.const 5624) "\02\00\00\00\"\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00B\00u\00s")
 (data $57 (i32.const 5676) "<")
 (data $57.1 (i32.const 5688) "\02\00\00\00,\00\00\00W\00r\00i\00t\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"")
 (data $58 (i32.const 5740) "\1c")
 (data $58.1 (i32.const 5752) "\02\00\00\00\06\00\00\00\"\00 \00(")
 (data $59 (i32.const 5772) ",")
 (data $59.1 (i32.const 5784) "\02\00\00\00\1c\00\00\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00\"")
 (data $60 (i32.const 5820) "\1c")
 (data $60.1 (i32.const 5832) "\02\00\00\00\04\00\00\00 \00(")
 (data $61 (i32.const 5852) "\1c")
 (data $61.1 (i32.const 5864) "\02\00\00\00\04\00\00\00)\00\"")
 (data $62 (i32.const 5884) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00@\16\00\00\00\00\00\00\80\16\00\00\00\00\00\00\a0\16\00\00\00\00\00\00\d0\16\00\00\00\00\00\00\f0\16")
 (data $63 (i32.const 5948) "\\")
 (data $63.1 (i32.const 5960) "\02\00\00\00L\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $64 (i32.const 6044) "\\")
 (data $64.1 (i32.const 6056) "\02\00\00\00L\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $65 (i32.const 6140) "l")
 (data $65.1 (i32.const 6152) "\02\00\00\00Z\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $66 (i32.const 6252) "L")
 (data $66.1 (i32.const 6264) "\02\00\00\008\00\00\00W\00r\00i\00t\00e\00 \00t\00o\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#")
 (data $67 (i32.const 6332) "l")
 (data $67.1 (i32.const 6344) "\02\00\00\00R\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00w\00r\00i\00t\00e\00 \00d\00e\00v\00i\00c\00e\00 \00#")
 (data $68 (i32.const 6444) ",")
 (data $68.1 (i32.const 6456) "\02\00\00\00\12\00\00\00 \00o\00n\00 \00p\00o\00r\00t\00 ")
 (data $69 (i32.const 6492) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\d0\18\00\00\00\00\00\00@\19")
 (data $70 (i32.const 6540) "\\")
 (data $70.1 (i32.const 6552) "\02\00\00\00H\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00w\00r\00i\00t\00e\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $71 (i32.const 6636) "<")
 (data $71.1 (i32.const 6648) "\02\00\00\00,\00\00\00m\00i\00s\00s\00i\00n\00g\00 \00h\00a\00n\00d\00l\00e\00r\00A\00d\00d\00r\00e\00s\00s")
 (data $72 (i32.const 6700) "<")
 (data $72.1 (i32.const 6712) "\02\00\00\00&\00\00\00=\d8\04\dd \00I\00n\00t\00e\00r\00r\00u\00p\00t\00i\00o\00n\00 \00I\00R\00Q")
 (data $73 (i32.const 6764) ",")
 (data $73.1 (i32.const 6776) "\02\00\00\00\18\00\00\00 \00-\00>\00 \00H\00a\00n\00d\00l\00e\00r\00 ")
 (data $74 (i32.const 6812) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00@\1a\00\00\00\00\00\00\80\1a")
 (data $75 (i32.const 6860) "\1c")
 (data $75.1 (i32.const 6872) "\1a\00\00\00\08\00\00\00\01")
 (data $76 (i32.const 6892) "\\")
 (data $76.1 (i32.const 6904) "\02\00\00\00J\00\00\00N\00o\00 \00R\00O\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $77 (i32.const 6988) "\\")
 (data $77.1 (i32.const 7000) "\02\00\00\00J\00\00\00N\00o\00 \00R\00A\00M\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $78 (i32.const 7084) "l")
 (data $78.1 (i32.const 7096) "\02\00\00\00X\00\00\00N\00o\00 \00I\00O\00 \00M\00a\00n\00a\00g\00e\00r\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $79 (i32.const 7196) "L")
 (data $79.1 (i32.const 7208) "\02\00\00\00:\00\00\00R\00e\00a\00d\00 \00f\00r\00o\00m\00 \00i\00n\00v\00a\00l\00i\00d\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00#")
 (data $80 (i32.const 7276) "l")
 (data $80.1 (i32.const 7288) "\02\00\00\00P\00\00\00N\00o\00 \00I\00O\00 \00D\00e\00v\00i\00c\00e\00 \00f\00o\00u\00n\00d\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00a\00d\00 \00d\00e\00v\00i\00c\00e\00 \00#")
 (data $81 (i32.const 7388) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80\1c\00\00\00\00\00\00@\19")
 (data $82 (i32.const 7436) "\\")
 (data $82.1 (i32.const 7448) "\02\00\00\00F\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00r\00e\00a\00d\00 \00o\00u\00t\00 \00o\00f\00 \00m\00e\00m\00o\00r\00y\00 \00r\00a\00n\00g\00e\00 \00:\00 ")
 (data $83 (i32.const 7532) "<")
 (data $83.1 (i32.const 7544) "\02\00\00\00,\00\00\00R\00e\00a\00d\00i\00n\00g\00 \00M\00e\00m\00o\00r\00y\00 \00v\00a\00l\00u\00e\00 \00\"")
 (data $84 (i32.const 7596) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00\80\1d\00\00\00\00\00\00\80\16\00\00\00\00\00\00\a0\16\00\00\00\00\00\00\d0\16\00\00\00\00\00\00\f0\16")
 (data $85 (i32.const 7660) "\\")
 (data $85.1 (i32.const 7672) "\02\00\00\00>\00\00\00M\00e\00m\00o\00r\00y\00B\00u\00s\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $86 (i32.const 7756) "<")
 (data $86.1 (i32.const 7768) "\02\00\00\00$\00\00\00m\00i\00s\00s\00i\00n\00g\00 \00b\00r\00e\00a\00k\00p\00o\00i\00n\00t")
 (data $87 (i32.const 7820) "\\")
 (data $87.1 (i32.const 7832) "\02\00\00\00@\00\00\00C\00P\00U\00 \00B\00r\00e\00a\00k\00p\00o\00i\00n\00t\00 \00(\00I\00D\00E\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $88 (i32.const 7916) "<")
 (data $88.1 (i32.const 7928) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $89 (i32.const 7980) "\1c")
 (data $89.1 (i32.const 7992) "\1d\00\00\00\08\00\00\00\02")
 (data $90 (i32.const 8012) ",")
 (data $90.1 (i32.const 8024) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00I\00M\00M\00 \00#")
 (data $91 (i32.const 8060) "\1c")
 (data $91.1 (i32.const 8072) "\02\00\00\00\06\00\00\00 \00:\00 ")
 (data $92 (i32.const 8092) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00`\1f\00\00\00\00\00\00\90\1f\00\00\00\00\00\00\d0\16\00\00\00\00\00\000\12")
 (data $93 (i32.const 8140) "\1c")
 (data $93.1 (i32.const 8152) "\1e\00\00\00\08\00\00\00\03")
 (data $94 (i32.const 8172) "\1c")
 (data $94.1 (i32.const 8184) "\1e\00\00\00\08\00\00\00\04")
 (data $95 (i32.const 8204) ",")
 (data $95.1 (i32.const 8216) "\02\00\00\00\14\00\00\00C\00P\00U\00 \00H\00a\00l\00t\00e\00d")
 (data $96 (i32.const 8252) "\1c")
 (data $96.1 (i32.const 8264) "\1e\00\00\00\08\00\00\00\05")
 (data $97 (i32.const 8284) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00`\1f\00\00\00\00\00\00\90\1f\00\00\00\00\00\00\d0\16\00\00\00\00\00\000\12")
 (data $98 (i32.const 8332) "\1c")
 (data $98.1 (i32.const 8344) "\1f\00\00\00\08\00\00\00\06")
 (data $99 (i32.const 8364) "\1c")
 (data $99.1 (i32.const 8376) "\02\00\00\00\02\00\00\00A")
 (data $100 (i32.const 8396) "\1c")
 (data $100.1 (i32.const 8408) "\02\00\00\00\02\00\00\00B")
 (data $101 (i32.const 8428) "\1c")
 (data $101.1 (i32.const 8440) "\02\00\00\00\02\00\00\00C")
 (data $102 (i32.const 8460) "\1c")
 (data $102.1 (i32.const 8472) "\02\00\00\00\02\00\00\00D")
 (data $103 (i32.const 8492) "\1c")
 (data $103.1 (i32.const 8504) "\02\00\00\00\02\00\00\00E")
 (data $104 (i32.const 8524) "\1c")
 (data $104.1 (i32.const 8536) "\02\00\00\00\02\00\00\00F")
 (data $105 (i32.const 8556) ",")
 (data $105.1 (i32.const 8568) "\02\00\00\00\14\00\00\00R\00e\00g\00i\00s\00t\00e\00r\00 \00#")
 (data $106 (i32.const 8604) "<")
 (data $106.1 (i32.const 8616) "\02\00\00\00,\00\00\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $107 (i32.const 8668) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80!\00\00\00\00\00\00\b0!")
 (data $108 (i32.const 8716) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80!\00\00\00\00\00\00\b0!")
 (data $109 (i32.const 8764) ",")
 (data $109.1 (i32.const 8776) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00R\00E\00G\00 \00#")
 (data $110 (i32.const 8812) "\1c")
 (data $110.1 (i32.const 8824) "\02\00\00\00\06\00\00\00 \00=\00 ")
 (data $111 (i32.const 8844) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00P\"\00\00\00\00\00\00\90\1f\00\00\00\00\00\00\80\"\00\00\00\00\00\00\d0\16\00\00\00\00\00\000\12")
 (data $112 (i32.const 8908) "\1c")
 (data $112.1 (i32.const 8920) "\1f\00\00\00\08\00\00\00\07")
 (data $113 (i32.const 8940) ",")
 (data $113.1 (i32.const 8952) "\02\00\00\00\16\00\00\00D\00E\00B\00U\00G\00 \00M\00E\00M\00 \00#")
 (data $114 (i32.const 8988) "\1c")
 (data $114.1 (i32.const 9000) "\02\00\00\00\08\00\00\00 \00:\00 \00[")
 (data $115 (i32.const 9020) "\1c")
 (data $115.1 (i32.const 9032) "\02\00\00\00\08\00\00\00]\00 \00=\00 ")
 (data $116 (i32.const 9052) "<\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00$\00\00\00\00#\00\00\00\00\00\000#\00\00\00\00\00\00P#\00\00\00\00\00\00\d0\16\00\00\00\00\00\000\12")
 (data $117 (i32.const 9116) "\1c")
 (data $117.1 (i32.const 9128) "\1f\00\00\00\08\00\00\00\08")
 (data $118 (i32.const 9148) "\1c")
 (data $118.1 (i32.const 9160) "\1f\00\00\00\08\00\00\00\t")
 (data $119 (i32.const 9180) "\1c")
 (data $119.1 (i32.const 9192) "\1f\00\00\00\08\00\00\00\n")
 (data $120 (i32.const 9212) "\1c")
 (data $120.1 (i32.const 9224) "\1f\00\00\00\08\00\00\00\0b")
 (data $121 (i32.const 9244) "\1c")
 (data $121.1 (i32.const 9256) "\1f\00\00\00\08\00\00\00\0c")
 (data $122 (i32.const 9276) "\\")
 (data $122.1 (i32.const 9288) "\02\00\00\00B\00\00\00C\00P\00U\00 \00B\00r\00e\00a\00k\00p\00o\00i\00n\00t\00 \00(\00I\00N\00T\003\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $123 (i32.const 9372) "\1c")
 (data $123.1 (i32.const 9384) "\1f\00\00\00\08\00\00\00\r")
 (data $124 (i32.const 9404) "\1c")
 (data $124.1 (i32.const 9416) "\1f\00\00\00\08\00\00\00\0e")
 (data $125 (i32.const 9436) "\1c")
 (data $125.1 (i32.const 9448) "\1f\00\00\00\08\00\00\00\0f")
 (data $126 (i32.const 9468) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\10\00\00\00\80!\00\00\00\00\00\00\b0!")
 (data $127 (i32.const 9516) "\1c")
 (data $127.1 (i32.const 9528) "\1f\00\00\00\08\00\00\00\10")
 (data $128 (i32.const 9548) "\1c")
 (data $128.1 (i32.const 9560) "\1f\00\00\00\08\00\00\00\11")
 (data $129 (i32.const 9580) "\1c")
 (data $129.1 (i32.const 9592) "\1f\00\00\00\08\00\00\00\12")
 (data $130 (i32.const 9612) "\1c")
 (data $130.1 (i32.const 9624) "\1f\00\00\00\08\00\00\00\13")
 (data $131 (i32.const 9644) "\1c")
 (data $131.1 (i32.const 9656) "\02\00\00\00\n\00\00\00c\00a\00r\00r\00y")
 (data $132 (i32.const 9676) "\1c")
 (data $132.1 (i32.const 9688) "\02\00\00\00\08\00\00\00z\00e\00r\00o")
 (data $133 (i32.const 9708) "\1c")
 (data $133.1 (i32.const 9720) "\1f\00\00\00\08\00\00\00\14")
 (data $134 (i32.const 9740) "\1c")
 (data $134.1 (i32.const 9752) "\1f\00\00\00\08\00\00\00\15")
 (data $135 (i32.const 9772) "\1c")
 (data $135.1 (i32.const 9784) "\1f\00\00\00\08\00\00\00\16")
 (data $136 (i32.const 9804) "\1c")
 (data $136.1 (i32.const 9816) "\1f\00\00\00\08\00\00\00\17")
 (data $137 (i32.const 9836) "\1c")
 (data $137.1 (i32.const 9848) "\1f\00\00\00\08\00\00\00\18")
 (data $138 (i32.const 9868) "\1c")
 (data $138.1 (i32.const 9880) "\1f\00\00\00\08\00\00\00\19")
 (data $139 (i32.const 9900) "\1c")
 (data $139.1 (i32.const 9912) "\1f\00\00\00\08\00\00\00\1a")
 (data $140 (i32.const 9932) "\1c")
 (data $140.1 (i32.const 9944) "\1f\00\00\00\08\00\00\00\1b")
 (data $141 (i32.const 9964) "\1c")
 (data $141.1 (i32.const 9976) "\1d\00\00\00\08\00\00\00\1c")
 (data $142 (i32.const 9996) "\1c")
 (data $142.1 (i32.const 10008) "\1e\00\00\00\08\00\00\00\1d")
 (data $143 (i32.const 10028) "\1c")
 (data $143.1 (i32.const 10040) "\1f\00\00\00\08\00\00\00\1e")
 (data $144 (i32.const 10060) "\1c")
 (data $144.1 (i32.const 10072) "\1f\00\00\00\08\00\00\00\1f")
 (data $145 (i32.const 10092) "\1c")
 (data $145.1 (i32.const 10104) "\1f\00\00\00\08\00\00\00 ")
 (data $146 (i32.const 10124) "\1c")
 (data $146.1 (i32.const 10136) "\1f\00\00\00\08\00\00\00!")
 (data $147 (i32.const 10156) "\1c")
 (data $147.1 (i32.const 10168) "\1f\00\00\00\08\00\00\00\"")
 (data $148 (i32.const 10188) "\1c")
 (data $148.1 (i32.const 10200) "\1f\00\00\00\08\00\00\00#")
 (data $149 (i32.const 10220) "\1c")
 (data $149.1 (i32.const 10232) "\1f\00\00\00\08\00\00\00$")
 (data $150 (i32.const 10252) "\1c")
 (data $150.1 (i32.const 10264) "\1f\00\00\00\08\00\00\00%")
 (data $151 (i32.const 10284) "\1c")
 (data $151.1 (i32.const 10296) "\1f\00\00\00\08\00\00\00&")
 (data $152 (i32.const 10316) "\1c")
 (data $152.1 (i32.const 10328) "\1f\00\00\00\08\00\00\00\'")
 (data $153 (i32.const 10348) "\1c")
 (data $153.1 (i32.const 10360) "\1f\00\00\00\08\00\00\00(")
 (data $154 (i32.const 10380) "\1c")
 (data $154.1 (i32.const 10392) "\1f\00\00\00\08\00\00\00)")
 (data $155 (i32.const 10412) "\1c")
 (data $155.1 (i32.const 10424) "\1f\00\00\00\08\00\00\00*")
 (data $156 (i32.const 10444) "\1c")
 (data $156.1 (i32.const 10456) "\1f\00\00\00\08\00\00\00+")
 (data $157 (i32.const 10476) "\1c")
 (data $157.1 (i32.const 10488) "\1f\00\00\00\08\00\00\00,")
 (data $158 (i32.const 10508) "\1c")
 (data $158.1 (i32.const 10520) "\1f\00\00\00\08\00\00\00-")
 (data $159 (i32.const 10540) "\1c")
 (data $159.1 (i32.const 10552) "\1f\00\00\00\08\00\00\00.")
 (data $160 (i32.const 10572) "\1c")
 (data $160.1 (i32.const 10584) "\1f\00\00\00\08\00\00\00/")
 (data $161 (i32.const 10604) "\1c")
 (data $161.1 (i32.const 10616) "\1f\00\00\00\08\00\00\000")
 (data $162 (i32.const 10636) "\1c")
 (data $162.1 (i32.const 10648) "\1f\00\00\00\08\00\00\001")
 (data $163 (i32.const 10668) "\1c")
 (data $163.1 (i32.const 10680) "\1f\00\00\00\08\00\00\002")
 (data $164 (i32.const 10700) "\1c")
 (data $164.1 (i32.const 10712) "\1f\00\00\00\08\00\00\003")
 (data $165 (i32.const 10732) "\1c")
 (data $165.1 (i32.const 10744) "\1f\00\00\00\08\00\00\004")
 (data $166 (i32.const 10764) "\1c")
 (data $166.1 (i32.const 10776) "\1f\00\00\00\08\00\00\005")
 (data $167 (i32.const 10796) "\1c")
 (data $167.1 (i32.const 10808) "\1f\00\00\00\08\00\00\006")
 (data $168 (i32.const 10828) "\1c")
 (data $168.1 (i32.const 10840) "\1f\00\00\00\08\00\00\007")
 (data $169 (i32.const 10860) "\1c")
 (data $169.1 (i32.const 10872) "\1f\00\00\00\08\00\00\008")
 (data $170 (i32.const 10892) "\1c")
 (data $170.1 (i32.const 10904) "\1f\00\00\00\08\00\00\009")
 (data $171 (i32.const 10924) "\1c")
 (data $171.1 (i32.const 10936) "\1f\00\00\00\08\00\00\00:")
 (data $172 (i32.const 10956) "\1c")
 (data $172.1 (i32.const 10968) "\1f\00\00\00\08\00\00\00;")
 (data $173 (i32.const 10988) "\1c")
 (data $173.1 (i32.const 11000) "\1f\00\00\00\08\00\00\00<")
 (data $174 (i32.const 11020) "\1c")
 (data $174.1 (i32.const 11032) "\1f\00\00\00\08\00\00\00=")
 (data $175 (i32.const 11052) "\1c")
 (data $175.1 (i32.const 11064) "\1f\00\00\00\08\00\00\00>")
 (data $176 (i32.const 11084) "\1c")
 (data $176.1 (i32.const 11096) "\1f\00\00\00\08\00\00\00?")
 (data $177 (i32.const 11116) "\1c")
 (data $177.1 (i32.const 11128) "\1f\00\00\00\08\00\00\00@")
 (data $178 (i32.const 11148) "\1c")
 (data $178.1 (i32.const 11160) "\1f\00\00\00\08\00\00\00A")
 (data $179 (i32.const 11180) "\1c")
 (data $179.1 (i32.const 11192) "\1f\00\00\00\08\00\00\00B")
 (data $180 (i32.const 11212) "\1c")
 (data $180.1 (i32.const 11224) "\1f\00\00\00\08\00\00\00C")
 (data $181 (i32.const 11244) "\1c")
 (data $181.1 (i32.const 11256) "\1f\00\00\00\08\00\00\00D")
 (data $182 (i32.const 11276) "\1c")
 (data $182.1 (i32.const 11288) "\1f\00\00\00\08\00\00\00E")
 (data $183 (i32.const 11308) "\1c")
 (data $183.1 (i32.const 11320) "\1f\00\00\00\08\00\00\00F")
 (data $184 (i32.const 11340) "\1c")
 (data $184.1 (i32.const 11352) "\1f\00\00\00\08\00\00\00G")
 (data $185 (i32.const 11372) "\1c")
 (data $185.1 (i32.const 11384) "\1f\00\00\00\08\00\00\00H")
 (data $186 (i32.const 11404) "\1c")
 (data $186.1 (i32.const 11416) "\1f\00\00\00\08\00\00\00I")
 (data $187 (i32.const 11436) "\1c")
 (data $187.1 (i32.const 11448) "\1f\00\00\00\08\00\00\00J")
 (data $188 (i32.const 11468) "\1c")
 (data $188.1 (i32.const 11480) "\1f\00\00\00\08\00\00\00K")
 (data $189 (i32.const 11500) "\1c")
 (data $189.1 (i32.const 11512) "\1f\00\00\00\08\00\00\00L")
 (data $190 (i32.const 11532) "\1c")
 (data $190.1 (i32.const 11544) "\1f\00\00\00\08\00\00\00M")
 (data $191 (i32.const 11564) "\1c")
 (data $191.1 (i32.const 11576) "\1f\00\00\00\08\00\00\00N")
 (data $192 (i32.const 11596) "\1c")
 (data $192.1 (i32.const 11608) "\1f\00\00\00\08\00\00\00O")
 (data $193 (i32.const 11628) "\1c")
 (data $193.1 (i32.const 11640) "\1f\00\00\00\08\00\00\00P")
 (data $194 (i32.const 11660) "\1c")
 (data $194.1 (i32.const 11672) "\1f\00\00\00\08\00\00\00Q")
 (data $195 (i32.const 11692) "\1c")
 (data $195.1 (i32.const 11704) "\1f\00\00\00\08\00\00\00R")
 (data $196 (i32.const 11724) "\1c")
 (data $196.1 (i32.const 11736) "\1f\00\00\00\08\00\00\00S")
 (data $197 (i32.const 11756) "\1c")
 (data $197.1 (i32.const 11768) "\1f\00\00\00\08\00\00\00T")
 (data $198 (i32.const 11788) "\1c")
 (data $198.1 (i32.const 11800) "\1f\00\00\00\08\00\00\00U")
 (data $199 (i32.const 11820) "\1c")
 (data $199.1 (i32.const 11832) "\1f\00\00\00\08\00\00\00V")
 (data $200 (i32.const 11852) "\1c")
 (data $200.1 (i32.const 11864) "\1f\00\00\00\08\00\00\00W")
 (data $201 (i32.const 11884) "\1c")
 (data $201.1 (i32.const 11896) "\1f\00\00\00\08\00\00\00X")
 (data $202 (i32.const 11916) "\1c")
 (data $202.1 (i32.const 11928) "\1f\00\00\00\08\00\00\00Y")
 (data $203 (i32.const 11948) "\1c")
 (data $203.1 (i32.const 11960) "\1f\00\00\00\08\00\00\00Z")
 (data $204 (i32.const 11980) "L")
 (data $204.1 (i32.const 11992) "\02\00\00\00.\00\00\00I\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00:\00 ")
 (data $205 (i32.const 12060) ",")
 (data $205.1 (i32.const 12072) "\02\00\00\00\1a\00\00\00)\00 \00a\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 ")
 (data $206 (i32.const 12108) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\18\00\00\00\e0.\00\00\00\00\00\00\d0\16\00\00\00\00\00\000/")
 (data $207 (i32.const 12156) ",")
 (data $207.1 (i32.const 12168) "\02\00\00\00\1c\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00T\00i\00m\00e\00r\00s")
 (data $208 (i32.const 12204) "<")
 (data $208.1 (i32.const 12216) "\02\00\00\00\1e\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00T\00i\00m\00e\00r\00 \00#")
 (data $209 (i32.const 12268) "<")
 (data $209.1 (i32.const 12280) "\02\00\00\00(\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00I\00R\00Q\00 \00n\00u\00m\00b\00e\00r\00:\00 ")
 (data $210 (i32.const 12332) "|")
 (data $210.1 (i32.const 12344) "\02\00\00\00h\00\00\00M\00i\00s\00s\00i\00n\00g\00 \00I\00n\00t\00e\00r\00r\00u\00p\00t\00 \00f\00o\00r\00 \00T\00i\00m\00e\00r\00.\00 \00C\00a\00n\00n\00o\00t\00 \00r\00e\00q\00u\00e\00s\00t\00I\00n\00t\00e\00r\00r\00u\00p\00t")
 (data $211 (i32.const 12460) "\1c")
 (data $211.1 (i32.const 12472) "\"\00\00\00\08\00\00\00[")
 (data $212 (i32.const 12492) "<")
 (data $212.1 (i32.const 12504) "\02\00\00\00&\00\00\00I\00o\00M\00a\00n\00a\00g\00e\00r\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $213 (i32.const 12556) "<")
 (data $213.1 (i32.const 12568) "\02\00\00\00\1e\00\00\00R\00e\00l\00o\00a\00d\00 \00D\00e\00v\00i\00c\00e\00 \00#")
 (data $214 (i32.const 12620) ",")
 (data $214.1 (i32.const 12632) "\02\00\00\00\10\00\00\00 \00n\00a\00m\00e\00d\00 \00\"")
 (data $215 (i32.const 12668) ",")
 (data $215.1 (i32.const 12680) "\02\00\00\00\10\00\00\00\"\00 \00(\00t\00y\00p\00e\00 ")
 (data $216 (i32.const 12716) ",\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\1c\00\00\00 1\00\00\00\00\00\00`1\00\00\00\00\00\00\901\00\00\00\00\00\000\12")
 (data $217 (i32.const 12764) ",")
 (data $217.1 (i32.const 12776) "\02\00\00\00\10\00\00\00m\00a\00i\00n\00.\00a\00s\00m")
 (data $218 (i32.const 12812) ",")
 (data $218.1 (i32.const 12824) "\02\00\00\00\1a\00\00\00b\00r\00e\00a\00k\00p\00o\00i\00n\00t\00s\00:\00 ")
 (data $219 (i32.const 12860) "<")
 (data $219.1 (i32.const 12872) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $220 (i32.const 12924) "<")
 (data $220.1 (i32.const 12936) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $221 (i32.const 12992) "%\00\00\00 \00\00\00 \00\00\00 ")
 (data $221.1 (i32.const 13028) "d")
 (data $221.2 (i32.const 13044) "\02A\00\00\00\00\00\00 \00\00\00 \00\00\00\02A\00\00\00\00\00\00\10A\01\00\00\00\00\00 \00\00\00\10\c1\00\00\00\00\00\00\02A\00\00\02\t\00\00\04A")
 (data $221.3 (i32.const 13108) "A")
 (data $221.4 (i32.const 13128) " \00\00\00\00\00\00\00\82\00\00\00\02A")
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
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  i32.const 1280
  call $~lib/rt/itcms/__visit
  i32.const 1520
  call $~lib/rt/itcms/__visit
  i32.const 5136
  call $~lib/rt/itcms/__visit
  i32.const 5440
  call $~lib/rt/itcms/__visit
  i32.const 1088
  call $~lib/rt/itcms/__visit
  i32.const 12880
  call $~lib/rt/itcms/__visit
  i32.const 12944
  call $~lib/rt/itcms/__visit
  i32.const 2544
  call $~lib/rt/itcms/__visit
  i32.const 3600
  call $~lib/rt/itcms/__visit
  i32.const 1056
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
     i32.const 1152
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
   i32.const 45912
   i32.lt_u
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1152
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
   i32.const 1152
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
    i32.const 1152
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
   i32.const 12992
   i32.load
   i32.gt_u
   if
    i32.const 1280
    i32.const 1344
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 2
   i32.shl
   i32.const 12996
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
    i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
    i32.const 1424
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
    i32.const 1424
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
  i32.const 45920
  i32.const 0
  i32.store
  i32.const 47488
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
    i32.const 45920
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
      i32.const 45920
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
  i32.const 45920
  i32.const 47492
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 45920
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
      i32.const 45912
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
     i32.const 1152
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 45912
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
     i32.const 45912
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
       i32.const 1424
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
   i32.const 1424
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
     i32.const 1424
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
   i32.const 1088
   i32.const 1152
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
   i32.const 1088
   i32.const 1424
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
    i32.const 1424
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
   i32.const 1424
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
   i32.const 1424
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
   i32.const 1152
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
 (func $~lib/util/number/utoa32_dec_lut (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  loop $while-continue|0
   local.get $1
   i32.const 10000
   i32.ge_u
   if
    local.get $1
    i32.const 10000
    i32.rem_u
    local.set $3
    local.get $1
    i32.const 10000
    i32.div_u
    local.set $1
    local.get $0
    local.get $2
    i32.const 4
    i32.sub
    local.tee $2
    i32.const 1
    i32.shl
    i32.add
    local.get $3
    i32.const 100
    i32.div_u
    i32.const 2
    i32.shl
    i32.const 2124
    i32.add
    i64.load32_u
    local.get $3
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 2124
    i32.add
    i64.load32_u
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $1
  i32.const 100
  i32.ge_u
  if
   local.get $0
   local.get $2
   i32.const 2
   i32.sub
   local.tee $2
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 100
   i32.rem_u
   i32.const 2
   i32.shl
   i32.const 2124
   i32.add
   i32.load
   i32.store
   local.get $1
   i32.const 100
   i32.div_u
   local.set $1
  end
  local.get $1
  i32.const 10
  i32.ge_u
  if
   local.get $0
   local.get $2
   i32.const 2
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 2
   i32.shl
   i32.const 2124
   i32.add
   i32.load
   i32.store
  else
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 48
   i32.add
   i32.store16
  end
 )
 (func $~lib/number/I32#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $__inlined_func$~lib/util/number/itoa32$79
   local.get $0
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 2112
    local.set $0
    br $__inlined_func$~lib/util/number/itoa32$79
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   local.get $0
   i32.sub
   local.get $0
   local.get $0
   i32.const 31
   i32.shr_u
   i32.const 1
   i32.shl
   local.tee $1
   select
   local.tee $3
   i32.const 100000
   i32.lt_u
   if (result i32)
    local.get $3
    i32.const 100
    i32.lt_u
    if (result i32)
     local.get $3
     i32.const 10
     i32.ge_u
     i32.const 1
     i32.add
    else
     local.get $3
     i32.const 10000
     i32.ge_u
     i32.const 3
     i32.add
     local.get $3
     i32.const 1000
     i32.ge_u
     i32.add
    end
   else
    local.get $3
    i32.const 10000000
    i32.lt_u
    if (result i32)
     local.get $3
     i32.const 1000000
     i32.ge_u
     i32.const 6
     i32.add
    else
     local.get $3
     i32.const 1000000000
     i32.ge_u
     i32.const 8
     i32.add
     local.get $3
     i32.const 100000000
     i32.ge_u
     i32.add
    end
   end
   local.tee $2
   i32.const 1
   i32.shl
   local.get $1
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.get $3
   local.get $2
   call $~lib/util/number/utoa32_dec_lut
   local.get $1
   if
    local.get $0
    i32.const 45
    i32.store16
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  local.get $0
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
    i32.const 12880
    i32.const 1152
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
   i32.const 12944
   i32.const 1152
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
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>~visit" (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=8
  local.tee $2
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $1
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $1
     i32.load offset=4
     call $~lib/rt/itcms/__visit
    end
    local.get $1
    i32.const 12
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  local.get $2
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<i32>~visit (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  (local $3 i32)
  block $folding-inner5
   block $folding-inner4
    block $folding-inner3
     block $folding-inner2
      block $folding-inner1
       block $folding-inner0
        block $invalid
         block $~lib/array/Array<u16>
          block $src/devices/Cpu/Flags
           block $src/devices/Cpu/InstructionActions
            block $~lib/staticarray/StaticArray<~lib/string/String>
             block $~lib/array/Array<i32>
              block $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>"
               block $src/devices/InterruptManager/CpuCoreInfo
                block $src/devices/InterruptManager/InterruptManager
                 block $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>"
                  block $src/devices/Cpu/ALU
                   block $src/devices/Cpu/CpuRegisters
                    block $src/devices/Cpu/Cpu
                     block $src/devices/IoManager/IoManager
                      block $~lib/staticarray/StaticArray<u8>
                       block $src/devices/Computer/Computer
                        block $~lib/string/String
                         block $~lib/arraybuffer/ArrayBuffer
                          block $~lib/object/Object
                           local.get $0
                           i32.const 8
                           i32.sub
                           i32.load
                           br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $folding-inner2 $src/devices/Computer/Computer $folding-inner2 $folding-inner3 $folding-inner2 $~lib/staticarray/StaticArray<u8> $folding-inner3 $src/devices/IoManager/IoManager $folding-inner4 $folding-inner0 $src/devices/Cpu/Cpu $src/devices/Cpu/CpuRegisters $src/devices/Cpu/ALU $folding-inner0 $folding-inner4 $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>" $src/devices/InterruptManager/InterruptManager $src/devices/InterruptManager/CpuCoreInfo $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>" $folding-inner2 $folding-inner0 $~lib/array/Array<i32> $~lib/staticarray/StaticArray<~lib/string/String> $folding-inner1 $src/devices/Cpu/InstructionActions $folding-inner2 $folding-inner1 $folding-inner1 $folding-inner1 $folding-inner4 $src/devices/Cpu/Flags $folding-inner1 $~lib/array/Array<u16> $folding-inner0 $invalid
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
                       local.get $0
                       i32.load offset=20
                       call $~lib/rt/itcms/__visit
                       local.get $0
                       i32.load offset=28
                       call $~lib/rt/itcms/__visit
                       local.get $0
                       i32.load offset=32
                       call $~lib/rt/itcms/__visit
                       return
                      end
                      return
                     end
                     local.get $0
                     i32.load
                     call $~lib/rt/itcms/__visit
                     br $folding-inner4
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
                 call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>~visit"
                 return
                end
                local.get $0
                i32.load offset=8
                call $~lib/rt/itcms/__visit
                local.get $0
                i32.load offset=12
                call $~lib/rt/itcms/__visit
                return
               end
               return
              end
              local.get $0
              call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>~visit"
              return
             end
             local.get $0
             call $~lib/array/Array<i32>~visit
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
         local.get $0
         call $~lib/array/Array<i32>~visit
         return
        end
        unreachable
       end
       global.get $~lib/memory/__stack_pointer
       i32.const 4
       i32.sub
       global.set $~lib/memory/__stack_pointer
       global.get $~lib/memory/__stack_pointer
       i32.const 13144
       i32.lt_s
       br_if $folding-inner5
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
       local.set $3
       loop $while-continue|00
        local.get $1
        local.get $3
        i32.lt_u
        if
         local.get $1
         i32.load
         local.tee $2
         if
          local.get $2
          call $~lib/rt/itcms/__visit
         end
         local.get $1
         i32.const 4
         i32.add
         local.set $1
         br $while-continue|00
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
       return
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
      i32.lt_s
      br_if $folding-inner5
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
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
  i32.const 45912
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1204
  i32.const 1200
  i32.store
  i32.const 1208
  i32.const 1200
  i32.store
  i32.const 1200
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1236
  i32.const 1232
  i32.store
  i32.const 1240
  i32.const 1232
  i32.store
  i32.const 1232
  global.set $~lib/rt/itcms/toSpace
  i32.const 1380
  i32.const 1376
  i32.store
  i32.const 1384
  i32.const 1376
  i32.store
  i32.const 1376
  global.set $~lib/rt/itcms/fromSpace
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor" (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 24
  i32.const 18
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
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
  i32.const 3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 4
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/devices/Memory/Memory#constructor (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 3776
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
 (func $src/devices/Memory/Memory#write (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
    i32.const 3696
    local.get $0
    call $~lib/string/String#concat
    i32.const 3808
    i32.const 129
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
   i32.const 13144
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
    i32.const 1280
    i32.const 1664
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/IoManager/IoManager#writeRam (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1728
   i32.const 1840
   i32.const 141
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
  call $src/devices/Memory/Memory#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/CpuRegisters#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#push (param $0 i32) (param $1 i32)
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
   i32.const 13144
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
   i32.const 13144
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
     i32.const 1520
     i32.const 3904
     i32.const 19
     i32.const 48
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $__inlined_func$~lib/rt/itcms/__renew$1929
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
      br $__inlined_func$~lib/rt/itcms/__renew$1929
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/InterruptManager/InterruptManager#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 19
   call $~lib/rt/itcms/__new
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
   i32.const 4096
   i32.store16 offset=4
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
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 20
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 21
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 16
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
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
   i32.const 3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 48
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 4
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
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
   local.get $0
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 3776
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
   i32.const 3776
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
  i32.const 3776
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 3772
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
     i32.const 3776
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 3776
  i32.store
  local.get $0
  local.get $1
  call $~lib/util/string/joinStringArray
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/IoManager/IoManager#writeString (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 20
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load16_u offset=8
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $4
   local.get $1
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
    global.get $~lib/memory/__stack_pointer
    local.get $4
    call $~lib/util/number/utoa32
    local.tee $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    call $~lib/number/I32#toString
    local.tee $1
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    i32.const 1535
    call $~lib/util/number/utoa32
    local.tee $2
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    i32.const 4400
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    i32.const 4404
    local.get $0
    i32.store
    i32.const 4400
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4400
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=16
    i32.const 4412
    local.get $1
    i32.store
    i32.const 4400
    local.get $1
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4400
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=16
    i32.const 4420
    local.get $2
    i32.store
    i32.const 4400
    local.get $2
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 4400
    i32.store
    i32.const 4400
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 1840
    i32.const 120
    i32.const 13
    call $~lib/builtins/abort
    unreachable
   end
   loop $for-loop|0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $3
    local.get $1
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
     i32.store offset=16
     local.get $0
     i32.load16_u offset=8
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     block $__inlined_func$~lib/string/String#charCodeAt$1993
      local.get $3
      local.get $1
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
       local.set $2
       br $__inlined_func$~lib/string/String#charCodeAt$1993
      end
      local.get $1
      local.get $3
      i32.const 1
      i32.shl
      i32.add
      i32.load16_u
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.add
      global.set $~lib/memory/__stack_pointer
     end
     local.get $0
     local.get $5
     local.get $2
     call $src/devices/IoManager/IoManager#writeRam
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     local.get $0
     local.get $0
     i32.load16_u offset=8
     i32.const 1
     i32.add
     i32.store16 offset=8
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   local.get $0
   local.get $0
   i32.load16_u offset=8
   i32.const 0
   call $src/devices/IoManager/IoManager#writeRam
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   local.get $0
   local.get $0
   i32.load16_u offset=8
   i32.const 1
   i32.add
   i32.store16 offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  i32.const 45936
  i32.const 45984
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $src/utils/toHex (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 i32)
  (local $7 f64)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   i32.const 3776
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 3776
   i32.store
   local.get $0
   if
    local.get $0
    local.set $2
    loop $while-continue|0
     local.get $2
     i32.const 0
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 8
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
      i32.lt_s
      br_if $folding-inner0
      global.get $~lib/memory/__stack_pointer
      i64.const 0
      i64.store
      global.get $~lib/memory/__stack_pointer
      i32.const 4752
      i32.store
      block $__inlined_func$~lib/string/String#charAt$1994
       local.get $2
       i32.const 16
       i32.rem_s
       local.tee $4
       i32.const 4748
       i32.load
       i32.const 1
       i32.shr_u
       i32.ge_u
       if
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        i32.const 3776
        local.set $0
        br $__inlined_func$~lib/string/String#charAt$1994
       end
       global.get $~lib/memory/__stack_pointer
       i32.const 2
       i32.const 2
       call $~lib/rt/itcms/__new
       local.tee $0
       i32.store offset=4
       local.get $0
       local.get $4
       i32.const 1
       i32.shl
       i32.const 4752
       i32.add
       i32.load16_u
       i32.store16
       global.get $~lib/memory/__stack_pointer
       i32.const 8
       i32.add
       global.set $~lib/memory/__stack_pointer
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      local.get $0
      local.get $3
      call $~lib/string/String.__concat
      local.tee $3
      i32.store
      local.get $2
      i32.const 16
      i32.div_s
      f64.convert_i32_s
      local.tee $7
      f64.ceil
      local.tee $5
      local.get $5
      f64.const -1
      f64.add
      local.get $5
      f64.const -0.5
      f64.add
      local.get $7
      f64.le
      select
      i32.trunc_sat_f64_s
      local.set $2
      br $while-continue|0
     end
    end
   else
    i32.const 2112
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 2112
    i32.store
   end
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.const 1
   i32.and
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 2112
    local.get $3
    call $~lib/string/String.__concat
    local.tee $3
    i32.store
   end
   local.get $1
   i32.const 0
   i32.gt_s
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $1
    local.get $3
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.gt_s
   else
    i32.const 0
   end
   if
    loop $while-continue|1
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $1
     local.get $3
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 2112
      local.get $3
      call $~lib/string/String.__concat
      local.tee $3
      i32.store
      br $while-continue|1
     end
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   i32.const 4816
   local.get $3
   call $~lib/string/String.__concat
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/IoManager/IoManager#writeDeviceTableEntry (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  call $src/devices/IoManager/IoManager#writeString
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 255
  i32.and
  local.tee $6
  i32.const 6
  i32.mul
  i32.const 1281
  i32.add
  local.tee $4
  local.get $1
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $4
  i32.const 1
  i32.add
  local.get $3
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $4
  i32.const 2
  i32.add
  local.get $6
  i32.const 4
  i32.shl
  i32.const 61440
  i32.add
  local.tee $3
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $4
  i32.const 3
  i32.add
  local.get $3
  i32.const 65535
  i32.and
  local.tee $3
  i32.const 8
  i32.shr_u
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $4
  i32.const 4
  i32.add
  local.get $5
  i32.const 255
  i32.and
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $4
  i32.const 5
  i32.add
  local.get $5
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 1280
  local.get $1
  i32.const 1
  i32.add
  call $src/devices/IoManager/IoManager#writeRam
  global.get $~lib/memory/__stack_pointer
  local.get $6
  call $~lib/util/number/utoa32
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.const 0
  call $src/utils/toHex
  local.tee $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 0
  call $src/utils/toHex
  local.tee $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  i32.const 4688
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  i32.const 4692
  local.get $0
  i32.store
  i32.const 4688
  local.get $0
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4688
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=24
  i32.const 4700
  local.get $2
  i32.store
  i32.const 4688
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4688
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=24
  i32.const 4708
  local.get $1
  i32.store
  i32.const 4688
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4688
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=24
  i32.const 4716
  local.get $3
  i32.store
  i32.const 4688
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4688
  i32.store offset=4
  i32.const 4688
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
 )
 (func $src/devices/IoManager/IoManager#addDevice (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 20
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
   local.tee $4
   i32.const 255
   i32.and
   i32.const 20
   i32.ge_u
   if
    i32.const 4128
    i32.const 1840
    i32.const 34
    i32.const 13
    call $~lib/builtins/abort
    unreachable
   end
   local.get $4
   i32.const 255
   i32.and
   i32.const 255
   i32.gt_u
   if
    i32.const 4128
    i32.const 1840
    i32.const 38
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
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 9
   i32.const 11
   call $~lib/rt/itcms/__new
   local.tee $6
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $~lib/object/Object#constructor
   local.tee $6
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   local.get $6
   i32.const 0
   i32.store8
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   local.get $6
   i32.const 3776
   i32.store offset=4
   local.get $6
   i32.const 3776
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   local.get $6
   i32.const 0
   i32.store8 offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   local.get $6
   local.get $4
   i32.store8
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $6
   local.get $1
   i32.store offset=4
   local.get $6
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   local.get $6
   local.get $2
   i32.store8 offset=8
   local.get $6
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=4
   local.get $3
   local.get $6
   call $~lib/array/Array<src/devices/Cpu/Cpu>#push
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $4
   local.get $1
   local.get $2
   call $src/devices/IoManager/IoManager#writeDeviceTableEntry
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 36
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
   i32.const 1488
   call $~lib/rt/__newArray
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor"
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=20
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=28
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 23
   i32.const 1632
   call $~lib/rt/__newArray
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=32
   local.get $0
   local.get $1
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
   i32.const 13144
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
   i32.const 13144
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
   i32.const 13144
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
   i32.const 13144
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
   call $src/devices/Memory/Memory#constructor
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
   i32.const 13144
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
   i32.const 13144
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
   call $src/devices/Memory/Memory#constructor
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
   i32.const 13144
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
   i32.const 13144
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
   i32.const 3872
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
   call $src/devices/IoManager/IoManager#writeRam
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
   i32.const 13144
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
   block $__inlined_func$src/devices/Cpu/Cpu#constructor$12 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    block $folding-inner01
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner01
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 31
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
     i32.const 13144
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
     local.get $2
     i32.const 0
     i32.store8 offset=29
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     i32.const 0
     i32.store8 offset=30
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
     call $src/devices/Cpu/CpuRegisters#constructor
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
     br $__inlined_func$src/devices/Cpu/Cpu#constructor$12
    end
    br $folding-inner1
   end
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $1
   local.get $2
   call $~lib/array/Array<src/devices/Cpu/Cpu>#push
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   call $src/devices/InterruptManager/InterruptManager#constructor
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=28
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 20
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=12
   local.tee $1
   i32.store offset=4
   local.get $1
   i32.eqz
   if
    i32.const 3952
    i32.const 4016
    i32.const 64
    i32.const 25
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 7
   i32.const 22
   call $~lib/rt/itcms/__new
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 10
   i32.store8 offset=5
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=6
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $3
   local.get $0
   i32.store
   local.get $3
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   i32.const 4096
   i32.const 0
   call $src/devices/IoManager/IoManager#addDevice
   drop
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=32
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=12
   local.get $1
   local.get $3
   call $~lib/array/Array<src/devices/Cpu/Cpu>#push
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 4848
   call $src/external_functions/console.log
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<src/devices/Cpu/Cpu>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1280
   i32.const 3904
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
   i32.const 5136
   i32.const 3904
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
 (func $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.load
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    local.tee $2
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load8_u
     local.get $1
     i32.const 255
     i32.and
     i32.eq
    end
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $0
     return
    end
    local.get $2
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $~lib/string/String.__eq (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $0
  local.get $1
  i32.eq
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1
   return
  end
  block $folding-inner0
   local.get $1
   i32.eqz
   local.get $0
   i32.eqz
   i32.or
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $3
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.ne
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $3
   local.tee $0
   i32.const 4
   i32.ge_u
   if (result i32)
    local.get $2
    i32.const 7
    i32.and
    local.get $1
    i32.const 7
    i32.and
    i32.or
   else
    i32.const 1
   end
   i32.eqz
   if
    loop $do-loop|0
     local.get $2
     i64.load
     local.get $1
     i64.load
     i64.eq
     if
      local.get $2
      i32.const 8
      i32.add
      local.set $2
      local.get $1
      i32.const 8
      i32.add
      local.set $1
      local.get $0
      i32.const 4
      i32.sub
      local.tee $0
      i32.const 4
      i32.ge_u
      br_if $do-loop|0
     end
    end
   end
   block $__inlined_func$~lib/util/string/compareImpl$273
    loop $while-continue|1
     local.get $0
     local.tee $3
     i32.const 1
     i32.sub
     local.set $0
     local.get $3
     if
      local.get $2
      i32.load16_u
      local.tee $5
      local.get $1
      i32.load16_u
      local.tee $4
      i32.sub
      local.set $3
      local.get $4
      local.get $5
      i32.ne
      br_if $__inlined_func$~lib/util/string/compareImpl$273
      local.get $2
      i32.const 2
      i32.add
      local.set $2
      local.get $1
      i32.const 2
      i32.add
      local.set $1
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
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $~lib/string/String.__ne (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5552
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5584
  i32.store offset=4
  i32.const 5552
  i32.const 5584
  call $~lib/string/String.__eq
  i32.eqz
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Memory/MemoryBus#write (param $0 i32) (param $1 i32) (param $2 i32)
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
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 40
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load8_u offset=4
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 255
    i32.and
    local.tee $3
    i32.const 0
    call $src/utils/toHex
    local.tee $4
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $3
    call $~lib/util/number/utoa32
    local.tee $5
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 65535
    i32.and
    local.tee $6
    i32.const 0
    call $src/utils/toHex
    local.tee $3
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $6
    call $~lib/util/number/utoa32
    local.tee $6
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    i32.const 5904
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=24
    i32.const 5908
    local.get $4
    i32.store
    i32.const 5904
    local.get $4
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 5904
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=24
    i32.const 5916
    local.get $5
    i32.store
    i32.const 5904
    local.get $5
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 5904
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=24
    i32.const 5924
    local.get $3
    i32.store
    i32.const 5904
    local.get $3
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 5904
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=24
    i32.const 5932
    local.get $6
    i32.store
    i32.const 5904
    local.get $6
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 5904
    i32.store offset=20
    i32.const 5904
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    call $src/external_functions/console.log
   end
   local.get $1
   i32.const 65535
   i32.and
   local.tee $3
   i32.const 61439
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
    i32.load offset=8
    local.tee $0
    i32.store offset=32
    local.get $0
    i32.eqz
    if
     local.get $3
     i32.const 0
     call $src/utils/toHex
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 6064
     local.get $0
     call $~lib/string/String#concat
     i32.const 3808
     i32.const 85
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    local.get $1
    local.get $2
    call $src/devices/Memory/Memory#write
    global.get $~lib/memory/__stack_pointer
    i32.const 40
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
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
     i32.const 0
     call $src/utils/toHex
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 6160
     local.get $0
     call $~lib/string/String#concat
     i32.const 3808
     i32.const 96
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
    i32.const 13144
    i32.lt_s
    br_if $folding-inner0
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
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     i32.const 6272
     local.get $0
     call $~lib/string/String#concat
     i32.const 1840
     i32.const 174
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
    call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
    local.tee $0
    i32.store offset=8
    block $__inlined_func$src/devices/IoManager/IoManager#write$56
     local.get $0
     if
      local.get $4
      local.get $1
      local.get $2
      call $src/external_functions/jsIo.write
      br $__inlined_func$src/devices/IoManager/IoManager#write$56
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
     i32.const 6512
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     i32.const 6516
     local.get $0
     i32.store
     i32.const 6512
     local.get $0
     i32.const 1
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     i32.const 6512
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=20
     i32.const 6524
     local.get $1
     i32.store
     i32.const 6512
     local.get $1
     i32.const 1
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     i32.const 6512
     i32.store offset=4
     i32.const 6512
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
   i32.const 0
   call $src/utils/toHex
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   i32.const 6560
   local.get $0
   call $~lib/string/String#concat
   i32.const 3808
   i32.const 105
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#writeMemory (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 207
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
  call $src/devices/Memory/MemoryBus#write
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#handleInterrupt (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 24
   memory.fill
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
   i32.load offset=28
   local.tee $2
   i32.store offset=8
   local.get $2
   i32.eqz
   if
    i32.const 5312
    i32.const 5376
    i32.const 241
    i32.const 25
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.load8_u offset=1
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.load8_u
   i32.and
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   block $__inlined_func$src/devices/InterruptManager/InterruptManager#getPendingIRQ$1
    local.get $3
    local.get $2
    i32.load8_u offset=2
    i32.const -1
    i32.xor
    i32.and
    local.tee $3
    if
     loop $for-loop|0
      local.get $1
      i32.const 8
      i32.lt_s
      if
       global.get $~lib/memory/__stack_pointer
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.load offset=12
       local.tee $5
       i32.store
       global.get $~lib/memory/__stack_pointer
       i32.const 4
       i32.sub
       global.set $~lib/memory/__stack_pointer
       global.get $~lib/memory/__stack_pointer
       i32.const 13144
       i32.lt_s
       br_if $folding-inner2
       global.get $~lib/memory/__stack_pointer
       i32.const 0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $5
       i32.store
       local.get $5
       local.get $1
       local.get $1
       i32.const 255
       i32.and
       i32.const -1028477379
       i32.mul
       i32.const 374761394
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $5
       local.get $5
       i32.const 15
       i32.shr_u
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $5
       local.get $5
       i32.const 13
       i32.shr_u
       i32.xor
       i32.const -1028477379
       i32.mul
       local.tee $5
       local.get $5
       i32.const 16
       i32.shr_u
       i32.xor
       call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find"
       local.tee $5
       i32.eqz
       if
        i32.const 5440
        i32.const 5504
        i32.const 105
        i32.const 17
        call $~lib/builtins/abort
        unreachable
       end
       local.get $5
       i32.load offset=4
       local.set $5
       global.get $~lib/memory/__stack_pointer
       i32.const 4
       i32.add
       global.set $~lib/memory/__stack_pointer
       local.get $5
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       i32.const 5552
       i32.store
       block $for-continue|0
        local.get $5
        i32.const 0
        call $~lib/string/String.__ne
        select
        if (result i32)
         global.get $~lib/memory/__stack_pointer
         local.get $5
         i32.store
         local.get $5
         f64.load
         f64.const 0
         f64.ne
        else
         i32.const 0
        end
        br_if $for-continue|0
        global.get $~lib/memory/__stack_pointer
        i32.const 5552
        i32.store
        local.get $5
        i32.const 0
        call $~lib/string/String.__ne
        select
        if (result i32)
         global.get $~lib/memory/__stack_pointer
         local.get $5
         i32.store
         local.get $5
         f64.load offset=8
         f64.const 0
         f64.ne
        else
         i32.const 0
        end
        br_if $for-continue|0
        i32.const 1
        local.get $1
        i32.const 7
        i32.and
        i32.shl
        local.get $3
        i32.and
        if
         global.get $~lib/memory/__stack_pointer
         i32.const 12
         i32.add
         global.set $~lib/memory/__stack_pointer
         br $__inlined_func$src/devices/InterruptManager/InterruptManager#getPendingIRQ$1
        end
       end
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       br $for-loop|0
      end
     end
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 255
    local.set $1
   end
   local.get $1
   i32.const 255
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 24
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 0
   i32.store8 offset=29
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 1
   i32.store8 offset=30
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   i32.load16_u offset=10
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $4
   i32.store
   local.get $4
   i32.load16_u offset=6
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $5
   i32.store
   local.get $5
   i32.load8_u offset=12
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   local.get $5
   call $src/devices/Cpu/Cpu#writeMemory
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $5
   i32.store
   local.get $5
   local.get $3
   i32.const 1
   i32.sub
   local.tee $5
   i32.store16 offset=10
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $5
   local.get $4
   i32.const 8
   i32.shr_u
   call $src/devices/Cpu/Cpu#writeMemory
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   i32.const 2
   i32.sub
   local.get $4
   i32.const 255
   i32.and
   call $src/devices/Cpu/Cpu#writeMemory
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $4
   i32.store
   local.get $4
   local.get $3
   i32.const 3
   i32.sub
   i32.store16 offset=10
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner2
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   local.get $2
   i32.load8_u offset=1
   i32.const -2
   local.get $1
   i32.const 7
   i32.and
   i32.rotl
   i32.and
   i32.store8 offset=1
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.load16_u offset=4
   local.tee $2
   i32.eqz
   if
    i32.const 6656
    i32.const 5376
    i32.const 274
    i32.const 13
    call $~lib/builtins/abort
    unreachable
   end
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
   i32.store16 offset=6
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.const 255
   i32.and
   call $~lib/util/number/utoa32
   local.tee $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 0
   call $src/utils/toHex
   local.tee $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=20
   i32.const 6836
   local.get $0
   i32.store
   i32.const 6832
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=20
   i32.const 6844
   local.get $1
   i32.store
   i32.const 6832
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=4
   i32.const 6832
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $src/external_functions/console.log
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Memory/Memory#read (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
    i32.const 3696
    local.get $0
    call $~lib/string/String#concat
    i32.const 3808
    i32.const 121
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
   i32.const 13144
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
    i32.const 1280
    i32.const 1664
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Memory/MemoryBus#read (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 13144
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
   i32.const 61439
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
    i32.load offset=8
    local.tee $3
    i32.store offset=12
    local.get $3
    i32.eqz
    if
     local.get $2
     i32.const 0
     call $src/utils/toHex
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 7008
     local.get $0
     call $~lib/string/String#concat
     i32.const 3808
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
    call $src/devices/Memory/Memory#read
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
      i32.const 0
      call $src/utils/toHex
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 7104
      local.get $0
      call $~lib/string/String#concat
      i32.const 3808
      i32.const 43
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     block $__inlined_func$src/devices/IoManager/IoManager#read$57 (result i32)
      global.get $~lib/memory/__stack_pointer
      i32.const 24
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
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
      call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
       i32.const 7216
       local.get $0
       call $~lib/string/String#concat
       i32.const 1840
       i32.const 153
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
      call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
       br $__inlined_func$src/devices/IoManager/IoManager#read$57
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
      i32.const 7408
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=20
      i32.const 7412
      local.get $3
      i32.store
      i32.const 7408
      local.get $3
      i32.const 1
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      i32.const 7408
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=20
      i32.const 7420
      local.get $2
      i32.store
      i32.const 7408
      local.get $2
      i32.const 1
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      i32.const 7408
      i32.store offset=4
      i32.const 7408
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
     i32.const 0
     call $src/utils/toHex
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 7456
     local.get $0
     call $~lib/string/String#concat
     i32.const 3808
     i32.const 51
     i32.const 13
     call $~lib/builtins/abort
     unreachable
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
    i32.const 0
    call $src/utils/toHex
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
    i32.const 0
    call $src/utils/toHex
    local.tee $4
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa32
    local.tee $1
    i32.store offset=32
    global.get $~lib/memory/__stack_pointer
    i32.const 7616
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=36
    i32.const 7620
    local.get $0
    i32.store
    i32.const 7616
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 7616
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=36
    i32.const 7628
    local.get $3
    i32.store
    i32.const 7616
    local.get $3
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 7616
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=36
    i32.const 7636
    local.get $4
    i32.store
    i32.const 7616
    local.get $4
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 7616
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=36
    i32.const 7644
    local.get $1
    i32.store
    i32.const 7616
    local.get $1
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 7616
    i32.store offset=4
    i32.const 7616
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#readMemory (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 198
   i32.const 25
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Memory/MemoryBus#read
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.load
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    local.tee $2
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load16_u
     local.get $1
     i32.const 65535
     i32.and
     i32.eq
    end
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $0
     return
    end
    local.get $2
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
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
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 28
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
   i32.const 13144
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
    i32.const 1520
    i32.const 1568
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#readMem8 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 176
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
  call $src/devices/Cpu/Cpu#readMemory
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1280
   i32.const 7936
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|0 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1280
   i32.const 7936
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|1 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 0
  call $src/utils/toHex
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
  i32.const 8112
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=20
  i32.const 8116
  local.get $2
  i32.store
  i32.const 8112
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8112
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=20
  i32.const 8124
  local.get $1
  i32.store
  i32.const 8112
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8112
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=20
  i32.const 8132
  local.get $3
  i32.store
  i32.const 8112
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8112
  i32.store offset=16
  i32.const 8112
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|2 (param $0 i32) (param $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|3 (param $0 i32) (param $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 8224
  call $src/external_functions/console.log
  call $src/external_functions/jsCpu.halted
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|4 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  i32.const 0
  call $src/utils/toHex
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
  i32.const 8304
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  i32.const 8308
  local.get $3
  i32.store
  i32.const 8304
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8304
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  i32.const 8316
  local.get $1
  i32.store
  i32.const 8304
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8304
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  i32.const 8324
  local.get $2
  i32.store
  i32.const 8304
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 8304
  i32.store offset=4
  i32.const 8304
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
 (func $src/devices/Cpu/Cpu#getRegisterValueByIdx (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   local.tee $1
   i32.store offset=8
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
   i32.load16_u offset=6
   i32.const 4
   call $src/utils/toHex
   local.tee $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 8736
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 8740
   local.get $1
   i32.store
   i32.const 8736
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8736
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 8748
   local.get $0
   i32.store
   i32.const 8736
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8736
   i32.store
   i32.const 8736
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 5376
   i32.const 305
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|5 (param $0 i32)
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
   i32.const 13144
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
   call $src/devices/Cpu/Cpu#readMem8
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
   call $src/devices/Cpu/Cpu#readMem8
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   block $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58 (result i32)
    global.get $~lib/memory/__stack_pointer
    i32.const 16
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store offset=8
    local.get $2
    i32.const 255
    i32.and
    i32.const 1
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8384
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    local.get $2
    i32.const 255
    i32.and
    i32.const 2
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8416
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    local.get $2
    i32.const 255
    i32.and
    i32.const 3
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8448
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    local.get $2
    i32.const 255
    i32.and
    i32.const 4
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8480
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    local.get $2
    i32.const 255
    i32.and
    i32.const 5
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8512
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    local.get $2
    i32.const 255
    i32.and
    i32.const 6
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 8544
     br $__inlined_func$src/devices/Cpu/Cpu#getRegisterNameByIdx$58
    end
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 255
    i32.and
    call $~lib/util/number/utoa32
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
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load16_u offset=6
    i32.const 4
    call $src/utils/toHex
    local.tee $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    i32.const 8688
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=8
    i32.const 8692
    local.get $1
    i32.store
    i32.const 8688
    local.get $1
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 8688
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    i32.const 8700
    local.get $0
    i32.store
    i32.const 8688
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 8688
    i32.store offset=4
    i32.const 8688
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 5376
    i32.const 292
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   local.tee $3
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $2
   call $src/devices/Cpu/Cpu#getRegisterValueByIdx
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.const 255
   i32.and
   call $~lib/util/number/utoa32
   local.tee $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 255
   i32.and
   local.tee $2
   i32.const 0
   call $src/utils/toHex
   local.tee $4
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/util/number/utoa32
   local.tee $2
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8864
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   i32.const 8868
   local.get $1
   i32.store
   i32.const 8864
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8864
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   i32.const 8876
   local.get $3
   i32.store
   i32.const 8864
   local.get $3
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8864
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=8
   i32.const 8884
   local.get $4
   i32.store
   i32.const 8864
   local.get $4
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8864
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   i32.const 8892
   local.get $2
   i32.store
   i32.const 8864
   local.get $2
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8864
   i32.store offset=4
   i32.const 8864
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#readMem16 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 185
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
  call $src/devices/Cpu/Cpu#readMemory
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 2
  i32.add
  call $src/devices/Cpu/Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|6 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  i32.const 0
  call $src/utils/toHex
  local.tee $2
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 0
  call $src/utils/toHex
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
  i32.const 9072
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=8
  i32.const 9076
  local.get $4
  i32.store
  i32.const 9072
  local.get $4
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 9072
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  i32.const 9084
  local.get $2
  i32.store
  i32.const 9072
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 9072
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  i32.const 9092
  local.get $1
  i32.store
  i32.const 9072
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 9072
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=8
  i32.const 9100
  local.get $3
  i32.store
  i32.const 9072
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 9072
  i32.store offset=4
  i32.const 9072
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|7 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 1
  i32.store8 offset=29
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|8 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 0
  i32.store8 offset=29
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
 (func $src/devices/Cpu/Cpu#pushValue (param $0 i32) (param $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 215
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
  call $src/devices/Cpu/Cpu#writeMemory
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
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=10
  i32.const 1
  i32.sub
  i32.store16 offset=10
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|9 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.tee $1
  i32.const 128
  i32.eq
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.const 6
   i32.mul
   i32.const 255
   i32.and
   i32.const 1540
   i32.add
   local.tee $1
   call $src/devices/Cpu/Cpu#readMemory
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $src/devices/Cpu/Cpu#readMemory
   i32.const 8
   i32.shl
   i32.add
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.const 255
   i32.and
   call $src/devices/Cpu/Cpu#readMemory
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.store
   local.get $2
   i32.load16_u offset=6
   i32.const 2
   i32.add
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $2
   i32.const 65535
   i32.and
   i32.const 8
   i32.shr_u
   call $src/devices/Cpu/Cpu#pushValue
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $2
   i32.const 255
   i32.and
   call $src/devices/Cpu/Cpu#pushValue
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
   return
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
 )
 (func $src/devices/Cpu/Cpu#popValue (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 5632
   i32.const 5376
   i32.const 227
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
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.load16_u offset=10
  call $src/devices/Cpu/Cpu#readMemory
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|10 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#popValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/devices/Cpu/Cpu#popValue
  local.get $1
  i32.or
  i32.const 255
  i32.and
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/devices/Cpu/Cpu#popValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  local.get $2
  local.get $3
  i32.store16 offset=6
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  local.get $2
  local.get $1
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 1
  i32.store8 offset=29
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 0
  i32.store8 offset=30
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|11 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.load16_u offset=6
  i32.const 4
  call $src/utils/toHex
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  i32.const 9296
  local.get $1
  call $~lib/string/String#concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $src/external_functions/console.log
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 1
  i32.store8 offset=28
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load
  local.tee $1
  i32.store
  local.get $1
  i32.const 1
  i32.store offset=24
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
  local.tee $0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 1
  i32.add
  i32.store16 offset=6
  call $src/external_functions/jsCpu.breakpoint
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|12 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|13 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  local.get $2
  local.get $1
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
 (func $src/devices/Cpu/Cpu#setRegisterValueByIdx (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   local.tee $1
   i32.store offset=8
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
   i32.load16_u offset=6
   i32.const 4
   call $src/utils/toHex
   local.tee $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 9488
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 9492
   local.get $1
   i32.store
   i32.const 9488
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 9488
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 9500
   local.get $0
   i32.store
   i32.const 9488
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 9488
   i32.store
   i32.const 9488
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 5376
   i32.const 339
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|14 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store
  local.get $3
  i32.load16_u offset=10
  i32.const 255
  i32.and
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $4
  i32.store
  local.get $4
  i32.load16_u offset=10
  i32.const 8
  i32.shr_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $4
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|15 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $src/devices/Cpu/Cpu#pushValue
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#pushValue
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
  call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|16 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#popValue
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/devices/Cpu/Cpu#popValue
  i32.const 8
  i32.shl
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
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|17 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/Cpu#getFlag (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 9696
  call $~lib/string/String.__eq
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
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|18 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9664
  call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|19 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9664
  call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|20 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|21 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|22 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 0
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 9664
   call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|23 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 9664
   call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|24 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 1
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 9664
   call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|25 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 9696
  call $src/devices/Cpu/Cpu#getFlag
  if (result i32)
   i32.const 0
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 9664
   call $src/devices/Cpu/Cpu#getFlag
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
   call $src/devices/Cpu/Cpu#readMem16
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|26 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|27 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  local.get $4
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|28 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|29 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|30 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|31 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|32 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|33 (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#pushValue
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
 )
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|34 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $src/devices/Cpu/Cpu#popValue
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 )
 (func $src/devices/Cpu/Flags#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 33
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
 (func $src/devices/Cpu/AluResult#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.const 32
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
  call $src/devices/Cpu/Flags#constructor
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
 (func $src/devices/Cpu/ALU#inc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/Cpu#setFlags (param $0 i32) (param $1 i32) (param $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|35 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#inc
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|36 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#inc
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#dec (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|37 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#dec
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|38 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#dec
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#not (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|39 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#not
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|40 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#not
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#add (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|41 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#add
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|42 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#add
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|43 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#add
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|44 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#add
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|45 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#add
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#sub (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|46 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#sub
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|47 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#sub
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|48 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#sub
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|49 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#sub
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|50 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#sub
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#and (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|51 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#and
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|52 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#and
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|53 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#and
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|54 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#and
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|55 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#and
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#or (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|56 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#or
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|57 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#or
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|58 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#or
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|59 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#or
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|60 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#or
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#xor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|61 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#xor
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|62 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#xor
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|63 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#xor
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|64 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#xor
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|65 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#xor
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#cmp (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|66 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#cmp
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|67 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#cmp
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|68 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#cmp
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|69 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#cmp
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/ALU#test (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Flags#constructor
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
  call $src/devices/Cpu/AluResult#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|70 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#test
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|71 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#test
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|72 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#test
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|73 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#test
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
  call $src/devices/Cpu/Cpu#setFlags
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
 (func $src/devices/Cpu/ALU#shl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/AluResult#constructor
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
  call $src/devices/Cpu/Flags#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|74 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#shl
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|75 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#shl
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|76 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#shl
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|77 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#shl
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|78 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#shl
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/ALU#shr (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/AluResult#constructor
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
  call $src/devices/Cpu/Flags#constructor
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|79 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#shr
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|80 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#shr
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|81 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/ALU#shr
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|82 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/ALU#shr
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|83 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#readMemory
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/ALU#shr
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
  call $src/devices/Cpu/Cpu#setFlags
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|84 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem16
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|85 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem16
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $3
  i32.const 255
  i32.and
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|86 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#readMemory
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#setRegisterValueByIdx
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|87 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions~anonymous|88 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
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
  call $src/devices/Cpu/Cpu#readMem8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
  i32.const 255
  i32.and
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  call $src/devices/Cpu/Cpu#getRegisterValueByIdx
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
  call $src/devices/Cpu/Cpu#writeMemory
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
 (func $src/devices/Cpu/fetchInstructionActions (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 24
   memory.fill
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
                                                                                          local.get $0
                                                                                          i32.const 255
                                                                                          i32.and
                                                                                          local.tee $0
                                                                                          i32.const 4
                                                                                          i32.ne
                                                                                          if
                                                                                           local.get $0
                                                                                           br_table $case1|0 $case2|0 $case14|0 $case15|0 $case3|0 $case4|0 $case5|0 $break|0 $case8|0 $case10|0 $case6|0 $case7|0 $case9|0 $break|0 $break|0 $break|0 $case16|0 $case19|0 $case20|0 $case17|0 $case18|0 $case21|0 $case22|0 $case23|0 $case24|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case27|0 $case28|0 $case29|0 $case30|0 $case26|0 $case25|0 $case31|0 $case32|0 $case11|0 $case12|0 $case13|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case33|0 $case34|0 $case35|0 $case36|0 $case37|0 $case38|0 $case39|0 $case40|0 $case41|0 $case42|0 $case43|0 $case44|0 $case45|0 $case46|0 $case47|0 $case48|0 $case49|0 $case50|0 $case51|0 $case52|0 $case53|0 $case54|0 $case55|0 $case56|0 $case57|0 $case58|0 $case59|0 $case60|0 $case61|0 $case62|0 $case63|0 $break|0 $case64|0 $case65|0 $case66|0 $case67|0 $case68|0 $case69|0 $case70|0 $case71|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $break|0 $case72|0 $case73|0 $case74|0 $case75|0 $case76|0 $case77|0 $case78|0 $case79|0 $case80|0 $case81|0 $break|0 $break|0 $case82|0 $case83|0 $case84|0 $case85|0 $case86|0 $break|0
                                                                                          end
                                                                                          i32.const 8000
                                                                                          local.set $3
                                                                                          global.get $~lib/memory/__stack_pointer
                                                                                          i32.const 8000
                                                                                          i32.store
                                                                                          i32.const 8160
                                                                                          local.set $2
                                                                                          global.get $~lib/memory/__stack_pointer
                                                                                          i32.const 8160
                                                                                          i32.store offset=4
                                                                                          br $break|0
                                                                                         end
                                                                                         i32.const 8192
                                                                                         local.set $2
                                                                                         global.get $~lib/memory/__stack_pointer
                                                                                         i32.const 8192
                                                                                         i32.store offset=4
                                                                                         br $break|0
                                                                                        end
                                                                                        i32.const 8272
                                                                                        local.set $2
                                                                                        global.get $~lib/memory/__stack_pointer
                                                                                        i32.const 8272
                                                                                        i32.store offset=4
                                                                                        br $break|0
                                                                                       end
                                                                                       i32.const 8352
                                                                                       local.set $1
                                                                                       global.get $~lib/memory/__stack_pointer
                                                                                       i32.const 8352
                                                                                       i32.store offset=8
                                                                                       br $break|0
                                                                                      end
                                                                                      i32.const 8928
                                                                                      local.set $1
                                                                                      global.get $~lib/memory/__stack_pointer
                                                                                      i32.const 8928
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
                                                                             i32.const 9536
                                                                             local.set $1
                                                                             global.get $~lib/memory/__stack_pointer
                                                                             i32.const 9536
                                                                             i32.store offset=8
                                                                             br $break|0
                                                                            end
                                                                            i32.const 9568
                                                                            local.set $1
                                                                            global.get $~lib/memory/__stack_pointer
                                                                            i32.const 9568
                                                                            i32.store offset=8
                                                                            br $break|0
                                                                           end
                                                                           i32.const 9600
                                                                           local.set $1
                                                                           global.get $~lib/memory/__stack_pointer
                                                                           i32.const 9600
                                                                           i32.store offset=8
                                                                           br $break|0
                                                                          end
                                                                          i32.const 9632
                                                                          local.set $1
                                                                          global.get $~lib/memory/__stack_pointer
                                                                          i32.const 9632
                                                                          i32.store offset=8
                                                                          br $break|0
                                                                         end
                                                                         i32.const 9728
                                                                         local.set $1
                                                                         global.get $~lib/memory/__stack_pointer
                                                                         i32.const 9728
                                                                         i32.store offset=8
                                                                         br $break|0
                                                                        end
                                                                        i32.const 9760
                                                                        local.set $1
                                                                        global.get $~lib/memory/__stack_pointer
                                                                        i32.const 9760
                                                                        i32.store offset=8
                                                                        br $break|0
                                                                       end
                                                                       i32.const 9792
                                                                       local.set $1
                                                                       global.get $~lib/memory/__stack_pointer
                                                                       i32.const 9792
                                                                       i32.store offset=8
                                                                       br $break|0
                                                                      end
                                                                      i32.const 9824
                                                                      local.set $1
                                                                      global.get $~lib/memory/__stack_pointer
                                                                      i32.const 9824
                                                                      i32.store offset=8
                                                                      br $break|0
                                                                     end
                                                                     i32.const 9856
                                                                     local.set $1
                                                                     global.get $~lib/memory/__stack_pointer
                                                                     i32.const 9856
                                                                     i32.store offset=8
                                                                     br $break|0
                                                                    end
                                                                    i32.const 9888
                                                                    local.set $1
                                                                    global.get $~lib/memory/__stack_pointer
                                                                    i32.const 9888
                                                                    i32.store offset=8
                                                                    br $break|0
                                                                   end
                                                                   i32.const 9920
                                                                   local.set $1
                                                                   global.get $~lib/memory/__stack_pointer
                                                                   i32.const 9920
                                                                   i32.store offset=8
                                                                   br $break|0
                                                                  end
                                                                  i32.const 9952
                                                                  local.set $1
                                                                  global.get $~lib/memory/__stack_pointer
                                                                  i32.const 9952
                                                                  i32.store offset=8
                                                                  br $break|0
                                                                 end
                                                                 i32.const 9984
                                                                 local.set $3
                                                                 global.get $~lib/memory/__stack_pointer
                                                                 i32.const 9984
                                                                 i32.store
                                                                 i32.const 10016
                                                                 local.set $2
                                                                 global.get $~lib/memory/__stack_pointer
                                                                 i32.const 10016
                                                                 i32.store offset=4
                                                                 br $break|0
                                                                end
                                                                i32.const 10048
                                                                local.set $1
                                                                global.get $~lib/memory/__stack_pointer
                                                                i32.const 10048
                                                                i32.store offset=8
                                                                br $break|0
                                                               end
                                                               i32.const 10080
                                                               local.set $1
                                                               global.get $~lib/memory/__stack_pointer
                                                               i32.const 10080
                                                               i32.store offset=8
                                                               br $break|0
                                                              end
                                                              i32.const 10112
                                                              local.set $1
                                                              global.get $~lib/memory/__stack_pointer
                                                              i32.const 10112
                                                              i32.store offset=8
                                                              br $break|0
                                                             end
                                                             i32.const 10144
                                                             local.set $1
                                                             global.get $~lib/memory/__stack_pointer
                                                             i32.const 10144
                                                             i32.store offset=8
                                                             br $break|0
                                                            end
                                                            i32.const 10176
                                                            local.set $1
                                                            global.get $~lib/memory/__stack_pointer
                                                            i32.const 10176
                                                            i32.store offset=8
                                                            br $break|0
                                                           end
                                                           i32.const 10208
                                                           local.set $1
                                                           global.get $~lib/memory/__stack_pointer
                                                           i32.const 10208
                                                           i32.store offset=8
                                                           br $break|0
                                                          end
                                                          i32.const 10240
                                                          local.set $1
                                                          global.get $~lib/memory/__stack_pointer
                                                          i32.const 10240
                                                          i32.store offset=8
                                                          br $break|0
                                                         end
                                                         i32.const 10272
                                                         local.set $1
                                                         global.get $~lib/memory/__stack_pointer
                                                         i32.const 10272
                                                         i32.store offset=8
                                                         br $break|0
                                                        end
                                                        i32.const 10304
                                                        local.set $1
                                                        global.get $~lib/memory/__stack_pointer
                                                        i32.const 10304
                                                        i32.store offset=8
                                                        br $break|0
                                                       end
                                                       i32.const 10336
                                                       local.set $1
                                                       global.get $~lib/memory/__stack_pointer
                                                       i32.const 10336
                                                       i32.store offset=8
                                                       br $break|0
                                                      end
                                                      i32.const 10368
                                                      local.set $1
                                                      global.get $~lib/memory/__stack_pointer
                                                      i32.const 10368
                                                      i32.store offset=8
                                                      br $break|0
                                                     end
                                                     i32.const 10400
                                                     local.set $1
                                                     global.get $~lib/memory/__stack_pointer
                                                     i32.const 10400
                                                     i32.store offset=8
                                                     br $break|0
                                                    end
                                                    i32.const 10432
                                                    local.set $1
                                                    global.get $~lib/memory/__stack_pointer
                                                    i32.const 10432
                                                    i32.store offset=8
                                                    br $break|0
                                                   end
                                                   i32.const 10464
                                                   local.set $1
                                                   global.get $~lib/memory/__stack_pointer
                                                   i32.const 10464
                                                   i32.store offset=8
                                                   br $break|0
                                                  end
                                                  i32.const 10496
                                                  local.set $1
                                                  global.get $~lib/memory/__stack_pointer
                                                  i32.const 10496
                                                  i32.store offset=8
                                                  br $break|0
                                                 end
                                                 i32.const 10528
                                                 local.set $1
                                                 global.get $~lib/memory/__stack_pointer
                                                 i32.const 10528
                                                 i32.store offset=8
                                                 br $break|0
                                                end
                                                i32.const 10560
                                                local.set $1
                                                global.get $~lib/memory/__stack_pointer
                                                i32.const 10560
                                                i32.store offset=8
                                                br $break|0
                                               end
                                               i32.const 10592
                                               local.set $1
                                               global.get $~lib/memory/__stack_pointer
                                               i32.const 10592
                                               i32.store offset=8
                                               br $break|0
                                              end
                                              i32.const 10624
                                              local.set $1
                                              global.get $~lib/memory/__stack_pointer
                                              i32.const 10624
                                              i32.store offset=8
                                              br $break|0
                                             end
                                             i32.const 10656
                                             local.set $1
                                             global.get $~lib/memory/__stack_pointer
                                             i32.const 10656
                                             i32.store offset=8
                                             br $break|0
                                            end
                                            i32.const 10688
                                            local.set $1
                                            global.get $~lib/memory/__stack_pointer
                                            i32.const 10688
                                            i32.store offset=8
                                            br $break|0
                                           end
                                           i32.const 10720
                                           local.set $1
                                           global.get $~lib/memory/__stack_pointer
                                           i32.const 10720
                                           i32.store offset=8
                                           br $break|0
                                          end
                                          i32.const 10752
                                          local.set $1
                                          global.get $~lib/memory/__stack_pointer
                                          i32.const 10752
                                          i32.store offset=8
                                          br $break|0
                                         end
                                         i32.const 10784
                                         local.set $1
                                         global.get $~lib/memory/__stack_pointer
                                         i32.const 10784
                                         i32.store offset=8
                                         br $break|0
                                        end
                                        i32.const 10816
                                        local.set $1
                                        global.get $~lib/memory/__stack_pointer
                                        i32.const 10816
                                        i32.store offset=8
                                        br $break|0
                                       end
                                       i32.const 10848
                                       local.set $1
                                       global.get $~lib/memory/__stack_pointer
                                       i32.const 10848
                                       i32.store offset=8
                                       br $break|0
                                      end
                                      i32.const 10880
                                      local.set $1
                                      global.get $~lib/memory/__stack_pointer
                                      i32.const 10880
                                      i32.store offset=8
                                      br $break|0
                                     end
                                     i32.const 10912
                                     local.set $1
                                     global.get $~lib/memory/__stack_pointer
                                     i32.const 10912
                                     i32.store offset=8
                                     br $break|0
                                    end
                                    i32.const 10944
                                    local.set $1
                                    global.get $~lib/memory/__stack_pointer
                                    i32.const 10944
                                    i32.store offset=8
                                    br $break|0
                                   end
                                   i32.const 10976
                                   local.set $1
                                   global.get $~lib/memory/__stack_pointer
                                   i32.const 10976
                                   i32.store offset=8
                                   br $break|0
                                  end
                                  i32.const 11008
                                  local.set $1
                                  global.get $~lib/memory/__stack_pointer
                                  i32.const 11008
                                  i32.store offset=8
                                  br $break|0
                                 end
                                 i32.const 11040
                                 local.set $1
                                 global.get $~lib/memory/__stack_pointer
                                 i32.const 11040
                                 i32.store offset=8
                                 br $break|0
                                end
                                i32.const 11072
                                local.set $1
                                global.get $~lib/memory/__stack_pointer
                                i32.const 11072
                                i32.store offset=8
                                br $break|0
                               end
                               i32.const 11104
                               local.set $1
                               global.get $~lib/memory/__stack_pointer
                               i32.const 11104
                               i32.store offset=8
                               br $break|0
                              end
                              i32.const 11136
                              local.set $1
                              global.get $~lib/memory/__stack_pointer
                              i32.const 11136
                              i32.store offset=8
                              br $break|0
                             end
                             i32.const 11168
                             local.set $1
                             global.get $~lib/memory/__stack_pointer
                             i32.const 11168
                             i32.store offset=8
                             br $break|0
                            end
                            i32.const 11200
                            local.set $1
                            global.get $~lib/memory/__stack_pointer
                            i32.const 11200
                            i32.store offset=8
                            br $break|0
                           end
                           i32.const 11232
                           local.set $1
                           global.get $~lib/memory/__stack_pointer
                           i32.const 11232
                           i32.store offset=8
                           br $break|0
                          end
                          i32.const 11264
                          local.set $1
                          global.get $~lib/memory/__stack_pointer
                          i32.const 11264
                          i32.store offset=8
                          br $break|0
                         end
                         i32.const 11296
                         local.set $1
                         global.get $~lib/memory/__stack_pointer
                         i32.const 11296
                         i32.store offset=8
                         br $break|0
                        end
                        i32.const 11328
                        local.set $1
                        global.get $~lib/memory/__stack_pointer
                        i32.const 11328
                        i32.store offset=8
                        br $break|0
                       end
                       i32.const 11360
                       local.set $1
                       global.get $~lib/memory/__stack_pointer
                       i32.const 11360
                       i32.store offset=8
                       br $break|0
                      end
                      i32.const 11392
                      local.set $1
                      global.get $~lib/memory/__stack_pointer
                      i32.const 11392
                      i32.store offset=8
                      br $break|0
                     end
                     i32.const 11424
                     local.set $1
                     global.get $~lib/memory/__stack_pointer
                     i32.const 11424
                     i32.store offset=8
                     br $break|0
                    end
                    i32.const 11456
                    local.set $1
                    global.get $~lib/memory/__stack_pointer
                    i32.const 11456
                    i32.store offset=8
                    br $break|0
                   end
                   i32.const 11488
                   local.set $1
                   global.get $~lib/memory/__stack_pointer
                   i32.const 11488
                   i32.store offset=8
                   br $break|0
                  end
                  i32.const 11520
                  local.set $1
                  global.get $~lib/memory/__stack_pointer
                  i32.const 11520
                  i32.store offset=8
                  br $break|0
                 end
                 i32.const 11552
                 local.set $1
                 global.get $~lib/memory/__stack_pointer
                 i32.const 11552
                 i32.store offset=8
                 br $break|0
                end
                i32.const 11584
                local.set $1
                global.get $~lib/memory/__stack_pointer
                i32.const 11584
                i32.store offset=8
                br $break|0
               end
               i32.const 11616
               local.set $1
               global.get $~lib/memory/__stack_pointer
               i32.const 11616
               i32.store offset=8
               br $break|0
              end
              i32.const 11648
              local.set $1
              global.get $~lib/memory/__stack_pointer
              i32.const 11648
              i32.store offset=8
              br $break|0
             end
             i32.const 11680
             local.set $1
             global.get $~lib/memory/__stack_pointer
             i32.const 11680
             i32.store offset=8
             br $break|0
            end
            i32.const 11712
            local.set $1
            global.get $~lib/memory/__stack_pointer
            i32.const 11712
            i32.store offset=8
            br $break|0
           end
           i32.const 11744
           local.set $1
           global.get $~lib/memory/__stack_pointer
           i32.const 11744
           i32.store offset=8
           br $break|0
          end
          i32.const 11776
          local.set $1
          global.get $~lib/memory/__stack_pointer
          i32.const 11776
          i32.store offset=8
          br $break|0
         end
         i32.const 11808
         local.set $1
         global.get $~lib/memory/__stack_pointer
         i32.const 11808
         i32.store offset=8
         br $break|0
        end
        i32.const 11840
        local.set $1
        global.get $~lib/memory/__stack_pointer
        i32.const 11840
        i32.store offset=8
        br $break|0
       end
       i32.const 11872
       local.set $1
       global.get $~lib/memory/__stack_pointer
       i32.const 11872
       i32.store offset=8
       br $break|0
      end
      i32.const 11904
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 11904
      i32.store offset=8
      br $break|0
     end
     i32.const 11936
     local.set $1
     global.get $~lib/memory/__stack_pointer
     i32.const 11936
     i32.store offset=8
     br $break|0
    end
    i32.const 11968
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 11968
    i32.store offset=8
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   i32.const 27
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
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store offset=4
   local.get $0
   local.get $3
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
   i32.store offset=8
   local.get $0
   local.get $2
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Cpu/Cpu#executeInstruction (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   block $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.const 48
    memory.fill
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
    i32.load
    local.tee $3
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $4
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.load16_u offset=6
    i32.const 4
    call $src/utils/toHex
    local.tee $5
    i32.store offset=12
    local.get $3
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     i32.const 7680
     local.get $5
     call $~lib/string/String#concat
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     call $src/external_functions/console.warn
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $3
    i32.store
    local.get $3
    i32.load16_u offset=6
    local.set $6
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
    i32.load offset=20
    local.tee $7
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $6
    local.get $6
    i32.const -1028477379
    i32.mul
    i32.const 374761395
    i32.add
    i32.const 17
    i32.rotl
    i32.const 668265263
    i32.mul
    local.tee $3
    local.get $3
    i32.const 15
    i32.shr_u
    local.tee $4
    i32.xor
    i32.const -2048144777
    i32.mul
    local.tee $8
    local.get $8
    i32.const 13
    i32.shr_u
    i32.xor
    i32.const -1028477379
    i32.mul
    local.tee $8
    local.get $8
    i32.const 16
    i32.shr_u
    i32.xor
    call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
    i32.const 0
    i32.ne
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    if
     global.get $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store
     local.get $7
     local.get $6
     local.get $3
     local.get $4
     i32.xor
     i32.const -2048144777
     i32.mul
     local.tee $3
     local.get $3
     i32.const 13
     i32.shr_u
     i32.xor
     i32.const -1028477379
     i32.mul
     local.tee $3
     local.get $3
     i32.const 16
     i32.shr_u
     i32.xor
     call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
     local.tee $3
     i32.eqz
     if
      i32.const 5440
      i32.const 5504
      i32.const 105
      i32.const 17
      call $~lib/builtins/abort
      unreachable
     end
     local.get $3
     i32.load offset=4
     local.set $3
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=20
     local.get $3
     i32.eqz
     if
      i32.const 7776
      i32.const 5376
      i32.const 107
      i32.const 30
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $3
     i32.store
     local.get $3
     i32.load offset=24
     local.get $2
     i32.or
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load
      local.tee $2
      i32.store
      local.get $2
      i32.const 0
      i32.store offset=24
     else
      global.get $~lib/memory/__stack_pointer
      local.get $5
      i32.store offset=4
      i32.const 7840
      local.get $5
      call $~lib/string/String#concat
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
      i32.load
      local.tee $1
      i32.store
      local.get $1
      i32.const 2
      i32.store offset=24
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 1
      i32.store8 offset=28
      call $src/external_functions/jsCpu.breakpoint
      br $folding-inner1
     end
    else
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load
     local.tee $2
     i32.store
     local.get $2
     i32.load offset=24
     i32.const 2
     i32.eq
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load
      local.tee $2
      i32.store
      local.get $2
      i32.const 0
      i32.store offset=24
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $src/devices/Cpu/fetchInstructionActions
    local.tee $2
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    i32.load offset=8
    if
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.load offset=4
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 1
      global.set $~argumentsLength
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $0
      local.get $2
      i32.load offset=4
      i32.load
      call_indirect (type $2)
     else
      i32.const 0
      call $~lib/typedarray/Uint8Array#constructor
     end
     local.tee $1
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     i32.const 2
     global.set $~argumentsLength
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=32
     local.get $0
     local.get $1
     local.get $2
     i32.load offset=8
     i32.load
     call_indirect (type $4)
     br $folding-inner1
    else
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     i32.load
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 1
      global.set $~argumentsLength
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $0
      local.get $2
      i32.load
      i32.load
      call_indirect (type $0)
      br $folding-inner1
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 255
    i32.and
    local.tee $1
    i32.const 0
    call $src/utils/toHex
    local.tee $2
    i32.store offset=36
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa32
    local.tee $1
    i32.store offset=40
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
    i32.load16_u offset=6
    i32.const 4
    call $src/utils/toHex
    local.tee $0
    i32.store offset=44
    global.get $~lib/memory/__stack_pointer
    i32.const 12128
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=4
    i32.const 12132
    local.get $2
    i32.store
    i32.const 12128
    local.get $2
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 12128
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    i32.const 12140
    local.get $1
    i32.store
    i32.const 12128
    local.get $1
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 12128
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    i32.const 12148
    local.get $0
    i32.store
    i32.const 12128
    local.get $0
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    i32.const 12128
    i32.store
    i32.const 12128
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 5376
    i32.const 152
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/devices/Cpu/Cpu#runCpuCycle (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   i32.store
   local.get $0
   i32.load8_u offset=8
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 16
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
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
   i32.load offset=28
   local.tee $3
   i32.store offset=8
   local.get $3
   i32.eqz
   if
    i32.const 5312
    i32.const 5376
    i32.const 53
    i32.const 25
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load8_u offset=29
   else
    i32.const 0
   end
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load8_u offset=30
   else
    i32.const 1
   end
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i32.load8_u offset=1
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i32.load8_u
    i32.and
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i32.load8_u offset=2
    i32.const -1
    i32.xor
    i32.and
    i32.const 0
    i32.ne
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   local.get $2
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $src/devices/Cpu/Cpu#handleInterrupt
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load
   local.tee $2
   i32.store
   local.get $2
   i32.load offset=24
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load
    local.tee $2
    i32.store
    local.get $2
    i32.const 0
    i32.store offset=24
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $0
   i64.load offset=16
   i64.const 1
   i64.add
   i64.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   local.tee $2
   i32.store offset=4
   local.get $0
   local.get $2
   i32.load16_u offset=6
   call $src/devices/Cpu/Cpu#readMemory
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   local.get $2
   i32.store8 offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
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
   i32.load8_u offset=8
   local.get $1
   call $src/devices/Cpu/Cpu#executeInstruction
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/interrupt_timer/InterruptTimerDevice#tick (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner2
   block $folding-inner1
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
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
    local.tee $1
    i32.store
    local.get $1
    i32.load8_u offset=6
    i32.eqz
    br_if $folding-inner2
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $1
    i32.load8_u offset=4
    i32.const 1
    i32.add
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $1
    i32.load8_u offset=5
    local.get $0
    i32.const 255
    i32.and
    i32.le_u
    if
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.load
     local.tee $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=28
     local.tee $3
     i32.store offset=8
     local.get $3
     if
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 12
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
      i32.lt_s
      br_if $folding-inner1
      global.get $~lib/memory/__stack_pointer
      i64.const 0
      i64.store
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=12
      local.tee $10
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=8
      local.tee $5
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 12
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
      i32.lt_s
      br_if $folding-inner1
      global.get $~lib/memory/__stack_pointer
      i64.const 0
      i64.store
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $10
      i32.store
      local.get $10
      i32.const 0
      i32.const -1803171685
      call $"~lib/map/Map<u8,src/devices/InterruptManager/CpuCoreInfo>#find"
      local.tee $0
      if
       global.get $~lib/memory/__stack_pointer
       local.get $5
       i32.store
       local.get $0
       local.get $5
       i32.store offset=4
       local.get $10
       local.get $5
       i32.const 1
       call $~lib/rt/itcms/__link
      else
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       local.get $10
       i32.load offset=16
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       local.get $10
       i32.load offset=12
       i32.eq
       if
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=4
        local.get $10
        i32.load offset=20
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=4
        local.get $10
        i32.load offset=12
        i32.const 3
        i32.mul
        i32.const 4
        i32.div_s
        i32.lt_s
        if (result i32)
         global.get $~lib/memory/__stack_pointer
         local.get $10
         i32.store offset=4
         local.get $10
         i32.load offset=4
        else
         global.get $~lib/memory/__stack_pointer
         local.get $10
         i32.store offset=4
         local.get $10
         i32.load offset=4
         i32.const 1
         i32.shl
         i32.const 1
         i32.or
        end
        local.set $7
        global.get $~lib/memory/__stack_pointer
        i32.const 16
        i32.sub
        global.set $~lib/memory/__stack_pointer
        global.get $~lib/memory/__stack_pointer
        i32.const 13144
        i32.lt_s
        br_if $folding-inner1
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $7
        i32.const 1
        i32.add
        local.tee $0
        i32.const 2
        i32.shl
        call $~lib/arraybuffer/ArrayBuffer#constructor
        local.tee $6
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.const 3
        i32.shl
        i32.const 3
        i32.div_s
        local.tee $8
        i32.const 12
        i32.mul
        call $~lib/arraybuffer/ArrayBuffer#constructor
        local.tee $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        local.get $10
        i32.load offset=8
        local.set $4
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        local.get $4
        local.get $10
        i32.load offset=16
        i32.const 12
        i32.mul
        i32.add
        local.set $9
        local.get $2
        local.set $0
        loop $while-continue|0
         local.get $4
         local.get $9
         i32.ne
         if
          local.get $4
          i32.load offset=8
          i32.const 1
          i32.and
          i32.eqz
          if
           local.get $0
           local.get $4
           i32.load8_u
           local.tee $11
           i32.store8
           global.get $~lib/memory/__stack_pointer
           local.get $4
           i32.load offset=4
           local.tee $12
           i32.store offset=8
           local.get $0
           local.get $12
           i32.store offset=4
           local.get $0
           local.get $6
           local.get $7
           local.get $11
           i32.const -1028477379
           i32.mul
           i32.const 374761394
           i32.add
           i32.const 17
           i32.rotl
           i32.const 668265263
           i32.mul
           local.tee $11
           i32.const 15
           i32.shr_u
           local.get $11
           i32.xor
           i32.const -2048144777
           i32.mul
           local.tee $11
           i32.const 13
           i32.shr_u
           local.get $11
           i32.xor
           i32.const -1028477379
           i32.mul
           local.tee $11
           i32.const 16
           i32.shr_u
           local.get $11
           i32.xor
           i32.and
           i32.const 2
           i32.shl
           i32.add
           local.tee $11
           i32.load
           i32.store offset=8
           local.get $11
           local.get $0
           i32.store
           local.get $0
           i32.const 12
           i32.add
           local.set $0
          end
          local.get $4
          i32.const 12
          i32.add
          local.set $4
          br $while-continue|0
         end
        end
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=12
        local.get $10
        local.get $6
        i32.store
        local.get $10
        local.get $6
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        local.get $10
        local.get $7
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=12
        local.get $10
        local.get $2
        i32.store offset=8
        local.get $10
        local.get $2
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        local.get $10
        local.get $8
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=12
        local.get $10
        local.get $10
        i32.load offset=20
        i32.store offset=16
        global.get $~lib/memory/__stack_pointer
        i32.const 16
        i32.add
        global.set $~lib/memory/__stack_pointer
       end
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.load offset=8
       local.tee $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store offset=4
       local.get $10
       local.get $10
       i32.load offset=16
       local.tee $2
       i32.const 1
       i32.add
       i32.store offset=16
       local.get $0
       local.get $2
       i32.const 12
       i32.mul
       i32.add
       local.tee $0
       i32.const 0
       i32.store8
       global.get $~lib/memory/__stack_pointer
       local.get $5
       i32.store
       local.get $0
       local.get $5
       i32.store offset=4
       local.get $10
       local.get $5
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store offset=4
       local.get $10
       local.get $10
       i32.load offset=20
       i32.const 1
       i32.add
       i32.store offset=20
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       local.get $10
       i32.load
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store
       local.get $0
       local.get $2
       local.get $10
       i32.load offset=4
       i32.const -1803171685
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $2
       i32.load
       i32.store offset=8
       local.get $2
       local.get $0
       i32.store
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 12
      i32.add
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      local.get $3
      local.get $3
      i32.load8_u offset=1
      i32.const 1
      i32.or
      i32.store8 offset=1
      global.get $~lib/memory/__stack_pointer
      i32.const 12
      i32.add
      global.set $~lib/memory/__stack_pointer
     else
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.sub
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 13144
      i32.lt_s
      br_if $folding-inner1
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 12352
      i32.store
      i32.const 12352
      call $~lib/bindings/dom/console.warn
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.add
      global.set $~lib/memory/__stack_pointer
     end
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     local.get $1
     i32.const 0
     i32.store8 offset=4
     br $folding-inner2
    end
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $1
    local.get $0
    i32.store8 offset=4
    br $folding-inner2
   end
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $src/index/computerRunCycles (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  i32.const 1
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=16
  local.tee $6
  i32.store
  local.get $6
  call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
    local.tee $6
    i32.store
    local.get $6
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
    local.get $3
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $6
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $6
     local.get $3
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
     local.tee $6
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store
     local.get $6
     i32.const 0
     i32.store8 offset=28
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
   loop $for-loop|1
    local.get $1
    local.get $5
    i32.gt_u
    if
     i32.const 0
     local.set $3
     loop $for-loop|2
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=16
      local.tee $6
      i32.store
      local.get $6
      call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
      local.get $3
      i32.gt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=16
       local.tee $6
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $6
       local.get $3
       call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
       local.tee $6
       i32.store offset=12
       local.get $6
       i32.eqz
       if
        local.get $3
        call $~lib/number/I32#toString
        local.set $0
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        i32.const 5264
        local.get $0
        call $~lib/string/String#concat
        i32.const 4960
        i32.const 89
        i32.const 27
        call $~lib/builtins/abort
        unreachable
       end
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store
       local.get $6
       i32.load8_u offset=28
       if (result i32)
        i32.const 1
       else
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store
        local.get $6
        i32.load8_u offset=8
       end
       if
        i32.const 0
        local.set $4
       else
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store
        local.get $6
        local.get $2
        call $src/devices/Cpu/Cpu#runCpuCycle
       end
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|2
      end
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|1
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=32
   local.tee $0
   i32.store offset=16
   local.get $0
   i32.eqz
   if
    i32.const 12176
    i32.const 4960
    i32.const 102
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 0
   local.set $1
   loop $for-loop|3
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
    local.get $1
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $1
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
     local.tee $2
     i32.store offset=20
     local.get $2
     i32.eqz
     if
      local.get $1
      call $~lib/number/I32#toString
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 12224
      local.get $0
      call $~lib/string/String#concat
      i32.const 4960
      i32.const 106
      i32.const 25
      call $~lib/builtins/abort
      unreachable
     end
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $src/devices/interrupt_timer/InterruptTimerDevice#tick
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|3
    end
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $src/index/computerResetComputer (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner1
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
   local.tee $3
   i32.store offset=4
   local.get $3
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner1
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=8
    local.get $3
    i32.load offset=4
    call $~lib/staticarray/StaticArray<u8>#constructor
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    local.get $3
    local.get $4
    i32.store
    local.get $3
    local.get $4
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
   local.tee $3
   i32.store offset=8
   local.get $3
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner1
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    loop $for-loop|0
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=4
     local.tee $4
     i32.store
     local.get $4
     call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
     local.get $2
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=4
      local.tee $4
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $4
      local.get $2
      call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
      local.tee $4
      i32.store offset=8
      local.get $4
      if
       local.get $2
       call $src/external_functions/jsIo.reset
      end
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|0
     end
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   i32.const 0
   local.set $2
   loop $for-loop|00
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $4
    i32.store
    local.get $4
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
    local.get $2
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $4
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     local.get $2
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
     local.tee $4
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner1
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     call $src/devices/Cpu/CpuRegisters#constructor
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $4
     local.get $5
     i32.store offset=4
     local.get $4
     local.get $5
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     i32.const 0
     i32.store8 offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     i64.const 0
     i64.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     i32.const 1
     i32.store8 offset=29
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     i32.const 0
     i32.store8 offset=30
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|00
    end
   end
   local.get $3
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 28
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 13144
    i32.lt_s
    br_if $folding-inner1
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.const 28
    memory.fill
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i32.const 1408
    i32.store16 offset=8
    loop $for-loop|01
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=4
     local.tee $0
     i32.store
     local.get $0
     call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
     local.get $1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=4
      local.tee $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      local.get $1
      call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
      local.tee $0
      i32.store offset=8
      local.get $0
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load8_u
       call $~lib/util/number/utoa32
       local.tee $2
       i32.store offset=12
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=4
       local.tee $4
       i32.store offset=16
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load8_u offset=8
       call $~lib/util/number/utoa32
       local.tee $5
       i32.store offset=20
       global.get $~lib/memory/__stack_pointer
       i32.const 12736
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=24
       i32.const 12740
       local.get $2
       i32.store
       i32.const 12736
       local.get $2
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       i32.const 12736
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.store offset=24
       i32.const 12748
       local.get $4
       i32.store
       i32.const 12736
       local.get $4
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       i32.const 12736
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $5
       i32.store offset=24
       i32.const 12756
       local.get $5
       i32.store
       i32.const 12736
       local.get $5
       i32.const 1
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       i32.const 12736
       i32.store offset=4
       i32.const 12736
       call $~lib/staticarray/StaticArray<~lib/string/String>#join
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       call $src/external_functions/console.log
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=24
       local.get $0
       i32.load8_u
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=24
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=4
       local.tee $4
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=24
       local.get $3
       local.get $2
       local.get $4
       local.get $0
       i32.load8_u offset=8
       call $src/devices/IoManager/IoManager#writeDeviceTableEntry
      end
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|01
     end
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 28
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<u16>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1280
   i32.const 3904
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   local.get $0
   local.get $1
   local.get $1
   i32.const 65535
   i32.and
   i32.const -1028477379
   i32.mul
   i32.const 374761395
   i32.add
   i32.const 17
   i32.rotl
   i32.const 668265263
   i32.mul
   local.tee $3
   local.get $3
   i32.const 15
   i32.shr_u
   i32.xor
   i32.const -2048144777
   i32.mul
   local.tee $3
   local.get $3
   i32.const 13
   i32.shr_u
   i32.xor
   i32.const -1028477379
   i32.mul
   local.tee $3
   local.get $3
   i32.const 16
   i32.shr_u
   i32.xor
   local.tee $8
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#find"
   local.tee $3
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $3
    local.get $2
    i32.store offset=4
    local.get $0
    local.get $2
    i32.const 1
    call $~lib/rt/itcms/__link
   else
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=12
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=12
     i32.const 3
     i32.mul
     i32.const 4
     i32.div_s
     i32.lt_s
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      i32.load offset=4
     else
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      i32.load offset=4
      i32.const 1
      i32.shl
      i32.const 1
      i32.or
     end
     local.set $9
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.const 1
     i32.add
     local.tee $3
     i32.const 2
     i32.shl
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $10
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.const 3
     i32.shl
     i32.const 3
     i32.div_s
     local.tee $7
     i32.const 12
     i32.mul
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $4
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     i32.load offset=8
     local.set $11
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $11
     local.get $0
     i32.load offset=16
     i32.const 12
     i32.mul
     i32.add
     local.set $6
     local.get $4
     local.set $3
     loop $while-continue|0
      local.get $6
      local.get $11
      i32.ne
      if
       local.get $11
       i32.load offset=8
       i32.const 1
       i32.and
       i32.eqz
       if
        local.get $3
        local.get $11
        i32.load16_u
        local.tee $12
        i32.store16
        global.get $~lib/memory/__stack_pointer
        local.get $11
        i32.load offset=4
        local.tee $5
        i32.store offset=8
        local.get $3
        local.get $5
        i32.store offset=4
        local.get $3
        local.get $10
        local.get $9
        local.get $12
        i32.const -1028477379
        i32.mul
        i32.const 374761395
        i32.add
        i32.const 17
        i32.rotl
        i32.const 668265263
        i32.mul
        local.tee $5
        i32.const 15
        i32.shr_u
        local.get $5
        i32.xor
        i32.const -2048144777
        i32.mul
        local.tee $5
        i32.const 13
        i32.shr_u
        local.get $5
        i32.xor
        i32.const -1028477379
        i32.mul
        local.tee $5
        i32.const 16
        i32.shr_u
        local.get $5
        i32.xor
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee $5
        i32.load
        i32.store offset=8
        local.get $5
        local.get $3
        i32.store
        local.get $3
        i32.const 12
        i32.add
        local.set $3
       end
       local.get $11
       i32.const 12
       i32.add
       local.set $11
       br $while-continue|0
      end
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $10
     i32.store offset=12
     local.get $0
     local.get $10
     i32.store
     local.get $0
     local.get $10
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     local.get $9
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=12
     local.get $0
     local.get $4
     i32.store offset=8
     local.get $0
     local.get $4
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     local.get $7
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     local.get $0
     local.get $0
     i32.load offset=20
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=8
    local.tee $3
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $4
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $3
    local.get $4
    i32.const 12
    i32.mul
    i32.add
    local.tee $3
    local.get $1
    i32.store16
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $3
    local.get $2
    i32.store offset=4
    local.get $0
    local.get $2
    i32.const 1
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=20
    i32.const 1
    i32.add
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $3
    local.get $1
    local.get $8
    local.get $0
    i32.load offset=4
    i32.and
    i32.const 2
    i32.shl
    i32.add
    local.tee $0
    i32.load
    i32.store offset=8
    local.get $0
    local.get $3
    i32.store
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $src/devices/Computer/Computer#setBreakpoints (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 24
   memory.fill
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#constructor"
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $0
   local.get $5
   i32.store offset=20
   local.get $0
   local.get $5
   i32.const 0
   call $~lib/rt/itcms/__link
   loop $for-loop|0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
    local.get $4
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     local.get $1
     local.get $4
     call $~lib/array/Array<u16>#__get
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     local.get $4
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
     local.tee $7
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     local.get $4
     call $~lib/array/Array<u16>#__get
     local.set $8
     global.get $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i64.const 0
     i64.store
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 10
     i32.const 17
     call $~lib/rt/itcms/__new
     local.tee $9
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $9
     i32.const 0
     i32.store16
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $9
     i32.const 12784
     i32.store offset=4
     local.get $9
     i32.const 12784
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $9
     i32.const 0
     i32.store16 offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $9
     local.get $5
     i32.store16
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store offset=8
     local.get $9
     local.get $7
     i32.store offset=4
     local.get $9
     local.get $7
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $9
     local.get $8
     i32.store16 offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $6
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $9
     i32.store offset=4
     local.get $6
     local.get $5
     local.get $9
     call $"~lib/map/Map<u16,src/devices/Computer/Breakpoint>#set"
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=20
   local.tee $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   call $~lib/number/I32#toString
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 12832
   local.get $0
   call $~lib/string/String#concat
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/bindings/dom/console.log
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1520
   i32.const 1568
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
 )
 (func $~lib/staticarray/StaticArray<u8>#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 1520
   i32.const 1664
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
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
   i32.const 2112
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
  local.tee $2
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  local.get $1
  local.get $0
  local.get $2
  call $~lib/util/number/utoa32_dec_lut
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:src/index/computerloadCodeInROM (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   i32.const 13144
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
   i32.load offset=4
   local.tee $0
   i32.store offset=4
   local.get $0
   i32.eqz
   if
    i32.const 4912
    i32.const 4960
    i32.const 34
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
     call $src/devices/Memory/Memory#write
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerloadCodeInRAM (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   i32.const 13144
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
   i32.load offset=8
   local.tee $0
   i32.store offset=4
   local.get $0
   i32.eqz
   if
    i32.const 5008
    i32.const 4960
    i32.const 56
    i32.const 9
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 61440
   i32.gt_s
   if
    i32.const 5056
    i32.const 4960
    i32.const 60
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
     call $src/devices/Memory/Memory#write
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
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:src/index/computerRunCycles@varargs (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
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
    local.set $2
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   local.get $2
   call $src/index/computerRunCycles
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
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
   i32.const 13144
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
   i32.const 13144
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
   call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
    call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
    i32.const 13144
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterPC$1972
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterPC$1972
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterSP$1973
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterSP$1973
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterIR$1974
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterIR$1974
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterA$1975
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterA$1975
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterB$1976
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterB$1976
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterC$1977
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterC$1977
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterD$1978
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterD$1978
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterE$1979
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterE$1979
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetRegisterF$1980
    local.get $1
    call $~lib/array/Array<src/devices/IoManager/IoDevice>#get:length
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
     call $~lib/array/Array<src/devices/Cpu/Cpu>#__get
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
     br $__inlined_func$src/index/computerGetRegisterF$1980
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
   block $__inlined_func$src/index/computerGetMemory$1981
    i32.const 12480
    i32.const 0
    local.get $0
    select
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     local.get $1
     call $src/devices/Memory/MemoryBus#read
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     br $__inlined_func$src/index/computerGetMemory$1981
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
  i32.const 45936
  i32.const 45984
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
   i32.const 13144
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
   i32.const 13144
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
    call $src/devices/Memory/MemoryBus#write
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
  i32.const 45936
  i32.const 45984
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
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=12
   local.tee $8
   i32.store offset=4
   local.get $8
   i32.eqz
   if
    i32.const 12512
    i32.const 4960
    i32.const 240
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.set $0
   i32.const 3776
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 3776
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
     local.set $7
     i32.const 1
     global.set $~argumentsLength
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 13144
     i32.lt_s
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 2
     i32.const 2
     call $~lib/rt/itcms/__new
     local.tee $5
     i32.store
     local.get $5
     local.get $7
     i32.store16
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=12
     local.get $1
     local.get $5
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
   local.get $8
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $8
   local.get $1
   local.get $3
   call $src/devices/IoManager/IoManager#addDevice
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
  i32.const 45936
  i32.const 45984
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
  i32.const 13144
  i32.lt_s
  if
   i32.const 45936
   i32.const 45984
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
 (func $export:src/index/computerSetBreakpoints (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
   i32.lt_s
   br_if $folding-inner0
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
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 13144
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
   call $src/devices/Computer/Computer#setBreakpoints
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 45936
  i32.const 45984
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
)
