; trex_game.asm (v1 simplified, step-based runner)

%include "os/v3/drivers/lib_screen.asm"
%include "os/v3/drivers/lib_keyboard.asm"
%include "os/v3/drivers/lib_console.asm"

section .data
  KEY_SPACE equ 32
  KEY_N equ 110
  KEY_ESC equ 27

  quit_flag db 0
  dino_y db 24
  jump_timer db 0
  obs_x db 30
  score db 0

  msg db "TREX mini: SPACE jump, N next tick, ESC quit",10,0

section .text
    global _start

_start:
    call init_device_screen
    call init_device_keyboard
    call init_device_console

  lea cl, dl, [msg]
  call console_print_string
  call tx_render

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
  cmp bl,KEY_SPACE
  je .jump
  cmp bl,KEY_N
  je .tick
  jmp .chk

.jump:
  mov al,6
  mov [jump_timer],al
  jmp .tick

.tick:
  call tx_step
  call tx_render
  jmp .chk

.quit:
  mov al,1
  mov [quit_flag],al

.chk:
  mov al,[quit_flag]
  cmp al,1
  je .exit
  jmp .loop
.exit:
  ret

tx_step:
  ; jump physics (very simple)
  mov al,[jump_timer]
  cmp al,0
  je .gravity
  dec al
  mov [jump_timer],al
  mov al,[dino_y]
  cmp al,16
  je .obs
  dec al
  mov [dino_y],al
  jmp .obs

.gravity:
  mov al,[dino_y]
  cmp al,24
  je .obs
  inc al
  mov [dino_y],al

.obs:
  mov al,[obs_x]
  dec al
  cmp al,255
  jne .setobs
  mov al,30
  mov bl,[score]
  inc bl
  mov [score],bl
.setobs:
  mov [obs_x],al

  ; collision (same x and ground-ish y)
  mov al,[obs_x]
  cmp al,6
  jne .done
  mov al,[dino_y]
  cmp al,22
  jl .done
  ; hit => reset score and obstacle
  mov al,0
  mov [score],al
  mov al,30
  mov [obs_x],al
.done:
  ret

tx_render:
  ; clear
  mov al,0
  mov el,0
.cly:
  cmp el,32
  je .ground
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

.ground:
  mov al,0x44
  mov el,26
  mov fl,0
.gx:
  cmp fl,32
  je .dino
  call screen_set_pixel
  inc fl
  jmp .gx

.dino:
  mov al,0xE0
  mov fl,6
  mov el,[dino_y]
  call screen_set_pixel

.obs:
  mov al,0x2A
  mov fl,[obs_x]
  mov el,24
  call screen_set_pixel
  ret
