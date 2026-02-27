; Author: yomax + deepseek
; Date: 2026-02
; Name: trex_game
; Description: Jeu T-Rex simplifié (comme Google Chrome offline)
;
; Contrôles : ESPACE pour sauter
; Score affiché sur le 7-segments ou en console
;
; Écran 128x128
; T-Rex : 16x16 (sprite)
; Obstacles : cactus 8x16
; Sol : ligne en bas de l'écran

.org 0xA000

; NOT FONCTIONNAL


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/graphics/lib_sprites.asm"
.include "os/v3/strings/lib_string.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data
    ; Constantes jeu
    GROUND_Y        equ 112         ; y du sol (128 - 16)
    TREX_X          equ 20          ; position x fixe du T-Rex
    TREX_Y_GROUND   equ 96 ; GROUND_Y - 16 ; position y au sol
    TREX_Y_JUMP     equ 80          ; hauteur max du saut
    OBSTACLE_SPEED  equ 2           ; vitesse défilement
    MIN_DISTANCE    equ 40          ; distance min entre obstacles

    ; États du jeu
    GAME_START      equ 0
    GAME_RUNNING    equ 1
    GAME_OVER       equ 2

    ; Variables jeu
    game_state      db 0 ; GAME_START
    trex_y          db 96 ; TREX_Y_GROUND
    trex_velocity   db 0            ; vitesse verticale (pour saut)
    is_jumping      db 0            ; 0 = au sol, 1 = en l'air

    ; Obstacles
    obstacle_x      db 128          ; position x (hors écran)
    obstacle_type   db 0            ; 0 = cactus simple
    obstacle_active db 0

    ; Score
    score           dw 0
    ;score_buffer    times 6 db 0    ; pour conversion string
    score_buffer    db 0, 0, 0, 0, 0, 0

    ; Timer
    frame_counter    db 0
    jump_key_pressed db 0           ; anti-rebond

    ASCII_R_UPPER    db "R"
    ASCII_R_LOWER    db "r"

    ; Messages
    msg_start       db "PRESS SPACE", 0
    msg_game_over   db "GAME OVER", 0
    msg_score       db "SCORE:", 0

    ; Sprite T-Rex (16x16 simplifié)
    trex_sprite:
        db 0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

    ; Sprite cactus (8x16)
    cactus_sprite:
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x00,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x00
        db 0x00,0x00,0x2A,0x2A,0x2A,0x2A,0x00,0x00
        db 0x00,0x00,0x00,0x2A,0x2A,0x00,0x00,0x00


section .bss
    ; Pour l'affichage texte
    text_buffer     resb 32


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

    ; Effacer l'écran (avec couleur de fond)
    call clear_screen

    ; Initialiser variables
    mov al, GAME_START
    mov [game_state], al

    mov al, TREX_Y_GROUND
    mov [trex_y], al

    mov al, 0
    mov [is_jumping], al
    mov [obstacle_active], al
    mov [score], al
    mov [score+1], al

    pop al
    ret

; ============================================================================
; GESTION CLAVIER
; ============================================================================
handle_input:
    push al
    push fl

    ; Lire statut clavier
    call get_keyboard_status
    cmp al, 0
    je .input_done

    ; Lire caractère
    call get_keyboard_char
    mov fl, al

    ; Confirme lecture
    call set_keyboard_status

    ; ESPACE (code 32)
    cmp fl, 32
    jne .check_r

    ; Espace pressé
    mov al, [game_state]
    cmp al, GAME_START
    jne .check_jump

    ; Démarrer jeu
    mov al, GAME_RUNNING
    mov [game_state], al
    jmp .input_done

.check_jump:
    cmp al, GAME_RUNNING
    jne .input_done

    ; Vérifier si déjà en train de sauter
    mov al, [is_jumping]
    cmp al, 0
    jne .input_done

    ; Démarrer saut
    mov al, 1
    mov [is_jumping], al
    mov al, 8           ; vitesse initiale vers le haut
    mov [trex_velocity], al
    jmp .input_done

.check_r:
    ; R pour restart (si game over)
    ;cmp fl, [ASCII_R_UPPER]
    mov al, [ASCII_R_UPPER]
    cmp fl, al
    jne .input_done
    ;cmp fl, [ASCII_R_LOWER]
    mov al, [ASCII_R_LOWER]
    cmp fl, al
    jne .input_done

    mov al, [game_state]
    cmp al, GAME_OVER
    jne .input_done

    call game_init

.input_done:
    pop fl
    pop al
    ret

; ============================================================================
; MISE À JOUR DU JEU
; ============================================================================
update_game:
    push al
    push bl

    mov al, [game_state]
    cmp al, GAME_RUNNING
    jne .update_done

    ; Mise à jour du saut
    call update_jump

    ; Mise à jour obstacles
    call update_obstacles

    ; Incrémenter score
    inc [score]
    jnc .no_score_carry
    inc [score+1]
.no_score_carry:

    ; Gestion frame counter (pour ralentir)
    inc [frame_counter]
    mov al, [frame_counter]
    cmp al, 2           ; ralentir un peu
    jb .update_done
    mov al, 0
    mov [frame_counter], al

.update_done:
    pop bl
    pop al
    ret

; ============================================================================
; MISE À JOUR DU SAUT
; ============================================================================
update_jump:
    push al
    push bl

    mov al, [is_jumping]
    cmp al, 0
    je .jump_done

    ; Récupérer la vélocité actuelle
    mov al, [trex_velocity]
    
    ; Vérifier si on monte ou on descend en regardant le bit de poids fort
    ; Si bit 7 = 1, c'est négatif (on descend)
    test al, 0x80
    jnz .descending

    ; === PHASE MONTANTE (vélocité positive) ===
    
    ; Appliquer vélocité à la position
    mov bl, [trex_y]
    add bl, al
    mov [trex_y], bl
    
    ; Ralentir (décélération)
    dec al
    mov [trex_velocity], al
    
    ; Vérifier si on a atteint le sommet (vélocité = 0)
    cmp al, 0
    jne .check_apex
    
    ; Sommet atteint, commencer descente
    ; Au lieu de mettre -1, on met 0xFF qui sera interprété comme négatif
    mov al, 0xFF        ; 0xFF = -1 en complément à 2
    mov [trex_velocity], al
    jmp .check_apex

.descending:
    ; === PHASE DESCENDANTE (vélocité négative) ===
    
    ; Pour descendre, on ajoute la valeur négative (ce qui soustrait)
    ; Exemple: 0xFF + 100 = 99 (car 100 - 1)
    mov bl, [trex_y]
    add bl, al          ; al est négatif (0xFF, 0xFE, etc.)
    mov [trex_y], bl
    
    ; Accélération vers le bas (rendre la valeur négative plus grande en magnitude)
    ; 0xFF → 0xFE → 0xFD ... (ce qui est -1, -2, -3...)
    dec al
    mov [trex_velocity], al

.check_apex:
    ; Vérifier si au sol
    mov al, [trex_y]
    cmp al, TREX_Y_GROUND
    jle .land
    
    ; Vérifier hauteur max (optionnel)
    cmp al, TREX_Y_JUMP
    jge .jump_done
    
    jmp .jump_done

.land:
    ; Retour au sol
    mov al, TREX_Y_GROUND
    mov [trex_y], al
    mov al, 0
    mov [is_jumping], al
    mov [trex_velocity], al

.jump_done:
    pop bl
    pop al
    ret

; ============================================================================
; MISE À JOUR DES OBSTACLES
; ============================================================================
update_obstacles:
    push al
    push bl
    push fl

    mov al, [obstacle_active]
    cmp al, 0
    je .maybe_spawn

    ; Déplacer obstacle vers la gauche
    mov al, [obstacle_x]
    sub al, OBSTACLE_SPEED
    mov [obstacle_x], al

    ; Vérifier sortie écran
    cmp al, 0
    jg .check_collision

    ; Obstacle sorti, désactiver
    mov al, 0
    mov [obstacle_active], al
    jmp .maybe_spawn

.check_collision:
    ; Collision T-Rex / obstacle ?
    ; T-Rex zone : X=20-36, Y=trex_y à trex_y+16
    ; Obstacle zone : X=obstacle_x à obstacle_x+8, Y=GROUND_Y-16 à GROUND_Y

    mov fl, [obstacle_x]
    cmp fl, 36          ; si obstacle_x > TREX_X+16 ?
    jg .maybe_spawn
    add fl, 8
    cmp fl, 20          ; si obstacle_x+8 < TREX_X ?
    jl .maybe_spawn

    ; Collision X, vérifier Y
    mov al, [trex_y]
    cmp al, TREX_Y_GROUND
    jge .collision      ; T-Rex au sol ou proche

    ; T-Rex en l'air, vérifier hauteur
    add al, 16
    cmp al, TREX_Y_GROUND
    jl .maybe_spawn     ; T-Rex assez haut, pas collision
    
.collision:
    ; Game Over!
    mov al, GAME_OVER
    mov [game_state], al

.maybe_spawn:
    ; Générer nouvel obstacle aléatoirement
    mov al, [obstacle_active]
    cmp al, 0
    jne .spawn_done

    ; Random simple (basé sur score)
    mov al, [score]
    and al, 0x3F        ; 0-63
    cmp al, 60          ; probabilité ~1/64 par frame
    jb .spawn_done

    ; Créer nouvel obstacle
    mov al, 1
    mov [obstacle_active], al
    mov al, 120
    mov [obstacle_x], al

.spawn_done:
    pop fl
    pop bl
    pop al
    ret

; ============================================================================
; DESSIN
; ============================================================================
draw_game:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; Effacer l'écran (fond)
    call clear_screen

    ; Dessiner le sol
    call draw_ground

    ; Dessiner T-Rex
    lea al, bl, [trex_sprite]
    mov fl, TREX_X
    mov el, [trex_y]
    call draw_sprite

    ; Dessiner obstacle si actif
    mov al, [obstacle_active]
    cmp al, 0
    je .draw_score

    lea al, bl, [cactus_sprite]
    mov fl, [obstacle_x]
    mov el, TREX_Y_GROUND
    call draw_sprite

.draw_score:
    ; Afficher score
    call draw_score_text

    ; Afficher message selon état
    mov al, [game_state]
    cmp al, GAME_START
    je .draw_start_msg

    cmp al, GAME_OVER
    je .draw_gameover_msg
    jmp .draw_end

.draw_start_msg:
    lea cl, dl, [msg_start]
    mov fl, 40
    mov el, 60
    call draw_text
    jmp .draw_end

.draw_gameover_msg:
    lea cl, dl, [msg_game_over]
    mov fl, 40
    mov el, 60
    call draw_text

.draw_end:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

; ============================================================================
; DESSINER LE SOL
; ============================================================================
draw_ground:
    push al
    push bl
    push fl
    push el

    mov fl, 0
    mov el, GROUND_Y
    mov al, 0x55        ; couleur vert/cyan

.ground_loop:
    cmp fl, 128
    je .ground_done

    call screen_set_pixel

    ; Varier légèrement couleur pour texture
    inc al
    inc fl
    jmp .ground_loop

.ground_done:
    pop el
    pop fl
    pop bl
    pop al
    ret

; ============================================================================
; AFFICHAGE TEXTE (version simplifiée)
; ============================================================================
draw_text:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; Sauvegarder position
    push fl
    push el

TEXT_LOOP:
    ; Lire caractère
    ldi al, cl, dl
    cmp al, 0
    je TEXT_DONE

    ; Dessiner caractère (5x7 pixels) - version simplifiée
    ; Ici on utilise juste des pixels pour l'instant
    ; Pour un vrai texte, il faudrait une font bitmap

    ; Position X suivante
    pop el
    pop fl
    add fl, 6
    push fl
    push el

    ; Caractère suivant
    call inc_cd
    jmp TEXT_LOOP

TEXT_DONE:
    pop el
    pop fl
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

; ============================================================================
; AFFICHAGE SCORE
; ============================================================================
draw_score_text:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; Afficher "SCORE:"
    lea cl, dl, [msg_score]
    mov fl, 5
    mov el, 5
    call draw_text

    ; Convertir score en string
    mov al, [score]
    lea cl, dl, [score_buffer]
    call int_to_str

    ; Afficher score
    mov fl, 45
    mov el, 5
    call draw_text

    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

; ============================================================================
; EFFACER ÉCRAN
; ============================================================================
clear_screen:
    push al
    push bl
    push fl
    push el

    mov fl, 0
    mov el, 0
    mov al, 0x00        ; couleur noir

.clear_y_loop:
    cmp el, 128
    je .clear_done

.clear_x_loop:
    cmp fl, 128
    je .clear_next_y

    call screen_set_pixel
    inc fl
    jmp .clear_x_loop

.clear_next_y:
    mov fl, 0
    inc el
    jmp .clear_y_loop

.clear_done:
    pop el
    pop fl
    pop bl
    pop al
    ret
