; color_sort.asm (v1 simplified)
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

  ; tube top colors (0 empty, 1 yellow, 2 magenta, 3 orange)
  t0 db 1
  t1 db 2
  t2 db 0

  msg db "COLOR SORT mini: pick src then dst (1/2/3)",10,0

section .text
global _start
_start:
  lea cl, dl, [msg]
  call console_print_string
  call cs_reset

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
  cmp bl,KEY_R
  je .reset
  cmp bl,KEY_1
  je .k1
  cmp bl,KEY_2
  je .k2
  cmp bl,KEY_3
  je .k3
  jmp .chk

.reset:
  call cs_reset
  jmp .chk
.k1:
  mov al,0
  call cs_sel_move
  jmp .chk
.k2:
  mov al,1
  call cs_sel_move
  jmp .chk
.k3:
  mov al,2
  call cs_sel_move
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

cs_reset:
  mov al,0
  mov [quit_flag],al
  mov al,255
  mov [selected],al
  mov al,1
  mov [t0],al
  mov al,2
  mov [t1],al
  mov al,0
  mov [t2],al
  call cs_render
  ret

cs_sel_move:
  ; in al dst or src if none selected
  mov bl,[selected]
  cmp bl,255
  jne .move
  mov [selected],al
  call cs_render
  ret
.move:
  ; src color in cl
  mov cl,0
  cmp bl,0
  je .s0
  cmp bl,1
  je .s1
  mov cl,[t2]
  mov [t2],0
  jmp .d
.s0:
  mov cl,[t0]
  mov [t0],0
  jmp .d
.s1:
  mov cl,[t1]
  mov [t1],0

.d:
  ; if src empty do nothing
  cmp cl,0
  je .done

  ; destination must be empty or same
  cmp al,0
  je .d0
  cmp al,1
  je .d1
  mov dl,[t2]
  cmp dl,0
  je .set2
  cmp dl,cl
  jne .restore
.set2:
  mov [t2],cl
  jmp .done
.d0:
  mov dl,[t0]
  cmp dl,0
  je .set0
  cmp dl,cl
  jne .restore
.set0:
  mov [t0],cl
  jmp .done
.d1:
  mov dl,[t1]
  cmp dl,0
  je .set1
  cmp dl,cl
  jne .restore
.set1:
  mov [t1],cl
  jmp .done

.restore:
  ; put back in source
  cmp bl,0
  je .r0
  cmp bl,1
  je .r1
  mov [t2],cl
  jmp .done
.r0:
  mov [t0],cl
  jmp .done
.r1:
  mov [t1],cl

.done:
  mov bl,255
  mov [selected],bl
  call cs_render
  ret

cs_render:
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
  mov fl,6
  mov bl,[t0]
  call cs_draw_tube
  mov fl,16
  mov bl,[t1]
  call cs_draw_tube
  mov fl,26
  mov bl,[t2]
  call cs_draw_tube
  ret

cs_draw_tube:
  ; in fl=x bl=color
  ; outline
  mov al,0x44
  mov el,20
  call screen_set_pixel
  inc el
  call screen_set_pixel
  inc el
  call screen_set_pixel

  cmp bl,0
  je .done
  cmp bl,1
  je .c1
  cmp bl,2
  je .c2
  mov al,0x15
  jmp .fill
.c1:
  mov al,0x2A
  jmp .fill
.c2:
  mov al,0xE0
.fill:
  mov el,22
  call screen_set_pixel
.done:
  ret
