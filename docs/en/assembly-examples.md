# Assembly Examples

## Immediate load

```asm
MOV A, 0x2A
```

## Register arithmetic

```asm
ADD A, 0x01
SUB A, 0x01
```

## Compare and branch

```asm
CMP A, 0x00
JZ done

; ...

done:
```

## Subroutine call

```asm
CALL routine
HALT

routine:
  RET
```

## Stack usage

```asm
PUSH A
POP B
```

## Memory-mapped I/O write

```asm
MOV [0xF000], A
```

Address range `0xF000-0xFFFF` is mapped to I/O devices.
