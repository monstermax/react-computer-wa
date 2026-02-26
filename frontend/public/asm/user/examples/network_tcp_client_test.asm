; -----------------------------------------------------------------------------
; NETWORK TCP - CLIENT TEST
; -----------------------------------------------------------------------------
; This program configures NETWORK_TCP as client, connects to a TCP server,
; sends a short message, then reads any reply bytes.
;
; IMPORTANT:
; - network_io_base must match your runtime device order.
; - In the CLI setup shown in cli/src/cli.ts, network_tcp is index 8 => 0xF080.
;
; Netcat command (server side, on your Linux host):
;   nc -l -p 4000
;
; Then run this ASM program in emulator.
; -----------------------------------------------------------------------------


; /!\ Device not usable in Browser. Use it only with NodeJS (The emulator cli mode)


.include "os/v3/arithmetic/lib_math.asm"


section .data
    ; Adjust if needed
    network_io_base      dw 0xF080

    ; Port offsets
    NET_DATA             equ 0x00
    NET_CMD              equ 0x01
    NET_STATUS           equ 0x02
    NET_RX_COUNT         equ 0x03
    NET_TX_COUNT         equ 0x04
    NET_LAST_ERROR       equ 0x05
    NET_HOST0            equ 0x06 ; 127
    NET_HOST1            equ 0x07 ; 0
    NET_HOST2            equ 0x08 ; 0
    NET_HOST3            equ 0x09 ; 1
    NET_PORT_LOW         equ 0x0A ; 4000 (low)
    NET_PORT_HIGH        equ 0x0B ; 4000 (high)

    ; Commands
    CMD_CONNECT          equ 0x01
    CMD_FLUSH            equ 0x05

    ; Status bits
    STATUS_CONNECTED     equ 0x01

    ; Connection timeout loop count
    CONNECT_TIMEOUT_LOOPS equ 200

    ; Message to send (ASCII)
    msg_data:
        db "Hello World from Assembly", 10
    msg_len              equ 26

section .text
    global _start

_start:
    ; [C:D] = network io base
    mov cl, [network_io_base]
    mov dl, [network_io_base + 1]

    ; clear last error
    mov el, NET_LAST_ERROR
    call add_cd_e
    sti cl, dl, 0
    mov el, NET_LAST_ERROR
    call sub_cd_e

    ; host = 127.0.0.1
    mov el, NET_HOST0
    call add_cd_e
    sti cl, dl, 127
    call inc_cd
    sti cl, dl, 0
    call inc_cd
    sti cl, dl, 0
    call inc_cd
    sti cl, dl, 1
    mov el, NET_HOST3
    call sub_cd_e

    ; port = 4000 (0x0FA0) => low=0xA0 high=0x0F
    mov el, NET_PORT_LOW
    call add_cd_e
    sti cl, dl, 0xA0
    call inc_cd
    sti cl, dl, 0x0F
    mov el, NET_PORT_HIGH
    call sub_cd_e

    ; CMD_CONNECT
    mov el, NET_CMD
    call add_cd_e
    sti cl, dl, CMD_CONNECT
    mov el, NET_CMD
    call sub_cd_e

    ; wait connected with timeout
    mov bl, CONNECT_TIMEOUT_LOOPS
.wait_connect:
    mov el, NET_STATUS
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_STATUS
    call sub_cd_e

    and al, STATUS_CONNECTED
    cmp al, STATUS_CONNECTED
    je .connected

    dec bl
    jnz .wait_connect

    ; timeout -> debug last_error then halt
    mov el, NET_LAST_ERROR
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_LAST_ERROR
    call sub_cd_e
    debug 1, al
    hlt

.connected:
    ; send message bytes
    mov fl, 0
.send_loop:
    cmp fl, msg_len
    je .flush

    ;mov al, [msg_data + fl]
    lea al, bl, [msg_data]
    mov el, fl
    call add_ab_e
    ldi al, al, bl

    mov el, NET_DATA
    call add_cd_e
    sti cl, dl, al
    mov el, NET_DATA
    call sub_cd_e

    inc fl
    jmp .send_loop

.flush:
    mov el, NET_CMD
    call add_cd_e
    sti cl, dl, CMD_FLUSH
    mov el, NET_CMD
    call sub_cd_e

    ; read incoming bytes for a while
    mov bl, 120
.read_outer:
    ; rx_count
    mov el, NET_RX_COUNT
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_RX_COUNT
    call sub_cd_e

    cmp al, 0
    je .next_tick

.read_inner:
    ; read one byte
    mov el, NET_DATA
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_DATA
    call sub_cd_e

    ; debug each received byte
    debug 2, al

    ; check if more bytes
    mov el, NET_RX_COUNT
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_RX_COUNT
    call sub_cd_e

    cmp al, 0
    jne .read_inner

.next_tick:
    dec bl
    jnz .read_outer

    hlt


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
