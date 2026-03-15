
%include "os/v3/drivers/lib_interrupt.asm"


section .data
    irq_count    db 0x00
    prev_count   db 0xFF
    _bk_a        db 0x00
    _bk_b        db 0x00
    _bk_c        db 0x00
    _bk_d        db 0x00


section .text
    global _start


_start:
    call init_device_interrupt
    call init_device_timer0

    lea cl, dl, [timer_handler]
    call interrupt_set_handler

    mov al, IRQ_TIMER
    call interrupt_enable_irq

    mov al, 5
    call timer0_set_period

    call timer0_enable

    ei

    main_loop:
        mov al, [irq_count]
        cmp al, [prev_count]
        je main_loop
        mov [prev_count], al
        debug 2, [irq_count]
        jmp main_loop


timer_handler:
    mov [_bk_a], al
    mov [_bk_b], bl
    mov [_bk_c], cl
    mov [_bk_d], dl

    inc [irq_count]

    ; ACK IRQ (interrupt_io_base + 0x02)
    mov cl, [interrupt_io_base]
    mov dl, [interrupt_io_base + 1]
    mov al, 0x02
    add cl, al
    jnc _ack_nc
    inc dl
    _ack_nc:
    mov al, IRQ_TIMER
    sti cl, dl, al

    mov al, [_bk_a]
    mov bl, [_bk_b]
    mov cl, [_bk_c]
    mov dl, [_bk_d]

    iret
