; Author: yomax
; Date: 2026-02
; Name: lib_screen
; Description: Screen Driver

; Screen I/O ports (relatifs à screen_io_base) :
;   +0 = PIXEL_X
;   +1 = PIXEL_Y
;   +2 = PIXEL_COLOR

; Couleur HSL : 0=rouge, 42=orange, 85=jaune/vert, 128=cyan, 170=bleu, 213=violet, 255=rouge


%include "os/v3/drivers/lib_devices.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
    str_screen         db "screen", 0
    screen_device_idx  db 0x00   ; must be followed by screen_io_base. will be auto filled
    screen_io_base     dw 0x0000 ; 0xF030 ; must be placed just after screen_device_idx. will be auto filled

    SCREEN_WIDTH equ 32
    SCREEN_HEIGHT equ 32


section .text
    global init_device_screen
    global screen_clear
    global screen_print_pixel
    global screen_set_pixel


ret ; this is a lib. no default entrypoint defined


init_device_screen:
    ; initialise le device screen
    lea al, bl, [str_screen]
    lea cl, dl, [screen_device_idx]
    call init_device ; set and store screen_device_idx value
    ret



screen_clear:
    mov cl, [screen_io_base]
    mov dl, [screen_io_base + 1]
    mov el, 3
    call add_cd_e ; set (C:D) to SCREEN_CLEAR port
    sti cl, dl, 1
    ret



screen_print_pixel:
    ; get pixel x - @PIXEL_X = screen_io_base
    mov cl, [screen_io_base]
    mov dl, [screen_io_base + 1]
    ldi al, cl, dl

    ; set pixel x - @PIXEL_X = screen_io_base
    ;mov cl, [screen_io_base]
    ;mov dl, [screen_io_base + 1]
    ;mov al, 0
    sti cl, dl, al

    ; set pixel y - @PIXEL_Y = screen_io_base + 1
    call inc_cd
    ;mov al, 0
    sti cl, dl, al

    ; set pixel color - @PIXEL_COLOR = screen_io_base + 2
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
; SCREEN_SET_PIXEL - Écrit un pixel à (F, E) avec la couleur AL
;
; Input:  F = X, E = Y, AL = couleur
; Uses:   C:D comme pointeur I/O (sauvegardés)
; ============================================================================
screen_set_pixel:
    push cl
    push dl

    ; Charger l'adresse I/O base dans C:D
    ;lea cl, dl, [screen_io_base]
    mov cl, [screen_io_base]
    mov dl, [screen_io_base + 1]

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

