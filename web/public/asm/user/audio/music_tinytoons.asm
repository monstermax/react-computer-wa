; Tiny Toon Adventures Theme — thème complet

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 72, 100, 0   ; C5
        db 73, 100, 0   ; C#5
        db 72, 100, 0   ; C5
        db 73, 100, 0   ; C#5
        db 74, 100, 0   ; D5
        db 75, 100, 0   ; D#5
        db 74, 100, 0   ; D5
        db 75, 100, 0   ; D#5
        db 76, 100, 0   ; E5
        db 77, 100, 0   ; F5
        db 76, 100, 0   ; E5
        db 77, 100, 0   ; F5
        db 78, 100, 0   ; F#5
        db 79, 100, 0   ; G5
        db 78, 100, 0   ; F#5
        db 79, 100, 0   ; G5
        db 80, 100, 0   ; G#5
        db 81, 100, 0   ; A5
        db 80, 100, 0   ; G#5
        db 81, 100, 0   ; A5
        db 82, 100, 0   ; A#5
        db 83, 100, 0   ; B5
        db 84, 100, 0   ; C6
        db 85, 100, 0   ; C#6
        db 86, 200, 0   ; D6
        db 0,  144, 1   ; REST 400ms
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 200, 0   ; D5
        db 78, 200, 0   ; F#5
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 81, 200, 0   ; A5
        db 80, 200, 0   ; G#5
        db 81, 200, 0   ; A5
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 0,  144, 1   ; REST 400ms
        db 78, 200, 0   ; F#5
        db 75, 200, 0   ; D#5
        db 78, 144, 1   ; F#5 400ms
        db 78, 200, 0   ; F#5
        db 80, 200, 0   ; G#5
        db 78, 144, 1   ; F#5 400ms
        db 78, 200, 0   ; F#5
        db 75, 200, 0   ; D#5
        db 78, 200, 0   ; F#5
        db 82, 200, 0   ; A#5
        db 78, 200, 0   ; F#5
        db 80, 200, 0   ; G#5
        db 78, 144, 1   ; F#5 400ms
        db 78, 200, 0   ; F#5
        db 75, 200, 0   ; D#5
        db 78, 200, 0   ; F#5
        db 78,  44, 1   ; F#5 300ms
        db 78, 100, 0   ; F#5
        db 73, 200, 0   ; C#5
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 84, 200, 0   ; C6
        db 85, 200, 0   ; C#6
        db 0,  200, 0   ; REST
        db 82, 144, 1   ; A#5 400ms
        db 87, 144, 1   ; D#6 400ms
        db 87,  44, 1   ; D#6 300ms
        db 82, 100, 0   ; A#5
        db 84, 200, 0   ; C6
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 80, 200, 0   ; G#5
        db 79, 200, 0   ; G5
        db 82, 200, 0   ; A#5
        db 77, 200, 0   ; F5
        db 79, 200, 0   ; G5
        db 75,  88, 2   ; D#5 600ms
        db 75, 200, 0   ; D#5
        db 77,  44, 1   ; F5 300ms
        db 79, 100, 0   ; G5
        db 80, 200, 0   ; G#5
        db 77, 200, 0   ; F5
        db 79, 200, 0   ; G5
        db 80, 200, 0   ; G#5
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 81, 200, 0   ; A5
        db 83, 200, 0   ; B5
        db 85, 200, 0   ; C#6
        db 81, 200, 0   ; A5
        db 86, 200, 0   ; D6
        db 0,  144, 1   ; REST 400ms
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 79, 200, 0   ; G5
        db 83, 200, 0   ; B5
        db 79, 200, 0   ; G5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 83,  44, 1   ; B5 300ms
        db 82, 100, 0   ; A#5
        db 83, 200, 0   ; B5
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 78, 200, 0   ; F#5
        db 79, 200, 0   ; G5
        db 81, 200, 0   ; A5
        db 82, 200, 0   ; A#5
        db 0,  200, 0   ; REST
        db 81, 200, 0   ; A5
        db 0,  200, 0   ; REST
        db 79, 144, 1   ; G5 400ms
        db 0,  200, 0   ; REST
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 200, 0   ; D5
        db 78, 200, 0   ; F#5
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 81, 200, 0   ; A5
        db 80, 200, 0   ; G#5
        db 81, 200, 0   ; A5
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 0,  144, 1   ; REST 400ms
        db 78, 200, 0   ; F#5
        db 75, 200, 0   ; D#5
        db 78, 144, 1   ; F#5 400ms
        db 78, 200, 0   ; F#5
        db 80, 200, 0   ; G#5
        db 78,  88, 2   ; F#5 600ms
        db 75, 200, 0   ; D#5
        db 78, 200, 0   ; F#5
        db 82, 200, 0   ; A#5
        db 78, 200, 0   ; F#5
        db 80, 200, 0   ; G#5
        db 78,  88, 2   ; F#5 600ms
        db 75, 200, 0   ; D#5
        db 78, 144, 1   ; F#5 400ms
        db 78, 200, 0   ; F#5
        db 73, 200, 0   ; C#5
        db 82, 144, 1   ; A#5 400ms
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 82, 200, 0   ; A#5
        db 83, 200, 0   ; B5
        db 84, 200, 0   ; C6
        db 85, 200, 0   ; C#6
        db 0,  200, 0   ; REST
        db 82, 144, 1   ; A#5 400ms
        db 87,  44, 1   ; D#6 300ms
        db 87, 100, 0   ; D#6
        db 87, 200, 0   ; D#6
        db 82, 200, 0   ; A#5
        db 84, 200, 0   ; C6
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 80, 200, 0   ; G#5
        db 79, 200, 0   ; G5
        db 82, 200, 0   ; A#5
        db 77, 200, 0   ; F5
        db 79, 200, 0   ; G5
        db 75,  88, 2   ; D#5 600ms
        db 75, 200, 0   ; D#5
        db 77,  44, 1   ; F5 300ms
        db 79, 100, 0   ; G5
        db 80, 200, 0   ; G#5
        db 77, 200, 0   ; F5
        db 79, 200, 0   ; G5
        db 80, 200, 0   ; G#5
        db 82, 200, 0   ; A#5
        db 82, 200, 0   ; A#5
        db 81, 200, 0   ; A5
        db 83, 200, 0   ; B5
        db 85, 200, 0   ; C#6
        db 81, 200, 0   ; A5
        db 86, 200, 0   ; D6
        db 0,  144, 1   ; REST 400ms
        db 74, 200, 0   ; D5
        db 71, 200, 0   ; B4
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 79, 200, 0   ; G5
        db 83, 200, 0   ; B5
        db 79, 200, 0   ; G5
        db 76, 200, 0   ; E5
        db 74, 144, 1   ; D5 400ms
        db 74, 200, 0   ; D5
        db 83,  44, 1   ; B5 300ms
        db 82, 100, 0   ; A#5
        db 83, 200, 0   ; B5
        db 74, 200, 0   ; D5
        db 76, 200, 0   ; E5
        db 78, 200, 0   ; F#5
        db 79, 200, 0   ; G5
        db 81, 200, 0   ; A5
        db 82, 200, 0   ; A#5
        db 0,  200, 0   ; REST
        db 81, 200, 0   ; A5
        db 0,  200, 0   ; REST
        db 79, 144, 1   ; G5 400ms
        db 79,  44, 1   ; G5 300ms
        db 74, 100, 0   ; D5
        db 76, 200, 0   ; E5
        db 74, 200, 0   ; D5
        db 74, 200, 0   ; D5
        db 72, 200, 0   ; C5
        db 71, 200, 0   ; B4
        db 74, 200, 0   ; D5
        db 69, 200, 0   ; A4
        db 74, 200, 0   ; D5
        db 67, 144, 1   ; G4 400ms
        db 79, 200, 0   ; G5
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
