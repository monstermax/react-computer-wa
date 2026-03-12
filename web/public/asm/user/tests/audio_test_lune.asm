; Author: claude
; Au Clair de la Lune
; C4=262Hz → (262-100)/7.45 ≈ 22
; D4=294Hz → (294-100)/7.45 ≈ 26
; E4=330Hz → (330-100)/7.45 ≈ 31

%include "os/v3/arithmetic/lib_math.asm"

section .data
    speaker_io_base  dw 0xF0E0

    ; MIDI: C4=60, D4=62, E4=64
    melody db 60, 30      ; do
           db 60, 30      ; do
           db 60, 30      ; do
           db 62, 30      ; ré
           db 64, 50      ; mi -
           db 62, 50      ; ré ---
           db 60, 30      ; do
           db 64, 30      ; mi
           db 62, 30      ; ré
           db 62, 30      ; ré
           db 60, 60      ; do ---
           db 0, 0        ; FIN


section .text
    global _start

_start:
    mov cl, [speaker_io_base]
    mov dl, [speaker_io_base + 1]

    mov el, [melody]
    mov fl, [melody + 1]

play_loop:
    ldi al, el, fl
    cmp al, 0
    je .done

    ; freq → port 0
    sti cl, dl, al
    call inc_ef

    ; duration → port 1 (triggers sound)
    ldi al, el, fl
    call inc_ef

    push cl
    push dl
    call inc_cd
    sti cl, dl, al
    pop dl
    pop cl

    ; wait for note to finish
.wait:
    push cl
    push dl
    call inc_cd
    ldi al, cl, dl
    pop dl
    pop cl
    cmp al, 1
    je .wait

    jmp play_loop

.done:
    ret


inc_ef:
    inc el
    jnc .no_carry
    inc fl
    .no_carry:
    ret