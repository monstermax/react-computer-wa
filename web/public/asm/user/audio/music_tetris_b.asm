; Tetris Music B — voix mélodique principale

%include "os/v3/audio/lib_music.asm"
%include "os/v3/drivers/lib_keyboard.asm"

KEY_ESC equ 0x1B

section .data
    melody:
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 75, 100, 0   ; D#5
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 71, 100, 0   ; B4
        db 72, 100, 0   ; C5
        db 0,  100, 0   ; REST
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 67, 100, 0   ; G4
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 64, 100, 0   ; E4
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 63, 100, 0   ; D#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 59, 100, 0   ; B3
        db 59, 100, 0   ; B3
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 63, 100, 0   ; D#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 59, 100, 0   ; B3
        db 59, 100, 0   ; B3
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 75, 100, 0   ; D#5
        db 0,  100, 0   ; REST
        db 76, 100, 0   ; E5
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 71, 100, 0   ; B4
        db 72, 100, 0   ; C5
        db 0,  100, 0   ; REST
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 67, 100, 0   ; G4
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 64, 100, 0   ; E4
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 63, 100, 0   ; D#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 59, 100, 0   ; B3
        db 59, 100, 0   ; B3
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 63, 100, 0   ; D#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,  100, 0   ; REST
        db 59, 100, 0   ; B3
        db 59, 100, 0   ; B3
        db 60, 100, 0   ; C4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,   76, 4   ; REST 1100ms
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 63, 100, 0   ; D#4
        db 0,  100, 0   ; REST
        db 64, 100, 0   ; E4
        db 0,   76, 4   ; REST 1100ms
        db 66, 100, 0   ; F#4
        db 0,   44, 1   ; REST 300ms
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 67, 100, 0   ; G4
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 67, 100, 0   ; G4
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 66, 100, 0   ; F#4
        db 0,  100, 0   ; REST
        db 67, 100, 0   ; G4
        db 0,   76, 4   ; REST 1100ms
        db 69, 100, 0   ; A4
        db 0,   44, 1   ; REST 300ms
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 71, 100, 0   ; B4
        db 72, 100, 0   ; C5
        db 0,  100, 0   ; REST
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 71, 100, 0   ; B4
        db 72, 100, 0   ; C5
        db 0,  100, 0   ; REST
        db 69, 100, 0   ; A4
        db 0,  100, 0   ; REST
        db 71, 100, 0   ; B4
        db 0,   76, 4   ; REST 1100ms
        db 73, 100, 0   ; C#5
        db 0,   44, 1   ; REST 300ms
        db 74, 100, 0   ; D5
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
