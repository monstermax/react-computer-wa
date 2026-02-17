
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
    jmp .done

.switch_on:
    ; switch est ON

.done:
    ; Acquitter le traitement
    mov al, bl                 ; AL = index
    call ack_switchs

    ; Ou plus simple : attendre et traiter en boucle
.main_loop:
    call wait_switch_change    ; attend un changement
    ; AL = index du switch

    call get_switch_state      ; AL = état
    ; faire quelque chose...

    call ack_switchs           ; acquitter
    jmp .main_loop
