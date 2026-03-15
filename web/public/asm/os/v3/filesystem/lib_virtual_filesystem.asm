; Author: Bob + yomax
; Name: os_v4 (stage1)
; Description: Stage1 init for VFS/mount/symlink + virtual /dev and /proc metadata (no hardcoded /dev/<idx>)

;.org 0x1000

%include "os/v3/drivers/init_devices.asm"
%include "os/v3/drivers/lib_console.asm"
%include "os/v3/drivers/lib_devices.asm"


; EN COURS DE DEV


section .data

    ; ---------------- VFS core state ----------------
    vfs_ready             db 0

    mount_count           db 0
    symlink_count         db 0
    inode_count           db 0

    ; ---------------- Tables ----------------
    ; mount entry = 8 bytes
    ; [0]=dev_idx [1]=flags [2]=mount_path_ptr_low [3]=mount_path_ptr_high
    ; [4]=src_name_ptr_low [5]=src_name_ptr_high [6..7]=reserved
    ;mount_table: 
    ;  times 64 db 0

    ; symlink entry = 6 bytes
    ; [0]=src_ptr_low [1]=src_ptr_high [2]=dst_ptr_low [3]=dst_ptr_high [4..5]=reserved
    ;symlink_table: 
    ;  times 48 db 0

    ; very small inode metadata table (RAM POC)
    ;inode_table: 
    ;  times 256 db 0

    ; /dev virtual entries generated from device table at boot
    ; fixed capacity for names copied from DEVICE_TABLE pointers
    dev_node_count        db 0
    ;dev_node_name_ptrs: 
    ;  times 64 db 0   ; up to 32 ptrs (lo/hi)

    ; /proc virtual entries (for now static process ids seeded by scheduler stage later)
    proc_node_count       db 0

    ; ---------------- Paths / labels ----------------
    p_root                db "/", 0
    p_usr                 db "/usr", 0
    p_bin                 db "/bin", 0
    p_usr_bin             db "/usr/bin", 0

    p_dev                 db "/dev", 0
    p_proc                db "/proc", 0

    ;str_os_disk           db "os_disk", 0
    ;os_disk_device_idx    db 0,0,0 ; idx, io_lo, io_hi (filled by init_device)

    ; ---------------- Messages ----------------
    m_start               db "[vfs_init] stage1 start", 10, 0
    m_vfs                 db "[vfs_init] init vfs", 10, 0
    m_mount               db "[vfs_init] mount os_disk -> /usr", 10, 0
    m_symlink             db "[vfs_init] symlink /bin -> /usr/bin", 10, 0
    m_dev                 db "[vfs_init] build virtual /dev from DEVICE_TABLE", 10, 0
    m_proc                db "[vfs_init] init virtual /proc", 10, 0
    m_done                db "[vfs_init] ready", 10, 0


section .bss
    mount_table resb 64
    symlink_table resb 48
    inode_table resb 256
    dev_node_name_ptrs resb 64   ; up to 32 ptrs (lo/hi)


section .text
    global init_virtual_file_system


init_virtual_file_system:
    call init_vfs
    call init_mounts
    call init_symlinks
    call init_virtual_dev
    call init_virtual_proc

    lea cl, dl, [m_done]
    call console_print_string

    ret


init_vfs:
    lea cl, dl, [m_vfs]
    call console_print_string

    mov al, 0
    mov [mount_count], al
    mov [symlink_count], al
    mov [inode_count], al
    mov [dev_node_count], al
    mov [proc_node_count], al

    mov al, 1
    mov [vfs_ready], al
    ret


init_mounts:
    lea cl, dl, [m_mount]
    call console_print_string

    ; resolve os_disk dynamically (no hardcoded device index/base)
    ;lea al, bl, [str_os_disk]
    ;lea cl, dl, [os_disk_device_idx]
    ;call init_device

    ; mount entry #0
    lea cl, dl, [mount_table]

    mov al, [os_disk_device_idx]
    sti cl, dl, al                  ; dev_idx

    call inc_cd
    mov al, 0
    sti cl, dl, al                  ; flags

    call inc_cd
    lea al, bl, [p_usr]
    sti cl, dl, al                  ; mount path ptr low

    call inc_cd
    sti cl, dl, bl                  ; mount path ptr high

    call inc_cd
    lea al, bl, [str_os_disk]
    sti cl, dl, al                  ; source name ptr low

    call inc_cd
    sti cl, dl, bl                  ; source name ptr high

    mov al, 1
    mov [mount_count], al
    ret


init_symlinks:
    lea cl, dl, [m_symlink]
    call console_print_string

    ; symlink #0: /bin -> /usr/bin
    lea cl, dl, [symlink_table]

    lea al, bl, [p_bin]
    sti cl, dl, al
    call inc_cd
    sti cl, dl, bl

    call inc_cd
    lea al, bl, [p_usr_bin]
    sti cl, dl, al
    call inc_cd
    sti cl, dl, bl

    mov al, 1
    mov [symlink_count], al
    ret


init_virtual_dev:
    lea cl, dl, [m_dev]
    call console_print_string

    ; Enumerate DEVICE_TABLE and store each device name pointer in dev_node_name_ptrs
    mov al, [DEVICE_TABLE_COUNT]
    mov [dev_node_count], al

    cmp al, 0
    je .done

    lea cl, dl, DEVICE_TABLE_START
    lea el, fl, [dev_node_name_ptrs]

.loop:
    ; entry layout: idx,type,io_lo,io_hi,name_lo,name_hi
    ; move C:D to +4
    push cl
    push dl
    mov al, 4
    add cl, al
    jnc .no_carry1
    inc dl
.no_carry1:

    ldi al, cl, dl
    sti el, fl, al
    call inc_ef

    call inc_cd
    ldi al, cl, dl
    sti el, fl, al
    call inc_ef

    pop dl
    pop cl

    ; next entry
    mov al, DEVICE_ENTRY_SIZE
    add cl, al
    jnc .no_carry2
    inc dl
.no_carry2:

    dec [dev_node_count]
    jnz .loop

    ; restore real count
    mov al, [DEVICE_TABLE_COUNT]
    mov [dev_node_count], al

.done:
    ret


init_virtual_proc:
    lea cl, dl, [m_proc]
    call console_print_string

    ; stage1 placeholder: will be synchronized with scheduler process table later
    mov al, 2
    mov [proc_node_count], al

    ; basic inode slots reservation for /proc + /dev roots
    mov al, 2
    mov [inode_count], al
    ret
