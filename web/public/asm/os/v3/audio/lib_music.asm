; lib_music.asm
; Séquenceur musical — timing basé sur RTC millis (temps réel JS)
; Indépendant de la clock CPU.
;
; API publique :
;   music_sleep_ms  : C:D = durée ms → busy-wait RTC
;   music_play_note : A = note MIDI (0=silence), C:D = durée ms
;   music_play_rest : C:D = durée ms → silence

%include "os/v3/drivers/lib_speaker.asm"
%include "os/v3/drivers/lib_rtc.asm"

section .data
    _ms_start_lo  db 0x00
    _ms_start_hi  db 0x00
    _ms_dur_lo    db 0x00
    _ms_dur_hi    db 0x00

section .text
    global music_sleep_ms
    global music_play_note
    global music_play_rest

ret


; ─────────────────────────────────────────────────────
; music_sleep_ms
; INPUT: C:D = durée en ms (uint16)
; Clobbers: A, B, E, F
; C:D restaurés en sortie
; ─────────────────────────────────────────────────────
music_sleep_ms:
    mov [_ms_dur_lo], cl
    mov [_ms_dur_hi], dl

    ; Snapshot de départ
    call _rtc_millis_16
    mov [_ms_start_lo], al
    mov [_ms_start_hi], bl

    music_sleep_loop:
        call _rtc_millis_16   ; A=lo, B=hi

        ; elapsed = now - start (16-bit)
        sub al, [_ms_start_lo]
        jnc _no_borrow
        dec bl
        _no_borrow:
        sub bl, [_ms_start_hi]

        ; elapsed (B:A) >= durée ?
        cmp bl, [_ms_dur_hi]
        jg  music_sleep_done
        jl  music_sleep_loop
        cmp al, [_ms_dur_lo]
        jl  music_sleep_loop

    music_sleep_done:
    mov cl, [_ms_dur_lo]
    mov dl, [_ms_dur_hi]
    ret


; ─────────────────────────────────────────────────────
; _rtc_millis_16
; OUTPUT: A = RTC_MILLIS_0 (lo), B = RTC_MILLIS_1 (hi)
; Clobbers: C, D, E
; ─────────────────────────────────────────────────────
_rtc_millis_16:
    mov el, 0x0F        ; RTC_MILLIS_REL_LO
    call _rtc_port
    ldi al, cl, dl

    mov el, 0x10        ; RTC_MILLIS_REL_HI
    call _rtc_port
    ldi bl, cl, dl
    ret


; ─────────────────────────────────────────────────────
; music_play_note
; INPUT: A = note MIDI (0=silence), C:D = durée ms
; ─────────────────────────────────────────────────────
music_play_note:
    cmp al, 0
    jz music_play_rest

    ; Écrire LENGTH_LO/HI avant le GATE
    push al
    push cl
    push dl

    mov al, cl
    mov el, SPEAKER_PORT_LENGTH_LO
    call _speaker_port
    sti cl, dl, al

    pop al
    push al
    mov el, SPEAKER_PORT_LENGTH_HI
    call _speaker_port
    sti cl, dl, al

    pop dl
    pop cl
    pop al

    ; Écrire la note
    push cl
    push dl
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al
    pop dl
    pop cl

    ; GATE ON
    push cl
    push dl
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al
    pop dl
    pop cl

    ; Attendre via RTC
    call music_sleep_ms
    ret


; ─────────────────────────────────────────────────────
; music_play_rest
; INPUT: C:D = durée ms
; ─────────────────────────────────────────────────────
music_play_rest:
    call music_sleep_ms
    ret
