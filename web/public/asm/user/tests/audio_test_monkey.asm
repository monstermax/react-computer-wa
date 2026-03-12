; Author: claude
; Monkey Island Theme - Opening melody
; Tempo ~160 BPM, noire = 375ms

%include "os/v3/arithmetic/lib_math.asm"

section .data
    buzzer_io_base  dw 0xF0B0

    ; Note table: freq byte values (100 + val * 7.45 = Hz)
    ; G4=392Hz  → (392-100)/7.45 ≈ 39
    ; A4=440Hz  → (440-100)/7.45 ≈ 46
    ; B4=494Hz  → (494-100)/7.45 ≈ 53
    ; C5=523Hz  → (523-100)/7.45 ≈ 57
    ; D5=587Hz  → (587-100)/7.45 ≈ 65
    ; E5=659Hz  → (659-100)/7.45 ≈ 75
    ; F5=698Hz  → (698-100)/7.45 ≈ 80
    ; G5=784Hz  → (784-100)/7.45 ≈ 92
    ; D4=294Hz  → (294-100)/7.45 ≈ 26
    ; E4=330Hz  → (330-100)/7.45 ≈ 31
    ; F4=349Hz  → (349-100)/7.45 ≈ 33
    ; REST=0Hz  →  0 duration

    ; melody: pairs of (freq_byte, duration_byte)
    ; duration: value * 10ms. 19=190ms (croche), 37=370ms (noire), 56=560ms (noire pointée)
    melody db 39, 19      ; G4 croche
           db 57, 19      ; C5 croche
           db 65, 37      ; D5 noire
           db 65, 19      ; D5 croche
           db 57, 19      ; C5 croche
           db 65, 19      ; D5 croche
           db 75, 19      ; E5 croche
           db 65, 37      ; D5 noire
           db 57, 19      ; C5 croche
           db 65, 19      ; D5 croche
           db 57, 37      ; C5 noire
           db 46, 19      ; A4 croche
           db 39, 37      ; G4 noire
           db 0, 0        ; END marker


section .text
    global _start

_start:
    mov cl, [buzzer_io_base]
    mov dl, [buzzer_io_base + 1]

    mov el, [melody]
    mov fl, [melody + 1]

play_loop:
    ; Read freq byte
    ldi al, el, fl
    cmp al, 0
    je .done

    ; Write freq to buzzer port 0
    sti cl, dl, al

    ; Advance to duration byte
    call inc_ef

    ; Read duration byte
    ldi al, el, fl
    
    ; Advance to next note
    call inc_ef

    ; Write duration to buzzer port 1 (triggers playback)
    push cl
    push dl
    call inc_cd
    sti cl, dl, al
    pop dl
    pop cl

    ; Wait for note to finish
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
