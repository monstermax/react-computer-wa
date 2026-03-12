; Author: yomax
; Date: 2026-02
; Name: buzzer_test
; Description: Emet un buzz

%include "os/v3/arithmetic/lib_math.asm"


section .data
    buzzer_io_base  dw 0xF0B0


section .text
    global _start


_start:
    mov cl, [buzzer_io_base]
    mov dl, [buzzer_io_base + 1]

    mov al, 45 ; BUZZER_FREQ => Fréquence = 440 Hz → valeur ≈ (440-100)/7.45 ≈ 45
    sti cl, dl, al

    call inc_cd

    mov al, 50 ; BUZZER_DURATION => Durée = 500ms → 500/10 = 50
    sti cl, dl, al

    ret

