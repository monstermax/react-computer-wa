; Monkey Island Theme

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
        db 0, 0, 0


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
