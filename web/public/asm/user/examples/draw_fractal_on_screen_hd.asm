


.org 0xA000

.include "os/v3/drivers/lib_screen_hd.asm"


section .data
    ;screenhd_io_base  dw 0xF0D0


section .text
    global _start


_start:
    call init_device_screenhd

    ; Example: XOR fractal on screen
    mov el, 0

    .loop_y:
        cmp el, 255
        je .done
        mov fl, 0

    .loop_x:
        cmp fl, 255
        je .next_y
        mov al, fl
        xor al, el
        shl al, 3
        call screen_set_pixel
        inc fl
        jmp .loop_x

    .next_y:
        inc el
        jmp .loop_y

    .done:
        ret


; --- Screen Utility: screen_set_pixel ---
; Input: F=X, E=Y, AL=color
screen_set_pixel:
    push cl
    push dl
    mov cl, [screenhd_io_base]
    mov dl, [screenhd_io_base + 1]
    sti cl, dl, fl
    call _inc_cd
    sti cl, dl, el
    call _inc_cd
    sti cl, dl, al
    pop dl
    pop cl
    ret


; --- Math Utility: _inc_cd ---
_inc_cd:
    inc cl
    jnc ._no_carry
    inc dl
    ._no_carry:
    ret

