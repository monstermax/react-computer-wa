; Monkey Island Theme — thème complet (88 notes)

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 76, 200, 0   ; E5
        db 0,  100, 0   ; REST
        db 76, 200, 0   ; E5
        db 79, 200, 0   ; G5
        db 78, 200, 0   ; F#5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 0,  100, 0   ; REST
        db 76,  88, 2   ; E5 600ms
        db 0,  144, 1   ; REST 400ms
        db 74, 200, 0   ; D5
        db 0,  200, 0   ; REST
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 71, 200, 0   ; B4
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 0,  100, 0   ; REST
        db 72, 200, 0   ; C5
        db 0,  100, 0   ; REST
        db 71,  88, 2   ; B4 600ms
        db 0,  144, 1   ; REST 400ms
        db 76, 200, 0   ; E5
        db 0,  200, 0   ; REST
        db 76, 144, 1   ; E5 400ms
        db 0,  100, 0   ; REST
        db 79, 200, 0   ; G5
        db 78, 200, 0   ; F#5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 0,  200, 0   ; REST
        db 76, 232, 3   ; E5 1000ms
        db 0,  200, 0   ; REST
        db 78, 200, 0   ; F#5
        db 79, 100, 0   ; G5
        db 0,  200, 0   ; REST
        db 79, 200, 0   ; G5
        db 0,  200, 0   ; REST
        db 81, 144, 1   ; A5 400ms
        db 0,   44, 1   ; REST 300ms
        db 78, 144, 1   ; F#5 400ms
        db 0,  100, 0   ; REST
        db 79, 200, 0   ; G5
        db 78, 200, 0   ; F#5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 78, 200, 0   ; F#5
        db 79, 200, 0   ; G5
        db 0,  100, 0   ; REST
        db 79, 200, 0   ; G5
        db 0,  200, 0   ; REST
        db 78,  88, 2   ; F#5 600ms
        db 0,  100, 0   ; REST
        db 76, 144, 1   ; E5 400ms
        db 0,  100, 0   ; REST
        db 79, 200, 0   ; G5
        db 78, 200, 0   ; F#5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 78, 200, 0   ; F#5
        db 79, 200, 0   ; G5
        db 0,  200, 0   ; REST
        db 79, 200, 0   ; G5
        db 0,  200, 0   ; REST
        db 78, 244, 1   ; F#5 500ms
        db 0,  200, 0   ; REST
        db 76, 144, 1   ; E5 400ms
        db 0,  100, 0   ; REST
        db 79, 200, 0   ; G5
        db 78, 200, 0   ; F#5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 76, 200, 0   ; E5
        db 0,  100, 0   ; REST
        db 76, 200, 0   ; E5
        db 0,  100, 0   ; REST
        db 76, 188, 2   ; E5 700ms
        db 0,   44, 1   ; REST 300ms
        db 76,  44, 1   ; E5 300ms
        db 0,  100, 0   ; REST
        db 74, 100, 0   ; D5
        db 0,  100, 0   ; REST
        db 72, 100, 0   ; C5
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 74, 100, 0   ; D5
        db 0,  100, 0   ; REST
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 71, 144, 1   ; B4 400ms
        db 0, 0, 0      ; FIN → boucle


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
