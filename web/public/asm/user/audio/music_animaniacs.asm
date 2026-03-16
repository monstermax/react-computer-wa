; Animaniacs Main Theme — Richard Stone

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"
%include "os/v3/drivers/lib_console.asm"

KEY_ESC equ 0x1B

section .data
    STR_PRESS_ESCAPE db "Press ESCAPE to stop", 13, 0

    melody:
        db 75,  44, 1   ; D#5 300ms
        db 74,  44, 1   ; D5 300ms
        db 75,  44, 1   ; D#5 300ms
        db 77, 244, 1   ; F5 500ms
        db 75, 100, 0   ; D#5 100ms
        db 74, 244, 1   ; D5 500ms
        db 75, 100, 0   ; D#5 100ms
        db 72,  44, 1   ; C5 300ms
        db 0,  188, 2   ; REST 700ms
        db 74, 100, 0   ; D5 100ms
        db 75, 100, 0   ; D#5 100ms
        db 77, 244, 1   ; F5 500ms
        db 75, 100, 0   ; D#5 100ms
        db 74, 244, 1   ; D5 500ms
        db 75, 100, 0   ; D#5 100ms
        db 70,  44, 1   ; A#4 300ms
        db 0,  188, 2   ; REST 700ms
        db 72, 100, 0   ; C5 100ms
        db 70, 100, 0   ; A#4 100ms
        db 68, 100, 0   ; G#4 100ms
        db 68, 100, 0   ; G#4 100ms
        db 0,  100, 0   ; REST 100ms
        db 72, 100, 0   ; C5 100ms
        db 75, 100, 0   ; D#5 100ms
        db 80,  44, 1   ; G#5 300ms
        db 0,  200, 0   ; REST 200ms
        db 80, 100, 0   ; G#5 100ms
        db 82, 200, 0   ; A#5 200ms
        db 80, 100, 0   ; G#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 80, 100, 0   ; G#5 100ms
        db 77,  44, 1   ; F5 300ms
        db 0,  200, 0   ; REST 200ms
        db 77, 100, 0   ; F5 100ms
        db 75,  44, 1   ; D#5 300ms
        db 84,  44, 1   ; C6 300ms
        db 82, 244, 1   ; A#5 500ms
        db 0,  100, 0   ; REST 100ms
        db 80, 100, 0   ; G#5 100ms
        db 80,  44, 1   ; G#5 300ms
        db 0,   32, 3   ; REST 800ms
        db 79,  44, 1   ; G5 300ms
        db 81, 100, 0   ; A5 100ms
        db 79, 100, 0   ; G5 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 76, 100, 0   ; E5 100ms
        db 79, 100, 0   ; G5 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 81, 100, 0   ; A5 100ms
        db 79, 100, 0   ; G5 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 74,  44, 1   ; D5 300ms
        db 81, 100, 0   ; A5 100ms
        db 79, 100, 0   ; G5 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 79, 100, 0   ; G5 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 81, 100, 0   ; A5 100ms
        db 79, 100, 0   ; G5 100ms
        db 0,  100, 0   ; REST 100ms
        db 78, 100, 0   ; F#5 100ms
        db 79, 100, 0   ; G5 100ms
        db 76,  44, 1   ; E5 300ms
        db 0,  200, 0   ; REST 200ms
        db 74, 100, 0   ; D5 100ms
        db 72, 100, 0   ; C5 100ms
        db 72, 100, 0   ; C5 100ms
        db 76, 100, 0   ; E5 100ms
        db 79, 100, 0   ; G5 100ms
        db 84, 100, 0   ; C6 100ms
        db 84, 100, 0   ; C6 100ms
        db 0,  200, 0   ; REST 200ms
        db 84, 100, 0   ; C6 100ms
        db 86, 100, 0   ; D6 100ms
        db 84, 100, 0   ; C6 100ms
        db 0,  100, 0   ; REST 100ms
        db 83, 100, 0   ; B5 100ms
        db 84, 100, 0   ; C6 100ms
        db 81,  44, 1   ; A5 300ms
        db 81, 100, 0   ; A5 100ms
        db 0, 0, 0      ; FIN → boucle


section .text
    global _start

_start:
    call init_device_interrupt
    call init_device_timer0
    call init_device_speaker
    call init_device_keyboard
    call init_device_console

    mov al, 0
    call speaker_set_wave
    mov al, 180
    call speaker_set_volume

    lea cl, dl, [melody]
    call play_melody

    lea cl, dl, [STR_PRESS_ESCAPE]
    call console_print_string


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
