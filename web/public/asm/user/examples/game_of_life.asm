; game_of_life.asm (v1 simplified, step-based)

%include "os/v3/drivers/lib_screen.asm"
%include "os/v3/drivers/lib_keyboard.asm"
%include "os/v3/drivers/lib_console.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
  W equ 8
  H equ 8
  KEY_N equ 110
  KEY_SPACE equ 32
  KEY_R equ 114
  KEY_C equ 99
  KEY_ESC equ 27

  quit_flag db 0
  msg db "LIFE: N/SPACE next, R random, C clear, ESC quit",10,0

  grid:
    db 0,0,0,0,0,0,0,0
    db 0,0,0,1,0,0,0,0
    db 0,0,0,0,1,0,0,0
    db 0,0,1,1,1,0,0,0
    db 0,0,0,0,0,0,0,0
    db 0,0,0,0,0,0,0,0
    db 0,0,0,0,0,0,0,0
    db 0,0,0,0,0,0,0,0

  next_grid:
    db 0,0,0,0,0,0,0,0
    db 0,0,0,0,0,0,0,0
    db 0,0,0,0,0,0,0,0
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

  lea cl, dl, [msg]
  call console_print_string
  call life_render

.life_loop:
  call get_keyboard_status
  and al, 0x01
  cmp al, 0
  je .chk_quit

  call get_keyboard_char
  mov bl, al
  call set_keyboard_status

  cmp bl, KEY_ESC
  je .set_quit
  cmp bl, KEY_N
  je .step
  cmp bl, KEY_SPACE
  je .step
  cmp bl, KEY_C
  je .clear
  cmp bl, KEY_R
  je .random
  jmp .chk_quit

.step:
  call life_step
  call life_render
  jmp .chk_quit

.clear:
  call life_clear
  call life_render
  jmp .chk_quit

.random:
  call life_random
  call life_render
  jmp .chk_quit

.set_quit:
  mov al, 1
  mov [quit_flag], al

.chk_quit:
  mov al, [quit_flag]
  cmp al, 1
  je .exit
  jmp .life_loop

.exit:
  ret

life_clear:
  mov el, 0
.lc_y:
  cmp el, H
  je .lc_done
  mov fl, 0
.lc_x:
  cmp fl, W
  je .lc_ny
  mov al, 0
  call life_set
  inc fl
  jmp .lc_x
.lc_ny:
  inc el
  jmp .lc_y
.lc_done:
  ret

life_random:
  ; deterministic pseudo-random pattern without rng device
  mov el, 0
.lr_y:
  cmp el, H
  je .lr_done
  mov fl, 0
.lr_x:
  cmp fl, W
  je .lr_ny
  mov al, fl
  add al, el
  and al, 0x01
  call life_set
  inc fl
  jmp .lr_x
.lr_ny:
  inc el
  jmp .lr_y
.lr_done:
  ret

life_step:
  mov el, 0
.ls_y:
  cmp el, H
  je .copy
  mov fl, 0
.ls_x:
  cmp fl, W
  je .ls_ny

  call life_neighbors
  mov bl, al
  call life_get
  mov bh, al

  mov al, 0
  cmp bh, 1
  je .live_rule
  cmp bl, 3
  je .become
  jmp .store
.live_rule:
  cmp bl, 2
  je .become
  cmp bl, 3
  je .become
  jmp .store
.become:
  mov al, 1
.store:
  call life_set_next

  inc fl
  jmp .ls_x
.ls_ny:
  inc el
  jmp .ls_y

.copy:
  mov el, 0
.cp_y:
  cmp el, H
  je .done
  mov fl, 0
.cp_x:
  cmp fl, W
  je .cp_ny
  call life_get_next
  call life_set
  inc fl
  jmp .cp_x
.cp_ny:
  inc el
  jmp .cp_y
.done:
  ret

life_neighbors:
  ; out AL=count
  mov al, 0
  ; only inner cells to keep simple
  cmp fl, 0
  je .n_done
  cmp el, 0
  je .n_done
  cmp fl, 7
  je .n_done
  cmp el, 7
  je .n_done

  dec fl
  dec el
  call life_get
  add al, 0
  mov bl, al
  inc fl
  call life_get
  add bl, al
  inc fl
  call life_get
  add bl, al

  dec fl
  inc el
  call life_get
  add bl, al
  inc fl
  call life_get
  add bl, al

  dec fl
  inc el
  call life_get
  add bl, al
  inc fl
  call life_get
  add bl, al
  inc fl
  call life_get
  add bl, al

  dec fl
  dec el
  mov al, bl
.n_done:
  ret

life_get:
  ; in fl=x el=y out al
  mov bl, el
  shl bl, 3
  add bl, fl
  ;mov al, [grid + bl]
  lea cl, dl, [grid]
  mov el, bl
  call add_cd_e
  ldi al, cl, dl
  ret

life_set:
  ; in fl=x el=y al
  mov bl, el
  shl bl, 3
  add bl, fl
  ;mov [grid + bl], al
  lea cl, dl, [grid]
  mov el, bl
  call add_cd_e
  sti al, cl, dl
  ret

life_get_next:
  mov bl, el
  shl bl, 3
  add bl, fl
  ;mov al, [next_grid + bl]
  lea cl, dl, [next_grid]
  mov el, bl
  call add_cd_e
  sti al, cl, dl
  ret

life_set_next:
  mov bl, el
  shl bl, 3
  add bl, fl
  ;mov [next_grid + bl], al
  lea cl, dl, [next_grid]
  mov el, bl
  call add_cd_e
  sti al, cl, dl
  ret

life_render:
  ; clear
  mov al, 0x00
  mov el, 0
.lrnd_y:
  cmp el, 32
  je .draw
  mov fl, 0
.lrnd_x:
  cmp fl, 32
  je .lrnd_ny
  call screen_set_pixel
  inc fl
  jmp .lrnd_x
.lrnd_ny:
  inc el
  jmp .lrnd_y

.draw:
  mov el, 0
.d_y:
  cmp el, H
  je .done
  mov fl, 0
.d_x:
  cmp fl, W
  je .d_ny
  call life_get
  cmp al, 1
  jne .next

  ; 4x4 cell
  mov al, 0x55
  push fl
  push el
  shl fl, 2
  shl el, 2
  call screen_set_pixel
  inc fl
  call screen_set_pixel
  inc fl
  call screen_set_pixel
  inc fl
  call screen_set_pixel
  pop el
  pop fl

.next:
  inc fl
  jmp .d_x
.d_ny:
  inc el
  jmp .d_y
.done:
  ret
