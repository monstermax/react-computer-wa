; lib_music.asm
; Séquenceur musical basé sur timer IRQ
;
; API publique :
;   play_melody   : lance la mélodie (C:D = adresse de la table)
;   stop_melody   : arrête la mélodie et coupe le son
;
; Format de la table melody :
;   triplets (note_midi, dur_lo, dur_hi)
;   note=0, dur>0  → silence
;   note=0, dur=0  → fin → boucle depuis le début
;
; Dépendances :
;   lib_interrupt.asm
;   lib_speaker.asm

%include "os/v3/drivers/lib_interrupt.asm"
%include "os/v3/drivers/lib_speaker.asm"

section .data
    _mel_start_lo  db 0x00   ; adresse de début de la table (pour boucle)
    _mel_start_hi  db 0x00
    _mel_ptr_lo    db 0x00   ; pointeur courant
    _mel_ptr_hi    db 0x00
    _cur_dur_lo    db 0x00
    _cur_dur_hi    db 0x00
    _elapsed_lo    db 0x00
    _elapsed_hi    db 0x00
    _bk_a          db 0x00
    _bk_b          db 0x00
    _bk_c          db 0x00
    _bk_d          db 0x00


section .text
    global play_melody
    global stop_melody
    global _music_play_current_note
    global _music_timer_handler

ret


; ─────────────────────────────────────────────────
; play_melody
; INPUT: C:D = adresse de la table melody
; Lance le séquenceur timer IRQ
; ─────────────────────────────────────────────────
play_melody:
    ; Sauvegarder adresse de début (pour boucle)
    mov [_mel_start_lo], cl
    mov [_mel_start_hi], dl
    mov [_mel_ptr_lo],   cl
    mov [_mel_ptr_hi],   dl

    ; Réinitialiser elapsed
    mov al, 0
    mov [_elapsed_lo], al
    mov [_elapsed_hi], al

    ; Configurer handler IRQ timer
    lea cl, dl, [_music_timer_handler]
    call interrupt_set_handler

    ; Activer IRQ timer
    mov al, IRQ_TIMER
    call interrupt_enable_irq

    ; Timer period = 1 tick = 100ms
    mov al, 1
    call timer0_set_period
    call timer0_enable

    ; Jouer la première note immédiatement
    call _music_play_current_note

    ei
    ret


; ─────────────────────────────────────────────────
; stop_melody
; Arrête le timer et coupe le son
; ─────────────────────────────────────────────────
stop_melody:
    call timer0_disable
    mov al, 0
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────
; _music_play_current_note
; ─────────────────────────────────────────────────
_music_play_current_note:
    mov cl, [_mel_ptr_lo]
    mov dl, [_mel_ptr_hi]

    ldi al, cl, dl      ; note
    call inc_cd
    ldi bl, cl, dl      ; dur_lo
    call inc_cd
    ldi el, cl, dl      ; dur_hi
    call inc_cd

    ; Sauvegarder nouveau pointeur
    mov [_mel_ptr_lo], cl
    mov [_mel_ptr_hi], dl

    ; Fin → boucler
    cmp al, 0
    jnz _mpcn_save
    cmp bl, 0
    jnz _mpcn_save
    cmp el, 0
    jnz _mpcn_save
    mov cl, [_mel_start_lo]
    mov dl, [_mel_start_hi]
    mov [_mel_ptr_lo], cl
    mov [_mel_ptr_hi], dl
    call _music_play_current_note
    ret

    _mpcn_save:
    mov [_cur_dur_lo], bl
    mov [_cur_dur_hi], el
    mov bl, 0
    mov [_elapsed_lo], bl
    mov [_elapsed_hi], bl

    cmp al, 0
    jz _mpcn_rest

    ; NOTE + GATE ON
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    ret

    _mpcn_rest:
    ; GATE OFF
    mov al, 0
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────
; _music_timer_handler — IRQ toutes les 100ms
; ─────────────────────────────────────────────────
_music_timer_handler:
    mov [_bk_a], al
    mov [_bk_b], bl
    mov [_bk_c], cl
    mov [_bk_d], dl

    mov al, [_elapsed_lo]
    mov bl, [_elapsed_hi]
    add al, 100
    jnc _mth_nc1
    inc bl
    _mth_nc1:
    mov [_elapsed_lo], al
    mov [_elapsed_hi], bl

    mov cl, [_cur_dur_hi]
    cmp bl, cl
    jg  _mth_next
    jl  _mth_ack
    mov cl, [_cur_dur_lo]
    cmp al, cl
    jl  _mth_ack

    _mth_next:
    call _music_play_current_note

    _mth_ack:
    mov cl, [interrupt_io_base]
    mov dl, [interrupt_io_base + 1]
    mov al, 0x02
    add cl, al
    jnc _mth_nc2
    inc dl
    _mth_nc2:
    mov al, IRQ_TIMER
    sti cl, dl, al

    mov al, [_bk_a]
    mov bl, [_bk_b]
    mov cl, [_bk_c]
    mov dl, [_bk_d]
    iret
