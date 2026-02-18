

.include "os/v3/arithmetic/lib_math.asm"


section .data
    user_disk_io_base  dw 0xF050  ; TODO: reproduire/copier/importer le code du bootloader pour initialiser les devices


section .text

    ; defini l'adresse io base
    mov cl, [user_disk_io_base]
    mov dl, [user_disk_io_base + 1]

    ; défini la 1ere adresse du disk à écrire
    mov al, 0 ; disk address low
    mov bl, 0 ; disk address high
    call set_disk_address


    sti cl, dl, 9 ; [DISK_DATA] = 0

    sti cl, dl, 1 ; [DISK_DATA] = 0

    sti cl, dl, 1 ; [DISK_DATA] = 0

    debug 1, cl
    debug 1, dl

    ret


; input : [C:D]=io_base & [A:B]=disk_address
set_disk_address:

    ; défini l'adresse du disk à écrire (low)
    mov el, 3
    call add_cd_e
    sti cl, dl, al ; [OS_DISK_ADDR_LOW] = 0

    ; défini l'adresse du disk à écrire (high)
    call inc_cd ; increment (C:D)
    sti cl, dl, bl ; [OS_DISK_ADDR_HIGH] = 0

    ; repositionne [C:D] a l'adresse io base
    mov el, 4
    call sub_cd_e

    ret
