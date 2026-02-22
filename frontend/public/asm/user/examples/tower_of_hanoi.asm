; Author: Bob + yomax
; Name: tower_of_hanoi
; Description: Tower of Hanoi (3 pegs, 3 disks) on 32x32 screen
;
; Controls:
; - 1/2/3: select source peg, then destination peg
; - R: reset
; - ESC: quit


; A DEBUGUER


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
    COL_PEG       equ 0x80
    COL_D1        equ 0x30
    COL_D2        equ 0x60
    COL_D3        equ 0x90
    COL_WIN       equ 0x55

    selected_src  db 0xFF
    quit_flag     db 0
    win_flag      db 0

    peg0_count    db 3
    peg1_count    db 0
    peg2_count    db 0

    ; bottom->top slots
    peg0_0        db 3
    peg0_1        db 2
    peg0_2        db 1

    peg1_0        db 0
    peg1_1        db 0
    peg1_2        db 0

    peg2_0        db 0
    peg2_1        db 0
    peg2_2        db 0

    msg_help_1    db "HANOI: press 1/2/3 then 1/2/3", 0
    msg_help_2    db "Move all disks to peg 3", 0
    msg_invalid   db "Invalid move", 0
    msg_win       db "Solved!", 0
    msg_eol       db 10, 0

section .text
    global _start

_start:
    call hanoi_reset
    call hanoi_print_help

hanoi_main_loop:
    call hanoi_handle_input

    mov al, [quit_flag]
    cmp al, 1
    je hanoi_quit

    jmp hanoi_main_loop

hanoi_quit:
    ret

hanoi_reset:
    mov al, 0
    mov [quit_flag], al
    mov [win_flag], al
    mov al, 0xFF
    mov [selected_src], al

    mov al, 3
    mov [peg0_count], al
    mov al, 0
    mov [peg1_count], al
    mov [peg2_count], al

    mov al, 3
    mov [peg0_0], al
    mov al, 2
    mov [peg0_1], al
    mov al, 1
    mov [peg0_2], al

    mov al, 0
    mov [peg1_0], al
    mov [peg1_1], al
    mov [peg1_2], al
    mov [peg2_0], al
    mov [peg2_1], al
    mov [peg2_2], al

    call hanoi_render
    ret

hanoi_print_help:
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

hanoi_print_invalid:
    push cl
    push dl
    lea cl, dl, [msg_invalid]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string
    pop dl
    pop cl
    ret

hanoi_print_win:
    push cl
    push dl
    lea cl, dl, [msg_win]
    call console_print_string
    lea cl, dl, [msg_eol]
    call console_print_string
    pop dl
    pop cl
    ret

hanoi_handle_input:
    push al
    push bl

    call get_keyboard_status
    and al, 0x01
    cmp al, 0
    je hanoi_input_done

    call get_keyboard_char
    mov bl, al
    call set_keyboard_status

    ; reset/quit
    mov al, bl
    cmp al, KEY_ESC
    je hanoi_key_esc
    cmp al, KEY_R
    je hanoi_key_reset
    cmp al, KEY_R_UPPER
    je hanoi_key_reset

    ; peg key -> AL in [0..2]
    mov al, bl
    cmp al, KEY_1
    je hanoi_key_p1
    cmp al, KEY_2
    je hanoi_key_p2
    cmp al, KEY_3
    je hanoi_key_p3
    jmp hanoi_input_done

hanoi_key_esc:
    mov al, 1
    mov [quit_flag], al
    jmp hanoi_input_done

hanoi_key_reset:
    call hanoi_reset
    jmp hanoi_input_done

hanoi_key_p1:
    mov al, 0
    jmp hanoi_select_or_move
hanoi_key_p2:
    mov al, 1
    jmp hanoi_select_or_move
hanoi_key_p3:
    mov al, 2

hanoi_select_or_move:
    ; AL = peg index pressed
    cmp [selected_src], 0xFF
    je hanoi_set_src

    ; destination selected -> attempt move src->dst
    mov bl, al ; dst
    mov al, [selected_src] ; src
    call hanoi_try_move

    mov al, 0xFF
    mov [selected_src], al
    call hanoi_render
    jmp hanoi_input_done

hanoi_set_src:
    mov [selected_src], al

hanoi_input_done:
    pop bl
    pop al
    ret

; In: AL=src, BL=dst
hanoi_try_move:
    push cl
    push dl
    push el
    push fl

    ; src top disk -> CL (0 means empty)
    call hanoi_get_top
    mov cl, al
    cmp cl, 0
    je hanoi_try_move_invalid

    ; dst top disk -> DL
    mov al, bl
    call hanoi_get_top
    mov dl, al

    ; valid if dst empty OR dst > src (larger number means larger disk)
    cmp dl, 0
    je hanoi_try_move_valid

    ; if dst < src => invalid
    cmp dl, cl
    jl hanoi_try_move_invalid

hanoi_try_move_valid:
    ; pop src
    mov al, [selected_src]
    call hanoi_pop

    ; push to dst (disk in CL)
    mov al, bl
    mov fl, cl
    call hanoi_push

    ; win if peg2_count == 3
    mov al, [peg2_count]
    cmp al, 3
    jne hanoi_try_move_end
    mov al, 1
    mov [win_flag], al
    call hanoi_print_win
    jmp hanoi_try_move_end

hanoi_try_move_invalid:
    call hanoi_print_invalid

hanoi_try_move_end:
    pop fl
    pop el
    pop dl
    pop cl
    ret

; In AL=peg idx, Out AL=top disk (0 if empty)
hanoi_get_top:
    push bl
    mov bl, al

    cmp bl, 0
    je hanoi_top_p0
    cmp bl, 1
    je hanoi_top_p1
    ; p2
    mov al, [peg2_count]
    cmp al, 0
    je hanoi_top_empty
    cmp al, 1
    je hanoi_top_p2_0
    cmp al, 2
    je hanoi_top_p2_1
    mov al, [peg2_2]
    jmp hanoi_top_done
hanoi_top_p2_0:
    mov al, [peg2_0]
    jmp hanoi_top_done
hanoi_top_p2_1:
    mov al, [peg2_1]
    jmp hanoi_top_done

hanoi_top_p0:
    mov al, [peg0_count]
    cmp al, 0
    je hanoi_top_empty
    cmp al, 1
    je hanoi_top_p0_0
    cmp al, 2
    je hanoi_top_p0_1
    mov al, [peg0_2]
    jmp hanoi_top_done
hanoi_top_p0_0:
    mov al, [peg0_0]
    jmp hanoi_top_done
hanoi_top_p0_1:
    mov al, [peg0_1]
    jmp hanoi_top_done

hanoi_top_p1:
    mov al, [peg1_count]
    cmp al, 0
    je hanoi_top_empty
    cmp al, 1
    je hanoi_top_p1_0
    cmp al, 2
    je hanoi_top_p1_1
    mov al, [peg1_2]
    jmp hanoi_top_done
hanoi_top_p1_0:
    mov al, [peg1_0]
    jmp hanoi_top_done
hanoi_top_p1_1:
    mov al, [peg1_1]
    jmp hanoi_top_done

hanoi_top_empty:
    mov al, 0
hanoi_top_done:
    pop bl
    ret

; In AL=peg idx, Out AL=popped disk (0 if empty)
hanoi_pop:
    push bl
    mov bl, al

    cmp bl, 0
    je hanoi_pop_p0
    cmp bl, 1
    je hanoi_pop_p1
    ; p2
    mov al, [peg2_count]
    cmp al, 0
    je hanoi_pop_empty
    cmp al, 1
    je hanoi_pop_p2_0
    cmp al, 2
    je hanoi_pop_p2_1
    mov al, [peg2_2]
    mov [peg2_2], 0
    dec [peg2_count]
    jmp hanoi_pop_done
hanoi_pop_p2_0:
    mov al, [peg2_0]
    mov [peg2_0], 0
    dec [peg2_count]
    jmp hanoi_pop_done
hanoi_pop_p2_1:
    mov al, [peg2_1]
    mov [peg2_1], 0
    dec [peg2_count]
    jmp hanoi_pop_done

hanoi_pop_p0:
    mov al, [peg0_count]
    cmp al, 0
    je hanoi_pop_empty
    cmp al, 1
    je hanoi_pop_p0_0
    cmp al, 2
    je hanoi_pop_p0_1
    mov al, [peg0_2]
    mov [peg0_2], 0
    dec [peg0_count]
    jmp hanoi_pop_done
hanoi_pop_p0_0:
    mov al, [peg0_0]
    mov [peg0_0], 0
    dec [peg0_count]
    jmp hanoi_pop_done
hanoi_pop_p0_1:
    mov al, [peg0_1]
    mov [peg0_1], 0
    dec [peg0_count]
    jmp hanoi_pop_done

hanoi_pop_p1:
    mov al, [peg1_count]
    cmp al, 0
    je hanoi_pop_empty
    cmp al, 1
    je hanoi_pop_p1_0
    cmp al, 2
    je hanoi_pop_p1_1
    mov al, [peg1_2]
    mov [peg1_2], 0
    dec [peg1_count]
    jmp hanoi_pop_done
hanoi_pop_p1_0:
    mov al, [peg1_0]
    mov [peg1_0], 0
    dec [peg1_count]
    jmp hanoi_pop_done
hanoi_pop_p1_1:
    mov al, [peg1_1]
    mov [peg1_1], 0
    dec [peg1_count]
    jmp hanoi_pop_done

hanoi_pop_empty:
    mov al, 0
hanoi_pop_done:
    pop bl
    ret

; In AL=peg idx, FL=disk
hanoi_push:
    push bl
    mov bl, al

    cmp bl, 0
    je hanoi_push_p0
    cmp bl, 1
    je hanoi_push_p1
    ; p2
    mov al, [peg2_count]
    cmp al, 0
    je hanoi_push_p2_0
    cmp al, 1
    je hanoi_push_p2_1
    mov [peg2_2], fl
    inc [peg2_count]
    jmp hanoi_push_done
hanoi_push_p2_0:
    mov [peg2_0], fl
    inc [peg2_count]
    jmp hanoi_push_done
hanoi_push_p2_1:
    mov [peg2_1], fl
    inc [peg2_count]
    jmp hanoi_push_done

hanoi_push_p0:
    mov al, [peg0_count]
    cmp al, 0
    je hanoi_push_p0_0
    cmp al, 1
    je hanoi_push_p0_1
    mov [peg0_2], fl
    inc [peg0_count]
    jmp hanoi_push_done
hanoi_push_p0_0:
    mov [peg0_0], fl
    inc [peg0_count]
    jmp hanoi_push_done
hanoi_push_p0_1:
    mov [peg0_1], fl
    inc [peg0_count]
    jmp hanoi_push_done

hanoi_push_p1:
    mov al, [peg1_count]
    cmp al, 0
    je hanoi_push_p1_0
    cmp al, 1
    je hanoi_push_p1_1
    mov [peg1_2], fl
    inc [peg1_count]
    jmp hanoi_push_done
hanoi_push_p1_0:
    mov [peg1_0], fl
    inc [peg1_count]
    jmp hanoi_push_done
hanoi_push_p1_1:
    mov [peg1_1], fl
    inc [peg1_count]

hanoi_push_done:
    pop bl
    ret

hanoi_render:
    push al
    push bl
    push cl
    push dl
    push el
    push fl

    call hanoi_clear_screen
    call hanoi_draw_pegs
    call hanoi_draw_all_disks

    ; win marker 2x2
    mov al, [win_flag]
    cmp al, 1
    jne hanoi_render_done
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

hanoi_render_done:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    pop al
    ret

hanoi_clear_screen:
    push al
    push fl
    push el
    mov al, COL_BG
    mov el, 0
hanoi_clear_y:
    cmp el, 32
    je hanoi_clear_done
    mov fl, 0
hanoi_clear_x:
    cmp fl, 32
    je hanoi_clear_next_y
    call screen_set_pixel
    inc fl
    jmp hanoi_clear_x
hanoi_clear_next_y:
    inc el
    jmp hanoi_clear_y
hanoi_clear_done:
    pop el
    pop fl
    pop al
    ret

hanoi_draw_pegs:
    push al
    push fl
    push el

    mov al, COL_PEG

    ; peg x = 8
    mov fl, 8
    mov el, 12
hanoi_peg0_loop:
    cmp el, 29
    je hanoi_peg1_start
    call screen_set_pixel
    inc el
    jmp hanoi_peg0_loop

hanoi_peg1_start:
    mov fl, 16
    mov el, 12
hanoi_peg1_loop:
    cmp el, 29
    je hanoi_peg2_start
    call screen_set_pixel
    inc el
    jmp hanoi_peg1_loop

hanoi_peg2_start:
    mov fl, 24
    mov el, 12
hanoi_peg2_loop:
    cmp el, 29
    je hanoi_pegs_done
    call screen_set_pixel
    inc el
    jmp hanoi_peg2_loop

hanoi_pegs_done:
    pop el
    pop fl
    pop al
    ret

hanoi_draw_all_disks:
    ; draw peg0 slots 0..2, then peg1, peg2
    call hanoi_draw_peg0
    call hanoi_draw_peg1
    call hanoi_draw_peg2
    ret

hanoi_draw_peg0:
    mov al, [peg0_0]
    mov bl, 0
    mov cl, 0
    call hanoi_draw_disk_slot
    mov al, [peg0_1]
    mov bl, 0
    mov cl, 1
    call hanoi_draw_disk_slot
    mov al, [peg0_2]
    mov bl, 0
    mov cl, 2
    call hanoi_draw_disk_slot
    ret

hanoi_draw_peg1:
    mov al, [peg1_0]
    mov bl, 1
    mov cl, 0
    call hanoi_draw_disk_slot
    mov al, [peg1_1]
    mov bl, 1
    mov cl, 1
    call hanoi_draw_disk_slot
    mov al, [peg1_2]
    mov bl, 1
    mov cl, 2
    call hanoi_draw_disk_slot
    ret

hanoi_draw_peg2:
    mov al, [peg2_0]
    mov bl, 2
    mov cl, 0
    call hanoi_draw_disk_slot
    mov al, [peg2_1]
    mov bl, 2
    mov cl, 1
    call hanoi_draw_disk_slot
    mov al, [peg2_2]
    mov bl, 2
    mov cl, 2
    call hanoi_draw_disk_slot
    ret

; In: AL=disk size(0..3), BL=peg idx(0..2), CL=slot(0 bottom..2 top)
hanoi_draw_disk_slot:
    push dl
    push el
    push fl

    cmp al, 0
    je hanoi_dd_done

    ; color by disk size
    cmp al, 1
    je hanoi_dd_c1
    cmp al, 2
    je hanoi_dd_c2
    mov al, COL_D3
    jmp hanoi_dd_color_ok
hanoi_dd_c1:
    mov al, COL_D1
    jmp hanoi_dd_color_ok
hanoi_dd_c2:
    mov al, COL_D2

hanoi_dd_color_ok:
    ; center x by peg
    cmp bl, 0
    je hanoi_dd_x0
    cmp bl, 1
    je hanoi_dd_x1
    mov fl, 24
    jmp hanoi_dd_xok
hanoi_dd_x0:
    mov fl, 8
    jmp hanoi_dd_xok
hanoi_dd_x1:
    mov fl, 16

hanoi_dd_xok:
    ; y by slot: 27,24,21
    mov el, 27
    cmp cl, 0
    je hanoi_dd_yok
    cmp cl, 1
    je hanoi_dd_y1
    mov el, 21
    jmp hanoi_dd_yok
hanoi_dd_y1:
    mov el, 24

hanoi_dd_yok:
    ; width by size: 3,5,7
    ; draw horizontal centered line
    ; start x = center-1 / -2 / -3
    cmp al, COL_D1
    je hanoi_dd_w1
    cmp al, COL_D2
    je hanoi_dd_w2

    ; w=7
    sub fl, 3
    mov dl, 7
    jmp hanoi_dd_draw
hanoi_dd_w2:
    sub fl, 2
    mov dl, 5
    jmp hanoi_dd_draw
hanoi_dd_w1:
    sub fl, 1
    mov dl, 3

hanoi_dd_draw:
hanoi_dd_loop:
    cmp dl, 0
    je hanoi_dd_done
    call screen_set_pixel
    inc fl
    dec dl
    jmp hanoi_dd_loop

hanoi_dd_done:
    pop fl
    pop el
    pop dl
    ret
