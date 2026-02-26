; -----------------------------------------------------------------------------
; NETWORK TCP - SERVER TEST (echo)
; -----------------------------------------------------------------------------
; This program configures NETWORK_TCP as TCP server, waits for a client,
; then echoes back any received bytes.
;
; IMPORTANT:
; - network_io_base must match your runtime device order.
; - In the CLI setup shown in cli/src/cli.ts, network_tcp is index 8 => 0xF080.
;
; Netcat command (client side, on your Linux host):
;   nc 127.0.0.1 4001
;
;   seq -s " " 1 99 | nc 127.0.0.1 4001
;
; Type text in nc and press Enter, emulator should echo bytes back.
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
    NET_LAST_ERROR       equ 0x05
    NET_HOST0            equ 0x06
    NET_HOST1            equ 0x07
    NET_HOST2            equ 0x08
    NET_HOST3            equ 0x09
    NET_PORT_LOW         equ 0x0A
    NET_PORT_HIGH        equ 0x0B

    ; Commands
    CMD_LISTEN           equ 0x02
    CMD_FLUSH            equ 0x05

    ; Status bits
    STATUS_CONNECTED     equ 0x01
    STATUS_LISTENING     equ 0x08

    LISTEN_TIMEOUT_LOOPS equ 200

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

    ; bind host = 127.0.0.1
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

    ; bind port = 4001 (0x0FA1)
    mov el, NET_PORT_LOW
    call add_cd_e
    sti cl, dl, 0xA1
    call inc_cd
    sti cl, dl, 0x0F
    mov el, NET_PORT_HIGH
    call sub_cd_e

    ; CMD_LISTEN
    mov el, NET_CMD
    call add_cd_e
    sti cl, dl, CMD_LISTEN
    mov el, NET_CMD
    call sub_cd_e

    ; wait for listening flag (optional check)
    mov bl, LISTEN_TIMEOUT_LOOPS
.wait_listening:
    mov el, NET_STATUS
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_STATUS
    call sub_cd_e

    and al, STATUS_LISTENING
    cmp al, STATUS_LISTENING
    je .wait_client

    dec bl
    jnz .wait_listening

    ; listen failed -> debug error and halt
    mov el, NET_LAST_ERROR
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_LAST_ERROR
    call sub_cd_e
    debug 1, al
    hlt

.wait_client:
    ; wait until a client connects
.wait_connected:
    mov el, NET_STATUS
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_STATUS
    call sub_cd_e

    and al, STATUS_CONNECTED
    cmp al, STATUS_CONNECTED
    jne .wait_connected

    ; echo loop
.echo_loop:
    ; read rx_count
    mov el, NET_RX_COUNT
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_RX_COUNT
    call sub_cd_e

    cmp al, 0
    je .echo_loop

.echo_bytes:
    ; read one byte
    mov el, NET_DATA
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_DATA
    call sub_cd_e

    ; debug received byte
    debug 2, al

    ; write same byte back (echo)
    mov el, NET_DATA
    call add_cd_e
    sti cl, dl, al
    mov el, NET_DATA
    call sub_cd_e

    ; flush quickly
    mov el, NET_CMD
    call add_cd_e
    sti cl, dl, CMD_FLUSH
    mov el, NET_CMD
    call sub_cd_e

    ; continue while rx_count > 0
    mov el, NET_RX_COUNT
    call add_cd_e
    ldi al, cl, dl
    mov el, NET_RX_COUNT
    call sub_cd_e

    cmp al, 0
    jne .echo_bytes

    jmp .echo_loop


