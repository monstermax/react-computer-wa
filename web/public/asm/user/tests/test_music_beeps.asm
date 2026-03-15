

%include "os/v3/audio/lib_music.asm"

_start:
    call init_device_speaker
    call init_device_rtc

    ; Bip 1
    mov al, 69      ; A4
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al

    ; Attendre 500ms
    mov cl, 244     ; 500 & 0xFF
    mov dl, 1       ; 500 >> 8
    call music_sleep_ms

    ; GATE OFF
    mov al, 0
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al

    ; Silence 500ms
    mov cl, 244
    mov dl, 1
    call music_sleep_ms

    ; Bip 2
    mov al, 69
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al

    mov cl, 244
    mov dl, 1
    call music_sleep_ms

    mov al, 0
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al

    ret