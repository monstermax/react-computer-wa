

section .data
    SYSCALLS_TABLE_COUNT       equ 0x0700
    SYSCALLS_TABLE_START       equ 0x0701
    SYSCALLS_TABLE_ENTRY_SIZE  equ 6
    SYSCALLS_TABLE_MAX_ENTRIES equ 20

    sys_exit     equ 1
    sys_read     equ 3
    sys_write    equ 4

    syscall_handler_backup_low   db 0
    syscall_handler_backup_high  db 0

    ;stdin        equ 0
    ;stdout       equ 1


section .text
    global init_syscalls
    global syscall_read
    global syscall_write
    global syscall_open
    global syscall_close
    global syscall_exec

ret ; this is a lib. no default entrypoint defined


init_syscalls:
    push cl
    push dl
    push el
    push fl

    ; SYSCALL 0x03 => syscall_read
    ;mov [SYSCALLS_TABLE_START + sys_read  * SYSCALLS_TABLE_ENTRY_SIZE], syscall_read
    lea cl, dl, [SYSCALLS_TABLE_START]
    mov el, 18 ; sys_read * SYSCALLS_TABLE_ENTRY_SIZE = 6 * 3 = 18
    call add_cd_e

    lea el, fl, [syscall_read]
    sti cl, dl, el
    call inc_cd
    sti cl, dl, fl

    ; SYSCALL 0x04 => syscall_write
    ;mov [SYSCALLS_TABLE_START + sys_write * SYSCALLS_TABLE_ENTRY_SIZE], syscall_write
    lea cl, dl, [SYSCALLS_TABLE_START]
    mov el, 24 ; sys_write * SYSCALLS_TABLE_ENTRY_SIZE = 6 * 4 = 24
    call add_cd_e

    lea el, fl, [syscall_read]
    sti cl, dl, el
    call inc_cd
    sti cl, dl, fl

    init_syscalls_end:
    pop fl
    pop el
    pop dl
    pop cl
    ret


syscall_read:

    ; pop & save syscall return addr
    pop el
    mov [syscall_handler_backup_low], el
    pop el
    mov [syscall_handler_backup_high], el

    ; read syscall_read params
    pop al ; 1st arg = file descriptor (not yet supported. read from keyboard)
    pop cl ; 2nd arg = pointer to the buffer (low byte)
    pop dl ; 2nd arg = pointer to the buffer (high byte)
    pop bl ; 3st arg = buffer length

    push el

    mov el, 0 ; longueur de buffer traité

    syscall_read_loop:
    cmp el, bl
    jge syscall_read_end

    ; read keyboard char
    call get_keyboard_status ; => OUTPUT in A (boolean)
    cmp al, 0
    je syscall_read_loop

    call get_keyboard_char ; => OUTPUT in A (char)
    call set_keyboard_status ; ack

    cmp al, 0
    je syscall_read_end

    cmp al, 13
    je syscall_read_end

    sti cl, dl, al

    inc el
    call dec_cd
    jmp syscall_read_loop

    syscall_read_end:
    pop el

    ; push & restore syscall return addr
    mov el, [syscall_handler_backup_high]  ; load high byte
    push el                                ; push high byte
    mov el, [syscall_handler_backup_low]   ; load low byte
    push el                                ; push low byte
    ret


syscall_write:

    ; pop & save syscall return addr
    pop el                                ; pop low byte
    mov [syscall_handler_backup_low], el  ; save low byte
    pop el                                ; pop high byte
    mov [syscall_handler_backup_high], el ; save high byte

    ; read syscall_write params
    pop al ; 1st arg = file descriptor (not yet supported. print to console)
    pop cl ; 2nd arg = pointer to the buffer (low byte)
    pop dl ; 2nd arg = pointer to the buffer (high byte)
    pop bl ; 3st arg = buffer length
    call console_print_sized_string

    ; push & restore syscall return addr
    mov el, [syscall_handler_backup_high]  ; load high byte
    push el                                ; push high byte
    mov el, [syscall_handler_backup_low]   ; load low byte
    push el                                ; push low byte
    ret


syscall_open:
    ; TODO
    ret


syscall_close:
    ; TODO
    ret


syscall_exec:
    ; TODO
    ret

