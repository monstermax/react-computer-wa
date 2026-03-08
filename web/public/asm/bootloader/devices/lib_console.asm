; Author: yomax
; Date: 2026-02
; Name: lib_console
; Description: Lib console for bootloader_v2


.include "bootloader/lib_devices.asm"
.include "bootloader/lib_math.asm"


section .data
    str_console         db "console", 0 ; libellé du device
    console_device_idx  db 0x00    ; must be followed by console_io_base. will be auto filled
    console_io_base     dw 0x0000  ; must be placed just after console_device_idx. will be auto filled



section .text
    global init_console_device
    global console_print_char
    global console_print_string


; print a CHAR on CONSOLE (INPUT => A = ASCII CHAR)
console_print_char:
    mov el, [console_io_base]     ; low  byte de l'adresse de la variable console_io_base
    mov fl, [console_io_base + 1] ; high byte de l'adresse de la variable console_io_base
    sti el, fl, al ; [e:f] = A
    ret


; print a STRING on CONSOLE (INPUT => (C:D) = string buffer address)
console_print_string:
    CONSOLE_PRINT_STRING_LOOP:
    ; Lire caractère depuis buffer
    ldi al, cl, dl ; A = [C:D]

    ; Vérifier si \0 (fin de string)
    cmp al, 0x00                   ; A = 0
    jz CONSOLE_PRINT_STRING_END    ; Si \0, terminer

    ; Afficher le caractère
    call console_print_char

    ; Incrémenter pointeur C:D
    mov el, 1
    call add_cd_e
    jmp CONSOLE_PRINT_STRING_LOOP

    CONSOLE_PRINT_STRING_END:
    ret


