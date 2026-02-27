; snake_game.asm (v1 simplified, step by key)
.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_console.asm"

section .data
  KEY_Z equ 122
  KEY_W equ 119
  KEY_S equ 115
  KEY_Q equ 113
  KEY_A equ 97
  KEY_D equ 100
  KEY_ESC equ 27

  quit_flag db 0
  px db 4
  py db 4
  fx db 2
  fy db 2

  msg db "SNAKE mini: ZQSD/WASD moves, ESC quit",10,0

section .text
global _start
_start:
  lea cl, dl, [msg]
  call console_print_string
  call sn_render

.loop:
  call get_keyboard_status
  and al,0x01
  cmp al,0
  je .chk

  call get_keyboard_char
  mov bl,al
  call set_keyboard_status

  cmp bl,KEY_ESC
  je .quit

  ; move
  cmp bl,KEY_Z
  je .up
  cmp bl,KEY_W
  je .up
  cmp bl,KEY_S
  je .down
  cmp bl,KEY_Q
  je .left
  cmp bl,KEY_A
  je .left
  cmp bl,KEY_D
  je .right
  jmp .chk

.up:
  mov al,[py]
  dec al
  cmp al,255
  jne .sety
  mov al,7
.sety:
  mov [py],al
  jmp .after_move
.down:
  mov al,[py]
  inc al
  cmp al,8
  jne .sety2
  mov al,0
.sety2:
  mov [py],al
  jmp .after_move
.left:
  mov al,[px]
  dec al
  cmp al,255
  jne .setx
  mov al,7
.setx:
  mov [px],al
  jmp .after_move
.right:
  mov al,[px]
  inc al
  cmp al,8
  jne .setx2
  mov al,0
.setx2:
  mov [px],al

.after_move:
  ; eat food => move food
  mov al,[px]
  cmp al,[fx]
  jne .render
  mov al,[py]
  cmp al,[fy]
  jne .render
  mov al,[fx]
  add al,3
  and al,7
  mov [fx],al
  mov al,[fy]
  add al,5
  and al,7
  mov [fy],al

.render:
  call sn_render

.chk:
  mov al,[quit_flag]
  cmp al,1
  je .exit
  jmp .loop

.quit:
  mov al,1
  mov [quit_flag],al
  jmp .chk
.exit:
  ret

sn_render:
  ; clear
  mov al,0
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
  ; draw food yellow (4x4)
  mov al,0x2A
  mov fl,[fx]
  mov el,[fy]
  call sn_draw_cell4

  ; draw player magenta (4x4)
  mov al,0xE0
  mov fl,[px]
  mov el,[py]
  call sn_draw_cell4
  ret

sn_draw_cell4:
  ; in al color fl=x el=y (tile 0..7)
  push al
  push bl
  push cl
  push dl
  push el
  push fl
  mov bl,al
  shl fl,2
  shl el,2
  mov cl,0
.ry:
  cmp cl,4
  je .done
  mov dl,0
.rx:
  cmp dl,4
  je .nrow
  mov al,bl
  call screen_set_pixel
  inc fl
  inc dl
  jmp .rx
.nrow:
  sub fl,4
  inc el
  inc cl
  jmp .ry
.done:
  pop fl
  pop el
  pop dl
  pop cl
  pop bl
  pop al
  ret
