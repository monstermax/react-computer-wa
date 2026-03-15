; lib_rtc.asm
; Driver RTC — accès au temps réel JS

%include "os/v3/drivers/lib_devices.asm"
%include "os/v3/arithmetic/lib_math.asm"

section .data
    str_rtc         db "rtc", 0
    rtc_device_idx  db 0x00
    rtc_io_base     dw 0x0000

section .text
    global init_device_rtc

ret

init_device_rtc:
    lea al, bl, [str_rtc]
    lea cl, dl, [rtc_device_idx]
    call init_device
    ret

; Charge C:D = rtc_io_base + offset E
_rtc_port:
    mov cl, [rtc_io_base]
    mov dl, [rtc_io_base + 1]
    call add_cd_e
    ret
