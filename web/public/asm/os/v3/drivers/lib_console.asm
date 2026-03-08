; Author: yomax
; Date: 2026-02
; Name: lib_console
; Description: Console Driver


.include "os/v3/drivers/lib_devices.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data
    str_console         db "console", 0
    console_device_idx  db 0x00   ; must be followed by console_io_base. will be auto filled
    console_io_base     dw 0x0000 ; 0xF010 ; must be placed just after console_device_idx. will be auto filled


section .text
    global init_device_console
    global console_print_char
    global console_clear
    global console_print_string
    global console_print_sized_string


ret ; this is a lib. no default entrypoint defined


init_device_console:
    ; initialise le device console
    lea al, bl, [str_console]
    lea cl, dl, [console_device_idx]
    call init_device ; set and store console_device_idx value
    ret



console_clear:
    mov al, 0x01
    ; mov [CONSOLE_CLEAR], al

    mov el, [console_io_base]     ; low  byte de l'adresse de la variable console_io_base
    mov fl, [console_io_base + 1] ; high byte de l'adresse de la variable console_io_base

    ; incremente (E:F) pour acceder à CONSOLE_CLEAR
    inc el
    jnc CONSOLE_CLEAR_AFTER_CARRY
    inc fl
    CONSOLE_CLEAR_AFTER_CARRY:

    sti el, fl, al ; [e:f] = A
    ret


; Register A = ASCII Char
console_print_char:
    mov el, [console_io_base]     ; low  byte de l'adresse de la variable console_io_base
    mov fl, [console_io_base + 1] ; high byte de l'adresse de la variable console_io_base
    sti el, fl, al ; [e:f] = A
    ret



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


; Affiche une string depuis un buffer mémoire (string max length = 256)
; Input: C:D = adresse du buffer, B = taille
console_print_sized_string:
    DEQUEUE:
    ; Lire caractère depuis buffer
    ldi al, cl, dl ; A = [C:D]

    call console_print_char

    ; Incrémenter pointeur C:D
    inc cl
    jnc NO_CARRY_PRINT
    inc dl

    NO_CARRY_PRINT:
    ; Décrémenter compteur
    dec bl
    jnz DEQUEUE

    CONSOLE_PRINT_SIZED_STRING_END:
    ret
