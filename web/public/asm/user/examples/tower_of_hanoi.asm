; tower_of_hanoi.asm (v1 simplified)
.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_console.asm"


section .data
  KEY_1 equ 49
  KEY_2 equ 50
  KEY_3 equ 51
  KEY_R equ 114
  KEY_ESC equ 27

  quit_flag db 0
  selected db 255
  ; pegs as counts only for simple visual demo
  peg0 db 3
  peg1 db 0
  peg2 db 0

  msg db "HANOI: select source then destination (1/2/3), R reset",10,0

section .text
    global _start

_start:
    call init_device_screen
    call init_device_keyboard
    call init_device_console

    lea cl, dl, [msg]
    call console_print_string
    call h_reset

.loop:
  call get_keyboard_status
  and al, 0x01
  cmp al, 0
  je .chk
  call get_keyboard_char
  mov bl, al
  call set_keyboard_status

  cmp bl, KEY_ESC
  je .q
  cmp bl, KEY_R
  je .do_reset
  cmp bl, KEY_1
  je .k1
  cmp bl, KEY_2
  je .k2
  cmp bl, KEY_3
  je .k3
  jmp .chk

.do_reset:
  call h_reset
  jmp .chk

.k1:
  mov al, 0
  call h_select_or_move
  jmp .chk
.k2:
  mov al, 1
  call h_select_or_move
  jmp .chk
.k3:
  mov al, 2
  call h_select_or_move
  jmp .chk

.q:
  mov al,1
  mov [quit_flag], al

.chk:
  mov al,[quit_flag]
  cmp al,1
  je .exit
  jmp .loop
.exit:
  ret

h_reset:
  mov al,0
  mov [quit_flag],al
  mov al,255
  mov [selected],al
  mov al,3
  mov [peg0],al
  mov al,0
  mov [peg1],al
  mov [peg2],al
  call h_render
  ret

h_select_or_move:
  ; in AL peg index
  mov bl, [selected]
  cmp bl, 255
  jne .move
  mov [selected], al
  call h_render
  ret
.move:
  ; pop from selected if >0, push to dst if valid (simple size-agnostic v1)
  mov bl, [selected]
  cmp bl, 0
  je .src0
  cmp bl, 1
  je .src1
  ; src2
  mov cl, [peg2]
  cmp cl,0
  je .done
  dec cl
  mov [peg2],cl
  jmp .dst
.src0:
  mov cl,[peg0]
  cmp cl,0
  je .done
  dec cl
  mov [peg0],cl
  jmp .dst
.src1:
  mov cl,[peg1]
  cmp cl,0
  je .done
  dec cl
  mov [peg1],cl

.dst:
  cmp al,0
  je .d0
  cmp al,1
  je .d1
  mov cl,[peg2]
  inc cl
  mov [peg2],cl
  jmp .done
.d0:
  mov cl,[peg0]
  inc cl
  mov [peg0],cl
  jmp .done
.d1:
  mov cl,[peg1]
  inc cl
  mov [peg1],cl

.done:
  mov bl,255
  mov [selected], bl
  call h_render
  ret

h_render:
  ; clear
  mov al,0x00
  mov el,0
.cly:
  cmp el,32
  je .draw
  mov fl,0
.clx:
  cmp fl,32
  je .nly
  call screen_set_pixel
  inc fl
  jmp .clx
.nly:
  inc el
  jmp .cly

.draw:
  ; draw three columns at x=6,16,26 with heights peg0/1/2
  mov fl,6
  mov bl,[peg0]
  call h_draw_col
  mov fl,16
  mov bl,[peg1]
  call h_draw_col
  mov fl,26
  mov bl,[peg2]
  call h_draw_col
  ret

h_draw_col:
  ; in fl=x bl=count
  mov el,28
.hd:
  cmp bl,0
  je .done
  mov al,0x55
  call screen_set_pixel
  dec el
  dec bl
  jmp .hd
.done:
  ret
