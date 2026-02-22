; Author: Bob + yomax
; Name: game_of_life
; Description: Conway's Game of Life (16x16, rendered 2x2 on 32x32)
;
; Controls:
; - N / SPACE: next generation
; - C: clear
; - R: random fill
; - ESC: quit
; - Switch 0: next generation
; - Switch 1: clear
; - Switch 2: random fill


; NOT FONCTIONNAL


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_console.asm"
.include "os/v3/drivers/lib_switchs.asm"

section .data
    KEY_N         equ 110
    KEY_N_UPPER   equ 78
    KEY_SPACE     equ 32
    KEY_C         equ 99
    KEY_C_UPPER   equ 67
    KEY_R         equ 114
    KEY_R_UPPER   equ 82
    KEY_ESC       equ 27

    COL_BG        equ 0x00
    COL_CELL      equ 0x55

    quit_flag     db 0

    rng_io_base   dw 0xF0A0

    msg_help_1    db "LIFE: N/SPACE next, C clear, R random", 0
    msg_help_2    db "Switch0 next, Switch1 clear, Switch2 random", 0
    msg_eol       db 10, 0

    ; 16x16 = 256 bytes
    cur_grid:
        ; first 16 bytes row0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

    next_grid:
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

section .text
    global _start

_start:
    mov al, 0
    mov [quit_flag], al

    call gol_seed_glider
    call gol_render
    call gol_print_help

gol_main:
    call gol_handle_switches
    call gol_handle_keyboard

    mov al, [quit_flag]
    cmp al, 1
    je gol_exit

    jmp gol_main

gol_exit:
    ret

gol_print_help:
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

gol_handle_switches:
    push al

    call get_switchs_pending
    cmp al, 0xFF
    je gol_sw_done

    cmp al, 0
    je gol_sw_next
    cmp al, 1
    je gol_sw_clear
    cmp al, 2
    je gol_sw_random
    jmp gol_sw_ack

gol_sw_next:
    call gol_step
    call gol_render
    jmp gol_sw_ack

gol_sw_clear:
    call gol_clear_all
    call gol_render
    jmp gol_sw_ack

gol_sw_random:
    call gol_random_fill
    call gol_render

gol_sw_ack:
    ; ack index in A
    call ack_switchs

gol_sw_done:
    pop al
    ret

gol_handle_keyboard:
    push al

    call get_keyboard_status
    and al, 0x01
    cmp al, 0
    je gol_k_done

    call get_keyboard_char
    call set_keyboard_status

    cmp al, KEY_ESC
    je gol_k_esc

    cmp al, KEY_SPACE
    je gol_k_next
    cmp al, KEY_N
    je gol_k_next
    cmp al, KEY_N_UPPER
    je gol_k_next

    cmp al, KEY_C
    je gol_k_clear
    cmp al, KEY_C_UPPER
    je gol_k_clear

    cmp al, KEY_R
    je gol_k_rand
    cmp al, KEY_R_UPPER
    je gol_k_rand

    jmp gol_k_done

gol_k_esc:
    mov al, 1
    mov [quit_flag], al
    jmp gol_k_done

gol_k_next:
    call gol_step
    call gol_render
    jmp gol_k_done

gol_k_clear:
    call gol_clear_all
    call gol_render
    jmp gol_k_done

gol_k_rand:
    call gol_random_fill
    call gol_render

gol_k_done:
    pop al
    ret

gol_seed_glider:
    call gol_clear_all
    ; simple glider near center
    ; (6,5) (7,6) (5,7) (6,7) (7,7)
    mov fl, 6
    mov el, 5
    mov al, 1
    call gol_set_cur

    mov fl, 7
    mov el, 6
    mov al, 1
    call gol_set_cur

    mov fl, 5
    mov el, 7
    mov al, 1
    call gol_set_cur

    mov fl, 6
    mov el, 7
    mov al, 1
    call gol_set_cur

    mov fl, 7
    mov el, 7
    mov al, 1
    call gol_set_cur
    ret

gol_clear_all:
    push al
    push cl
    push dl
    push el
    push fl

    mov el, 0
gol_clear_y:
    cmp el, 16
    je gol_clear_done
    mov fl, 0
gol_clear_x:
    cmp fl, 16
    je gol_clear_ny
    mov al, 0
    call gol_set_cur
    call gol_set_next
    inc fl
    jmp gol_clear_x
gol_clear_ny:
    inc el
    jmp gol_clear_y
gol_clear_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop al
    ret

gol_random_fill:
    push al
    push cl
    push dl
    push el
    push fl

    mov cl, [rng_io_base]
    mov dl, [rng_io_base + 1]

    mov el, 0
gol_rand_y:
    cmp el, 16
    je gol_rand_done
    mov fl, 0
gol_rand_x:
    cmp fl, 16
    je gol_rand_ny

    ldi al, cl, dl
    and al, 0x01
    call gol_set_cur

    inc fl
    jmp gol_rand_x
gol_rand_ny:
    inc el
    jmp gol_rand_y
gol_rand_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop al
    ret

; compute one generation
gol_step:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    mov el, 0
gol_step_y:
    cmp el, 16
    je gol_copy_next
    mov fl, 0
gol_step_x:
    cmp fl, 16
    je gol_step_ny

    ; neighbor count in BL
    mov bl, 0

    ; y-1 row
    cmp el, 0
    je gol_step_midrow
    ; x-1,y-1
    cmp fl, 0
    je gol_step_n1b
    dec fl
    dec el
    call gol_get_cur
    add bl, al
    inc fl
    inc el
gol_step_n1b:
    ; x,y-1
    dec el
    call gol_get_cur
    add bl, al
    inc el
    ; x+1,y-1
    cmp fl, 15
    je gol_step_midrow
    inc fl
    dec el
    call gol_get_cur
    add bl, al
    dec fl
    inc el

gol_step_midrow:
    ; x-1,y
    cmp fl, 0
    je gol_step_n3b
    dec fl
    call gol_get_cur
    add bl, al
    inc fl
gol_step_n3b:
    ; x+1,y
    cmp fl, 15
    je gol_step_botrow
    inc fl
    call gol_get_cur
    add bl, al
    dec fl

gol_step_botrow:
    cmp el, 15
    je gol_step_apply

    ; x-1,y+1
    cmp fl, 0
    je gol_step_n6b
    dec fl
    inc el
    call gol_get_cur
    add bl, al
    inc fl
    dec el
gol_step_n6b:
    ; x,y+1
    inc el
    call gol_get_cur
    add bl, al
    dec el
    ; x+1,y+1
    cmp fl, 15
    je gol_step_apply
    inc fl
    inc el
    call gol_get_cur
    add bl, al
    dec fl
    dec el

gol_step_apply:
    ; current state in AL
    call gol_get_cur
    cmp al, 1
    je gol_step_live

    ; dead -> alive if neighbors==3
    mov al, 0
    cmp bl, 3
    jne gol_step_store
    mov al, 1
    jmp gol_step_store

gol_step_live:
    ; live survives with 2 or 3
    mov al, 0
    cmp bl, 2
    je gol_step_survive
    cmp bl, 3
    je gol_step_survive
    jmp gol_step_store
gol_step_survive:
    mov al, 1

gol_step_store:
    call gol_set_next

    inc fl
    jmp gol_step_x
gol_step_ny:
    inc el
    jmp gol_step_y

; copy next->cur
gol_copy_next:
    mov el, 0
gol_copy_y:
    cmp el, 16
    je gol_step_done
    mov fl, 0
gol_copy_x:
    cmp fl, 16
    je gol_copy_ny
    call gol_get_next
    call gol_set_cur
    inc fl
    jmp gol_copy_x
gol_copy_ny:
    inc el
    jmp gol_copy_y

gol_step_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

gol_render:
    push al
    push el
    push fl

    ; clear 32x32
    mov al, COL_BG
    mov el, 0
gol_ry:
    cmp el, 32
    je gol_draw_cells
    mov fl, 0
gol_rx:
    cmp fl, 32
    je gol_rny
    call screen_set_pixel
    inc fl
    jmp gol_rx
gol_rny:
    inc el
    jmp gol_ry

; each grid cell => 2x2 block
gol_draw_cells:
    mov el, 0
gol_dy:
    cmp el, 16
    je gol_render_done
    mov fl, 0
gol_dx:
    cmp fl, 16
    je gol_dny

    call gol_get_cur
    cmp al, 1
    jne gol_dx_next

    mov al, COL_CELL
    call gol_draw_cell2

gol_dx_next:
    inc fl
    jmp gol_dx
gol_dny:
    inc el
    jmp gol_dy

gol_render_done:
    pop fl
    pop el
    pop al
    ret

; in FL=x(0..15), EL=y(0..15)
gol_draw_cell2:
    push al
    push bl
    push cl

    ; px = x*2, py = y*2
    mov bl, fl
    shl bl, 1
    mov cl, el
    shl cl, 1

    mov fl, bl
    mov el, cl
    call screen_set_pixel

    inc fl
    call screen_set_pixel

    dec fl
    inc el
    call screen_set_pixel

    inc fl
    call screen_set_pixel

    pop cl
    pop bl
    pop al
    ret

; grid access helpers
; in FL=x, EL=y
; out AL=cur[y*16+x]
gol_get_cur:
    push cl
    push dl
    push bl

    mov bl, el
    shl bl, 4
    add bl, fl

    lea cl, dl, [cur_grid]
    add cl, bl
    jnc gol_gc_noc
    inc dl
gol_gc_noc:
    ldi al, cl, dl

    pop bl
    pop dl
    pop cl
    ret

; in FL=x, EL=y, AL=value(0/1)
gol_set_cur:
    push cl
    push dl
    push bl

    mov bl, al
    mov al, el
    shl al, 4
    add al, fl

    lea cl, dl, [cur_grid]
    add cl, al
    jnc gol_sc_noc
    inc dl
gol_sc_noc:
    sti cl, dl, bl

    pop bl
    pop dl
    pop cl
    ret

; in FL=x, EL=y
; out AL=next[y*16+x]
gol_get_next:
    push cl
    push dl
    push bl

    mov bl, el
    shl bl, 4
    add bl, fl

    lea cl, dl, [next_grid]
    add cl, bl
    jnc gol_gn_noc
    inc dl
gol_gn_noc:
    ldi al, cl, dl

    pop bl
    pop dl
    pop cl
    ret

; in FL=x, EL=y, AL=value(0/1)
gol_set_next:
    push cl
    push dl
    push bl

    mov bl, al
    mov al, el
    shl al, 4
    add al, fl

    lea cl, dl, [next_grid]
    add cl, al
    jnc gol_sn_noc
    inc dl
gol_sn_noc:
    sti cl, dl, bl

    pop bl
    pop dl
    pop cl
    ret
