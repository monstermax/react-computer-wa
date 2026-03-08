; Author: yomax
; Date: 2026-02
; Name: init_devices
; Description: initialise les devices. Repere et enregistre l'idx de chaque device à un emplacement memoire, permettant au bootloader de les manipuler facilement.


.include "bootloader/devices/lib_console.asm"
.include "bootloader/devices/lib_leds.asm"


section .data
    str_os_disk         db "os_disk", 0 ; libellé du device
    os_disk_device_idx  db 0x00   ; must be followed by os_disk_io_base. will be auto filled
    os_disk_io_base     dw 0x0000 ; must be placed just after os_disk_device_idx. will be auto filled

    str_dma             db "dma", 0 ; libellé du device
    dma_device_idx      db 0x00   ; must be followed by dma_io_base. will be auto filled
    dma_io_base         dw 0x0000 ; must be placed just after dma_device_idx. will be auto filled



section .text
    global init_devices


init_devices:

    ; initialise le device OS_DISK
    lea al, bl, [str_os_disk]
    lea cl, dl, [os_disk_device_idx]
    call init_device ; set and store os_disk_device_idx value

    ; initialise le device DMA
    lea al, bl, [str_dma]
    lea cl, dl, [dma_device_idx]
    call init_device ; set and store dma_device_idx value

    ; initialise le device Console
    lea al, bl, [str_console]
    lea cl, dl, [console_device_idx]
    call init_device ; set and store console_device_idx value

    ; initialise le device LEDs
    lea al, bl, [str_leds]
    lea cl, dl, [leds_device_idx]
    call init_device ; set and store leds_device_idx value

    ret

