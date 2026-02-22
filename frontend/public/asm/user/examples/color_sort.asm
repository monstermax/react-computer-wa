; Author: Bob + yomax
; Name: color_sort
; Description: Color Sort (3 tubes x 4 cells) on 32x32 screen
;
; Controls:
; - 1/2/3: select source tube, then destination tube
; - R: reset
; - ESC: quit


; COMPILATION FAILED


.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_console.asm"

section .data
    KEY_1         equ 49
    KEY_2         equ 50
    KEY_3         equ 51
    KEY_R         equ 114
    KEY_R_UPPER   equ 82
    KEY_ESC       equ 27

    COL_BG        equ 0x00
    COL_TUBE      equ 0x88
    COL_C1        equ 0x2A
    COL_C2        equ 0xA0
    COL_C3        equ 0xE0
    COL_WIN       equ 0x55

    selected_src  db 0xFF
    quit_flag     db 0
    win_flag      db 0

    tube0_count   db 4
    tube1_count   db 4
    tube2_count   db 0

    ; bottom->top, 0 means empty
    tube0_0       db 1
    tube0_1       db 2
    tube0_2       db 1
    tube0_3       db 2

    tube1_0       db 2
    tube1_1       db 1
    tube1_2       db 2
    tube1_3       db 1

    tube2_0       db 0
    tube2_1       db 0
    tube2_2       db 0
    tube2_3       db 0

    msg_help_1    db "COLOR SORT: 1/2/3 then 1/2/3", 0
    msg_help_2    db "Rule: same color or empty tube", 0
    msg_invalid   db "Invalid pour", 0
    msg_win       db "Solved!", 0
    msg_eol       db 10, 0

section .text
    global _start

_start:
    call cs_reset
    call cs_print_help

cs_loop:
    call cs_handle_input
    mov al, [quit_flag]
    cmp al, 1
    je cs_quit
    jmp cs_loop

cs_quit:
    ret

cs_reset:
    mov al, 0
    mov [quit_flag], al
    mov [win_flag], al
    mov al, 0xFF
    mov [selected_src], al

    mov al, 4
    mov [tube0_count], al
    mov [tube1_count], al
    mov al, 0
    mov [tube2_count], al

    mov al, 1
    mov [tube0_0], al
    mov al, 2
    mov [tube0_1], al
    mov al, 1
    mov [tube0_2], al
    mov al, 2
    mov [tube0_3], al

    mov al, 2
    mov [tube1_0], al
    mov al, 1
    mov [tube1_1], al
    mov al, 2
    mov [tube1_2], al
    mov al, 1
    mov [tube1_3], al

    mov al, 0
    mov [tube2_0], al
    mov [tube2_1], al
    mov [tube2_2], al
    mov [tube2_3], al

    call cs_render
    ret

cs_print_help:
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

cs_print_invalid:
    push cl
    push dl
    lea cl, dl, [msg_invalid]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string
    pop dl
    pop cl
    ret

cs_print_win:
    push cl
    push dl
    lea cl, dl, [msg_win]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string
    pop dl
    pop cl
    ret

cs_handle_input:
    push al
    push bl

    call get_keyboard_status
    and al, 0x01
    cmp al, 0
    je cs_input_done

    call get_keyboard_char
    mov bl, al
    call set_keyboard_status

    mov al, bl
    cmp al, KEY_ESC
    je cs_key_esc
    cmp al, KEY_R
    je cs_key_reset
    cmp al, KEY_R_UPPER
    je cs_key_reset

    mov al, bl
    cmp al, KEY_1
    je cs_key_1
    cmp al, KEY_2
    je cs_key_2
    cmp al, KEY_3
    je cs_key_3
    jmp cs_input_done

cs_key_esc:
    mov al, 1
    mov [quit_flag], al
    jmp cs_input_done

cs_key_reset:
    call cs_reset
    jmp cs_input_done

cs_key_1:
    mov al, 0
    jmp cs_select_or_move
cs_key_2:
    mov al, 1
    jmp cs_select_or_move
cs_key_3:
    mov al, 2

cs_select_or_move:
    cmp [selected_src], 0xFF
    je cs_set_src

    mov bl, al ; dst
    mov al, [selected_src] ; src
    call cs_try_pour

    mov al, 0xFF
    mov [selected_src], al
    call cs_render
    jmp cs_input_done

cs_set_src:
    mov [selected_src], al

cs_input_done:
    pop bl
    pop al
    ret

; In: AL=src, BL=dst
cs_try_pour:
    push cl
    push dl
    push el

    ; source top in CL
    call cs_get_top
    mov cl, al
    cmp cl, 0
    je cs_pour_invalid

    ; destination top in DL, count in AL
    mov al, bl
    call cs_get_top
    mov dl, al

    mov al, bl
    call cs_get_count
    cmp al, 4
    je cs_pour_invalid

    ; destination must be empty or same color
    cmp dl, 0
    je cs_pour_valid
    cmp dl, cl
    jne cs_pour_invalid

cs_pour_valid:
    mov al, [selected_src]
    call cs_pop

    mov al, bl
    mov fl, cl
    call cs_push

    call cs_check_win
    mov al, [win_flag]
    cmp al, 1
    jne cs_pour_end
    call cs_print_win
    jmp cs_pour_end

cs_pour_invalid:
    call cs_print_invalid

cs_pour_end:
    pop el
    pop dl
    pop cl
    ret

; In AL=tube idx, Out AL=count
cs_get_count:
    cmp al, 0
    je cs_gc0
    cmp al, 1
    je cs_gc1
    mov al, [tube2_count]
    ret
cs_gc0:
    mov al, [tube0_count]
    ret
cs_gc1:
    mov al, [tube1_count]
    ret

; In AL=tube idx, Out AL=top color (0 if empty)
cs_get_top:
    push bl
    mov bl, al

    cmp bl, 0
    je cs_gt0
    cmp bl, 1
    je cs_gt1
    mov al, [tube2_count]
    cmp al, 0
    je cs_gte
    cmp al, 1
    je cs_gt2_0
    cmp al, 2
    je cs_gt2_1
    cmp al, 3
    je cs_gt2_2
    mov al, [tube2_3]
    jmp cs_gtd
cs_gt2_0: mov al, [tube2_0] ;
    jmp cs_gtd
cs_gt2_1: mov al, [tube2_1]
    jmp cs_gtd
cs_gt2_2: mov al, [tube2_2]
    jmp cs_gtd

cs_gt0:
    mov al, [tube0_count]
    cmp al, 0
    je cs_gte
    cmp al, 1
    je cs_gt0_0
    cmp al, 2
    je cs_gt0_1
    cmp al, 3
    je cs_gt0_2
    mov al, [tube0_3]
    jmp cs_gtd
cs_gt0_0: mov al, [tube0_0]
    jmp cs_gtd
cs_gt0_1: mov al, [tube0_1]
    jmp cs_gtd
cs_gt0_2: mov al, [tube0_2]
    jmp cs_gtd

cs_gt1:
    mov al, [tube1_count]
    cmp al, 0
    je cs_gte
    cmp al, 1
    je cs_gt1_0
    cmp al, 2
    je cs_gt1_1
    cmp al, 3
    je cs_gt1_2
    mov al, [tube1_3]
    jmp cs_gtd
cs_gt1_0: mov al, [tube1_0]
    jmp cs_gtd
cs_gt1_1: mov al, [tube1_1]
    jmp cs_gtd
cs_gt1_2: mov al, [tube1_2]
    jmp cs_gtd

cs_gte:
    mov al, 0
cs_gtd:
    pop bl
    ret

; In AL=tube idx, Out AL=popped color
cs_pop:
    push bl
    mov bl, al

    cmp bl, 0
    je cs_pop0
    cmp bl, 1
    je cs_pop1
    mov al, [tube2_count]
    cmp al, 0
    je cs_pope
    cmp al, 1
    je cs_pop2_0
    cmp al, 2
    je cs_pop2_1
    cmp al, 3
    je cs_pop2_2
    mov al, [tube2_3]
    mov [tube2_3], 0
    dec [tube2_count]
    jmp cs_popd
cs_pop2_0:
    mov al, [tube2_0]
    mov [tube2_0], 0
    dec [tube2_count]
    jmp cs_popd
cs_pop2_1:
    mov al, [tube2_1]
    mov [tube2_1], 0
    dec [tube2_count]
    jmp cs_popd
cs_pop2_2:
    mov al, [tube2_2]
    mov [tube2_2], 0
    dec [tube2_count]
    jmp cs_popd

cs_pop0:
    mov al, [tube0_count]
    cmp al, 0
    je cs_pope
    cmp al, 1
    je cs_pop0_0
    cmp al, 2
    je cs_pop0_1
    cmp al, 3
    je cs_pop0_2
    mov al, [tube0_3]
    mov [tube0_3], 0
    dec [tube0_count]
    jmp cs_popd
cs_pop0_0: mov al, [tube0_0]
    mov [tube0_0], 0
    dec [tube0_count]
    jmp cs_popd
cs_pop0_1: mov al, [tube0_1]
    mov [tube0_1], 0
    dec [tube0_count]
    jmp cs_popd
cs_pop0_2: mov al, [tube0_2]
    mov [tube0_2], 0
    dec [tube0_count]
    jmp cs_popd

cs_pop1:
    mov al, [tube1_count]
    cmp al, 0
    je cs_pope
    cmp al, 1
    je cs_pop1_0
    cmp al, 2
    je cs_pop1_1
    cmp al, 3
    je cs_pop1_2
    mov al, [tube1_3]
    mov [tube1_3], 0
    dec [tube1_count]
    jmp cs_popd
cs_pop1_0: mov al, [tube1_0]
    mov [tube1_0], 0
    dec [tube1_count]
    jmp cs_popd
cs_pop1_1: mov al, [tube1_1]
    mov [tube1_1], 0
    dec [tube1_count]
    jmp cs_popd
cs_pop1_2: mov al, [tube1_2]
    mov [tube1_2], 0
    dec [tube1_count]
    jmp cs_popd

cs_pope:
    mov al, 0
cs_popd:
    pop bl
    ret

; In AL=tube idx, FL=color
cs_push:
    push bl
    mov bl, al
    cmp bl, 0
    je cs_push0
    cmp bl, 1
    je cs_push1
    mov al, [tube2_count]
    cmp al, 0
    je cs_push2_0
    cmp al, 1
    je cs_push2_1
    cmp al, 2
    je cs_push2_2
    mov [tube2_3], fl
    inc [tube2_count]
    jmp cs_pushd
cs_push2_0: mov [tube2_0], fl
    inc [tube2_count]
    jmp cs_pushd
cs_push2_1: mov [tube2_1], fl
    inc [tube2_count]
    jmp cs_pushd
cs_push2_2: mov [tube2_2], fl
    inc [tube2_count]
    jmp cs_pushd

cs_push0:
    mov al, [tube0_count]
    cmp al, 0
    je cs_push0_0
    cmp al, 1
    je cs_push0_1
    cmp al, 2
    je cs_push0_2
    mov [tube0_3], fl
    inc [tube0_count]
    jmp cs_pushd
cs_push0_0: mov [tube0_0], fl
    inc [tube0_count]
    jmp cs_pushd
cs_push0_1: mov [tube0_1], fl
    inc [tube0_count]
    jmp cs_pushd
cs_push0_2: mov [tube0_2], fl
    inc [tube0_count]
    jmp cs_pushd

cs_push1:
    mov al, [tube1_count]
    cmp al, 0
    je cs_push1_0
    cmp al, 1
    je cs_push1_1
    cmp al, 2
    je cs_push1_2
    mov [tube1_3], fl
    inc [tube1_count]
    jmp cs_pushd
cs_push1_0: mov [tube1_0], fl
    inc [tube1_count]
    jmp cs_pushd
cs_push1_1: mov [tube1_1], fl
    inc [tube1_count]
    jmp cs_pushd
cs_push1_2: mov [tube1_2], fl
    inc [tube1_count]

cs_pushd:
    pop bl
    ret

cs_check_win:
    ; win if each non-empty tube is full and uniform
    mov al, 1
    mov [win_flag], al

    call cs_check_tube0
    cmp [win_flag], 0
    je cs_cw_end
    call cs_check_tube1
    cmp [win_flag], 0
    je cs_cw_end
    call cs_check_tube2

cs_cw_end:
    ret

cs_check_tube0:
    mov al, [tube0_count]
    cmp al, 0
    je cs_ct0_ok
    cmp al, 4
    jne cs_ct_bad
    mov al, [tube0_0]
    cmp al, [tube0_1]
    jne cs_ct_bad
    cmp al, [tube0_2]
    jne cs_ct_bad
    cmp al, [tube0_3]
    jne cs_ct_bad
cs_ct0_ok:
    ret

cs_check_tube1:
    mov al, [tube1_count]
    cmp al, 0
    je cs_ct1_ok
    cmp al, 4
    jne cs_ct_bad
    mov al, [tube1_0]
    cmp al, [tube1_1]
    jne cs_ct_bad
    cmp al, [tube1_2]
    jne cs_ct_bad
    cmp al, [tube1_3]
    jne cs_ct_bad
cs_ct1_ok:
    ret

cs_check_tube2:
    mov al, [tube2_count]
    cmp al, 0
    je cs_ct2_ok
    cmp al, 4
    jne cs_ct_bad
    mov al, [tube2_0]
    cmp al, [tube2_1]
    jne cs_ct_bad
    cmp al, [tube2_2]
    jne cs_ct_bad
    cmp al, [tube2_3]
    jne cs_ct_bad
cs_ct2_ok:
    ret

cs_ct_bad:
    mov al, 0
    mov [win_flag], al
    ret

cs_render:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    call cs_clear
    call cs_draw_tubes
    call cs_draw_liquids

    mov al, [win_flag]
    cmp al, 1
    jne cs_render_done
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

cs_render_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

cs_clear:
    push al
    push fl
    push el
    mov al, COL_BG
    mov el, 0
cs_cy:
    cmp el, 32
    je cs_cd
    mov fl, 0
cs_cx:
    cmp fl, 32
    je cs_cny
    call screen_set_pixel
    inc fl
    jmp cs_cx
cs_cny:
    inc el
    jmp cs_cy
cs_cd:
    pop el
    pop fl
    pop al
    ret

cs_draw_tubes:
    ; draw three tube outlines (x=7,15,23 ; y=8..24)
    push al
    push fl
    push el
    mov al, COL_TUBE

    ; tube0 sides x=6/8
    mov el, 8
cs_t0y:
    cmp el, 25
    je cs_t1
    mov fl, 6
    call screen_set_pixel
    mov fl, 8
    call screen_set_pixel
    inc el
    jmp cs_t0y

cs_t1:
    mov el, 8
cs_t1y:
    cmp el, 25
    je cs_t2
    mov fl, 14
    call screen_set_pixel
    mov fl, 16
    call screen_set_pixel
    inc el
    jmp cs_t1y

cs_t2:
    mov el, 8
cs_t2y:
    cmp el, 25
    je cs_tb
    mov fl, 22
    call screen_set_pixel
    mov fl, 24
    call screen_set_pixel
    inc el
    jmp cs_t2y

cs_tb:
    ; bottoms y=24
    mov el, 24
    mov fl, 6
    call screen_set_pixel
    mov fl, 7
    call screen_set_pixel
    mov fl, 8
    call screen_set_pixel

    mov fl, 14
    call screen_set_pixel
    mov fl, 15
    call screen_set_pixel
    mov fl, 16
    call screen_set_pixel

    mov fl, 22
    call screen_set_pixel
    mov fl, 23
    call screen_set_pixel
    mov fl, 24
    call screen_set_pixel

    pop el
    pop fl
    pop al
    ret

cs_draw_liquids:
    call cs_draw_tube0
    call cs_draw_tube1
    call cs_draw_tube2
    ret

cs_draw_tube0:
    mov al, [tube0_0]
    mov bl, 0
    mov cl, 0
    call cs_draw_cell
    mov al, [tube0_1]
    mov bl, 0
    mov cl, 1
    call cs_draw_cell
    mov al, [tube0_2]
    mov bl, 0
    mov cl, 2
    call cs_draw_cell
    mov al, [tube0_3]
    mov bl, 0
    mov cl, 3
    call cs_draw_cell
    ret

cs_draw_tube1:
    mov al, [tube1_0]
    mov bl, 1
    mov cl, 0
    call cs_draw_cell
    mov al, [tube1_1]
    mov bl, 1
    mov cl, 1
    call cs_draw_cell
    mov al, [tube1_2]
    mov bl, 1
    mov cl, 2
    call cs_draw_cell
    mov al, [tube1_3]
    mov bl, 1
    mov cl, 3
    call cs_draw_cell
    ret

cs_draw_tube2:
    mov al, [tube2_0]
    mov bl, 2
    mov cl, 0
    call cs_draw_cell
    mov al, [tube2_1]
    mov bl, 2
    mov cl, 1
    call cs_draw_cell
    mov al, [tube2_2]
    mov bl, 2
    mov cl, 2
    call cs_draw_cell
    mov al, [tube2_3]
    mov bl, 2
    mov cl, 3
    call cs_draw_cell
    ret

; AL=color id (0..2), BL=tube idx, CL=level from bottom (0..3)
cs_draw_cell:
    push dl
    push el
    push fl

    cmp al, 0
    je cs_dc_done

    ; map color
    cmp al, 1
    je cs_dc_c1
    cmp al, 2
    je cs_dc_c2
    mov al, COL_C3
    jmp cs_dc_color_ok
cs_dc_c1:
    mov al, COL_C1
    jmp cs_dc_color_ok
cs_dc_c2:
    mov al, COL_C2

cs_dc_color_ok:
    ; center x in tube interior: 7 / 15 / 23
    cmp bl, 0
    je cs_dc_x0
    cmp bl, 1
    je cs_dc_x1
    mov fl, 23
    jmp cs_dc_xok
cs_dc_x0:
    mov fl, 7
    jmp cs_dc_xok
cs_dc_x1:
    mov fl, 15

cs_dc_xok:
    ; y levels bottom-up: 23,19,15,11
    mov el, 23
    cmp cl, 0
    je cs_dc_yok
    cmp cl, 1
    je cs_dc_y1
    cmp cl, 2
    je cs_dc_y2
    mov el, 11
    jmp cs_dc_yok
cs_dc_y1:
    mov el, 19
    jmp cs_dc_yok
cs_dc_y2:
    mov el, 15

cs_dc_yok:
    ; draw 1x3 vertical block
    call screen_set_pixel
    inc el
    call screen_set_pixel
    inc el
    call screen_set_pixel

cs_dc_done:
    pop fl
    pop el
    pop dl
    ret
