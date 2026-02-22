; Author: Bob + yomax
; Name: sokoban_game
; Description: Sokoban (8x8 grid, rendered on 32x32 screen)
; Visual scale: tiles are 3x3, walls are drawn with 2px thickness
;
; Controls: Z/Q/S/D (or W/A/S/D)
; - Z/W: up
; - S: down
; - Q/A: left
; - D: right
;
; Notes:
; - Turn-based (no timer dependency)
; - Full redraw only after valid moves


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_console.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data
    ; ------------------------------------------------------------------------
    ; Constants
    ; ------------------------------------------------------------------------
    MAP_W               equ 8
    MAP_H               equ 8

    TILE_FLOOR          equ 0
    TILE_WALL           equ 1
    TILE_TARGET         equ 2
    TILE_BOX            equ 3
    TILE_PLAYER         equ 4
    TILE_BOX_ON_TARGET  equ 5
    TILE_PLAYER_ON_TGT  equ 6

    COL_FLOOR           equ 0x00
    COL_WALL            equ 0x96
    COL_TARGET          equ 0x2A
    COL_BOX             equ 0x15
    COL_PLAYER          equ 0xE0
    COL_BOX_ON_TARGET   equ 0xF0
    COL_PLAYER_ON_TGT   equ 0xFF

    ; Tiny win marker color (top-left 2x2)
    COL_WIN             equ 0x55

    ; Keyboard (ASCII)
    KEY_Z               equ 122
    KEY_W               equ 119
    KEY_S               equ 115
    KEY_Q               equ 113
    KEY_A               equ 97
    KEY_D               equ 100

    KEY_Z_UPPER         equ 90
    KEY_W_UPPER         equ 87
    KEY_S_UPPER         equ 83
    KEY_Q_UPPER         equ 81
    KEY_A_UPPER         equ 65
    KEY_D_UPPER         equ 68

    ; ------------------------------------------------------------------------
    ; Game state
    ; ------------------------------------------------------------------------
    player_x            db 4
    player_y            db 2

    move_dx             db 0
    move_dy             db 0

    next_x              db 0
    next_y              db 0
    next2_x             db 0
    next2_y             db 0

    game_won            db 0

    ; RNG device base (see rng_test.asm)
    rng_io_base         dw 0xF0A0

    msg_help_1          db "SOKOBAN: ZQSD/WASD to move", 0
    msg_help_2          db "Push orange box onto yellow target", 0
    msg_level_ok        db "Level solved. New target generated.", 0
    msg_eol             db 10, 0

    ; 8x8 map:
    ; 11111111
    ; 10000001
    ; 10234001
    ; 10000001
    ; 10000001
    ; 10000001
    ; 10000001
    ; 11111111
    ;
    ; Goal: push box (3) left onto target (2)
    map_data:
        db 1,1,1,1,1,1,1,1
        db 1,0,0,0,0,0,0,1
        db 1,0,2,3,4,0,0,1
        db 1,0,0,0,0,0,0,1
        db 1,0,0,0,0,0,0,1
        db 1,0,0,0,0,0,0,1
        db 1,0,0,0,0,0,0,1
        db 1,1,1,1,1,1,1,1


section .text
    global _start


_start:
    call render_map
    call print_help

.main_loop:
    call handle_input
    jmp .main_loop


; =============================================================================
; Console messages
; =============================================================================
print_help:
    push cl
    push dl

    lea cl, dl, [msg_help_1]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string

    lea cl, dl, [msg_help_2]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string

    pop dl
    pop cl
    ret

print_level_ok:
    push cl
    push dl

    lea cl, dl, [msg_level_ok]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string

    pop dl
    pop cl
    ret


; =============================================================================
; Input
; =============================================================================
handle_input:
    push al
    push bl

    call get_keyboard_status
    and al, 0x01
    cmp al, 0
    je .handle_input_done

    call get_keyboard_char
    mov bl, al ; save pressed key

    ; acknowledge key read
    call set_keyboard_status

    ; default: no movement
    mov al, 0
    mov [move_dx], al
    mov [move_dy], al

    ; restore pressed key for comparisons
    mov al, bl

    ; Up (Z/W)
    cmp al, KEY_Z
    je .up
    cmp al, KEY_W
    je .up
    cmp al, KEY_Z_UPPER
    je .up
    cmp al, KEY_W_UPPER
    je .up

    ; Down (S)
    cmp al, KEY_S
    je .down
    cmp al, KEY_S_UPPER
    je .down

    ; Left (Q/A)
    cmp al, KEY_Q
    je .left
    cmp al, KEY_A
    je .left
    cmp al, KEY_Q_UPPER
    je .left
    cmp al, KEY_A_UPPER
    je .left

    ; Right (D)
    cmp al, KEY_D
    je .right
    cmp al, KEY_D_UPPER
    je .right

    jmp .handle_input_done

.up:
    mov al, 0xFF
    mov [move_dy], al
    jmp .try

.down:
    mov al, 0x01
    mov [move_dy], al
    jmp .try

.left:
    mov al, 0xFF
    mov [move_dx], al
    jmp .try

.right:
    mov al, 0x01
    mov [move_dx], al

.try:
    call try_move

.handle_input_done:
    pop bl
    pop al
    ret


; =============================================================================
; try_move
; =============================================================================
try_move:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; next = player + delta
    mov al, [player_x]
    add al, [move_dx]
    mov [next_x], al

    mov al, [player_y]
    add al, [move_dy]
    mov [next_y], al

    ; tile_next in AL
    mov fl, [next_x]
    mov el, [next_y]
    call get_tile

    ; wall => blocked
    cmp al, TILE_WALL
    je .exit

    ; box / box_on_target => push path
    cmp al, TILE_BOX
    je .push
    cmp al, TILE_BOX_ON_TARGET
    je .push

    ; normal move only if next is floor or target
    cmp al, TILE_FLOOR
    je .normal_move
    cmp al, TILE_TARGET
    je .normal_move

    jmp .exit

.push:
    ; next2 = next + delta
    mov al, [next_x]
    add al, [move_dx]
    mov [next2_x], al

    mov al, [next_y]
    add al, [move_dy]
    mov [next2_y], al

    ; tile_next2 in AL
    mov fl, [next2_x]
    mov el, [next2_y]
    call get_tile

    ; next2 must be floor or target
    cmp al, TILE_FLOOR
    je .can_push
    cmp al, TILE_TARGET
    je .can_push
    jmp .exit

.can_push:
    ; ------------------------------------------------------------
    ; 1) Move box to next2
    ; ------------------------------------------------------------
    mov fl, [next2_x]
    mov el, [next2_y]

    ; AL currently has tile_next2 (floor/target)
    cmp al, TILE_TARGET
    je .box_to_target

    mov al, TILE_BOX
    call set_tile
    jmp .after_box_move

.box_to_target:
    mov al, TILE_BOX_ON_TARGET
    call set_tile

.after_box_move:
    ; ------------------------------------------------------------
    ; 2) Move player into next
    ; ------------------------------------------------------------
    ; Determine tile_next again (it was box or box_on_target)
    mov fl, [next_x]
    mov el, [next_y]
    call get_tile

    ; if original next was box_on_target => player_on_target
    cmp al, TILE_BOX_ON_TARGET
    je .player_to_target_cell

    mov al, TILE_PLAYER
    call set_tile
    jmp .after_player_to_next

.player_to_target_cell:
    mov al, TILE_PLAYER_ON_TGT
    call set_tile

.after_player_to_next:
    ; ------------------------------------------------------------
    ; 3) Clear old player cell (player or player_on_target)
    ; ------------------------------------------------------------
    mov fl, [player_x]
    mov el, [player_y]
    call get_tile

    cmp al, TILE_PLAYER_ON_TGT
    je .old_becomes_target

    mov al, TILE_FLOOR
    call set_tile
    jmp .finalize_pos

.old_becomes_target:
    mov al, TILE_TARGET
    call set_tile

.finalize_pos:
    mov al, [next_x]
    mov [player_x], al
    mov al, [next_y]
    mov [player_y], al

    call check_win
    call render_map
    jmp .exit

.normal_move:
    ; ------------------------------------------------------------
    ; normal move into floor/target
    ; AL currently tile_next
    ; ------------------------------------------------------------
    mov bl, al ; save tile_next

    ; set next cell to player/player_on_target
    mov fl, [next_x]
    mov el, [next_y]

    cmp bl, TILE_TARGET
    je .to_target

    mov al, TILE_PLAYER
    call set_tile
    jmp .clear_old

.to_target:
    mov al, TILE_PLAYER_ON_TGT
    call set_tile

.clear_old:
    mov fl, [player_x]
    mov el, [player_y]
    call get_tile

    cmp al, TILE_PLAYER_ON_TGT
    je .old_target2

    mov al, TILE_FLOOR
    call set_tile
    jmp .finalize_pos2

.old_target2:
    mov al, TILE_TARGET
    call set_tile

.finalize_pos2:
    mov al, [next_x]
    mov [player_x], al
    mov al, [next_y]
    mov [player_y], al

    call check_win
    call render_map

.exit:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; check_win: win when no TILE_BOX remains
; =============================================================================
check_win:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov al, 1
    mov [game_won], al

    mov el, 0 ; y
.y_loop:
    cmp el, MAP_H
    je .check_win_done

    mov fl, 0 ; x
.x_loop:
    cmp fl, MAP_W
    je .next_y

    call get_tile
    cmp al, TILE_BOX
    jne .next_x

    mov al, 0
    mov [game_won], al
    jmp .check_win_done

.next_x:
    inc fl
    jmp .x_loop

.next_y:
    inc el
    jmp .y_loop

.check_win_done:
    ; If solved, move target to a new random inner cell
    mov al, [game_won]
    cmp al, 1
    jne .check_win_exit

    call relocate_target
    call print_level_ok

    ; keep playing (no permanent win state)
    mov al, 0
    mov [game_won], al

.check_win_exit:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; relocate_target
; - converts BOX_ON_TARGET -> BOX
; - converts PLAYER_ON_TGT -> PLAYER
; - places a new TARGET on a random inner floor cell (x,y in 1..6)
; =============================================================================
relocate_target:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; 1) remove old target overlays
    mov el, 0
reloc_scan_y:
    cmp el, MAP_H
    je reloc_place_target

    mov fl, 0
reloc_scan_x:
    cmp fl, MAP_W
    je reloc_next_y

    call get_tile

    cmp al, TILE_BOX_ON_TARGET
    je reloc_box_on_target

    cmp al, TILE_PLAYER_ON_TGT
    je reloc_player_on_target

    jmp reloc_next_x

reloc_box_on_target:
    mov al, TILE_BOX
    call set_tile
    jmp reloc_next_x

reloc_player_on_target:
    mov al, TILE_PLAYER
    call set_tile

reloc_next_x:
    inc fl
    jmp reloc_scan_x

reloc_next_y:
    inc el
    jmp reloc_scan_y

    ; 2) choose random inner floor cell for new target
reloc_place_target:
reloc_pick_cell:
    call random_inner_coord
    mov bl, al

    call random_inner_coord
    mov cl, al

    mov fl, bl
    mov el, cl
    call get_tile

    cmp al, TILE_FLOOR
    jne reloc_pick_cell

    mov al, TILE_TARGET
    call set_tile

    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; random_inner_coord
; out: AL in range [1..6]
; =============================================================================
random_inner_coord:
    push cl
    push dl

    mov cl, [rng_io_base]
    mov dl, [rng_io_base + 1]

random_inner_coord_loop:
    ldi al, cl, dl
    and al, 0x07
    cmp al, 0
    je random_inner_coord_loop
    cmp al, 7
    je random_inner_coord_loop

    pop dl
    pop cl
    ret


; =============================================================================
; render_map
; =============================================================================
render_map:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov el, 0 ; y
.render_y:
    cmp el, MAP_H
    je .after_map

    mov fl, 0 ; x
.render_x:
    cmp fl, MAP_W
    je .next_render_y

    call get_tile
    mov bl, al
    call tile_to_color

    ; walls with thinner border (2x2), other tiles in 3x3
    cmp bl, TILE_WALL
    je .draw_wall

    call draw_cell3
    jmp .after_draw_cell

.draw_wall:
    call draw_cell2

.after_draw_cell:

    inc fl
    jmp .render_x

.next_render_y:
    inc el
    jmp .render_y

.after_map:
    ; draw tiny 2x2 win marker in top-left corner
    mov al, [game_won]
    cmp al, 1
    jne .render_map_done

    mov al, COL_WIN
    mov fl, 0
    mov el, 0
    call screen_set_pixel
    mov fl, 1
    mov el, 0
    call screen_set_pixel
    mov fl, 0
    mov el, 1
    call screen_set_pixel
    mov fl, 1
    mov el, 1
    call screen_set_pixel

.render_map_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; tile_to_color
; in:  AL=tile
; out: AL=color
; =============================================================================
tile_to_color:
    cmp al, TILE_FLOOR
    je .floor
    cmp al, TILE_WALL
    je .wall
    cmp al, TILE_TARGET
    je .target
    cmp al, TILE_BOX
    je .box
    cmp al, TILE_PLAYER
    je .player
    cmp al, TILE_BOX_ON_TARGET
    je .box_target
    cmp al, TILE_PLAYER_ON_TGT
    je .player_target

    mov al, COL_FLOOR
    ret

.floor:
    mov al, COL_FLOOR
    ret
.wall:
    mov al, COL_WALL
    ret
.target:
    mov al, COL_TARGET
    ret
.box:
    mov al, COL_BOX
    ret
.player:
    mov al, COL_PLAYER
    ret
.box_target:
    mov al, COL_BOX_ON_TARGET
    ret
.player_target:
    mov al, COL_PLAYER_ON_TGT
    ret


; =============================================================================
; draw_cell3
; in:  F=tile_x, E=tile_y, AL=color
; =============================================================================
draw_cell3:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov bl, al

    ; tile coords -> pixel coords (x3)
    ; fl = fl * 3 => fl*2 + fl
    mov dl, fl
    shl fl, 1
    add fl, dl

    ; el = el * 3 => el*2 + el
    mov dl, el
    shl el, 1
    add el, dl

    mov cl, 0 ; dy
.draw3_row_loop:
    cmp cl, 3
    je .draw3_done

    mov dl, 0 ; dx
.draw3_col_loop:
    cmp dl, 3
    je .draw3_next_row

    mov al, bl
    call screen_set_pixel

    inc fl
    inc dl
    jmp .draw3_col_loop

.draw3_next_row:
    sub fl, 3
    inc el
    inc cl
    jmp .draw3_row_loop

.draw3_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; draw_cell2 (used for wall thickness)
; in:  F=tile_x, E=tile_y, AL=color
; =============================================================================
draw_cell2:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov bl, al

    ; tile coords -> pixel coords (x3) to stay aligned with grid
    mov dl, fl
    shl fl, 1
    add fl, dl

    mov dl, el
    shl el, 1
    add el, dl

    mov cl, 0 ; dy
.draw2_row_loop:
    cmp cl, 2
    je .draw2_done

    mov dl, 0 ; dx
.draw2_col_loop:
    cmp dl, 2
    je .draw2_next_row

    mov al, bl
    call screen_set_pixel

    inc fl
    inc dl
    jmp .draw2_col_loop

.draw2_next_row:
    sub fl, 2
    inc el
    inc cl
    jmp .draw2_row_loop

.draw2_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret


; =============================================================================
; get_tile
; in:  F=x, E=y
; out: AL=tile
; =============================================================================
get_tile:
    push bl
    push cl
    push dl

    mov al, el
    shl al, 3
    add al, fl

    lea cl, dl, [map_data]
    add cl, al
    jnc .get_tile_no_carry
    inc dl
.get_tile_no_carry:
    ldi al, cl, dl

    pop dl
    pop cl
    pop bl
    ret


; =============================================================================
; set_tile
; in:  F=x, E=y, AL=tile
; =============================================================================
set_tile:
    push bl
    push cl
    push dl

    mov bl, al

    mov al, el
    shl al, 3
    add al, fl

    lea cl, dl, [map_data]
    add cl, al
    jnc .set_tile_no_carry
    inc dl
.set_tile_no_carry:
    sti cl, dl, bl

    pop dl
    pop cl
    pop bl
    ret
