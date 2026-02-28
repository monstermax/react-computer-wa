; Author: Bob + yomax
; Name: bootloader_v3
; Description: Bootloader v3


; 1. Attend que le deivce "os_disk" soit présent et contienne une valeur différente de 0x00 dans son 1er byte de stockage.
; 2. Charge le contenu du disque "os_disk" dans la RAM à l'adresse 0x1000
; 3. Jump à l'adresse 0x1000 pour déléguer la suite de l'execution à l'OS


.org 0x0000

.include "bootloader/lib_math.asm"
.include "bootloader/init_devices.asm"


section .data
    BOOTLOADER_VERSION   equ 4
    STACK_END            equ 0xEFFF
    OS_START             equ 0x1000

    ASCII_LF             equ 0x0D

    STR_BOOT             db "BOOTLOADER V4", 13, 0
    STR_WAITING          db "WAITING FOR os_disk...", 13, 0
    STR_FOUND            db "os_disk FOUND", 13, 0
    STR_LOADING          db "LOADING STAGE1 TO 0x1000", 13, 0
    STR_JUMP             db "JUMP 0x1000", 13, 0


section .text
    global _start


_start:
    mov dl, BOOTLOADER_VERSION
    mov esp, STACK_END

    ; discover devices (fills os_disk_device_idx/os_disk_io_base, console, leds, dma...)
    call init_devices

    ; feedback
    lea cl, dl, [STR_BOOT]
    call console_print_string

    lea cl, dl, [STR_WAITING]
    call console_print_string

    call wait_for_os_disk

    lea cl, dl, [STR_FOUND]
    call console_print_string

    lea cl, dl, [STR_LOADING]
    call console_print_string

    ; load raw stage1 from os_disk to RAM @ 0x1000 (same robust path as v2)
    call load_os_in_ram

    lea cl, dl, [STR_JUMP]
    call console_print_string

    mov esp, STACK_END
    jmp OS_START


; -----------------------------------------------------------------------------
; wait_for_os_disk
; - no hardcoded io base, uses os_disk_io_base discovered by init_device
; -----------------------------------------------------------------------------
wait_for_os_disk:
.wait_loop:
    mov cl, [os_disk_io_base]
    mov dl, [os_disk_io_base + 1]

    ; if base is 0x0000 => not discovered yet
    cmp cl, 0
    jne .check_marker
    cmp dl, 0
    jne .check_marker
    jmp .wait_loop

.check_marker:
    ; configure disk address = 0x0000 (ports +3/+4)
    mov el, 3
    call add_cd_e
    sti cl, dl, 0

    call inc_cd
    sti cl, dl, 0

    ; back to DATA port and read first byte
    mov el, 4
    call sub_cd_e
    ldi al, cl, dl
    cmp al, 0
    je .wait_loop

    ret


; -----------------------------------------------------------------------------
; load_os_in_ram
; - identical strategy to bootloader_v2 (DMA copy full os_disk content)
; - source disk device discovered dynamically via init_device
; -----------------------------------------------------------------------------
load_os_in_ram:
    ; if already loaded, skip
    mov bl, [OS_START]
    cmp bl, 0
    jnz .loaded

    ; setup dma source disk index
    mov al, [os_disk_device_idx]
    mov cl, [dma_io_base]
    mov dl, [dma_io_base + 1]
    sti cl, dl, al

    ; DMA_ADDR_START = 0x0000
    call inc_cd
    sti cl, dl, 0
    call inc_cd
    sti cl, dl, 0

    ; read disk size from os_disk ports +1/+2 -> A:B
    mov cl, [os_disk_io_base]
    mov dl, [os_disk_io_base + 1]

    call inc_cd
    ldi al, cl, dl
    call inc_cd
    ldi bl, cl, dl

    ; end = size - 1
    dec al
    jnc .no_carry
    dec bl
.no_carry:

    ; set DMA_ADDR_END = A:B (ports +3/+4 from dma base)
    mov cl, [dma_io_base]
    mov dl, [dma_io_base + 1]

    mov el, 3
    call add_cd_e
    sti cl, dl, al

    call inc_cd
    sti cl, dl, bl

    ; set DMA_TARGET_ADDR = OS_START (ports +5/+6)
    lea al, bl, OS_START
    call inc_cd
    sti cl, dl, al

    call inc_cd
    sti cl, dl, bl

    ; trigger DMA copy (port +7)
    call inc_cd
    sti cl, dl, 1

    ; safety check
    mov bl, [OS_START]
    cmp bl, 0
    jnz .loaded

    hlt

.loaded:
    ret
