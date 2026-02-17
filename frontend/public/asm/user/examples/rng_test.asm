; Author: yomax
; Date: 2026-02
; Name: rng_test
; Description: Genere 10 nombres aléatoires

.include "os/v3/arithmetic/lib_math.asm"
.include "os/v3/strings/lib_string.asm"
.include "os/v3/drivers/lib_console.asm"


section .data
    rng_io_base  dw 0xF0A0

section .bss
    string_buffer resb 4


section .text
    global _start


_start:
    mov cl, [rng_io_base]
    mov dl, [rng_io_base + 1]

    mov bl, 10 ; compteur

    call inc_cd
    mov al, 42 ; RNG_SEED => Seed = 0x42
    sti cl, dl, al

    call dec_cd
    push cl
    push dl

    rng_loop:
    pop dl
    pop cl
    push cl
    push dl
    ldi al, cl, dl ; RNG_OUTPUT → génère nombre aléatoire

    lea cl, dl, [string_buffer]
    push al
    call int_to_str
    pop al
    debug 1, al

    call console_print_string

    mov al, 10 ; EOL
    call console_print_char

    dec bl

    jnz rng_loop

    pop dl
    pop cl
    ret

