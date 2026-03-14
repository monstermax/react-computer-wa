
%include "os/v3/strings/lib_string.asm"

section .data
    sys_read      equ 3
    sys_write     equ 4

    str_text_1    db "Write something here: ", 0
    str_text_2    db "You wrote: ", 0
    NEW_LINE      db 13, 0


section .bss
    str_test_r    resb 16


section .text
    global _start


_start:
    int3

    call test_write

    ret



test_read:

    mov al, 16
    push al ; 4th param : str length

    lea cl, dl, [str_test_r] ; load string pointer
    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)

    mov al, 0 ; stdin
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_read call
    mov al, sys_read
    int 0x08

    ret


test_write:

    ; prepare sys_write params for str_text_1

    lea cl, dl, [str_text_1] ; load string pointer

    call strlen ; => calculate string size => A = strlen([C:D])

    push al ; 4th param : str length
    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)

    mov al, 1 ; stdout
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_write call
    mov al, sys_write
    int 0x08


    call test_read


    ; prepare sys_write params for str_text_2

    lea cl, dl, [str_text_2] ; load string pointer

    call strlen ; => calculate string size => A = strlen([C:D])

    push al ; 4th param : str length
    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)

    mov al, 1 ; stdout
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_write call
    mov al, sys_write
    int 0x08


    ; prepare sys_write params for str_test_r

    lea cl, dl, [str_test_r] ; load string pointer

    call strlen ; => calculate string size => A = strlen([C:D])

    push al ; 4th param : str length
    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)

    mov al, 1 ; stdout
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_write call
    mov al, sys_write
    int 0x08


    ; prepare sys_write params for NEW_LINE

    lea cl, dl, [NEW_LINE] ; load string pointer

    ;call strlen ; => calculate string size => A = strlen([C:D])
    mov al, 1

    push al ; 4th param : str length
    push dl ; 3st param : pointer to the buffer (low byte)
    push cl ; 2nd param : pointer to the buffer (high byte)

    mov al, 1 ; stdout
    push al ; 1st param : file descriptor. not yet supported. push anything

    ; sys_write call
    mov al, sys_write
    int 0x08


    ret

