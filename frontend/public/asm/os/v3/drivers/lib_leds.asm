; Author: yomax
; Date: 2026-02
; Name: lib_leds
; Description: LEDs Display Driver


.include "os/v3/drivers/lib_devices.asm"


section .data
    str_leds         db "leds", 0
    leds_device_idx  db 0x00   ; must be followed by leds_io_base. will be auto filled
    leds_io_base     dw 0x0000 ; 0xF020 ; must be placed just after leds_device_idx. will be auto filled

    LEDS_STATE_ALL_OFF  equ 0x00
    LEDS_STATE_ALL_ON   equ 0xFF


section .text
    global init_device_leds
    global leds_get_value
    global leds_set_value
    global leds_set_all
    global leds_set_none


_exit:
    ret


init_device_leds:
    ; initialise le device leds
    lea al, bl, [str_leds]
    lea cl, dl, [leds_device_idx]
    call init_device ; set and store leds_device_idx value
    ret




; Retourne la valeur des LEDS dans A
leds_get_value:
    mov cl, [leds_io_base]
    mov dl, [leds_io_base+1]
    ldi al, cl, dl
    ret


; Set LEDs value => INPUT : A = LEDs value
leds_set_value:
    mov cl, [leds_io_base]
    mov dl, [leds_io_base+1]
    sti cl, dl, al

    ret


; Switch on all LEDs (no required input)
leds_set_all:
    mov al, LEDS_STATE_ALL_ON
    call leds_set_value
    ret


; Switch off all LEDs (no required input)
leds_set_none:
    mov al, LEDS_STATE_ALL_OFF
    call leds_set_value
    ret

