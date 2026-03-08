; Author: yomax
; Date: 2026-02
; Name: lib_sprites
; Description: Graphics Sprites Library


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_screen_hd.asm"


section .data
    _spr_x_start   db 0            ; X de départ sauvegardé
    _spr_y_start   db 0            ; Y de départ sauvegardé
    _spr_row       db 0            ; compteur de ligne
    _spr_col       db 0            ; compteur de colonne


section .text
    global draw_sprite
    global draw_sprite_hd


ret ; this is a lib. no default entrypoint defined


; ============================================================================
; draw_sprite
;
; Input :
;   A:B = adresse du sprite en mémoire (low:high)
;   F   = X de départ (coin haut-gauche)
;   E   = Y de départ (coin haut-gauche)
;
; Sprite 16x16. Couleur 0x00 = transparent.
; ============================================================================


draw_sprite:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; Sauvegarder position de départ
    mov [_spr_x_start], fl
    mov [_spr_y_start], el

    ; Pointeur sprite dans C:D
    mov cl, al
    mov dl, bl

    mov al, 0
    mov [_spr_row], al              ; row = 0

.spr2_row_loop:
    mov al, [_spr_row]
    cmp al, 16
    je .spr2_done

    mov al, 0
    mov [_spr_col], al              ; col = 0

.spr2_col_loop:
    mov al, [_spr_col]
    cmp al, 16
    je .spr2_next_row

    ; Lire couleur depuis [C:D]
    ldi al, cl, dl                  ; A = pixel color

    ; Si transparent, skip le dessin
    cmp al, 0
    je .spr2_skip

    ; Préparer F = X_start + col, E = Y_start + row pour screen_set_pixel
    mov fl, [_spr_x_start]
    mov bl, [_spr_col]
    add fl, bl                      ; F = X_start + col

    mov el, [_spr_y_start]
    mov bl, [_spr_row]
    add el, bl                      ; E = Y_start + row

    ; A contient déjà la couleur
    call screen_set_pixel

.spr2_skip:
    ; Avancer pointeur sprite
    push el
    mov el, 1
    call add_cd_e
    pop el

    inc [_spr_col]
    jmp .spr2_col_loop

.spr2_next_row:
    inc [_spr_row]
    jmp .spr2_row_loop

.spr2_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret





; ============================================================================
; draw_sprite_hd
;
; Input :
;   A:B = adresse du sprite en mémoire (low:high)
;   F   = X de départ (coin haut-gauche) - en pixels (0-255)
;   E   = Y de départ (coin haut-gauche) - en pixels (0-255)
;
; Sprite 16x16. Couleur 0x00 = transparent. Écran 256x256 avec pixelSize=2
; Chaque pixel du sprite devient un carré de 2x2 pixels à l'écran
; ============================================================================

draw_sprite_hd:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; Sauvegarder position de départ
    mov [_spr_x_start], fl
    mov [_spr_y_start], el

    ; Pointeur sprite dans C:D
    mov cl, al
    mov dl, bl

    mov al, 0
    mov [_spr_row], al              ; row = 0

.hd_row_loop:
    mov al, [_spr_row]
    cmp al, 16
    je .hd_done

    mov al, 0
    mov [_spr_col], al              ; col = 0

.hd_col_loop:
    mov al, [_spr_col]
    cmp al, 16
    je .hd_next_row

    ; Lire couleur depuis [C:D]
    ldi al, cl, dl                  ; A = pixel color

    ; Si transparent, skip le dessin
    cmp al, 0
    je .hd_skip

    ; Sauvegarder la couleur
    push al

    ; Calculer la position de départ du carré 2x2
    ; X = X_start + (col * 2)
    mov fl, [_spr_x_start]
    mov bl, [_spr_col]
    shl bl, 1                       ; col * 2
    add fl, bl                      ; F = X_start + (col*2)

    ; Y = Y_start + (row * 2)
    mov el, [_spr_y_start]
    mov bl, [_spr_row]
    shl bl, 1                       ; row * 2
    add el, bl                      ; E = Y_start + (row*2)

    ; Restaurer la couleur
    pop al

    ; Dessiner un carré 2x2
    ; Pixel (0,0)
    call screenhd_set_pixel

    ; Pixel (1,0)
    push fl
    inc fl
    call screenhd_set_pixel
    pop fl

    ; Pixel (0,1)
    push el
    inc el
    call screenhd_set_pixel
    pop el

    ; Pixel (1,1)
    inc fl
    inc el
    call screenhd_set_pixel

.hd_skip:
    ; Avancer pointeur sprite
    push el
    mov el, 1
    call add_cd_e
    pop el

    inc [_spr_col]
    jmp .hd_col_loop

.hd_next_row:
    inc [_spr_row]
    jmp .hd_row_loop

.hd_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


