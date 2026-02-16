

- os: parser les arguments de la commande shell
- os: gestion des io devices (recuperer ce que le bootloader a initialisé)
- os: shell: ameliorer la comparaison de chaines (verifier la longueur des chaines)
- gestion des fleches clavier (pour créer jeu dans screen ou pour créer menu menuconfig)

- /!\ ne pas lire le code depuis la ROM. d'abord copier la ROM dans la RAM.

- io timer
- io randomizer
- io rtc
- io sound/buzzer/speaker
- io switches (8 toggles cliquables dans l'UI, lu comme un byte sur un port (utile pour configurer des paramètres au runtime))
- io gamepad
- io network/socket
- cpu: interrupts
- os: interrupts
- os: syscall
- os: gestionnaire de fichiers ouverts
- os: gestionnaire de processus/threads
- os: gestionnaire des users


- webworkers ?

- jeux: pong, arkanoid, snake, tetris, sokoban, pacman

