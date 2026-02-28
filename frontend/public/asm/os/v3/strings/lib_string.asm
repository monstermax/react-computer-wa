; Author: yomax
; Date: 2026-02
; Name: lib_string
; Description: Strings Library


.include "os/v3/arithmetic/lib_math.asm"


section .data
    DIGIT_0 equ 48
    DIGIT_9 equ 57

section .text
    global strlen
    global strcmp
    global strcmp_len
    global int_to_str
    global str_to_int


; TODO: strlower & strupper


ret ; this is a lib. no default entrypoint defined



; recupere la taille d'une chaine [C:D] (terminée par \0). => A = longueur de la chaine située à l'adresse [C:D]
strlen:
    push cl
    push dl
    push fl

    mov al, 0 ; A = longueur finale de la chaine à analyser

    STRLEN_LOOP:
    ; lecture d'un caractere
    ldi fl, cl, dl ; F = [C:D]

    cmp fl, 0
    je STRLEN_END ; si fin de chaine (caractere 0), on quitte

    call inc_cd ; incremente (C:D) pour passer au caractere suivant
    inc al ; incremente A pour comptabiliser ce caractere
    jmp STRLEN_LOOP

    STRLEN_END:
    pop fl
    pop dl
    pop cl
    ret


; -----------------------------------------------
; strcmp : compare string [A:B] vs [C:D] (null-terminated)
; Résultat : flag zero=1 si égales
; -----------------------------------------------
strcmp:
    STRCMP_START:

    ; lecture des caracteres des 2 chaines
    ldi el, al, bl ; E = [A:B]
    ldi fl, cl, dl ; F = [C:D]
    cmp el, fl ; compare les caracteres

    jne STRCMP_END ; si caractere different, on quitte (avec sauvegarde du flag zero)

    cmp el, 0
    je STRCMP_END ; si fin de chaine (caractere 0), on quitte (avec sauvegarde du flag zero)

    call inc_ab
    call inc_cd
    jmp STRCMP_START ; passage au caractere suivant

    STRCMP_END:
    ret



strcmp_len:
    ; si chaine vide, on quitte directement
    cmp fl, 0
    je STRCMP_LEN_END

    push fl ; sauvegarde la longueur de la chaine

    STRCMP_LEN_START:

    ; lecture des caracteres des 2 chaines
    push fl ; sauvegarde la longueur de la chaine (1 byte) = longueur restante à lire
    ldi el, al, bl ; E = [A:B]
    ldi fl, cl, dl ; F = [C:D]
    cmp el, fl ; compare les caracteres
    pop fl ; restaure la longueur restante à lire

    ; si caractere different, on quitte (avec sauvegarde du flag zero)
    jne STRCMP_LEN_END_POP

    dec fl ; decremente la longueur restante à lire
    cmp fl, 0

    ; si fin de chaine (longueur atteinte), on quitte (avec sauvegarde du flag zero)
    je STRCMP_LEN_END_POP

    ;push fl ; sauvegarde la longueur restante à lire

    ; passage au caractere suivant
    call inc_ab
    call inc_cd
    jmp STRCMP_LEN_START ; retour à STRCMP_LEN_START

    STRCMP_LEN_END_POP:
    pop fl ; restaure l'etat de la pile

    STRCMP_LEN_END:
    ret




; -----------------------------------------------
; int_to_str : convertit un entier 8 bits en string
; Entrée : AL = nombre à convertir (0-255)
;         [C:D] = buffer de destination (au moins 4 bytes)
; Sortie : [C:D] contient la string terminée par \0
;         A retourne la longueur de la string
; -----------------------------------------------
int_to_str:
    push bl
    push cl
    push dl
    push el
    push fl

    ; Sauvegarde l'adresse de destination
    push cl
    push dl

    mov el, 0           ; compteur de caractères

    ; Cas spécial: nombre = 0
    cmp al, 0
    jne .int_to_str_not_zero

    mov fl, DIGIT_0
    sti cl, dl, fl
    call inc_cd
    inc el
    jmp .null_term

.int_to_str_not_zero:
    ; Sauvegarde la valeur originale
    push al

    ; === Calcul des centaines ===
    mov bl, 0           ; compteur centaines
    mov fl, al          ; valeur restante
    
.count_100:
    cmp fl, 100
    jb .done_100
    sub fl, 100
    inc bl
    jmp .count_100

.done_100:
    mov al, bl          ; al = nombre de centaines
    cmp al, 0
    je .prepare_tens

    ; Affiche les centaines
    add al, DIGIT_0
    sti cl, dl, al
    call inc_cd
    inc el

.prepare_tens:
    ; FL contient le reste (0-99)
    ; On le sauvegarde pour plus tard
    push fl             ; ← PUSH équilibré : on push ici pour tous les chemins

    ; === Calcul des dizaines ===
    mov bl, 0           ; compteur dizaines
    mov al, fl          ; al = reste (0-99)
    
.count_10:
    cmp al, 10
    jb .done_10
    sub al, 10
    inc bl
    jmp .count_10

.done_10:
    ; À ce stade : bl = dizaines, al = unités
    ; On récupère le reste des centaines pour décider l'affichage
    pop fl              ; ← POP correspondant au PUSH de .prepare_tens

    ; Décide si on affiche les dizaines
    cmp fl, 0           ; fl = reste des centaines (0-99)
    jne .show_tens      ; Si on avait des centaines, on affiche toujours les dizaines
    cmp bl, 0
    je .show_units      ; Si pas de centaines ET dizaines=0, on saute

.show_tens:
    push al             ; sauvegarde les unités
    mov al, bl
    add al, DIGIT_0
    sti cl, dl, al
    call inc_cd
    inc el
    pop al              ; restaure les unités

.show_units:
    add al, DIGIT_0
    sti cl, dl, al
    call inc_cd
    inc el

    ; Nettoie la pile de la sauvegarde de .int_to_str_not_zero
    pop al              ; correspond au push al de .int_to_str_not_zero

.null_term:
    mov fl, 0
    sti cl, dl, fl

    ; Restaure l'adresse de départ pour calculer la longueur
    pop dl
    pop cl
    mov al, el          ; A = longueur de la string

    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    ret



; -----------------------------------------------
; str_to_int : convertit une string en entier 8 bits
; Entrée : [C:D] = adresse de la string (terminée par \0)
; Sortie : AL = valeur numérique (0-255)
;         Si erreur (caractère non numérique ou dépassement), AL = 0xFF
; -----------------------------------------------
str_to_int:
    push bl
    push cl
    push dl
    push el
    push fl

    mov al, 0        ; résultat
    mov el, 0        ; compteur de chiffres (max 3)

.str_to_int_next_char:
    ; Lecture du caractère
    ldi fl, cl, dl   ; FL = caractère courant

    ; Fin de chaine ?
    cmp fl, 0
    je .str_to_int_end_success

    ; Vérification que c'est un chiffre (0-9)
    cmp fl, DIGIT_0
    jb .str_to_int_error
    cmp fl, DIGIT_9
    ja .str_to_int_error

    ; Conversion ASCII → valeur (soustraire '0')
    sub fl, DIGIT_0

    ; Sauvegarde du nouveau chiffre
    push fl

    ; Multiplication du résultat actuel par 10
    ; AL = AL * 10
    mov bl, 10
    call mul8        ; AL = AL * 10 (utilise BL=10)

    ; Ajout du nouveau chiffre
    pop fl
    add al, fl
    jc .str_to_int_error        ; Si carry, dépassement (>255)

    ; Passage au caractère suivant
    call inc_cd
    inc el           ; inc compteur chiffres

    ; Maximum 3 chiffres pour 0-255
    cmp el, 3
    jge .str_to_int_check_end
    jmp .str_to_int_next_char

.str_to_int_check_end:
    ; Vérifie qu'il n'y a plus que le null terminator
    ldi fl, cl, dl
    cmp fl, 0
    jne .str_to_int_error       ; Si pas null, trop long

.str_to_int_end_success:
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    ret

.str_to_int_error:
    mov al, 0xFF
    pop fl
    pop el
    pop dl
    pop cl
    pop bl
    ret

