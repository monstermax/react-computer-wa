; Author: yomax
; Date: 2026-02
; Name: lib_dma
; Description: Lib dma for bootloader_v2


.include "bootloader/lib_devices.asm"
.include "bootloader/lib_math.asm"


section .data
    dma_device_idx  db 0x00
    dma_io_base     dw 0x0000

    str_dma          db "dma", 0 ; libellé du device

