; =============================================================================
; BOOTLOADER v4
; =============================================================================
; Goal:
; - read OS stage1 from device "os_disk"
; - load bytes in RAM at 0x1000
; - jump to 0x1000
;
; Assumptions:
; - os_disk I/O base = 0xF050 (device index 5)
; - disk port map:
;     +0 DATA
;     +1 SIZE_LOW
;     +2 SIZE_HIGH
;     +3 ADDR_LOW
;     +4 ADDR_HIGH
; - stage1 starts at disk address 0x0000
; =============================================================================

.include "os/v3/drivers/lib_console.asm"

section .data
    os_disk_io_base      dw 0xF050
    stage1_load_addr     dw 0x1000

    size_low             db 0
    size_high            db 0

    rem_low              db 0
    rem_high             db 0

    disk_addr_low        db 0
    disk_addr_high       db 0

    ram_ptr_low          db 0
    ram_ptr_high         db 0

    msg_boot             db "[bootloader v4] loading os stage1 -> 0x1000", 10, 0
    msg_size             db "[bootloader v4] stage1 size bytes:", 32, 0
    msg_jump             db "[bootloader v4] jump 0x1000", 10, 0
    msg_err              db "[bootloader v4] empty os_disk", 10, 0

section .text
    global _start

_start:
    lea cl, dl, [msg_boot]
    call console_print_string

    ; [C:D] = os disk base
    mov cl, [os_disk_io_base]
    mov dl, [os_disk_io_base + 1]

    ; Read disk size low/high
    mov el, 1
    call add_cd_e
    mov al, [cl:dl]
    mov [size_low], al

    call inc_cd
    mov al, [cl:dl]
    mov [size_high], al

    mov el, 2
    call sub_cd_e

    ; if size == 0 => error
    mov al, [size_low]
    or al, [size_high]
    cmp al, 0
    jne .size_ok

    lea cl, dl, [msg_err]
    call console_print_string
    hlt

.size_ok:
    ; print size low for quick debug
    lea cl, dl, [msg_size]
    call console_print_string
    mov al, [size_low]
    debug 1, al
    mov al, [size_high]
    debug 1, al

    ; remaining = size
    mov al, [size_low]
    mov [rem_low], al
    mov al, [size_high]
    mov [rem_high], al

    ; disk_addr = 0
    mov al, 0
    mov [disk_addr_low], al
    mov [disk_addr_high], al

    ; ram_ptr = 0x1000
    mov al, [stage1_load_addr]
    mov [ram_ptr_low], al
    mov al, [stage1_load_addr + 1]
    mov [ram_ptr_high], al

.load_loop:
    ; done when rem == 0
    mov al, [rem_low]
    or al, [rem_high]
    cmp al, 0
    je .jump_stage1

    ; [C:D] = os disk base
    mov cl, [os_disk_io_base]
    mov dl, [os_disk_io_base + 1]

    ; set disk address low/high
    mov el, 3
    call add_cd_e
    mov al, [disk_addr_low]
    mov [cl:dl], al

    call inc_cd
    mov al, [disk_addr_high]
    mov [cl:dl], al

    ; back to DATA port
    mov el, 4
    call sub_cd_e

    ; read byte from disk data
    mov al, [cl:dl]

    ; write byte to RAM at [ram_ptr]
    mov cl, [ram_ptr_low]
    mov dl, [ram_ptr_high]
    sti cl, dl, al

    ; ram_ptr++
    mov al, [ram_ptr_low]
    inc al
    mov [ram_ptr_low], al
    jnz .ram_no_carry
    mov al, [ram_ptr_high]
    inc al
    mov [ram_ptr_high], al
.ram_no_carry:

    ; disk_addr++
    mov al, [disk_addr_low]
    inc al
    mov [disk_addr_low], al
    jnz .disk_no_carry
    mov al, [disk_addr_high]
    inc al
    mov [disk_addr_high], al
.disk_no_carry:

    ; rem--
    mov al, [rem_low]
    cmp al, 0
    jne .dec_low
    mov al, 0xFF
    mov [rem_low], al
    mov al, [rem_high]
    dec al
    mov [rem_high], al
    jmp .load_loop
.dec_low:
    dec al
    mov [rem_low], al
    jmp .load_loop

.jump_stage1:
    lea cl, dl, [msg_jump]
    call console_print_string
    jmp 0x1000


; -----------------------------------------------------------------------------
; Helpers on [C:D]
; -----------------------------------------------------------------------------
inc_cd:
    inc cl
    jnz .inc_cd_end
    inc dl
.inc_cd_end:
    ret

add_cd_e:
    add cl, el
    jnc .add_cd_e_end
    inc dl
.add_cd_e_end:
    ret

sub_cd_e:
    sub cl, el
    jnc .sub_cd_e_end
    dec dl
.sub_cd_e_end:
    ret
