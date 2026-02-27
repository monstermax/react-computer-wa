; =============================================================================
; OS v4 (stage1)
; =============================================================================
; Responsibilities (stage1):
; - early init
; - instantiate in-memory VFS metadata
; - mount os_disk at /usr (VFS mount table)
; - create symlink /bin -> /usr/bin
; - seed virtual /dev and /proc trees metadata
;
; This stage is intentionally simple/pedagogic and RAM-resident.
; =============================================================================

.include "os/v3/drivers/lib_console.asm"

section .data
    OS_VERSION               equ 4

    ; ---------------------- VFS tables (RAM structures) -----------------------
    ; minimal metadata model for stage1:
    ; - mount table
    ; - symlink table
    ; - inode table (very small)

    vfs_magic                dw 0x5646   ; 'VF'
    vfs_ready                db 0

    mount_count              db 0
    mount_max                equ 8

    ; mount entry (12 bytes):
    ; [0]  fs_type
    ; [1]  dev_index
    ; [2]  mount_flags
    ; [3]  reserved
    ; [4]  path_ptr_low
    ; [5]  path_ptr_high
    ; [6]  src_ptr_low
    ; [7]  src_ptr_high
    ; [8..11] reserved
    mount_table:
      times 96 db 0

    symlink_count            db 0
    symlink_max              equ 8

    ; symlink entry (8 bytes):
    ; [0] src_ptr_low
    ; [1] src_ptr_high
    ; [2] dst_ptr_low
    ; [3] dst_ptr_high
    ; [4..7] reserved
    symlink_table:
      times 64 db 0

    inode_count              db 0
    inode_max                equ 32
    ; inode entry (8 bytes simplified)
    inode_table:
      times 256 db 0

    ; ---------------------------- VFS paths -----------------------------------
    p_root                   db "/", 0
    p_bin                    db "/bin", 0
    p_usr                    db "/usr", 0
    p_usr_bin                db "/usr/bin", 0

    p_dev                    db "/dev", 0
    p_dev0                   db "/dev/0", 0
    p_dev0_io_base           db "/dev/0/io_base", 0
    p_dev0_io_index          db "/dev/0/io_index", 0
    p_dev0_name              db "/dev/0/name", 0

    p_proc                   db "/proc", 0
    p_proc1                  db "/proc/1", 0
    p_proc1_exe              db "/proc/1/exe", 0
    p_proc1_cwd              db "/proc/1/cwd", 0
    p_proc1_cmdline          db "/proc/1/cmdline", 0

    p_proc2                  db "/proc/2", 0
    p_proc2_exe              db "/proc/2/exe", 0
    p_proc2_cwd              db "/proc/2/cwd", 0
    p_proc2_cmdline          db "/proc/2/cmdline", 0

    src_os_disk              db "os_disk", 0

    ; ---------------------------- messages ------------------------------------
    m_boot                   db "[os v4] stage1 start", 10, 0
    m_vfs                    db "[os v4] init vfs", 10, 0
    m_mount                  db "[os v4] mount os_disk -> /usr", 10, 0
    m_symlink                db "[os v4] symlink /bin -> /usr/bin", 10, 0
    m_dev                    db "[os v4] seed /dev metadata", 10, 0
    m_proc                   db "[os v4] seed /proc metadata", 10, 0
    m_done                   db "[os v4] ready", 10, 0

section .text
    global _start

_start:
    mov dl, OS_VERSION

    lea cl, dl, [m_boot]
    call console_print_string

    call init_vfs
    call init_mounts
    call init_symlinks
    call init_virtual_dev
    call init_virtual_proc

    lea cl, dl, [m_done]
    call console_print_string

    ; stage1 done (stage2/userland hook can be called from here later)
    hlt


; -----------------------------------------------------------------------------
; init_vfs
; -----------------------------------------------------------------------------
init_vfs:
    lea cl, dl, [m_vfs]
    call console_print_string

    mov al, 0
    mov [mount_count], al
    mov [symlink_count], al
    mov [inode_count], al

    mov al, 1
    mov [vfs_ready], al
    ret


; -----------------------------------------------------------------------------
; init_mounts
; - mount os_disk at /usr
; -----------------------------------------------------------------------------
init_mounts:
    lea cl, dl, [m_mount]
    call console_print_string

    ; mount entry #0 at mount_table
    ; fs_type=1 (custom)
    ; dev_index=5 (os_disk, matching current device list)
    ; mount_flags=0
    mov cl, mount_table
    mov dl, mount_table >> 8

    mov al, 1
    mov [cl:dl], al            ; fs_type

    call inc_cd
    mov al, 5
    mov [cl:dl], al            ; dev_index (os_disk)

    call inc_cd
    mov al, 0
    mov [cl:dl], al            ; mount_flags

    call inc_cd
    mov [cl:dl], al            ; reserved

    ; path_ptr => /usr
    call inc_cd
    lea al, ah, [p_usr]
    mov [cl:dl], al
    call inc_cd
    mov [cl:dl], ah

    ; src_ptr => os_disk
    call inc_cd
    lea al, ah, [src_os_disk]
    mov [cl:dl], al
    call inc_cd
    mov [cl:dl], ah

    mov al, 1
    mov [mount_count], al
    ret


; -----------------------------------------------------------------------------
; init_symlinks
; - /bin -> /usr/bin
; -----------------------------------------------------------------------------
init_symlinks:
    lea cl, dl, [m_symlink]
    call console_print_string

    ; symlink entry #0 at symlink_table
    mov cl, symlink_table
    mov dl, symlink_table >> 8

    lea al, ah, [p_bin]
    mov [cl:dl], al
    call inc_cd
    mov [cl:dl], ah

    call inc_cd
    lea al, ah, [p_usr_bin]
    mov [cl:dl], al
    call inc_cd
    mov [cl:dl], ah

    mov al, 1
    mov [symlink_count], al
    ret


; -----------------------------------------------------------------------------
; init_virtual_dev
; - stage1 metadata only (virtual tree)
; -----------------------------------------------------------------------------
init_virtual_dev:
    lea cl, dl, [m_dev]
    call console_print_string

    ; very small inode seed for /dev tree (pedagogic placeholders)
    ; inode #0 => /dev
    mov al, 1
    mov [inode_count], al
    ret


; -----------------------------------------------------------------------------
; init_virtual_proc
; - stage1 metadata only (virtual tree)
; -----------------------------------------------------------------------------
init_virtual_proc:
    lea cl, dl, [m_proc]
    call console_print_string

    ; reserve inode slots for /proc and two process entries
    mov al, [inode_count]
    add al, 3
    mov [inode_count], al
    ret


; -----------------------------------------------------------------------------
; Helpers on [C:D]
; -----------------------------------------------------------------------------
inc_cd:
    inc cl
    jnz .inc_cd_end
    inc dl
.inc_cd_end:
    ret
