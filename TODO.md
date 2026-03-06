
- os: partitions / secteur d'amorcage
- os: filesystem (mkfs) => voir https://github.com/ReturnInfinity/BareMetal-OS-legacy/blob/master/os/drivers/filesystems/bmfs.asm
- os: parser les arguments de la commande shell
- os: separer dans 2 dossiers le code "kernel" et le code "user/userland"
- gestion des fleches clavier (pour créer jeu dans screen ou pour créer menu menuconfig)
- import/export des io disk via json et/ou raw
- gui: afficher l'etat de la pile
- gui connexion/deconnexion de device io à chaud
- cpu: gérer des registres 16-bit (couple de registres 8-bit) ?

- /!\ ne pas lire le code depuis la ROM. d'abord copier la ROM dans la RAM => bootloader stage 2 qui copie le kernel en RAM ?

+ cpu: interrupts
- io gamepad
- io mouse
- io 7-segments display
- io network/socket => OK (nodejs)
- io websocket
- os: interrupts
- os: syscall
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



idées noms chaine youtube / discord:
- Assembly Required
- Illegal Opcode
- ByteForge
- Out of Memory
- Illegal Instruction
- OpCode Only
- The NOP
- BitShift
- 8-bit Lab
- 8-bit Forge
- ByteCraft

- Bare Metal JS
- Silicon in JavaScript
- Build Your CPU
- The Virtual Machine Lab
- Crafting a Computer
- From Bits to OS

- 8 bits suffisent
- Carrément 8-bit
- Bit à Bit
- L'Assembleur du Dimanche
- RétroCode
- La Guerre des Bits
- Le Bastion 8-bit





Doc Dev OS :
- https://wiki.osdev.org/


FileSystem
- https://lifo.sh/ + https://github.com/lifo-sh/lifo => A browser-native operating system
- https://wiki.osdev.org/BMFS => https://github.com/ReturnInfinity/BareMetal-OS-legacy/blob/master/os/drivers/filesystems/bmfs.asm
- https://mikeos.sourceforge.net/handbook-appdev-asm.html#syscalldisk => Mike OS Floppy Files


Autre projet d'OS:
- https://mikeos.sourceforge.net/ => (description FR : https://www.berlios.de/software/mikeos/ )
- https://github.com/ReturnInfinity/BareMetal-OS
- https://github.com/ReturnInfinity/BareMetal
- https://github.com/ReturnInfinity/BareMetal-OS-legacy
- https://github.com/prochazkaml/MichalOS => MikeOS fork
- https://tomos.sourceforge.net/ => MikeOS fork
- https://www.haiku-os.org/ => Haiku OS
- https://git.kolibrios.org/KolibriOS/kolibrios => Kolibri OS
- https://lifo.sh/ => A browser-native operating system



Compilateur :
- https://github.com/wojtup/mosbc => MikeOS' BASIC Compiler

