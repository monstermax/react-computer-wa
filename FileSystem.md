
# File System


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

