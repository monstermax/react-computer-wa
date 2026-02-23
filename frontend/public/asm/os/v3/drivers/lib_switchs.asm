; Author: yomax + deepseek
; Date: 2026-02
; Name: lib_switchs
; Description: Switchs/Buttons Driver
;
; Ports I/O (relatifs à switchs_io_base) :
;   +0 = SWITCHS_DATA     (lecture/écriture) - état des 8 switchs
;   +1 = SWITCHS_STATUS   (lecture) - index du switch en attente (0-7) ou 0xFF si aucun
;   +1 = SWITCHS_ACK      (écriture) - acquitter l'index traité

.include "os/v3/drivers/lib_devices.asm"
.include "os/v3/arithmetic/lib_math.asm"


section .data

    ; pour l'initialisation du device
    str_switchs         db "switchs", 0
    switchs_device_idx  db 0x00   ; must be followed by switchs_io_base. will be auto filled
    switchs_io_base     dw 0x0000 ; must be placed just after switchs_device_idx. will be auto filled

    ; Constantes
    SWITCHS_NO_PENDING equ 0xFF  ; valeur retournée quand aucun switch en attente


section .text
    global init_device_switchs
    global get_switchs_value
    global get_switchs_pending
    global set_switchs_value
    global ack_switchs
    global wait_switch_change
    global get_switch_state


_exit:
    ret


init_device_switchs:
    ; initialise le device Switchs
    lea al, bl, [str_switchs]
    lea cl, dl, [switchs_device_idx]
    call init_device
;debug 4, [switchs_io_base]
;debug 4, [switchs_io_base+1]
    ret


; ============================================================================
; get_switchs_value - Lit l'état actuel de tous les switchs
; Entrée: aucune
; Sortie: A = état des 8 switchs (bit 0 = switch 0, bit 7 = switch 7)
; ============================================================================
get_switchs_value:
    mov cl, [switchs_io_base]     ; low byte
    mov dl, [switchs_io_base + 1] ; high byte
    ldi al, cl, dl                ; A = [C:D] = état des switchs
    ret


; ============================================================================
; get_switchs_pending - Lit l'index du switch en attente
; Entrée: aucune
; Sortie: A = index du switch en attente (0-7) ou 0xFF si aucun
; ============================================================================
get_switchs_pending:
    mov cl, [switchs_io_base]     ; low byte
    mov dl, [switchs_io_base + 1] ; high byte
    call inc_cd                   ; C:D = switchs_io_base + 1 (STATUS)
    ldi al, cl, dl                ; A = index du switch en attente
    ret


; ============================================================================
; set_switchs_value - Écrit une valeur dans les switchs (reset)
; Entrée: A = nouvelle valeur
; ============================================================================
set_switchs_value:
    mov cl, [switchs_io_base]     ; low byte
    mov dl, [switchs_io_base + 1] ; high byte
    sti cl, dl, al                ; écrit la valeur
    ret


; ============================================================================
; ack_switchs - Acquitte le traitement d'un switch
; Entrée: A = index du switch à acquitter (0-7)
; ============================================================================
ack_switchs:
    mov cl, [switchs_io_base]     ; low byte
    mov dl, [switchs_io_base + 1] ; high byte
    call inc_cd                   ; C:D = switchs_io_base + 1 (ACK)
    sti cl, dl, al                ; écrit l'index pour acquitter
    ret


; ============================================================================
; wait_switch_change - Attend qu'un switch soit changé
; Entrée: aucune
; Sortie: A = index du switch qui a changé (0-7)
; ============================================================================
wait_switch_change:
    call get_switchs_pending      ; A = index en attente
    cmp al, SWITCHS_NO_PENDING
    je wait_switch_change         ; boucle tant que pas de changement
    ret                           ; A = index du switch


; ============================================================================
; get_switch_state - Lit l'état d'un switch spécifique
; Entrée: A = index du switch (0-7)
; Sortie: A = 1 si switch ON, 0 si OFF
; ============================================================================
get_switch_state:
    push bl
    push cl
    
    ; Sauvegarder l'index
    mov bl, al
    
    ; Lire tous les switchs
    call get_switchs_value        ; A = état global
    
    ; Isoler le bit demandé
    mov cl, bl                    ; CL = index
    shr al, cl                    ; décaler le bit vers la droite
    and al, 1                     ; ne garder que le bit 0
    
    pop cl
    pop bl
    ret


; ============================================================================
; get_switchs_mask - Lit l'état des switchs avec un masque
; Entrée: A = masque (bits à tester)
; Sortie: A = 1 si tous les bits du masque sont à 1, 0 sinon
; ============================================================================
get_switchs_mask:
    push bl
    
    mov bl, al                    ; sauvegarder le masque
    call get_switchs_value        ; A = état global
    and al, bl                    ; appliquer le masque
    cmp al, bl                    ; égal au masque ?
    jne .not_equal
    mov al, 1                     ; oui → 1
    jmp .done
.not_equal:
    mov al, 0                     ; non → 0
.done:
    pop bl
    ret


; ============================================================================
; wait_switch_mask - Attend qu'un ensemble de switchs soit dans un état donné
; Entrée: A = masque à tester
;         B = valeur attendue (0 ou 1)
; Sortie: A = index du premier switch qui correspond
; ============================================================================
wait_switch_mask:
    push bl
    push cl
    
    mov cl, al                    ; CL = masque
    mov bl, al                    ; BL = valeur attendue
    
.wait_loop:
    call get_switchs_value        ; A = état global
    and al, cl                    ; appliquer le masque
    
    cmp bl, 0
    je .check_zero
    ; On attend que ce soit != 0 (au moins un bit à 1)
    cmp al, 0
    je .wait_loop
    jmp .found
.check_zero:
    ; On attend que ce soit == 0 (tous à 0)
    cmp al, 0
    jne .wait_loop
    
.found:
    ; Trouver le premier bit à 1 (si valeur attendue = 1)
    cmp bl, 0
    je .done
    
    mov cl, 0                     ; compteur
.find_bit:
    shr al, 1
    jc .bit_found
    inc cl
    jmp .find_bit
.bit_found:
    mov al, cl                    ; A = index
    
.done:
    pop cl
    pop bl
    ret
