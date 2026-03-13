
%include "os/v3/strings/lib_string.asm"

section .data
    sys_write   equ 4
    str_test    db "Test syscall write", 13, 0


section .text
    global _start


_start:

    ; sys_write params
    lea cl, dl, [str_test]

    call strlen ; => A = strlen([C:D])

    push al ; 4th param : str length

    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_write call
    mov al, sys_write
    int 0x08

    int3
    ret
