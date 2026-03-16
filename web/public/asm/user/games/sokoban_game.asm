; Author: openclaw + yomax
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

.org 0xA000

%include "os/v3/drivers/lib_screen.asm"
%include "os/v3/drivers/lib_keyboard.asm"
%include "os/v3/drivers/lib_console.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
    ; ------------------------------------------------------------------------
    ; Constants
    ; ------------------------------------------------------------------------
    MAP_W               equ 8
    MAP_H               equ 8
    MAP_W_MAX           equ 7
    MAP_H_MAX           equ 7

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
    KEY_ESC             equ 27

    TILE_SIZE           equ 3
    BOARD_OFFSET_X      equ 4
    BOARD_OFFSET_Y      equ 4

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
    quit_requested      db 0

    ; RNG device base (see rng_test.asm)
    rng_io_base         dw 0xF0A0

    msg_help_1          db "SOKOBAN: ZQSD/WASD to move. Escape to quit.", 13, 0
    msg_help_2          db "Click the Console to set keyboard focus.", 13, "You are the pink box. Push orange box onto yellow target.", 13, 0
    msg_level_ok        db "Level solved. New target generated.", 0
    msg_eol             db 10, 0

    ; 8x8 map (no blocking wall tiles on borders)
    ; visual frame is drawn separately
    map_data:
        db 0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0
        db 0,0,2,3,4,0,0,0
        db 0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0


section .text
    global _start


_start:
    call init_device_screen
    call init_device_keyboard
    call init_device_console

    mov al, 0
    mov [quit_requested], al
    call render_map
    call print_help

.main_loop:
    call handle_input

    mov al, [quit_requested]
    cmp al, 1
    je .quit_game

    jmp .main_loop

.quit_game:
    ret


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

    ; Escape: request quit
    cmp al, KEY_ESC
    je .escape

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
    jmp .try

.escape:
    mov al, 1
    mov [quit_requested], al
    jmp .handle_input_done

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

    ; next = player + delta (with wrap-around on borders)
    mov al, [player_x]
    add al, [move_dx]

    ; wrap X into [0..MAP_W-1]
    cmp al, 0xFF
    je .try_move_wrap_next_x_neg
    cmp al, MAP_W
    je .try_move_wrap_next_x_pos
    jmp .try_move_wrap_next_x_done
.try_move_wrap_next_x_neg:
    mov al, MAP_W_MAX
    jmp .try_move_wrap_next_x_done
.try_move_wrap_next_x_pos:
    mov al, 0
.try_move_wrap_next_x_done:
    mov [next_x], al

    mov al, [player_y]
    add al, [move_dy]

    ; wrap Y into [0..MAP_H-1]
    cmp al, 0xFF
    je .try_move_wrap_next_y_neg
    cmp al, MAP_H
    je .try_move_wrap_next_y_pos
    jmp .try_move_wrap_next_y_done
.try_move_wrap_next_y_neg:
    mov al, MAP_H_MAX
    jmp .try_move_wrap_next_y_done
.try_move_wrap_next_y_pos:
    mov al, 0
.try_move_wrap_next_y_done:
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
    ; next2 = next + delta (with wrap-around on borders)
    mov al, [next_x]
    add al, [move_dx]

    cmp al, 0xFF
    je .try_move_wrap_next2_x_neg
    cmp al, MAP_W
    je .try_move_wrap_next2_x_pos
    jmp .try_move_wrap_next2_x_done
.try_move_wrap_next2_x_neg:
    mov al, MAP_W_MAX
    jmp .try_move_wrap_next2_x_done
.try_move_wrap_next2_x_pos:
    mov al, 0
.try_move_wrap_next2_x_done:
    mov [next2_x], al

    mov al, [next_y]
    add al, [move_dy]

    cmp al, 0xFF
    je .try_move_wrap_next2_y_neg
    cmp al, MAP_H
    je .try_move_wrap_next2_y_pos
    jmp .try_move_wrap_next2_y_done
.try_move_wrap_next2_y_neg:
    mov al, MAP_H_MAX
    jmp .try_move_wrap_next2_y_done
.try_move_wrap_next2_y_pos:
    mov al, 0
.try_move_wrap_next2_y_done:
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
    call relocate_box
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
; relocate_box
; - remove current BOX / BOX_ON_TARGET from map
; - place BOX on a random inner floor cell (x,y in 1..6)
; =============================================================================
relocate_box:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    ; remove current box overlays first
    mov el, 0
rbox_scan_y:
    cmp el, MAP_H
    je rbox_place

    mov fl, 0
rbox_scan_x:
    cmp fl, MAP_W
    je rbox_next_y

    call get_tile

    cmp al, TILE_BOX
    je rbox_clear_to_floor

    cmp al, TILE_BOX_ON_TARGET
    je rbox_clear_to_target

    jmp rbox_next_x

rbox_clear_to_floor:
    mov al, TILE_FLOOR
    call set_tile
    jmp rbox_next_x

rbox_clear_to_target:
    mov al, TILE_TARGET
    call set_tile

rbox_next_x:
    inc fl
    jmp rbox_scan_x

rbox_next_y:
    inc el
    jmp rbox_scan_y

rbox_place:
rbox_pick_cell:
    call random_inner_coord
    mov bl, al

    call random_inner_coord
    mov cl, al

    mov fl, bl
    mov el, cl
    call get_tile

    ; only place box on floor (not target/player)
    cmp al, TILE_FLOOR
    jne rbox_pick_cell

    mov al, TILE_BOX
    call set_tile

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

    ; draw 3x3 tiles (walls are rendered as floor; border drawn separately)
    call draw_cell3

    inc fl
    jmp .render_x

.next_render_y:
    inc el
    jmp .render_y

.after_map:
    call draw_board_border

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
    ; wall collision remains in map logic, but visual border is drawn by draw_board_border
    mov al, COL_FLOOR
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
; draw_board_border
; draws a continuous 2px border around the 8x8*3 playfield
; =============================================================================
draw_board_border:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov al, COL_WALL

    ; top border y=2..3, x=2..29
    mov el, 2
bb_top_row1:
    mov fl, 2
bb_top_row1_x:
    cmp fl, 30
    je bb_top_row2
    call screen_set_pixel
    inc fl
    jmp bb_top_row1_x

bb_top_row2:
    mov el, 3
    mov fl, 2
bb_top_row2_x:
    cmp fl, 30
    je bb_bottom_row1
    call screen_set_pixel
    inc fl
    jmp bb_top_row2_x

    ; bottom border y=28..29, x=2..29
bb_bottom_row1:
    mov el, 28
    mov fl, 2
bb_bottom_row1_x:
    cmp fl, 30
    je bb_bottom_row2
    call screen_set_pixel
    inc fl
    jmp bb_bottom_row1_x

bb_bottom_row2:
    mov el, 29
    mov fl, 2
bb_bottom_row2_x:
    cmp fl, 30
    je bb_left_col
    call screen_set_pixel
    inc fl
    jmp bb_bottom_row2_x

    ; left border x=2..3, y=2..29
bb_left_col:
    mov fl, 2
    mov el, 2
bb_left_col_y:
    cmp el, 30
    je bb_left_col2
    call screen_set_pixel
    inc el
    jmp bb_left_col_y

bb_left_col2:
    mov fl, 3
    mov el, 2
bb_left_col2_y:
    cmp el, 30
    je bb_right_col
    call screen_set_pixel
    inc el
    jmp bb_left_col2_y

    ; right border x=28..29, y=2..29
bb_right_col:
    mov fl, 28
    mov el, 2
bb_right_col_y:
    cmp el, 30
    je bb_right_col2
    call screen_set_pixel
    inc el
    jmp bb_right_col_y

bb_right_col2:
    mov fl, 29
    mov el, 2
bb_right_col2_y:
    cmp el, 30
    je bb_done
    call screen_set_pixel
    inc el
    jmp bb_right_col2_y

bb_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
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

    ; tile coords -> pixel coords (x3) + board offset
    mov dl, fl
    shl fl, 1
    add fl, dl
    add fl, BOARD_OFFSET_X

    mov dl, el
    shl el, 1
    add el, dl
    add el, BOARD_OFFSET_Y

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

    ; tile coords -> pixel coords (x3) + board offset
    mov dl, fl
    shl fl, 1
    add fl, dl
    add fl, BOARD_OFFSET_X

    mov dl, el
    shl el, 1
    add el, dl
    add el, BOARD_OFFSET_Y

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
