; Author: yomax
; Date: 2026-02
; Name: lib_shell
; Description: Shell Library


.include "os/v3/arithmetic/lib_math.asm"
.include "os/v3/drivers/lib_console.asm"
.include "os/v3/drivers/lib_leds.asm"
.include "os/v3/drivers/lib_keyboard.asm"
.include "os/v3/drivers/lib_screen.asm"
.include "os/v3/drivers/lib_switchs.asm"
.include "os/v3/strings/lib_ascii.asm"
.include "os/v3/strings/lib_string.asm"
.include "os/v3/graphics/demo_screen.asm"
.include "os/v3/graphics/demo_sprites_pack1.asm"
.include "os/v3/graphics/demo_sprites_pack2.asm"
.include "os/v3/graphics/demo_sprite_youtube.asm"


section .data
    ;keyboard_io_base      dw 0xF000 ; TODO: a remplacer par [keyboard_io_base] ; TODO: reproduire/copier/importer le code du bootloader pour initialiser les devices

    shell_command_ptr     db 0x00 ; position du pointer dans l'espace "shell_command_input"

    STR_WELCOME_LINE_1    db "== OS v3 ==", 13, 13, 0
    STR_CONSOLE_PROMPT    db "root@playground $ ", 0
    STR_RUN_COMMAND       db "Running command...", 13, 0
    STR_COMMAND_NOT_FOUND db "Command not found", 13, 0
    STR_COMMAND_HELP_TEST db 13, "Commands:", 13
                          db "   help      (0) Print help message (this message)", 13 ; test
                          db "   custom    (1) Run custom code", 13
                          db "   pixels    (2) Screen pixels demo", 13
                          db "   sprite    (3) Screen sprite demo", 13
                          db "   leds      (4) Toggle LEDs", 13
                          db "   clear     (5) Clear Console & Screen", 13
                          db "   reboot    (6) Reboot the computer", 13
                          db "   halt      (7) Halt the computer", 13
                          db "   ls            Display files list (Not yet available)", 13
                          db "   ps            Display processes list (Not yet available)", 13
                          db 13, 0
    STR_COMMAND_LS_TEST   db "Files list here...", 13, 0
    STR_COMMAND_PS_TEST   db "Processes list here...", 13, 0

    STR_CUSTOM_COMMAND_MISSING db "Custom code not loaded", 13, 0
    STR_COMMAND_NOT_AVAILABLE db "Command not yet available", 13, 0

    STR_COMMANDS_BEGIN    db 0
    STR_COMMAND_PIXELS    db "pixels", 0
    STR_COMMAND_SPRITE    db "sprite", 0
    STR_COMMAND_REBOOT    db "reboot", 0
    STR_COMMAND_CUSTOM    db "custom", 0
    STR_COMMAND_CLEAR     db "clear", 0
    STR_COMMAND_HELP      db "help", 0
    STR_COMMAND_HALT      db "halt", 0
    STR_COMMAND_LEDS      db "leds", 0
    STR_COMMAND_MKFS      db "mkfs", 0
    STR_COMMAND_PS        db "ps", 0
    STR_COMMAND_LS        db "ls", 0
    STR_COMMANDS_END      db 0

    SHELL_COMMAND_MAX_LEN equ 128 ; longueur max de la chaine shell_command_input

    LEDS_STATE_HALF_1     equ 0x55
    LEDS_STATE_HALF_2     equ 0xAA
    CUSTOM_CODE_LOAD_ADDR equ 0xA000
    ASCII_EOL             equ 13

    network_tcp_device_str db "network_tcp"
    network_tcp_device_idx db 0x00       ; must be followed by network_tcp_device_io_base. will be auto filled
    network_tcp_device_io_base dw 0x0000 ; must be placed just after network_tcp_device_idx. will be auto filled



section .bss
    shell_command_input  resb 128 ; 128 bits pour stocker la commande en cours (la taille doit correspondre à SHELL_COMMAND_MAX_LEN)


section .text
    global run_shell


ret ; this is a lib. no default entrypoint defined


run_shell:
    ;int3

    ; run_shell_print_info:
    lea cl, dl, [STR_WELCOME_LINE_1]
    call console_print_string

    run_shell_prompt:
    mov [shell_command_ptr], 0x00 ; reinitialise le pointeur de position (de la chaine de caractere de la commande tapée)

    ; Affiche le prompt:
    lea cl, dl, [STR_CONSOLE_PROMPT]
    call console_print_string


    ; cas particulier pour l'emulateur en mode NodeJS (et non Browser+React)
    call handle_cli


    ; Boucle d'ecoute de touches clavier
    RUN_SHELL_READLINE:


    ; ecoute les boutons du GUI
    call get_switchs_pending

    cmp al, 0xFF
    je SKIP_HANDLE_BUTTONS

    ; Lire l'état de ce switch
    ;push al                    ; sauvegarder l'index
    ;call get_switch_state      ; A = 1 si ON, 0 si OFF
    ;pop bl                     ; BL = index

    push al ; enregistre l'idx du bouton
    mov al, 0
    call set_switchs_value ; reinitialise la valeur du bouton
    pop al

    ; check si c'est bouton #0
    cmp al, 0x00
    jne SKIP_HANDLE_BUTTON_0

    ; execute l'action du bouton #0 => help
    mov al, ASCII_EOL
    call console_print_char

    call run_command_help
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_0:


    ; check si c'est bouton #1
    cmp al, 0x01
    jne SKIP_HANDLE_BUTTON_1

    ; execute l'action du bouton #1 => custom
    mov al, ASCII_EOL
    call console_print_char

    call run_command_custom
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_1:


    ; check si c'est bouton #2
    cmp al, 0x02
    jne SKIP_HANDLE_BUTTON_2

    ; execute l'action du bouton #2 => pixels
    mov al, ASCII_EOL
    call console_print_char

    call run_command_pixels
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_2:


    ; check si c'est bouton #3
    cmp al, 0x03
    jne SKIP_HANDLE_BUTTON_3

    ; execute l'action du bouton #3 => sprite
    mov al, ASCII_EOL
    call console_print_char

    call run_command_sprite
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_3:


    ; check si c'est bouton #4
    cmp al, 0x04
    jne SKIP_HANDLE_BUTTON_4

    ; execute l'action du bouton #4 => sprite
    mov al, ASCII_EOL
    call console_print_char

    call run_command_leds
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_4:


    ; check si c'est bouton #5
    cmp al, 0x05
    jne SKIP_HANDLE_BUTTON_5

    ; execute l'action du bouton #5 => halt
    mov al, ASCII_EOL
    call console_print_char

    call run_command_clear
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_5:


    ; check si c'est bouton #6
    cmp al, 0x06
    jne SKIP_HANDLE_BUTTON_6

    ; execute l'action du bouton #6 => halt
    mov al, ASCII_EOL
    call console_print_char

    call run_command_reboot
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_6:


    ; check si c'est bouton #7
    cmp al, 0x07
    jne SKIP_HANDLE_BUTTON_7

    ; execute l'action du bouton #7 => halt
    mov al, ASCII_EOL
    call console_print_char

    call run_command_halt
    jmp CALL_RUN_COMMAND_END
    SKIP_HANDLE_BUTTON_7:


    SKIP_HANDLE_BUTTONS:


;    ; Calcul l'adresse pour acceder à la lecture du statut clavier
;    mov cl, [keyboard_io_base]     ; low  byte de l'adresse de la variable keyboard_io_base
;    mov dl, [keyboard_io_base + 1] ; high byte de l'adresse de la variable keyboard_io_base
;    call inc_cd ; incremente (C:D) pour atteindre KEYBOARD_STATUS
;
;    ; Lecture du statut clavier (est-ce qu'une touche a été pressée ? oui/non)
;    ldi al, cl, dl ; A = [C:D]
    call get_keyboard_status
    cmp al, 0
    je RUN_SHELL_READLINE ; si pas de touche pressé, on retourne au label "RUN_SHELL_READLINE"


    ; Lecture du caractere clavier (et stocke la valeur dans A)
;    mov cl, [keyboard_io_base]     ; low  byte de l'adresse de la variable keyboard_io_base
;    mov dl, [keyboard_io_base + 1] ; high byte de l'adresse de la variable keyboard_io_base
;    ldi al, cl, dl ; A = [C:D]
    call get_keyboard_char

    ; Confirme la lecture du clavier ; set_keyboard_status
    call inc_cd ; incremente (C:D) pour atteindre KEYBOARD_STATUS
    sti cl, dl, 0 ; confirme la lecture du clavier


    mov fl, [shell_command_ptr] ; longueur de la chaine en cours


    ; TODO: a refactorer. ignorer les caracteres non imprimables (< 32). ne pas les ajouter au buffer. ne pas les envoyer a la console


    ; Detection touche backspace
    cmp, al, ASCII_BACKSPACE
    je HANDLE_BACKSPACE
    jmp HANDLE_NO_BACKSPACE

    ; gestion du backspace
    HANDLE_BACKSPACE:
    cmp fl, 0
    je RUN_SHELL_READLINE ; Si chaine vide, on ne fait rien. retour a l'ecoute du clavier

    ; Decremente le pointer de position
    dec [shell_command_ptr]

    jmp AFTER_HANDLE_BACKSPACE


    ; gestion du NO backspace
    HANDLE_NO_BACKSPACE:

    ; Detection si longueur maximal (de la chaine) atteinte
    ;mov fl, [shell_command_ptr]
    cmp fl, SHELL_COMMAND_MAX_LEN
    jl AFTER_CHECK_MAX_LEN ; si longueur max non atteinte, on skip la verification de entrée

    HANDLE_MAX_LEN:
    cmp al, ASCII_CR
    jne RUN_SHELL_READLINE ; si NOT touche entrée retour a lecture du clavier

    AFTER_CHECK_MAX_LEN:


    ; Ajoute le caractere au buffer "shell_command_input" (a l'aide du pointer de position "shell_command_ptr")
    lea cl, dl, [shell_command_input]
    mov el, [shell_command_ptr]
    call add_cd_e
    sti cl, dl, al

    ; Incremente le pointer de position
    inc [shell_command_ptr]

    ; fin de la gestion du backspace
    AFTER_HANDLE_BACKSPACE:


    ; Affiche le caractere sur la console
    call console_print_char

    ; Si touche Entrée, on execute la commande complete
    cmp al, ASCII_CR
    je RUN_SHELL_RUN_COMMAND



    ; sinon on retourne écouter le prochain caractere clavier
    jmp RUN_SHELL_READLINE


    ; Execute la commande tapée
    RUN_SHELL_RUN_COMMAND:

    ; remplace le \10 final par \0
    lea cl, dl, [shell_command_input]
    mov el, [shell_command_ptr]
    call add_cd_e
    sti cl, dl, 0

    ; Detection caractere diese en debut de commande
    mov al, [shell_command_input]
    cmp, al, ASCII_SHARP
    je CALL_RUN_COMMAND_END

    ; Affiche un message pour indiquer l'execution de la commande
    ; lea cl, dl, [STR_RUN_COMMAND]
    ; call console_print_string


    ; Affiche la commande tapée
    ;mov bl, [shell_command_ptr] ; definit la longueur de la chaine à afficher
    ;lea cl, dl, [shell_command_input]
    ;call console_print_sized_string ; afficher la commande tapée


    ; Execute la commande tapée
    call run_command

    CALL_RUN_COMMAND_END:
    jmp run_shell_prompt ; retour au prompt
    ret


run_command:
    ; affiche un message d'information
    ;lea cl, dl, [STR_RUN_COMMAND] ; (C,D) = [STR_RUN_COMMAND]
    ;mov bl, [shell_command_ptr] ; definit la longueur de la chaine
    ;call console_print_string

    mov fl, [shell_command_ptr] ; recupere le pointeur de position de la chaine (pour connaitre la longueur de la chaine)
    dec fl ; recupere la longueur de la chaine saisie (decremente pour retirer le EOL)
    push fl ; sauvegarde la longueur de la chaine saisie
    jz RUN_COMMAND_END

    ; TODO: on a besoin de connaitre la longueur de chaque chaine a comparer (help, ls, ...) pour que strcmp_len soit coherent
    ; on connait la longueur de la chaine tapée (F) mais pas la longueur de la chaine a comparer (STR_COMMAND_HELP, STR_COMMAND_LS, ...)


    ; HANDLE HELP

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_HELP] ; (C,D) = [STR_COMMAND_HELP]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_HELP

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_HELP ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_HELP ; si chaine differente, on passe a la commande suivante

    call run_command_help ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_HELP:


    ; HANDLE LS

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_LS] ; (C,D) = [STR_COMMAND_LS]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_LS

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_LS ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_LS ; si chaine differente, on passe a la commande suivante

    call run_command_ls ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_LS:


    ; HANDLE PS

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_PS] ; (C,D) = [STR_COMMAND_PS]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_PS

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_PS ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_PS ; si chaine differente, on passe a la commande suivante

    call run_command_ps ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_PS:


    ; HANDLE PIXELS

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_PIXELS] ; (C,D) = [STR_COMMAND_PIXELS]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_PIXELS

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_PIXELS ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_PIXELS ; si chaine differente, on passe a la commande suivante

    call run_command_pixels ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_PIXELS:


    ; HANDLE SPRITE

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_SPRITE] ; (C,D) = [STR_COMMAND_SPRITE]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_SPRITE

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_SPRITE ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_SPRITE ; si chaine differente, on passe a la commande suivante

    call run_command_sprite ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_SPRITE:


    ; HANDLE LEDS

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_LEDS] ; (C,D) = [STR_COMMAND_LEDS]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_LEDS

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_LEDS ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_LEDS ; si chaine differente, on passe a la commande suivante

    call run_command_leds ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_LEDS:



    ; HANDLE MKFS

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_MKFS] ; (C,D) = [STR_COMMAND_MKFS]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_MKFS

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_MKFS ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_MKFS ; si chaine differente, on passe a la commande suivante

    call run_command_mkfs ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_MKFS:




    ; HANDLE CUSTOM

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_CUSTOM] ; (C,D) = [STR_COMMAND_CUSTOM]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_CUSTOM

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_CUSTOM ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_CUSTOM ; si chaine differente, on passe a la commande suivante

    call run_command_custom ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_CUSTOM:


    ; HANDLE HALT

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_HALT] ; (C,D) = [STR_COMMAND_HALT]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_HALT

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_HALT ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_HALT ; si chaine differente, on passe a la commande suivante

    call run_command_halt ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_HALT:


    ; HANDLE REBOOT

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_REBOOT] ; (C,D) = [STR_COMMAND_REBOOT]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_REBOOT

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_REBOOT ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_REBOOT ; si chaine differente, on passe a la commande suivante

    call run_command_reboot ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_REBOOT:


    ; HANDLE CLEAR

    ; recupere un pointer vers la chaine de caractere de la commande à executer
    lea al, bl, [shell_command_input]

    ; recupere un pointer vers la chaine de caractere à comparer (parmi la liste des commandes connues)
    lea cl, dl, [STR_COMMAND_CLEAR] ; (C,D) = [STR_COMMAND_CLEAR]

    ; recupere la longueur de la chaine à comparer
    push al
    call strlen ; => A = longueur de la chaine STR_COMMAND_CLEAR

    ; compare les longueurs de chaines
    cmp al, fl
    pop al
    jne AFTER_CHECK_COMMAND_CLEAR ; si longueur de chaine differente, on passe a la commande suivante

    ; compare les chaines
    call strcmp_len
    jne AFTER_CHECK_COMMAND_CLEAR ; si chaine differente, on passe a la commande suivante

    call run_command_clear ; run command
    jmp RUN_COMMAND_END

    AFTER_CHECK_COMMAND_CLEAR:



    COMMAND_NOT_FOUND:
    debug 9, 0xFF
    lea cl, dl, [STR_COMMAND_NOT_FOUND]
    call console_print_string
    ;hlt
    ;ret

    RUN_COMMAND_END:
    pop fl
    ;hlt
    ret



run_command_help:
    debug 9, 1
    lea cl, dl, [STR_COMMAND_HELP_TEST]
    call console_print_string
    ;hlt
    ret


run_command_ls:
    debug 9, 2
    lea cl, dl, [STR_COMMAND_LS_TEST]
    call console_print_string
    ;hlt
    ret


run_command_ps:
    debug 9, 3
    lea cl, dl, [STR_COMMAND_PS_TEST]
    call console_print_string
    ;hlt
    ret


run_command_pixels:
    debug 9, 4
    ;call draw_plasma
    call draw_xor_pattern
    ;call draw_tunnel
    ;call draw_diamond
    ;call draw_fire_palette
    ;call draw_checkerboard_gradient
    ;call draw_rainbow_diagonal
    ;call draw_spiral
    ret


run_command_sprite:
    debug 9, 5
    ;call draw_mario
    ;call draw_mario_and_sonic ; Sonic est un peu foiré
    ;call draw_pacman
    call draw_ghost
    ;call draw_invader
    ;call draw_heart
    ;call draw_mushroom
    ;call draw_creeper
    ;call draw_arcade_scene
    ;call draw_youtube_logo
    ret


run_command_leds:
    debug 9, 6
    call leds_get_value
    cmp al, 0
    je HANDLE_COMMAND_LEDS_ON ; si eteint, on jump pour allumer (en state half_1)

    HANDLE_COMMAND_LEDS_OFF:
    cmp al, LEDS_STATE_HALF_1
    je HANDLE_COMMAND_LEDS_ON_1

    ; eteind les LEDS
    call leds_set_none
    jmp COMMAND_LEDS_END ; saute a la fin de la commande


    HANDLE_COMMAND_LEDS_ON_1:
    ; allume les LEDS (en state half_2)
    mov al, LEDS_STATE_HALF_2
    call leds_set_value
    jmp COMMAND_LEDS_END ; saute a la fin de la commande


    HANDLE_COMMAND_LEDS_ON:
    ; allume les LEDS (en state half_1)
    mov al, LEDS_STATE_HALF_1
    call leds_set_value
    jmp COMMAND_LEDS_END ; saute a la fin de la commande


    COMMAND_LEDS_END:
    ;hlt
    ret


run_command_mkfs:
    debug 9, 7
    lea cl, dl, [STR_COMMAND_NOT_AVAILABLE]
    call console_print_string
    ; TODO
    ret


run_command_custom:
    debug 9, 8
    mov al, [CUSTOM_CODE_LOAD_ADDR] ; detecte si du code est présent a l'adresse CUSTOM_CODE_LOAD_ADDR
    cmp al, 0
    jnz CUSTOM_CODE_START ; si code trouvé on pouvoir l'executer

    CUSTOM_CODE_NOT_FOUND:
    lea cl, dl, [STR_CUSTOM_COMMAND_MISSING]
    call console_print_string
    jmp CUSTOM_CODE_END

    ; execution du code custom
    CUSTOM_CODE_START:
    call CUSTOM_CODE_LOAD_ADDR
    ;hlt
    CUSTOM_CODE_END:
    ret


run_command_clear:
    debug 9, 9
    call run_command_clear_console ; clear console
    call run_command_clear_screen  ; clear screen
    ret

run_command_clear_console:
    debug 9, 10
    call console_clear
    ret

run_command_clear_screen:
    debug 9, 11
    call screen_clear
    ret


run_command_halt:
    debug 9, 12
    hlt
    ret


run_command_reboot:
    debug 9, 13
    mov al, 0
    mov bl, 0
    mov cl, 0
    mov dl, 0
    mov el, 0
    mov fl, 0
    mov esp, 0

    mov [0x4999], 1 ; DEBUG
    jmp 0x0000 ; ATTENTION BUG : apres reboot, l'OS ne se lance pas (il perd les pedales lors de l'appel "call init_drivers" dans "os_v3.asm"). il jump à 0x202B au lieu de 0x102B
    ;ret



; direct start custom code when it is cli mode (nodejs)
handle_cli:
    lea al, bl, [network_tcp_device_str]
    call find_device_by_name

    cmp cl, 0
    jne handle_cli_apply ; device network_tcp found

    cmp dl, 0
    jne handle_cli_apply ; device network_tcp found

    jmp handle_cli_end ; device network_tcp not found

    handle_cli_apply:

    debug 1, 3

    call 0xa000 ; go to custom program

    hlt

    handle_cli_end:
    ret
