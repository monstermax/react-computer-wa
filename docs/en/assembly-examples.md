# Assembly Examples

Minimal examples based on instruction behavior visible in current CPU code.

> Note: exact assembler source syntax is defined by the frontend compiler. Examples here focus on instruction intent.

## 1) Load immediate into a register

```asm
; intent: A = 0x2A
MOV A, 0x2A
```

Matches `MOV_REG_IMM` behavior.

## 2) Add immediate to register

```asm
; intent: A = A + 1
ADD A, 0x01
```

Matches `ADD_REG_IMM`.

## 3) Compare then conditional jump

```asm
; intent: compare A with 0 then jump if equal
CMP A, 0x00
JZ target
```

Matches `CMP_REG_IMM` then `JZ`.

## 4) Subroutine call

```asm
CALL subroutine
; ...
subroutine:
  ; work
  RET
```

`CALL` pushes return address on stack, `RET` restores it.

## 5) Memory-mapped I/O write

```asm
; intent: write a value to an I/O address
MOV [0xF000], A
```

Addresses in `0xF000-0xFFFF` are routed to I/O.
