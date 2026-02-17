; Author: Claude + yomax
; Date: 2026-02
; Name: demo_sprites_pack1
; Description: Dessine Mario et Sonic en pixel art sur l'écran 256x256
;
; Chaque pixel du sprite est dessiné comme un carré de SCALE_FACTOR x SCALE_FACTOR pixels
; Pour 256x256 avec sprites 16x16 : SCALE_FACTOR = 16 (16*16 = 256)

; Dépendances : lib_sprites.asm (draw_sprite_hd)

.include "os/v3/graphics/lib_sprites.asm"


section .data
    ; --- Constantes d'échelle ---
    SCALE_FACTOR    equ 16          ; Chaque pixel du sprite devient 16x16 pixels à l'écran
    SPRITE_SIZE     equ 16          ; Taille originale du sprite (16x16)
    SCREEN_SIZE     equ 256         ; Écran 256x256

    ; --- Couleurs ---
    COL_TRANSPARENT equ 0x00
    COL_RED         equ 0x01
    COL_BROWN       equ 0x08
    COL_SKIN        equ 0x18
    COL_YELLOW      equ 0x2A
    COL_GREEN       equ 0x55
    COL_BLUE_LIGHT  equ 0x80
    COL_BLUE_DARK   equ 0xAA
    COL_WHITE       equ 0xC0


; ============================================================================
; SPRITE : Mario 16x16 (inchangé)
; ============================================================================

    _R equ COL_RED
    _S equ COL_SKIN
    _B equ COL_BLUE_DARK
    _K equ COL_BROWN
    _Y equ COL_YELLOW
    _W equ COL_WHITE
    _X equ COL_TRANSPARENT


sprite_mario_hd:
    db _X, _X, _X, _X, _X, _R, _R, _R, _R, _R, _X, _X, _X, _X, _X, _X ; row 0
    db _X, _X, _X, _X, _R, _R, _R, _R, _R, _R, _R, _R, _R, _X, _X, _X ; row 1
    db _X, _X, _X, _X, _K, _K, _K, _S, _S, _K, _S, _X, _X, _X, _X, _X ; row 2
    db _X, _X, _X, _K, _S, _K, _S, _S, _S, _K, _S, _S, _S, _X, _X, _X ; row 3
    db _X, _X, _X, _K, _S, _K, _K, _S, _S, _S, _K, _S, _S, _S, _X, _X ; row 4
    db _X, _X, _X, _K, _K, _S, _S, _S, _S, _K, _K, _K, _K, _X, _X, _X ; row 5
    db _X, _X, _X, _X, _X, _S, _S, _S, _S, _S, _S, _S, _X, _X, _X, _X ; row 6
    db _X, _X, _X, _X, _R, _R, _B, _R, _R, _B, _R, _X, _X, _X, _X, _X ; row 7
    db _X, _X, _X, _R, _R, _R, _B, _R, _R, _B, _R, _R, _R, _X, _X, _X ; row 8
    db _X, _X, _R, _R, _R, _R, _B, _B, _B, _B, _R, _R, _R, _R, _X, _X ; row 9
    db _X, _X, _S, _S, _R, _B, _Y, _B, _B, _Y, _B, _R, _S, _S, _X, _X ; row 10
    db _X, _X, _S, _S, _S, _B, _B, _B, _B, _B, _B, _S, _S, _S, _X, _X ; row 11
    db _X, _X, _S, _S, _B, _B, _B, _B, _B, _B, _B, _B, _S, _S, _X, _X ; row 12
    db _X, _X, _X, _X, _B, _B, _B, _X, _X, _B, _B, _B, _X, _X, _X, _X ; row 13
    db _X, _X, _X, _K, _K, _K, _X, _X, _X, _X, _K, _K, _K, _X, _X, _X ; row 14
    db _X, _X, _K, _K, _K, _K, _X, _X, _X, _X, _K, _K, _K, _K, _X, _X ; row 15

sprite_mario_hd_end:


; ============================================================================
; SPRITE : Sonic 16x16 (inchangé)
; ============================================================================

_U equ COL_BLUE_LIGHT

sprite_sonic_hd:
    db _X, _X, _X, _X, _X, _X, _X, _X, _U, _U, _U, _X, _X, _X, _X, _X ; row 0
    db _X, _X, _X, _X, _X, _X, _U, _U, _U, _U, _U, _U, _X, _X, _X, _X ; row 1
    db _X, _X, _X, _X, _X, _U, _U, _U, _U, _U, _U, _U, _U, _X, _X, _X ; row 2
    db _X, _X, _X, _X, _U, _U, _U, _U, _U, _U, _U, _U, _X, _X, _X, _X ; row 3
    db _X, _X, _X, _U, _U, _U, _U, _U, _U, _U, _X, _X, _X, _X, _X, _X ; row 4
    db _X, _X, _U, _U, _U, _K, _S, _S, _S, _S, _X, _X, _X, _X, _X, _X ; row 5
    db _X, _X, _U, _U, _K, _W, _K, _S, _S, _S, _S, _X, _X, _X, _X, _X ; row 6
    db _X, _X, _U, _U, _K, _W, _K, _S, _K, _S, _S, _X, _X, _X, _X, _X ; row 7
    db _X, _X, _X, _U, _U, _K, _S, _S, _S, _S, _X, _X, _X, _X, _X, _X ; row 8
    db _X, _X, _X, _X, _U, _U, _S, _S, _Y, _S, _X, _X, _X, _X, _X, _X ; row 9
    db _X, _X, _X, _X, _X, _U, _U, _U, _U, _U, _U, _X, _X, _X, _X, _X ; row 10
    db _X, _X, _X, _X, _R, _R, _U, _U, _U, _U, _X, _X, _X, _X, _X, _X ; row 11
    db _X, _X, _X, _R, _R, _R, _R, _U, _U, _R, _R, _X, _X, _X, _X, _X ; row 12
    db _X, _X, _X, _X, _S, _S, _X, _X, _X, _S, _S, _X, _X, _X, _X, _X ; row 13
    db _X, _X, _X, _X, _S, _S, _X, _X, _X, _S, _S, _X, _X, _X, _X, _X ; row 14
    db _X, _X, _X, _R, _R, _R, _X, _X, _X, _R, _R, _R, _X, _X, _X, _X ; row 15

sprite_sonic_hd_end:


section .text
    global draw_mario_hd
    global draw_sonic_hd
    global draw_mario_and_sonic_hd


_exit:
    ;call draw_mario_hd
    ret


; ============================================================================
; DRAW_MARIO_HD - Dessine Mario à la position (16, 112) pour être centré
; Position = (X * SCALE_FACTOR, Y * SCALE_FACTOR)
; 16 * 16 = 256, donc pour centrer Mario sur 256x256 :
;   X = (256 - 16*16) / 2 = 0
;   Y = (256 - 16*16) / 2 = 0
; ============================================================================
draw_mario_hd:
    push al
    push bl
    push el
    push fl
    push cl
    push dl

    lea al, bl, sprite_mario_hd        ; A:B = adresse du sprite Mario
    
    ; Position du sprite dans la grille virtuelle (0-15)
    ; On le met à (0,0) pour le placer en haut à gauche
    mov fl, 0                       ; X virtuel = 0
    mov el, 0                       ; Y virtuel = 0
    
    call draw_sprite_hd

    pop dl
    pop cl
    pop fl
    pop el
    pop bl
    pop al
    ret


; ============================================================================
; DRAW_SONIC_HD - Dessine Sonic à droite de Mario
; Pour que Mario et Sonic soient côte à côte :
; Mario en (0,0), Sonic en (8,0) (car 8*16 = 128, centré)
; ============================================================================
draw_sonic_hd:
    push al
    push bl
    push el
    push fl
    push cl
    push dl

    lea al, bl, sprite_sonic_hd        ; A:B = adresse du sprite Sonic
    
    ; Position à droite de Mario
    mov fl, 16                       ; X virtuel = 16 (au milieu de l'écran)
    mov el, 0                       ; Y virtuel = 0
    
    call draw_sprite_hd

    pop dl
    pop cl
    pop fl
    pop el
    pop bl
    pop al
    ret


; ============================================================================
; DRAW_MARIO_AND_SONIC - Dessine les deux côte à côte centrés
; ============================================================================
draw_mario_and_sonic_hd:
    call draw_mario_hd
    call draw_sonic_hd
    ret