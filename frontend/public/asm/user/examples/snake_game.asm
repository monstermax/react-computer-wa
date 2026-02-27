; Author: yomax + deepseek
; Date: 2026-02
; Name: snake_game
; Description: Jeu Snake sur écran 32x32 pour CPU 8 bits
;
; Contrôles : Z=Haut, S=Bas, Q=Gauche, D=Droite
; Serpent limité à 16 segments max (simplicité)

.org 0xA000

; NOT FONCTIONNAL


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/strings/lib_string.asm"
.include "os/v3/arithmetic/lib_math.asm"


; ============================================================================
; CONSTANTES
; ============================================================================
GRID_SIZE       equ 32
CELL_SIZE       equ 4
SCREEN_SIZE     equ 128

DIR_UP          equ 0
DIR_DOWN        equ 1
DIR_LEFT        equ 2
DIR_RIGHT       equ 3

COL_SNAKE       equ 0x2A
COL_HEAD        equ 0x55
COL_FOOD        equ 0xFF
COL_BG          equ 0x00

GAME_PLAYING    equ 1
GAME_OVER       equ 0

; ============================================================================
; VARIABLES - Tout est en variables simples, pas de tableaux complexes
; ============================================================================
section .data
    ; Positions fixes pour 16 segments max (chacun a sa propre variable)
    head_x:     db 16
    head_y:     db 16
    body1_x:    db 15
    body1_y:    db 16
    body2_x:    db 14
    body2_y:    db 16
    body3_x:    db 0
    body3_y:    db 0
    body4_x:    db 0
    body4_y:    db 0
    body5_x:    db 0
    body5_y:    db 0
    body6_x:    db 0
    body6_y:    db 0
    body7_x:    db 0
    body7_y:    db 0
    body8_x:    db 0
    body8_y:    db 0
    body9_x:    db 0
    body9_y:    db 0
    body10_x:   db 0
    body10_y:   db 0
    body11_x:   db 0
    body11_y:   db 0
    body12_x:   db 0
    body12_y:   db 0
    body13_x:   db 0
    body13_y:   db 0
    body14_x:   db 0
    body14_y:   db 0
    body15_x:   db 0
    body15_y:   db 0
    
    snake_len:  db 3           ; longueur actuelle (3 au début)
    direction:  db DIR_RIGHT
    next_dir:   db DIR_RIGHT
    
    food_x:     db 0
    food_y:     db 0
    
    game_state: db GAME_PLAYING
    score:      dw 0
    frame_cnt:  db 0
    
    msg_score:  db "SCORE:", 0
    msg_over:   db "GAME OVER", 0
    msg_restart: db "PRESS R", 0

    STR_z db 'z'
    STR_Z db 'Z'
    STR_s db 's'
    STR_S db 'S'
    STR_q db 'q'
    STR_Q db 'Q'
    STR_d db 'd'
    STR_D db 'D'
    STR_r db 'r'
    STR_R db 'R'

; ============================================================================
; CODE PRINCIPAL
; ============================================================================
section .text
    global _start

_start:
    call game_init

.main_loop:
    call handle_input
    call update_game
    call draw_game
    jmp .main_loop

; ============================================================================
; INITIALISATION
; ============================================================================
game_init:
    push al
    
    call clear_screen
    
    ; Position initiale
    mov al, 16
    mov [head_x], al
    mov [head_y], al
    
    mov al, 15
    mov [body1_x], al
    mov al, 16
    mov [body1_y], al
    
    mov al, 14
    mov [body2_x], al
    mov al, 16
    mov [body2_y], al
    
    ; Longueur
    mov al, 3
    mov [snake_len], al
    
    ; Direction
    mov al, DIR_RIGHT
    mov [direction], al
    mov [next_dir], al
    
    ; Score
    mov al, 0
    mov [score], al
    mov [score+1], al
    
    ; Pomme
    call generate_food
    
    ; État
    mov al, GAME_PLAYING
    mov [game_state], al
    
    pop al
    ret

; ============================================================================
; GESTION CLAVIER
; ============================================================================
handle_input:
    push al
    push fl
    
    call get_keyboard_status
    cmp al, 0
    je .done
    
    call get_keyboard_char
    mov fl, al
    call set_keyboard_status
    
    mov al, [game_state]
    cmp al, GAME_OVER
    je .check_restart
    
    ; Directions
    cmp fl, STR_z
    je .up
    cmp fl, STR_Z
    je .up
    cmp fl, STR_s
    je .down
    cmp fl, STR_S
    je .down
    cmp fl, STR_q
    je .left
    cmp fl, STR_Q
    je .left
    cmp fl, STR_d
    je .right
    cmp fl, STR_D
    je .right
    jmp .done
    
.up:
    mov al, [direction]
    cmp al, DIR_DOWN
    je .done
    mov al, DIR_UP
    mov [next_dir], al
    jmp .done
    
.down:
    mov al, [direction]
    cmp al, DIR_UP
    je .done
    mov al, DIR_DOWN
    mov [next_dir], al
    jmp .done
    
.left:
    mov al, [direction]
    cmp al, DIR_RIGHT
    je .done
    mov al, DIR_LEFT
    mov [next_dir], al
    jmp .done
    
.right:
    mov al, [direction]
    cmp al, DIR_LEFT
    je .done
    mov al, DIR_RIGHT
    mov [next_dir], al
    jmp .done
    
.check_restart:
    cmp fl, STR_r
    je .restart
    cmp fl, STR_R
    je .restart
    jmp .done
    
.restart:
    call game_init
    
.done:
    pop fl
    pop al
    ret

; ============================================================================
; MISE À JOUR
; ============================================================================
update_game:
    push al
    
    mov al, [game_state]
    cmp al, GAME_OVER
    je .done
    
    ; Ralentir le jeu
    inc [frame_cnt]
    mov al, [frame_cnt]
    cmp al, 3           ; vitesse (ajuste selon besoin)
    jb .done
    mov al, 0
    mov [frame_cnt], al
    
    ; Appliquer direction
    mov al, [next_dir]
    mov [direction], al
    
    call move_snake
    call check_collisions
    
.done:
    pop al
    ret

; ============================================================================
; DÉPLACEMENT - Version simple avec variables explicites
; ============================================================================
move_snake:
    push al
    push bl
    
    ; Récupérer longueur
    mov bl, [snake_len]
    
    ; Décaler tous les segments vers la queue
    ; (body2 prend body1, body1 prend head, etc.)
    
    ; Pour un serpent de longueur variable, on utilise des if/else
    ; C'est moins élégant mais 100% fiable sur CPU 8 bits
    
    cmp bl, 15
    jb .skip15
    mov al, [body14_x]
    mov [body15_x], al
    mov al, [body14_y]
    mov [body15_y], al
.skip15:
    cmp bl, 14
    jb .skip14
    mov al, [body13_x]
    mov [body14_x], al
    mov al, [body13_y]
    mov [body14_y], al
.skip14:
    cmp bl, 13
    jb .skip13
    mov al, [body12_x]
    mov [body13_x], al
    mov al, [body12_y]
    mov [body13_y], al
.skip13:
    cmp bl, 12
    jb .skip12
    mov al, [body11_x]
    mov [body12_x], al
    mov al, [body11_y]
    mov [body12_y], al
.skip12:
    cmp bl, 11
    jb .skip11
    mov al, [body10_x]
    mov [body11_x], al
    mov al, [body10_y]
    mov [body11_y], al
.skip11:
    cmp bl, 10
    jb .skip10
    mov al, [body9_x]
    mov [body10_x], al
    mov al, [body9_y]
    mov [body10_y], al
.skip10:
    cmp bl, 9
    jb .skip9
    mov al, [body8_x]
    mov [body9_x], al
    mov al, [body8_y]
    mov [body9_y], al
.skip9:
    cmp bl, 8
    jb .skip8
    mov al, [body7_x]
    mov [body8_x], al
    mov al, [body7_y]
    mov [body8_y], al
.skip8:
    cmp bl, 7
    jb .skip7
    mov al, [body6_x]
    mov [body7_x], al
    mov al, [body6_y]
    mov [body7_y], al
.skip7:
    cmp bl, 6
    jb .skip6
    mov al, [body5_x]
    mov [body6_x], al
    mov al, [body5_y]
    mov [body6_y], al
.skip6:
    cmp bl, 5
    jb .skip5
    mov al, [body4_x]
    mov [body5_x], al
    mov al, [body4_y]
    mov [body5_y], al
.skip5:
    cmp bl, 4
    jb .skip4
    mov al, [body3_x]
    mov [body4_x], al
    mov al, [body3_y]
    mov [body4_y], al
.skip4:
    cmp bl, 3
    jb .skip3
    mov al, [body2_x]
    mov [body3_x], al
    mov al, [body2_y]
    mov [body3_y], al
.skip3:
    cmp bl, 2
    jb .skip2
    mov al, [body1_x]
    mov [body2_x], al
    mov al, [body1_y]
    mov [body2_y], al
.skip2:
    ; Segment 1 prend la tête
    mov al, [head_x]
    mov [body1_x], al
    mov al, [head_y]
    mov [body1_y], al
    
    ; Déplacer la tête selon direction
    mov al, [direction]
    cmp al, DIR_UP
    je .up
    cmp al, DIR_DOWN
    je .down
    cmp al, DIR_LEFT
    je .left
    cmp al, DIR_RIGHT
    je .right
    jmp .done
    
.up:
    dec [head_y]
    jmp .done
.down:
    inc [head_y]
    jmp .done
.left:
    dec [head_x]
    jmp .done
.right:
    inc [head_x]
    
.done:
    pop bl
    pop al
    ret

; ============================================================================
; COLLISIONS
; ============================================================================
check_collisions:
    push al
    push bl
    
    ; 1. Pomme ?
    mov al, [head_x]
    cmp al, [food_x]
    jne .check_wall
    mov al, [head_y]
    cmp al, [food_y]
    jne .check_wall
    
    call eat_food
    jmp .done
    
.check_wall:
    ; 2. Murs
    mov al, [head_x]
    cmp al, 0
    jl .game_over
    cmp al, GRID_SIZE
    jge .game_over
    
    mov al, [head_y]
    cmp al, 0
    jl .game_over
    cmp al, GRID_SIZE
    jge .game_over
    
    ; 3. Corps (vérifier chaque segment)
    mov bl, [snake_len]
    dec bl              ; ne pas vérifier la tête
    
    cmp bl, 1
    jb .done
    
    ; Vérifier body1
    mov al, [head_x]
    cmp al, [body1_x]
    jne .check_body2
    mov al, [head_y]
    cmp al, [body1_y]
    je .game_over
    
.check_body2:
    cmp bl, 2
    jb .done
    mov al, [head_x]
    cmp al, [body2_x]
    jne .check_body3
    mov al, [head_y]
    cmp al, [body2_y]
    je .game_over
    
.check_body3:
    cmp bl, 3
    jb .done
    mov al, [head_x]
    cmp al, [body3_x]
    jne .check_body4
    mov al, [head_y]
    cmp al, [body3_y]
    je .game_over
    
.check_body4:
    cmp bl, 4
    jb .done
    mov al, [head_x]
    cmp al, [body4_x]
    jne .check_body5
    mov al, [head_y]
    cmp al, [body4_y]
    je .game_over
    
.check_body5:
    cmp bl, 5
    jb .done
    mov al, [head_x]
    cmp al, [body5_x]
    jne .check_body6
    mov al, [head_y]
    cmp al, [body5_y]
    je .game_over
    
.check_body6:
    cmp bl, 6
    jb .done
    mov al, [head_x]
    cmp al, [body6_x]
    jne .check_body7
    mov al, [head_y]
    cmp al, [body6_y]
    je .game_over
    
.check_body7:
    cmp bl, 7
    jb .done
    mov al, [head_x]
    cmp al, [body7_x]
    jne .check_body8
    mov al, [head_y]
    cmp al, [body7_y]
    je .game_over
    
.check_body8:
    cmp bl, 8
    jb .done
    mov al, [head_x]
    cmp al, [body8_x]
    jne .check_body9
    mov al, [head_y]
    cmp al, [body8_y]
    je .game_over
    
.check_body9:
    cmp bl, 9
    jb .done
    mov al, [head_x]
    cmp al, [body9_x]
    jne .check_body10
    mov al, [head_y]
    cmp al, [body9_y]
    je .game_over
    
.check_body10:
    cmp bl, 10
    jb .done
    mov al, [head_x]
    cmp al, [body10_x]
    jne .check_body11
    mov al, [head_y]
    cmp al, [body10_y]
    je .game_over
    
.check_body11:
    cmp bl, 11
    jb .done
    mov al, [head_x]
    cmp al, [body11_x]
    jne .check_body12
    mov al, [head_y]
    cmp al, [body11_y]
    je .game_over
    
.check_body12:
    cmp bl, 12
    jb .done
    mov al, [head_x]
    cmp al, [body12_x]
    jne .check_body13
    mov al, [head_y]
    cmp al, [body12_y]
    je .game_over
    
.check_body13:
    cmp bl, 13
    jb .done
    mov al, [head_x]
    cmp al, [body13_x]
    jne .check_body14
    mov al, [head_y]
    cmp al, [body13_y]
    je .game_over
    
.check_body14:
    cmp bl, 14
    jb .done
    mov al, [head_x]
    cmp al, [body14_x]
    jne .check_body15
    mov al, [head_y]
    cmp al, [body14_y]
    je .game_over
    
.check_body15:
    cmp bl, 15
    jb .done
    mov al, [head_x]
    cmp al, [body15_x]
    jne .done
    mov al, [head_y]
    cmp al, [body15_y]
    je .game_over
    
    jmp .done
    
.game_over:
    mov al, GAME_OVER
    mov [game_state], al
    
.done:
    pop bl
    pop al
    ret

; ============================================================================
; MANGER LA POMME
; ============================================================================
eat_food:
    push al
    
    ; Augmenter longueur
    inc [snake_len]
    
    ; Augmenter score
    inc [score]
    jnc .no_carry
    inc [score+1]
.no_carry:
    
    ; Nouvelle pomme
    call generate_food
    
    pop al
    ret

; ============================================================================
; GÉNÉRER POMME
; ============================================================================
generate_food:
    push al
    push bl
    
.gen_loop:
    ; Position aléatoire simple
    mov al, [score]
    add al, [frame_cnt]
    and al, 0x1F
    mov [food_x], al
    
    mov al, [score+1]
    add al, [frame_cnt]
    and al, 0x1F
    mov [food_y], al
    
    ; Vérifier que pas sur le serpent
    mov al, [food_x]
    cmp al, [head_x]
    jne .check_body1
    mov al, [food_y]
    cmp al, [head_y]
    je .gen_loop
    
.check_body1:
    mov al, [food_x]
    cmp al, [body1_x]
    jne .check_body2
    mov al, [food_y]
    cmp al, [body1_y]
    je .gen_loop
    
.check_body2:
    mov al, [food_x]
    cmp al, [body2_x]
    jne .check_body3
    mov al, [food_y]
    cmp al, [body2_y]
    je .gen_loop
    
.check_body3:
    mov al, [food_x]
    cmp al, [body3_x]
    jne .check_body4
    mov al, [food_y]
    cmp al, [body3_y]
    je .gen_loop
    
.check_body4:
    mov al, [food_x]
    cmp al, [body4_x]
    jne .check_body5
    mov al, [food_y]
    cmp al, [body4_y]
    je .gen_loop
    
    ; ... continuer pour tous les segments jusqu'à snake_len
    
.valid:
    pop bl
    pop al
    ret

; ============================================================================
; DESSIN
; ============================================================================
draw_game:
    push al
    push fl
    push el
    
    call clear_screen
    
    ; Dessiner pomme
    mov al, [food_x]
    mov fl, al
    shl fl, 2
    mov al, [food_y]
    mov el, al
    shl el, 2
    mov al, COL_FOOD
    call draw_cell
    
    ; Dessiner serpent
    mov al, COL_HEAD
    mov fl, [head_x]
    shl fl, 2
    mov el, [head_y]
    shl el, 2
    call draw_cell
    
    mov al, COL_SNAKE
    mov fl, [body1_x]
    shl fl, 2
    mov el, [body1_y]
    shl el, 2
    call draw_cell
    
    mov fl, [body2_x]
    shl fl, 2
    mov el, [body2_y]
    shl el, 2
    call draw_cell
    
    ; Ajouter les autres segments selon snake_len
    mov al, [snake_len]
    cmp al, 4
    jb .draw_score
    
    mov fl, [body3_x]
    shl fl, 2
    mov el, [body3_y]
    shl el, 2
    call draw_cell
    
    ; ... continuer jusqu'à snake_len
    
.draw_score:
    ; Afficher score en console (optionnel)
    
    pop el
    pop fl
    pop al
    ret

; ============================================================================
; DESSINER CELLULE 4x4
; ============================================================================
draw_cell:
    push al
    push bl
    push cl
    push fl
    push el
    
    mov bl, al          ; sauver couleur
    mov cl, 0
    
.row_loop:
    cmp cl, CELL_SIZE
    je .done
    
    mov al, bl
    call screen_set_pixel
    inc fl
    
    inc cl
    jmp .row_loop
    
.done:
    pop el
    pop fl
    pop cl
    pop bl
    pop al
    ret

; ============================================================================
; EFFACER ÉCRAN
; ============================================================================
clear_screen:
    push al
    push fl
    push el
    
    mov fl, 0
    mov el, 0
    mov al, COL_BG
    
.yloop:
    cmp el, SCREEN_SIZE
    je .done
    
.xloop:
    cmp fl, SCREEN_SIZE
    je .next_y
    
    call screen_set_pixel
    inc fl
    jmp .xloop
    
.next_y:
    mov fl, 0
    inc el
    jmp .yloop
    
.done:
    pop el
    pop fl
    pop al
    ret