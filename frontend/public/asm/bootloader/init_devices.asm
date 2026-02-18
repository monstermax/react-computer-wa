; Author: yomax
; Date: 2026-02
; Name: init_devices
; Description: initialise les devices. Repere et enregistre l'idx de chaque device à un emplacement memoire, permettant au bootloader de les manipuler facilement.


.include "bootloader/devices/lib_console.asm"
.include "bootloader/devices/lib_dma.asm"
.include "bootloader/devices/lib_leds.asm"
.include "bootloader/devices/lib_os_disk.asm"
.include "bootloader/devices/lib_screen.asm"



section .text
    global init_devices


init_devices:

    ; initialise le device LEDs
    lea al, bl, [str_leds]
    lea cl, dl, [leds_device_idx]
    call init_device

    ; initialise le device OS_DISK
    lea al, bl, [str_os_disk]
    lea cl, dl, [os_disk_device_idx]
    call init_device

    ; initialise le device DMA
    lea al, bl, [str_dma]
    lea cl, dl, [dma_device_idx]
    call init_device

    ; initialise le device Console
    lea al, bl, [str_console]
    lea cl, dl, [console_device_idx]
    call init_device

    ; initialise le device Screen
    lea al, bl, [str_screen]
    lea cl, dl, [screen_device_idx]
    call init_device

    ret

