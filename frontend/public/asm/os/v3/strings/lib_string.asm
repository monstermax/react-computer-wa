; Author: yomax
; Date: 2026-02
; Name: lib_string
; Description: Strings Library


.include "os/v3/arithmetic/lib_math.asm"


section .text
    global strlen
    global strcmp
    global strcmp_len


_exit:
    ret



; recupere la taille d'une chaine (terminée par \0). => A = longueur de la chaine située à l'adresse [C:D]
strlen:
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
    ret



; TODO: strlower & strupper & int_to_str & str_to_int


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
    push fl ; sauvegarde la longueur de la chaine (1 byte) = longueur restante à lire

    ; TODO: a revoir => il faut (aussi) comparer la longueur des chaines

    ; si chaine vide, on quitte directement
    cmp fl, 0
    je STRCMP_LEN_END_POP

    STRCMP_LEN_START:

    ; lecture des caracteres des 2 chaines
    ldi el, al, bl ; E = [A:B]
    ldi fl, cl, dl ; F = [C:D]
    cmp el, fl ; compare les caracteres

    ; si caractere different, on quitte (avec sauvegarde du flag zero)
    jne STRCMP_LEN_END_POP


    pop fl ; restaure la longueur restante à lire
    dec fl ; decremente la longueur restante à lire
    cmp fl, 0

    ; si fin de chaine (longueur atteinte), on quitte (avec sauvegarde du flag zero)
    je STRCMP_LEN_END

    push fl ; sauvegarde la longueur restante à lire

    ; passage au caractere suivant
    call inc_ab
    call inc_cd
    jmp STRCMP_LEN_START ; retour à STRCMP_LEN_START

    STRCMP_LEN_END_POP:
    pop fl ; restaure l'etat de la pile

    STRCMP_LEN_END:
    ret
