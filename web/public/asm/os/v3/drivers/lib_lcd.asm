; Author: yomax
; Date: 2026-02
; Name: lib_lcd
; Description: LCD Driver


.include "os/v3/drivers/lib_devices.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data
    str_lcd         db "lcd", 0
    lcd_device_idx  db 0x00   ; must be followed by lcd_io_base. will be auto filled
    lcd_io_base     dw 0x0000 ; 0xF0F0 ; must be placed just after lcd_device_idx. will be auto filled


section .text
    global init_device_lcd
    global lcd_clear
    global lcd_print_char
    global lcd_print_string


ret ; this is a lib. no default entrypoint defined


init_device_lcd:
    ; initialise le device lcd
    lea al, bl, [str_lcd]
    lea cl, dl, [lcd_device_idx]

    debug 1, al
    debug 1, bl
    debug 1, cl
    debug 1, dl

    call init_device ; set and store lcd_device_idx value followed by lcd_io_base value

    debug 2, [lcd_device_idx]
    debug 2, [lcd_io_base]
    debug 2, [lcd_io_base + 1]

    ret





lcd_clear:
    debug 3, [lcd_device_idx]
    debug 3, [lcd_io_base]
    debug 3, [lcd_io_base + 1]

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
    lcd_print_sized_string_dequeue:
    ; Lire caractère depuis buffer
    ldi al, cl, dl ; A = [C:D]

    call lcd_print_char

    ; Incrémenter pointeur C:D
    inc cl
    jnc lcd_print_sized_string_no_carry_print
    inc dl

    lcd_print_sized_string_no_carry_print:
    ; Décrémenter compteur
    dec bl
    jnz lcd_print_sized_string_dequeue

    LCD_PRINT_SIZED_STRING_END:
    ret
