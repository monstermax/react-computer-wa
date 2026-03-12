

%include "os/v3/drivers/lib_lcd.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
    STR_DEMO db "Hello Assembly", 0


section .text
    global _start


_start:
    call init_device_lcd
    call lcd_clear

    lea cl, dl, [STR_DEMO]
    call lcd_print_string

    ret


