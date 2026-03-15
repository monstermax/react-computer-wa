
- os: partitions / secteur d'amorcage
- os: filesystem (mkfs) => voir https://github.com/ReturnInfinity/BareMetal-OS-legacy/blob/master/os/drivers/filesystems/bmfs.asm
- os: parser les arguments de la commande shell
- os: separer dans 2 dossiers le code "kernel" et le code "user/userland"
- gestion des fleches clavier (pour créer jeu dans screen ou pour créer menu menuconfig)
- import/export des io disk via json et/ou raw
- gui: afficher l'etat de la pile
- gui connexion/deconnexion de device io à chaud
- cpu: gérer des registres 16-bit (couple de registres 8-bit) ?

- rendre le code assembleur compatible nasm

- /!\ ne pas lire le code depuis la ROM. d'abord copier la ROM dans la RAM => bootloader stage 2 qui copie le kernel en RAM ?

+ cpu: interrupts

- prevoir un interpreteur assembleur (en plus du compilateur) ?

- io gamepad
- io mouse
- io 7-segments display
- io network/socket => OK (nodejs)
- io websocket

+ os: interrupts handlers
+ os: syscall handlers
- os: gestionnaire de devices
- os: gestionnaire du root virtual system
- os: gestionnaire de fichiers ouverts
- os: gestionnaire de processus/threads
- os: gestionnaire des users


- jeux: t-rex, pong, arkanoid, snake, tetris, sokoban, pacman, game of life, frogger

- partage de code & devices entre utilisateurs

- créer github doc emulateur
- créer paquet npm pour code assembleur (bootloader + OS)
- créer github code assembleur & devices io communautaire

- créer gamification (levels & badges)

- créer serveur discord
- créer chaine youtube


Périphériques créatifs
- Clavier virtuel sur le screen, cliquable à la souris (pour tablettes/tactile)
- Piano : Utiliser le clavier PC comme touches de piano avec le buzzer
- Générateur de musique : Format mod/tracker minimal avec 3 canaux
- Horloge/timer : Réveil avec alarme (buzzer) et affichage 7-segments
- Météo : Récupérer la météo via network et l'afficher
- Terminal chat : Discussion entre deux navigateurs via WebSocket



