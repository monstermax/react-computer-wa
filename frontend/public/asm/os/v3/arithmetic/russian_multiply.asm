


section .text
    global russian_multiply


_exit:
    mov al, 104
    mov bl, 8
    ;call russian_multiply
    call russian_divide
    ret



; Multiplication russe
; Entrée : AL = a, BL = b
; Sortie : AL = a * b
russian_multiply:
    push bl
    push cl
    push dl
    push fl

    mov cl, 0        ; somme finale

    ; Optimisation : prend le plus petit comme diviseur
    cmp al, bl
    jle .start
    xchg al, bl ; swap A <=> B

.start:
    ; Vérifier si A est impair AVANT de le diviser
    mov dl, al
    and dl, 1
    cmp dl, 0
    je .even

    ; A est impair → ajouter B au résultat
    add cl, bl

.even:
    ; Maintenant on peut diviser A et multiplier B
    shr al, 1        ; A = A / 2
    shl bl, 1        ; B = B * 2

    cmp al, 0
    jne .start

    mov al, cl
    debug 4, al

    pop fl
    pop dl
    pop cl
    pop bl
    ret




; Division russe
; Entrée : AL = dividende, BL = diviseur
; Sortie : AL = quotient, BL = reste
russian_divide:
    push cl
    push dx

    cmp bl, 0
    je .error

    mov cl, 0        ; quotient
    mov dl, al       ; reste = dividende
    
    ; On va multiplier le diviseur jusqu'à dépasser
    mov al, bl       ; AL = diviseur courant
    mov bl, 1        ; BL = multiplicateur courant
    
    ; Doubler jusqu'à dépasser
.double:
    cmp al, dl
    ja .start_sub
    shl al, 1
    shl bl, 1
    jmp .double
    
.start_sub:
    ; Revenir à la valeur précédente
    shr al, 1
    shr bl, 1
    
.sub_loop:
    cmp bl, 0
    je .done
    
    cmp dl, al
    jb .next
    
    sub dl, al
    add cl, bl
    
.next:
    shr al, 1
    shr bl, 1
    jmp .sub_loop
    
.done:
    mov al, cl       ; quotient
    mov bl, dl       ; reste
    pop dx
    pop cl
    ret

.error:
    mov al, 0xFF
    mov bl, 0xFF
    pop dx
    pop cl
    ret
