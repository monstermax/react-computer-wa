; Tetris Music A — voix mélodique principale

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 76, 144, 1   ; E5 400ms
        db 71, 200, 0   ; B4 200ms
        db 72, 200, 0   ; C5 200ms
        db 74, 144, 1   ; D5 400ms
        db 72, 200, 0   ; C5 200ms
        db 71, 200, 0   ; B4 200ms
        db 69, 144, 1   ; A4 400ms
        db 69, 200, 0   ; A4 200ms
        db 72, 200, 0   ; C5 200ms
        db 76, 144, 1   ; E5 400ms
        db 74, 200, 0   ; D5 200ms
        db 72, 200, 0   ; C5 200ms
        db 71,  88, 2   ; B4 600ms
        db 72, 200, 0   ; C5 200ms
        db 74, 144, 1   ; D5 400ms
        db 76, 144, 1   ; E5 400ms
        db 72, 144, 1   ; C5 400ms
        db 69, 144, 1   ; A4 400ms
        db 69, 144, 1   ; A4 400ms
        db 0,   88, 2   ; REST 600ms
        db 74, 200, 0   ; D5 200ms
        db 0,  200, 0   ; REST 200ms
        db 77, 200, 0   ; F5 200ms
        db 81, 144, 1   ; A5 400ms
        db 72, 100, 0   ; C5 100ms
        db 72, 100, 0   ; C5 100ms
        db 79, 200, 0   ; G5 200ms
        db 77, 200, 0   ; F5 200ms
        db 76, 200, 0   ; E5 200ms
        db 0,  144, 1   ; REST 400ms
        db 72, 200, 0   ; C5 200ms
        db 76, 144, 1   ; E5 400ms
        db 69, 100, 0   ; A4 100ms
        db 67, 100, 0   ; G4 100ms
        db 74, 200, 0   ; D5 200ms
        db 72, 200, 0   ; C5 200ms
        db 71, 144, 1   ; B4 400ms
        db 71, 200, 0   ; B4 200ms
        db 72, 200, 0   ; C5 200ms
        db 74, 144, 1   ; D5 400ms
        db 76, 144, 1   ; E5 400ms
        db 72, 144, 1   ; C5 400ms
        db 69, 144, 1   ; A4 400ms
        db 69, 144, 1   ; A4 400ms
        db 0,  144, 1   ; REST 400ms
        db 76, 144, 1   ; E5 400ms
        db 71, 200, 0   ; B4 200ms
        db 72, 200, 0   ; C5 200ms
        db 74, 144, 1   ; D5 400ms
        db 72, 200, 0   ; C5 200ms
        db 71, 200, 0   ; B4 200ms
        db 69, 144, 1   ; A4 400ms
        db 69, 200, 0   ; A4 200ms
        db 72, 200, 0   ; C5 200ms
        db 76, 144, 1   ; E5 400ms
        db 74, 200, 0   ; D5 200ms
        db 72, 200, 0   ; C5 200ms
        db 71,  88, 2   ; B4 600ms
        db 72, 200, 0   ; C5 200ms
        db 74, 144, 1   ; D5 400ms
        db 76, 144, 1   ; E5 400ms
        db 72, 144, 1   ; C5 400ms
        db 69, 144, 1   ; A4 400ms
        db 69, 144, 1   ; A4 400ms
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
