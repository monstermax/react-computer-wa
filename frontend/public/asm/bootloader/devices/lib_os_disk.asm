; Author: yomax
; Date: 2026-02
; Name: lib_os_disk
; Description: Lib os_disk for bootloader_v2


.include "bootloader/lib_devices.asm"
.include "bootloader/lib_math.asm"


section .data
    os_disk_device_idx  db 0x00
    os_disk_io_base     dw 0x0000

    str_os_disk         db "os_disk", 0 ; libellé du device

