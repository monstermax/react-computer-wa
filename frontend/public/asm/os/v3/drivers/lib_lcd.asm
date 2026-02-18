; Author: yomax
; Date: 2026-02
; Name: lib_lcd
; Description: LCD Driver


.include "os/v3/arithmetic/lib_math.asm"


section .data
    lcd_io_base  dw 0xF0F0  ; TODO: reproduire/copier/importer le code du bootloader pour initialiser les devices


section .text
    ;global lcd_clear ; TODO
    global lcd_print_char
    global lcd_print_string


_exit:
    ret




lcd_clear:
    mov cl, [lcd_io_base]
    mov dl, [lcd_io_base + 1]

    call inc_cd
    mov al, 1 ; CMD Clear
    sti cl, dl, al
    call dec_cd
    ret


; Register A = ASCII Char
lcd_print_char:
    mov el, [lcd_io_base]     ; low  byte de l'adresse de la variable lcd_io_base
    mov fl, [lcd_io_base + 1] ; high byte de l'adresse de la variable lcd_io_base
    sti el, fl, al ; [e:f] = A
    ret



lcd_print_string:
    LCD_PRINT_STRING_LOOP:
    ; Lire caractère depuis buffer
    ldi al, cl, dl ; A = [C:D]

    ; Vérifier si \0 (fin de string)
    cmp al, 0x00                   ; A = 0
    jz LCD_PRINT_STRING_END    ; Si \0, terminer

    ; Afficher le caractère
    call lcd_print_char

    ; Incrémenter pointeur C:D
    mov el, 1
    call add_cd_e
    jmp LCD_PRINT_STRING_LOOP

    LCD_PRINT_STRING_END:

    ret



; Affiche une string depuis un buffer mémoire (string max length = 256)
; Input: C:D = adresse du buffer, B = taille
lcd_print_sized_string:
    DEQUEUE:
    ; Lire caractère depuis buffer
    ldi al, cl, dl ; A = [C:D]

    call lcd_print_char

    ; Incrémenter pointeur C:D
    inc cl
    jnc NO_CARRY_PRINT
    inc dl

    NO_CARRY_PRINT:
    ; Décrémenter compteur
    dec bl
    jnz DEQUEUE

    LCD_PRINT_SIZED_STRING_END:
    ret
