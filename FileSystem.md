
# File System


- inspiration : https://github.com/lifo-sh/lifo


## Structure

```
/

/bin => /usr/bin

/dev
/dev/0
/dev/0/io_base
/dev/0/io_index
/dev/0/name

/proc
/proc/1
/proc/1/exe => /bin/init
/proc/1/cwd => /
/proc/1/cmdline

/proc/2
/proc/2/exe => /bin/bash
/proc/2/cwd => /
/proc/2/cmdline

/etc

/mnt

/usr

/usr/bin
/usr/bin/init
/usr/bin/bash

/usr/lib
/usr/lib/devices
/usr/lib/devices/lib_devices.so

/usr/lib/devices/console
/usr/lib/devices/console/lib_console.so

```


---

## Commandes:

```
mkfs /dev/0

mount /dev/0 /usr
```



## MBR

```
+-------------------------------+---------------------------+-----------------+
|      Code d'amorçage          |   Table des partitions    |   Signature     |
|      (Bootloader code)        |   (Partition table)       |   0x55AA        |
|      (446 octets)             |   (64 octets)             |   (2 octets)    |
+-------------------------------+---------------------------+-----------------+
^                               ^                           ^
0x0000                          0x01BE                      0x01FE
(Tout début du disque)           (Début de la table)        (Fin du MBR)
```


1. Si le disque n'est PAS bootable (disque de données)
- Même si vous ne pouvez pas démarrer dessus, le disque a besoin d'une table des partitions pour que le système d'exploitation puisse organiser et trouver vos fichiers.
- Code d'amorçage (octets 0-445) : Cette zone est soit vide (remplie de zéros), soit elle contient des données aléatoires ou un code inoffensif, mais rien qui ne permette de lancer un OS.
- Table des partitions (octets 446-509) : Elle est bien présente et correctement renseignée. C'est elle qui indique où se trouve la partition "Data" (en NTFS, ext4, etc.).
- Signature 0x55AA (octets 510-511) : Elle est toujours présente. C'est elle qui valide que le secteur 0 est bien un secteur de type MBR (valide), même si le code dedans est inutilisable pour booter.

2. Si le disque EST bootable (disque système)
- Code d'amorçage (octets 0-445) : Cette zone contient un petit programme (bootloader). Son rôle est de chercher dans la table des partitions la partition marquée comme "active" (bootable) pour charger le reste du système.
- Table des partitions (octets 446-509) : Elle est présente, et l'une des entrées a un flag spécial appelé "boot flag" (indicateur de démarrage).
- Signature 0x55AA (octets 510-511) : Toujours présente.


# La Table des Partitions
Elle est divisée en 4 entrées de 16 octets chacune. Chaque entrée décrit une partition primaire (son type, son début, sa taille, etc.). C'est pour cela qu'avec un MBR traditionnel, on ne peut avoir que 4 partitions primaires maximum.


---

## Process

### actuellement
au demarrage de l'emulateur, le code du bootloader est mis dans la ROM et le code de l'OS est mis dans le disque "os_disk" (device IO).

le bootloader (codé avec notre assembleur fait maison) s'occupe de copier le contenu du disque "os_disk" dans la RAM de l'emulateur. ensuite il "jump" à l'adresse de l'OS, et l'OS s'execute, prenant le relais.

### todo
idealement "mkfs" aura généré 2 partitions : 1 partition "raw" contenant des instructions machines et le "stage 1" de l'OS, et une partition contenant un systeme de fichiers (le stage 2 et tous les fichiers kernel et userland).
note: cela veut dire qu'il faut gérer les partions dans notre systeme de fichiers et de disques.



---

# FS Types

source: https://github.com/WebAssembly/WASI/blob/main/proposals/filesystem/wit-0.3.0-draft/types.wit


filetype / descriptortype :
    unknown,            /// The type of the descriptor or file is unknown or is different from any of the other types specified.
    block-device,       /// The descriptor refers to a block device inode.
    character-device,   /// The descriptor refers to a character device inode.
    directory,          /// The descriptor refers to a directory inode.
    fifo,               /// The descriptor refers to a named pipe.
    symbolic-link,      /// The file refers to a symbolic link inode.
    regular-file,       /// The descriptor refers to a regular file inode.
    socket,             /// The descriptor refers to a socket.


filestat : 
    %type: descriptor-type,                        /// File type.
    link-count: link-count,                        /// Number of hard links to the file.
    size: filesize,                                /// For regular files, the file size in bytes. For symbolic links, the length in bytes of the pathname contained in the symbolic link.
    data-access-timestamp: option<instant>,        /// Last data access timestamp. If the `option` is none, the platform doesn't maintain an access  timestamp for this file.  Last data modification timestamp.

    data-modification-timestamp: option<instant>,  /// If the `option` is none, the platform doesn't maintain a modification timestamp for this file.

    status-change-timestamp: option<instant>,      /// Last file status-change timestamp. If the `option` is none, the platform doesn't maintain a status-change timestamp for this file.



# Path resolution


https://github.com/WebAssembly/WASI/blob/main/proposals/filesystem/path-resolution.md

