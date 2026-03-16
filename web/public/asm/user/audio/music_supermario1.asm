; Super Mario Bros 1 — Overworld Theme

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 76, 100, 0   ; E5
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 72, 100, 0   ; C5
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 79, 100, 0   ; G5
        db 0,  232, 3   ; REST 1000ms
        db 72, 100, 0   ; C5
        db 0,   44, 1   ; REST 300ms
        db 67, 100, 0   ; G4
        db 0,   44, 1   ; REST 300ms
        db 64, 100, 0   ; E4
        db 0,   44, 1   ; REST 300ms
        db 69, 100, 0   ; A4
        db 0,  200, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  200, 0   ; REST
        db 70, 100, 0   ; A#4
        db 69, 100, 0   ; A4
        db 0,  200, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 79, 100, 0   ; G5
        db 0,  100, 0   ; REST
        db 81, 100, 0   ; A5
        db 0,  200, 0   ; REST
        db 77, 100, 0   ; F5
        db 79, 100, 0   ; G5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 71, 100, 0   ; B4
        db 0,   44, 1   ; REST 300ms
        db 72, 100, 0   ; C5
        db 0,   44, 1   ; REST 300ms
        db 67, 100, 0   ; G4
        db 0,   44, 1   ; REST 300ms
        db 64, 100, 0   ; E4
        db 0,   44, 1   ; REST 300ms
        db 69, 100, 0   ; A4
        db 0,  200, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  200, 0   ; REST
        db 70, 100, 0   ; A#4
        db 69, 100, 0   ; A4
        db 0,  200, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 79, 100, 0   ; G5
        db 0,  100, 0   ; REST
        db 81, 100, 0   ; A5
        db 0,  200, 0   ; REST
        db 77, 100, 0   ; F5
        db 79, 100, 0   ; G5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 71, 100, 0   ; B4
        db 0,   88, 2   ; REST 600ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 68, 100, 0   ; G#4
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 84, 100, 0   ; C6
        db 0,  200, 0   ; REST
        db 84, 100, 0   ; C6
        db 84, 100, 0   ; C6
        db 0,   32, 3   ; REST 800ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 68, 100, 0   ; G#4
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 75, 100, 0   ; D#5
        db 0,   44, 1   ; REST 300ms
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 72, 100, 0   ; C5
        db 0,   20, 5   ; REST 1300ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 68, 100, 0   ; G#4
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 84, 100, 0   ; C6
        db 0,  200, 0   ; REST
        db 84, 100, 0   ; C6
        db 84, 100, 0   ; C6
        db 0,   32, 3   ; REST 800ms
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 77, 100, 0   ; F5
        db 75, 100, 0   ; D#5
        db 0,  200, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  200, 0   ; REST
        db 68, 100, 0   ; G#4
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 0,  200, 0   ; REST
        db 69, 100, 0   ; A4
        db 72, 100, 0   ; C5
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 75, 100, 0   ; D#5
        db 0,   44, 1   ; REST 300ms
        db 74, 100, 0   ; D5
        db 0,   44, 1   ; REST 300ms
        db 72, 100, 0   ; C5
        db 0,  232, 3   ; REST 1000ms
        db 72, 100, 0   ; C5
        db 72, 100, 0   ; C5
        db 0, 0, 0      ; FIN → boucle


section .text
    global _start

_start:
    call init_device_interrupt
    call init_device_timer0
    call init_device_speaker
    call init_device_keyboard

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
