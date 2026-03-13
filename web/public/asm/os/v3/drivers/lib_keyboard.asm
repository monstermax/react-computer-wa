; Author: yomax
; Date: 2026-01
; Name: lib_keyboard
; Description: Keyboard Driver


%include "os/v3/drivers/lib_devices.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
    str_keyboard         db "keyboard", 0
    keyboard_device_idx  db 0x00   ; must be followed by keyboard_io_base. will be auto filled
    keyboard_io_base     dw 0x0000 ; 0xF000 ; must be placed just after keyboard_device_idx. will be auto filled


section .text
    global init_device_keyboard
    global get_keyboard_status
    global get_keyboard_char
    global set_keyboard_status


ret ; this is a lib. no default entrypoint defined


init_device_keyboard:
    push al
    push bl
    push cl
    push dl

    ; initialise le device keyboard
    lea al, bl, [str_keyboard]
    lea cl, dl, [keyboard_device_idx]
    call init_device ; set and store keyboard_device_idx value

    pop dl
    pop cl
    pop bl
    pop al
    ret



; lit le statut du clavier (SORTIE : A = boolean)
get_keyboard_status:
    push cl
    push dl

    mov cl, [keyboard_io_base]     ; low  byte de l'adresse de la variable keyboard_io_base
    mov dl, [keyboard_io_base + 1] ; high byte de l'adresse de la variable keyboard_io_base
    call inc_cd ; incremente (C:D) pour atteindre KEYBOARD_STATUS

    ; Lecture du statut clavier (est-ce qu'une touche a été pressée ? oui/non)
    ldi al, cl, dl ; A = [C:D]

    pop dl
    pop cl
    ret


; Lecture du caractere clavier (SORTIE : A = char)
get_keyboard_char:
    push cl
    push dl

    mov cl, [keyboard_io_base]     ; low  byte de l'adresse de la variable keyboard_io_base
    mov dl, [keyboard_io_base + 1] ; high byte de l'adresse de la variable keyboard_io_base
    ldi al, cl, dl ; A = [C:D]

    pop dl
    pop cl
    ret


; Confirme la lecture du clavier
set_keyboard_status:
    push cl
    push dl

    mov cl, [keyboard_io_base]     ; low  byte de l'adresse de la variable keyboard_io_base
    mov dl, [keyboard_io_base + 1] ; high byte de l'adresse de la variable keyboard_io_base
    call inc_cd     ; incremente (C:D) pour atteindre KEYBOARD_STATUS
    sti cl, dl, 0   ; confirme la lecture du clavier

    pop dl
    pop cl
    ret

