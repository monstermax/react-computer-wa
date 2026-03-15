; Scumm Bar Theme — Monkey Island

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 67, 100, 0   ; G4
        db 0,  200, 0   ; REST
        db 67, 200, 0   ; G4
        db 69, 200, 0   ; A4
        db 70, 200, 0   ; A#4
        db 0,  100, 0   ; REST
        db 69, 200, 0   ; A4
        db 67, 200, 0   ; G4
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 72, 144, 1   ; C5 400ms
        db 70, 200, 0   ; A#4
        db 69, 200, 0   ; A4
        db 67, 100, 0   ; G4
        db 0,  200, 0   ; REST
        db 67, 200, 0   ; G4
        db 69, 200, 0   ; A4
        db 70, 100, 0   ; A#4
        db 0,  200, 0   ; REST
        db 69, 200, 0   ; A4
        db 67, 100, 0   ; G4
        db 74, 100, 0   ; D5
        db 0,  200, 0   ; REST
        db 74, 100, 0   ; D5
        db 0,  200, 0   ; REST
        db 74,  64, 6   ; D5 1600ms
        db 0,   44, 1   ; REST 300ms
        db 74, 100, 0   ; D5
        db 0,  200, 0   ; REST
        db 74, 200, 0   ; D5
        db 75, 200, 0   ; D#5
        db 77, 100, 0   ; F5
        db 0,  200, 0   ; REST
        db 77, 200, 0   ; F5
        db 0,  200, 0   ; REST
        db 74, 100, 0   ; D5
        db 0,  200, 0   ; REST
        db 74, 200, 0   ; D5
        db 75, 200, 0   ; D#5
        db 77, 100, 0   ; F5
        db 0,  200, 0   ; REST
        db 78, 200, 0   ; F#5
        db 0,  200, 0   ; REST
        db 79,  44, 1   ; G5 300ms
        db 0,  100, 0   ; REST
        db 74, 200, 0   ; D5
        db 0,  200, 0   ; REST
        db 75,  44, 1   ; D#5 300ms
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 74,  44, 1   ; D5 300ms
        db 72, 200, 0   ; C5
        db 70, 100, 0   ; A#4
        db 72,  44, 1   ; C5 300ms
        db 70, 200, 0   ; A#4
        db 69, 200, 0   ; A4
        db 67, 144, 1   ; G4 400ms
        db 0,  100, 0   ; REST
        db 69, 200, 0   ; A4
        db 70, 244, 1   ; A#4 500ms
        db 0,  100, 0   ; REST
        db 72, 200, 0   ; C5
        db 74, 200, 0   ; D5
        db 75, 200, 0   ; D#5
        db 74, 100, 0   ; D5
        db 72, 200, 0   ; C5
        db 70, 200, 0   ; A#4
        db 0,  100, 0   ; REST
        db 67, 200, 0   ; G4
        db 0,  200, 0   ; REST
        db 79, 144, 1   ; G5 400ms
        db 0, 0, 0


section .text
    global _start

_start:
    call init_device_interrupt
    call init_device_timer0
    call init_device_speaker
    call init_device_keyboard

    mov al, 100 ; delay millisecond = 1 / clockFreq => 100 pour clock à 10 ticks/sec.
    mov bl, 0
    call music_set_tick_ms

    mov al, 0
    call speaker_set_wave
    mov al, 180
    call speaker_set_volume

    lea cl, dl, [melody]
    call play_melody

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
    call stop_melody
    ret
