; Author: yomax + deepseek
; Date: 2026-02
; Name: switchs_test
; Description: Switchs/Buttons Test

.include "os/v3/drivers/lib_switchs.asm"


_start:
    ; Attendre qu'un switch soit changé
    call wait_switch_change    ; A = index du switch (0-7)

    ; Lire l'état de ce switch
    push al                    ; sauvegarder l'index
    call get_switch_state      ; A = 1 si ON, 0 si OFF
    pop bl                     ; BL = index

    ; Afficher le résultat
    cmp al, 1
    je .switch_on

    ; switch est OFF
    ; TODO: enregistrer la valeur si on le souhaite
    jmp .done

.switch_on:
    ; switch est ON
    ; TODO: enregistrer la valeur si on le souhaite

.done:
    ; Acquitter le traitement
    mov al, bl                 ; AL = index
    call ack_switchs

    ret
