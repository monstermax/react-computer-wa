; lib_interrupt.asm
; Driver InterruptManager + Timer
;
; Ports InterruptManager :
;   0x00  INTERRUPT_ENABLE        bitmask IRQs activées
;   0x01  INTERRUPT_PENDING       IRQs en attente (lecture)
;   0x02  INTERRUPT_ACK           acquitter une IRQ (écriture)
;   0x03  INTERRUPT_MASK          masque IRQs
;   0x04  INTERRUPT_HANDLER_LO    adresse handler low byte
;   0x05  INTERRUPT_HANDLER_HI    adresse handler high byte
;
; Ports Timer (timer0) :
;   0x00  TIMER_COUNTER    compteur courant (lecture)
;   0x01  TIMER_CONTROL    bit0=enable, bit1=reset
;   0x02  TIMER_PRESCALER  période en ticks
;
; IRQ sources :
;   IRQ_TIMER    equ 0
;   IRQ_KEYBOARD equ 1
;   IRQ_DISK     equ 2
;   IRQ_UART     equ 3
;   IRQ_BUTTON   equ 4

%include "os/v3/drivers/lib_devices.asm"
%include "os/v3/arithmetic/lib_math.asm"

IRQ_TIMER    equ 0
IRQ_KEYBOARD equ 1
IRQ_DISK     equ 2
IRQ_UART     equ 3
IRQ_BUTTON   equ 4

INT_PORT_ENABLE     equ 0x00
INT_PORT_PENDING    equ 0x01
INT_PORT_ACK        equ 0x02
INT_PORT_MASK       equ 0x03
INT_PORT_HANDLER_LO equ 0x04
INT_PORT_HANDLER_HI equ 0x05

TIMER_PORT_COUNTER   equ 0x00
TIMER_PORT_CONTROL   equ 0x01
TIMER_PORT_PRESCALER equ 0x02


section .data
    str_interrupt        db "interrupt", 0
    interrupt_device_idx db 0x00
    interrupt_io_base    dw 0x0000

    str_timer0           db "timer0", 0
    timer0_device_idx    db 0x00
    timer0_io_base       dw 0x0000

    _ih_lo  db 0x00     ; sauvegarde handler low
    _ih_hi  db 0x00     ; sauvegarde handler high


section .text
    global init_device_interrupt
    global init_device_timer0
    global interrupt_set_handler
    global interrupt_enable_irq
    global interrupt_ack
    global timer0_set_period
    global timer0_enable
    global timer0_disable

ret


; ── Helpers ports ─────────────────────────────────
_interrupt_port:
    mov cl, [interrupt_io_base]
    mov dl, [interrupt_io_base + 1]
    call add_cd_e
    ret

_timer0_port:
    mov cl, [timer0_io_base]
    mov dl, [timer0_io_base + 1]
    call add_cd_e
    ret


; ── Init devices ──────────────────────────────────
init_device_interrupt:
    lea al, bl, [str_interrupt]
    lea cl, dl, [interrupt_device_idx]
    call init_device
    ret

init_device_timer0:
    lea al, bl, [str_timer0]
    lea cl, dl, [timer0_device_idx]
    call init_device
    ret


; ─────────────────────────────────────────────────────
; interrupt_set_handler
; INPUT: C = handler low byte, D = handler high byte
; Clobbers: A, E
; ─────────────────────────────────────────────────────
interrupt_set_handler:
    mov [_ih_lo], cl
    mov [_ih_hi], dl

    mov el, INT_PORT_HANDLER_LO
    call _interrupt_port
    mov al, [_ih_lo]
    sti cl, dl, al

    mov el, INT_PORT_HANDLER_HI
    call _interrupt_port
    mov al, [_ih_hi]
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────────
; interrupt_enable_irq
; INPUT: A = IRQ number (0-7)
; Active le bit A dans INTERRUPT_ENABLE
; Clobbers: B, C, D, E
; ─────────────────────────────────────────────────────
interrupt_enable_irq:
    ; Lire valeur actuelle
    mov el, INT_PORT_ENABLE
    call _interrupt_port
    ldi bl, cl, dl      ; bl = enabled actuel

    ; Calculer masque = 1 << A
    mov el, 1
    cmp al, 0
    jz _enable_no_shift
    mov fl, al
    mov al, el
    _enable_shift_loop:
        shl al, 1
        dec fl
        jnz _enable_shift_loop
    mov el, al
    _enable_no_shift:

    or bl, el

    ; Réécrire
    mov el, INT_PORT_ENABLE
    call _interrupt_port
    sti cl, dl, bl
    ret


; ─────────────────────────────────────────────────────
; interrupt_ack
; INPUT: A = IRQ number (0-7)
; Clobbers: C, D, E
; ─────────────────────────────────────────────────────
interrupt_ack:
    mov el, INT_PORT_ACK
    call _interrupt_port
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────────
; timer0_set_period
; INPUT: A = période en ticks (1-255)
; Clobbers: C, D, E
; ─────────────────────────────────────────────────────
timer0_set_period:
    mov el, TIMER_PORT_PRESCALER
    call _timer0_port
    sti cl, dl, al
    ret


; ─────────────────────────────────────────────────────
; timer0_enable / timer0_disable
; Clobbers: A, C, D, E
; ─────────────────────────────────────────────────────
timer0_enable:
    mov al, 1
    mov el, TIMER_PORT_CONTROL
    call _timer0_port
    sti cl, dl, al
    ret

timer0_disable:
    mov al, 0
    mov el, TIMER_PORT_CONTROL
    call _timer0_port
    sti cl, dl, al
    ret
