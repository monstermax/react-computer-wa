; audio_test_monkey.asm
; Monkey Island Theme — données extraites du MIDI officiel
; Table : (note_midi, dur_lo, dur_hi) — durée en ms sur 16 bits
; L'APU reçoit la durée exacte via LENGTH_LO/HI

%include "os/v3/drivers/lib_interrupt.asm"
%include "os/v3/drivers/lib_speaker.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 76, 240, 0   ; E5 240ms
        db 0,   99, 0   ; REST 99ms
        db 76, 177, 0   ; E5 177ms
        db 79, 219, 0   ; G5 219ms
        db 78, 198, 0   ; F#5 198ms
        db 76, 188, 0   ; E5 188ms
        db 74, 208, 0   ; D5 208ms
        db 0,  141, 0   ; REST 141ms
        db 76, 129, 2   ; E5 641ms
        db 0,  129, 1   ; REST 385ms
        db 74, 193, 0   ; D5 193ms
        db 0,  151, 0   ; REST 151ms
        db 74, 219, 0   ; D5 219ms
        db 72, 172, 0   ; C5 172ms
        db 71, 177, 0   ; B4 177ms
        db 74, 208, 0   ; D5 208ms
        db 72, 214, 0   ; C5 214ms
        db 0,  130, 0   ; REST 130ms
        db 72, 203, 0   ; C5 203ms
        db 0,  146, 0   ; REST 146ms
        db 71, 118, 2   ; B4 630ms
        db 0,  140, 1   ; REST 396ms
        db 76, 193, 0   ; E5 193ms
        db 0,  156, 0   ; REST 156ms
        db 76, 192, 1   ; E5 448ms
        db 79, 208, 0   ; G5 208ms
        db 78, 177, 0   ; F#5 177ms
        db 76, 198, 0   ; E5 198ms
        db 74, 193, 0   ; D5 193ms
        db 0,  156, 0   ; REST 156ms
        db 76, 201, 3   ; E5 969ms
        db 0,  229, 0   ; REST 229ms
        db 78, 156, 0   ; F#5 156ms
        db 79, 146, 0   ; G5 146ms
        db 0,  198, 0   ; REST 198ms
        db 79, 151, 0   ; G5 151ms
        db 0, 0, 0      ; FIN → boucle

    mel_ptr    dw 0x0000
    ; Durée en ms de la note courante (16-bit) pour le séquenceur
    cur_dur_lo db 0x00
    cur_dur_hi db 0x00
    ; Compteur ms écoulés depuis le début de la note courante
    elapsed_lo db 0x00
    elapsed_hi db 0x00

    _bk_a      db 0x00
    _bk_b      db 0x00
    _bk_c      db 0x00
    _bk_d      db 0x00


section .text
    global _start

_start:
    call init_device_interrupt
    call init_device_timer0
    call init_device_speaker
    call init_device_keyboard

    mov al, 0       ; pulse wave
    call speaker_set_wave
    mov al, 180
    call speaker_set_volume
    mov al, 2
    call speaker_set_attack
    mov al, 10
    call speaker_set_decay
    mov al, 160
    call speaker_set_sustain
    mov al, 15
    call speaker_set_release

    lea cl, dl, [melody]
    mov [mel_ptr],     cl
    mov [mel_ptr + 1], dl

    ; Réinitialiser elapsed
    mov al, 0
    mov [elapsed_lo], al
    mov [elapsed_hi], al

    lea cl, dl, [timer_handler]
    call interrupt_set_handler

    mov al, IRQ_TIMER
    call interrupt_enable_irq

    mov al, 1               ; period = 1 tick = 100ms
    call timer0_set_period
    call timer0_enable

    ; Jouer la première note immédiatement
    call play_current_note

    ei

    main_loop:
        call get_keyboard_status
        and al, 0x01
        jz main_loop
        call get_keyboard_char
        cmp al, KEY_ESC
        jz _quit
        call set_keyboard_status
        jmp main_loop

    _quit:
    call timer0_disable
    mov al, 0
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────
; play_current_note
; Lit note + dur_lo + dur_hi depuis mel_ptr
; Joue la note avec LENGTH exact dans l'APU
; ─────────────────────────────────────────────────
play_current_note:
    mov cl, [mel_ptr]
    mov dl, [mel_ptr + 1]

    ldi al, cl, dl      ; al = note
    call inc_cd
    ldi bl, cl, dl      ; bl = dur_lo
    call inc_cd
    ldi el, cl, dl      ; el = dur_hi
    call inc_cd

    ; Sauvegarder nouveau pointeur
    mov [mel_ptr],     cl
    mov [mel_ptr + 1], dl

    ; Fin → boucler
    cmp al, 0
    jnz _pcn_check
    cmp bl, 0
    jnz _pcn_continue
    cmp el, 0
    jnz _pcn_continue
    lea cl, dl, [melody]
    mov [mel_ptr],     cl
    mov [mel_ptr + 1], dl
    call play_current_note
    ret

    _pcn_continue:
    ; Sauvegarder durée courante
    mov [cur_dur_lo], bl
    mov [cur_dur_hi], el
    ; Réinitialiser elapsed
    mov al, 0
    mov [elapsed_lo], al
    mov [elapsed_hi], al

    ; REST → GATE OFF
    cmp al, 0
    jnz _pcn_play
    ; al est déjà 0 ici mais on teste la note (al avant écrasement)
    ; Correction : on a écrasé al avec 0. Retester la note.
    ; → utiliser une variable temporaire

    jmp _pcn_done   ; silence, pas de GATE

    _pcn_check:
    ; al = note (non nul)
    mov [cur_dur_lo], bl
    mov [cur_dur_hi], el
    mov bl, 0
    mov [elapsed_lo], bl
    mov [elapsed_hi], bl

    _pcn_play:
    ; Écrire LENGTH_LO dans le speaker
    push al
    mov al, [cur_dur_lo]
    mov el, SPEAKER_PORT_LENGTH_LO
    call _speaker_port
    sti cl, dl, al

    ; Écrire LENGTH_HI
    mov al, [cur_dur_hi]
    mov el, SPEAKER_PORT_LENGTH_HI
    call _speaker_port
    sti cl, dl, al

    ; Écrire NOTE
    pop al
    push al
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al

    ; GATE ON
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    pop al

    _pcn_done:
    ret


; ─────────────────────────────────────────────────
; timer_handler — IRQ toutes les 100ms
; Incrémente elapsed, passe à la note suivante
; quand elapsed >= cur_dur
; ─────────────────────────────────────────────────
timer_handler:
    mov [_bk_a], al
    mov [_bk_b], bl
    mov [_bk_c], cl
    mov [_bk_d], dl

    ; elapsed += 100
    mov al, [elapsed_lo]
    mov bl, [elapsed_hi]
    add al, 100
    jnc _th_no_carry
    inc bl
    _th_no_carry:
    mov [elapsed_lo], al
    mov [elapsed_hi], bl

    ; elapsed >= cur_dur ?
    mov cl, [cur_dur_hi]
    cmp bl, cl
    jg  _th_next        ; elapsed_hi > dur_hi → note suivante
    jl  _th_ack         ; elapsed_hi < dur_hi → attendre
    ; elapsed_hi == dur_hi → comparer lo
    mov cl, [cur_dur_lo]
    cmp al, cl
    jl  _th_ack         ; elapsed_lo < dur_lo → attendre

    _th_next:
    call play_current_note

    _th_ack:
    mov cl, [interrupt_io_base]
    mov dl, [interrupt_io_base + 1]
    mov al, 0x02
    add cl, al
    jnc _th_nc
    inc dl
    _th_nc:
    mov al, IRQ_TIMER
    sti cl, dl, al

    mov al, [_bk_a]
    mov bl, [_bk_b]
    mov cl, [_bk_c]
    mov dl, [_bk_d]

    iret
