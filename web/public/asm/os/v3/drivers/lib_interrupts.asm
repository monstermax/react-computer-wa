

section .data
    INTERRUPTS_TABLE_COUNT       equ 0x0600
    INTERRUPTS_TABLE_START       equ 0x0601
    INTERRUPTS_TABLE_ENTRY_SIZE  equ 6
    INTERRUPTS_TABLE_MAX_ENTRIES equ 20

    interrupt_handler_backup_low   db 0
    interrupt_handler_backup_high  db 0

    int_syscall     equ 8


section .text
    global init_interrupts
    global interrupt_syscall

ret ; this is a lib. no default entrypoint defined


init_interrupts:
    push cl
    push dl
    push el
    push fl

    ; INTERRUPT 0x08 => interrupt_syscall
    ;mov [INTERRUPTS_TABLE_START + int_syscall  * INTERRUPTS_TABLE_ENTRY_SIZE], interrupt_syscall
    lea cl, dl, [INTERRUPTS_TABLE_START]
    mov el, 48 ; int_syscall * INTERRUPTS_TABLE_ENTRY_SIZE = 6 * 8 = 48
    call add_cd_e

    lea el, fl, [interrupt_syscall]

    call inc_cd
    call inc_cd

    debug 3, cl
    debug 3, dl

    sti cl, dl, el
    call inc_cd
    sti cl, dl, fl

    init_interrupts_end:
    pop fl
    pop el
    pop dl
    pop cl
    ret



; code appelé par l'instruction INT du CPU. A contient l'id de syscall a appeler
interrupt_syscall:
    pop el
    pop fl
    mov [interrupt_handler_backup_low], el
    mov [interrupt_handler_backup_high], fl

    ; TODO : rechercher dans la table SYSCALLS_TABLE au lieu de lister chaque syscall


    ; sys_read
    interrupt_syscall_handle_03:
    cmp al, 0x03
    jne interrupt_syscall_after_03
    call syscall_read
    interrupt_syscall_after_03:


    ; sys_write
    interrupt_syscall_handle_04:
    cmp al, 0x04
    jne interrupt_syscall_after_04
    call syscall_write
    interrupt_syscall_after_04:



    interrupt_syscall_end:
    mov el, [interrupt_handler_backup_low]
    mov fl, [interrupt_handler_backup_high]
    push fl
    push el
    iret
