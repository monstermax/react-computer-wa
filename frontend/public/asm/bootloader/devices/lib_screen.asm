; Author: yomax
; Date: 2026-02
; Name: lib_screen
; Description: Lib screen for bootloader_v2


.include "bootloader/lib_devices.asm"
.include "bootloader/lib_math.asm"


section .data
    screen_device_idx  db 0x00
    screen_io_base     dw 0x0000

    str_screen         db "screen", 0 ; libellé du device


