; Author: yomax + claude
; Date: 2026-03
; Name: lib_speaker
; Modèle APU GameBoy : le CPU écrit et continue. Pas de polling.
;
; Ports I/O :
;   +0x00  NOTE      Note MIDI (0-127)
;   +0x01  WAVEFORM  0=pulse 1=triangle 2=sawtooth 3=noise
;   +0x02  VOLUME    0-255
;   +0x03  DUTY      0-255
;   +0x04  ATTACK    ms
;   +0x05  DECAY     ms
;   +0x06  SUSTAIN   0-255
;   +0x07  RELEASE   ms
;   +0x08  LENGTH_LO durée low byte  (ms)
;   +0x09  LENGTH_HI durée high byte (ms)
;   +0x0A  GATE      écriture 1 = déclenche. lecture = 1 si en cours
;
; Conventions :
;   speaker_play  : A=note, B=durée low, C=durée high → joue et continue
;   speaker_set_* : A=valeur

%include "os/v3/drivers/lib_devices.asm"
%include "os/v3/arithmetic/lib_math.asm"


section .data
    str_speaker        db "speaker", 0
    speaker_device_idx db 0x00
    speaker_io_base    dw 0x0000

    SPEAKER_PORT_NOTE      equ 0x00
    SPEAKER_PORT_WAVEFORM  equ 0x01
    SPEAKER_PORT_VOLUME    equ 0x02
    SPEAKER_PORT_DUTY      equ 0x03
    SPEAKER_PORT_ATTACK    equ 0x04
    SPEAKER_PORT_DECAY     equ 0x05
    SPEAKER_PORT_SUSTAIN   equ 0x06
    SPEAKER_PORT_RELEASE   equ 0x07
    SPEAKER_PORT_LENGTH_LO equ 0x08
    SPEAKER_PORT_LENGTH_HI equ 0x09
    SPEAKER_PORT_GATE      equ 0x0A



section .text
    global init_device_speaker
    global speaker_play
    global speaker_set_wave
    global speaker_set_volume
    global speaker_set_attack
    global speaker_set_decay
    global speaker_set_sustain
    global speaker_set_release

ret


; ── Charge C:D = io_base + offset E ──────────────
_speaker_port:
    mov cl, [speaker_io_base]
    mov dl, [speaker_io_base + 1]
    call add_cd_e
    ret


; ── Init ──────────────────────────────────────────
init_device_speaker:
    lea al, bl, [str_speaker]
    lea cl, dl, [speaker_device_idx]
    call init_device
    ret


; ── speaker_play ──────────────────────────────────
; INPUT: A = note MIDI, B = durée low (ms), C = durée high (ms)
; Le CPU écrit et continue immédiatement (pas d'attente)
; Clobbers: D, E
speaker_play:
    push cl         ; sauver durée high

    ; Écrire la note
    mov el, SPEAKER_PORT_NOTE
    call _speaker_port
    sti cl, dl, al

    ; Écrire LENGTH_LO
    mov al, bl
    mov el, SPEAKER_PORT_LENGTH_LO
    call _speaker_port
    sti cl, dl, al

    ; Écrire LENGTH_HI
    pop al          ; al = durée high
    mov el, SPEAKER_PORT_LENGTH_HI
    call _speaker_port
    sti cl, dl, al

    ; GATE ON → déclenche la note dans l'APU
    mov al, 1
    mov el, SPEAKER_PORT_GATE
    call _speaker_port
    sti cl, dl, al

    ret


; ── speaker_set_* ─────────────────────────────────
; INPUT: A = valeur
speaker_set_wave:
    mov el, SPEAKER_PORT_WAVEFORM
    call _speaker_port
    sti cl, dl, al
    ret

speaker_set_volume:
    mov el, SPEAKER_PORT_VOLUME
    call _speaker_port
    sti cl, dl, al
    ret

speaker_set_attack:
    mov el, SPEAKER_PORT_ATTACK
    call _speaker_port
    sti cl, dl, al
    ret

speaker_set_decay:
    mov el, SPEAKER_PORT_DECAY
    call _speaker_port
    sti cl, dl, al
    ret

speaker_set_sustain:
    mov el, SPEAKER_PORT_SUSTAIN
    call _speaker_port
    sti cl, dl, al
    ret

speaker_set_release:
    mov el, SPEAKER_PORT_RELEASE
    call _speaker_port
    sti cl, dl, al
    ret
