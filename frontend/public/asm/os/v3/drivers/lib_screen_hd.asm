; Author: yomax
; Date: 2026-02
; Name: lib_screen_hd
; Description: HD Screen Driver

; HD Screen I/O ports (relatifs à screenhd_io_base) :
;   +0 = PIXEL_X
;   +1 = PIXEL_Y
;   +2 = PIXEL_COLOR

; Couleur HSL : 0=rouge, 42=orange, 85=jaune/vert, 128=cyan, 170=bleu, 213=violet, 255=rouge


.include "os/v3/drivers/lib_devices.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data
    str_screenhd         db "screen_hd", 0
    screenhd_device_idx  db 0x00   ; must be followed by screenhd_io_base. will be auto filled
    screenhd_io_base     dw 0x0000 ; 0xF0D0 ; must be placed just after screenhd_device_idx. will be auto filled

    SCREENHD_WIDTH equ 256
    SCREENHD_HEIGHT equ 256


section .text
    global init_device_screenhd
    global screenhd_print_pixel
    global screenhd_set_pixel


_exit:
    ret


init_device_screenhd:
    ; initialise le device screenhd
    lea al, bl, [str_screenhd]
    lea cl, dl, [screenhd_device_idx]
    call init_device ; set and store screenhd_device_idx value
    ret



screenhd_print_pixel:
    ; get pixel x - @PIXEL_X = screenhd_io_base
    mov cl, [screenhd_io_base]
    mov dl, [screenhd_io_base + 1]
    ldi al, cl, dl

    ; set pixel x - @PIXEL_X = screenhd_io_base
    ;mov cl, [screenhd_io_base]
    ;mov dl, [screenhd_io_base + 1]
    ;mov al, 0
    sti cl, dl, al

    ; set pixel y - @PIXEL_Y = screenhd_io_base + 1
    call inc_cd
    ;mov al, 0
    sti cl, dl, al

    ; set pixel color - @PIXEL_COLOR = screenhd_io_base + 2
    call inc_cd
    push al ; sauvegarde A (la position courante)
    inc al ; incremente A (pour ne pas etre à 0 lors de la 1ere iteration)
    mov bl, 10 ; multiplie par 10 => couleur = poxition+1 * 10
    push cl
    push dl
    call mul8 ; A = A * B = couleur du pixel
    pop dl
    pop cl
    debug 7, al
    sti cl, dl, al
    pop al

    call dec_cd
    call dec_cd
    inc al
    sti cl, dl, al ; met à jour le prochain PIXEL_X

    ret



; ============================================================================
; SCREENHD_SET_PIXEL - Écrit un pixel à (F, E) avec la couleur AL
;
; Input:  F = X, E = Y, AL = couleur
; Uses:   C:D comme pointeur I/O (sauvegardés)
; ============================================================================
screenhd_set_pixel:
    push cl
    push dl

    ; Charger l'adresse I/O base dans C:D
    ;lea cl, dl, [screenhd_io_base]
    mov cl, [screenhd_io_base]
    mov dl, [screenhd_io_base + 1]

    ; Écrire X (port +0)
    sti cl, dl, fl              ; [C:D] = F  (PIXEL_X = F)

    ; Avancer vers port +1 (PIXEL_Y)
    call inc_cd
    sti cl, dl, el              ; [C:D] = E  (PIXEL_Y = E)

    ; Avancer vers port +2 (PIXEL_COLOR)
    call inc_cd
    sti cl, dl, al              ; [C:D] = A  (PIXEL_COLOR = A)

    pop dl
    pop cl
    ret

