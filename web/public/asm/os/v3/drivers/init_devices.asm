; Author: yomax
; Date: 2026-02
; Name: init_devices
; Description: initialise les devices. Repere et enregistre l'idx de chaque device à un emplacement memoire, permettant au bootloader de les manipuler facilement.


%include "os/v3/drivers/lib_console.asm"
%include "os/v3/drivers/lib_keyboard.asm"
%include "os/v3/drivers/lib_lcd.asm"
%include "os/v3/drivers/lib_leds.asm"
%include "os/v3/drivers/lib_screen.asm"
%include "os/v3/drivers/lib_screen_hd.asm"
%include "os/v3/drivers/lib_switchs.asm"
%include "os/v3/drivers/lib_rtc.asm"
%include "os/v3/drivers/lib_speaker.asm"


section .data
    ;str_screen          db "screen", 0 ; libellé du device
    ;screen_device_idx   db 0x00
    ;screen_io_base      dw 0x0000 ; must be placed just after screen_device_idx. will be auto filled

    str_os_disk         db "os_disk", 0 ; libellé du device
    os_disk_device_idx  db 0x00
    os_disk_io_base     dw 0x0000 ; must be placed just after os_disk_device_idx. will be auto filled

    ;str_dma             db "dma", 0 ; libellé du device
    ;dma_device_idx      db 0x00
    ;dma_io_base         dw 0x0000 ; must be placed just after dma_device_idx. will be auto filled



section .text
    global init_devices


init_devices:
    ; system
    ;init_device_dma
    ;init_device_os_disk

    ; outputs
    call init_device_console ; console
    call init_device_screen ; screen
    call init_device_screenhd ; screenhd
    call init_device_leds ; leds
    call init_device_lcd ; lcd
    call init_device_rtc ; rtc
    call init_device_speaker ; speaker

    ; inputs
    call init_device_keyboard ; keyboard
    call init_device_switchs ; switchs

    ret

