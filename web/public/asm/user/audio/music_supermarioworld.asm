; Super Mario World — Overworld Theme

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 69, 244, 1   ; A4 500ms
        db 65,  44, 1   ; F4 300ms
        db 60, 100, 0   ; C4
        db 62, 100, 0   ; D4
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 244, 1   ; F4 500ms
        db 62, 100, 0   ; D4
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 72, 200, 0   ; C5
        db 69,  44, 1   ; A4 300ms
        db 67, 244, 1   ; G4 500ms
        db 60, 100, 0   ; C4
        db 69, 244, 1   ; A4 500ms
        db 65,  44, 1   ; F4 300ms
        db 60, 100, 0   ; C4
        db 62, 100, 0   ; D4
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 244, 1   ; F4 500ms
        db 62, 100, 0   ; D4
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 70, 100, 0   ; A#4
        db 69, 100, 0   ; A4
        db 67, 100, 0   ; G4
        db 65, 132, 3   ; F4 900ms
        db 0,  100, 0   ; REST
        db 69, 244, 1   ; A4 500ms
        db 65,  44, 1   ; F4 300ms
        db 60, 100, 0   ; C4
        db 62, 100, 0   ; D4
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 244, 1   ; F4 500ms
        db 62, 100, 0   ; D4
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 72, 200, 0   ; C5
        db 69,  44, 1   ; A4 300ms
        db 67, 244, 1   ; G4 500ms
        db 60, 100, 0   ; C4
        db 69, 244, 1   ; A4 500ms
        db 65,  44, 1   ; F4 300ms
        db 60, 100, 0   ; C4
        db 62, 100, 0   ; D4
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 244, 1   ; F4 500ms
        db 62, 100, 0   ; D4
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 70, 100, 0   ; A#4
        db 69, 100, 0   ; A4
        db 67, 100, 0   ; G4
        db 65, 132, 3   ; F4 900ms
        db 0,  100, 0   ; REST
        db 69,  44, 1   ; A4 300ms
        db 65,  44, 1   ; F4 300ms
        db 60, 200, 0   ; C4
        db 69,  44, 1   ; A4 300ms
        db 65,  88, 2   ; F4 600ms
        db 68, 100, 0   ; G#4
        db 65, 100, 0   ; F4
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 68,  44, 1   ; G#4 300ms
        db 67, 232, 3   ; G4 1000ms
        db 69,  44, 1   ; A4 300ms
        db 65,  44, 1   ; F4 300ms
        db 60, 200, 0   ; C4
        db 69,  44, 1   ; A4 300ms
        db 65,  88, 2   ; F4 600ms
        db 68, 100, 0   ; G#4
        db 65, 100, 0   ; F4
        db 60, 200, 0   ; C4
        db 72, 120, 5   ; C5 1400ms
        db 69, 244, 1   ; A4 500ms
        db 65,  44, 1   ; F4 300ms
        db 60, 100, 0   ; C4
        db 62, 100, 0   ; D4
        db 65, 100, 0   ; F4
        db 0,  100, 0   ; REST
        db 65, 244, 1   ; F4 500ms
        db 67, 100, 0   ; G4
        db 69, 100, 0   ; A4
        db 65, 100, 0   ; F4
        db 60, 200, 0   ; C4
        db 62,  44, 1   ; D4 300ms
        db 65, 132, 3   ; F4 900ms
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
