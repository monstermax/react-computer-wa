; Author: yomax
; Date: 2026-02
; Name: lib_string
; Description: Lib string for bootloader_v2


.include "bootloader/lib_math.asm"


section .text
    global strcmp


; -----------------------------------------------
; strcmp : compare string [A:B] vs [C:D] (null-terminated)
; Résultat : flag zero=1 si égales
; -----------------------------------------------
strcmp:
    STRCMP_START:
    ldi el, al, bl ; E = [A:B]
    ldi fl, cl, dl ; F = [C:D]
    cmp el, fl

    jne STRCMP_END

    cmp el, 0
    je STRCMP_END

    call inc_ab
    call inc_cd
    jmp STRCMP_START

    STRCMP_END:
    ret

