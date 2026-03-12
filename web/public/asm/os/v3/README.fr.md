# OS v4 (stage1) — README (FR)

Ce document décrit précisément **l’architecture visée** et le comportement de la première implémentation `os/v4`.

> Objectif: construire un OS pédagogique mais sérieux, inspiré des concepts Unix/Linux sans les recopier à l’identique.

---

## 1) Boot: enchaînement bootloader -> stage1

### Rôle du bootloader v4
1. Initialiser les devices via la table de devices (découverte dynamique).
2. Résoudre `os_disk` par nom (`init_device` / `find_device_by_name`), sans hardcode d’IO base.
3. Charger le stage1 en RAM à l’adresse `0x1000`.
4. Faire un `jmp 0x1000`.

### Rôle de l’OS v4 stage1
1. Initialiser les drivers nécessaires.
2. Initialiser les structures noyau de VFS (tables en RAM).
3. Déclarer les montages (ex: `os_disk -> /usr`).
4. Déclarer les symlinks (ex: `/bin -> /usr/bin`).
5. Construire les arborescences virtuelles `/dev` et `/proc`.

Le stage1 ne fait pas encore tout (pas de syscall complet/read/write path resolver final), mais pose la base propre pour la suite.

---

## 2) VFS: modèle retenu

Le VFS est la couche d’abstraction centrale qui:
- normalise les chemins (`/usr/bin/init`, `/dev/...`, `/proc/...`),
- route vers le bon backend (FS disque, pseudo-fs `/dev`, pseudo-fs `/proc`),
- gère les montages et les symlinks.

### Structures RAM stage1
- `mount_table`: table de montages actifs.
- `symlink_table`: table des liens symboliques.
- `inode_table`: table de métadonnées inodes simplifiée (POC structurant).
- compteurs (`mount_count`, `symlink_count`, `inode_count`, ...).

Ces structures sont volontairement petites et lisibles pour rester pédagogiques.

---

## 3) Mounts

### Principe
Un montage associe:
- une **source** (device/partition/fs),
- un **point de montage** (chemin dans l’arborescence).

### Dans stage1 v4
- résolution dynamique de `os_disk` par nom,
- création d’une entrée de montage `os_disk -> /usr`.

Aucun index device n’est hardcodé côté logique de montage: tout passe par découverte dans la table devices.

---

## 4) Symlinks

### Principe
Un symlink mappe un chemin logique vers un autre chemin.

### Dans stage1 v4
- déclaration de `/bin -> /usr/bin` dans `symlink_table`.

Plus tard, le resolver de chemins appliquera la réécriture automatiquement à l’ouverture/lookup.

---

## 5) /dev (virtuel, dynamique)

### Principe
`/dev` est un pseudo-fs exposant les devices détectés au runtime.

### Choix v4
- pas de chemins hardcodés type `/dev/0` en statique code,
- génération à partir de `DEVICE_TABLE` (noms/indices/IO connus dynamiquement),
- stockage des métadonnées nécessaires en RAM pour publication VFS.

Cela permet de changer l’ordre des devices dans l’émulateur sans casser l’OS.

---

## 6) /proc (virtuel, temps réel)

### Principe
`/proc` expose l’état des processus et du noyau en pseudo-fichiers.

### Stage1 v4
- initialisation de la racine `/proc` et compteurs de base,
- placeholders simples pour les premiers PID,
- futur lien direct avec scheduler/process table.

### Cible finale
- `/proc/<pid>/exe`
- `/proc/<pid>/cwd`
- `/proc/<pid>/cmdline`
- et potentiellement `/proc/mounts`, `/proc/devices`.

---

## 7) Ce qui est déjà fait vs ce qui reste

### Déjà fait (stage1)
- Pipeline boot -> load stage1 -> jump.
- VFS metadata init.
- Mount metadata (`os_disk -> /usr`).
- Symlink metadata (`/bin -> /usr/bin`).
- Seed virtuel `/dev` et `/proc`.

### Prochaines étapes
1. Resolver de chemins (normalisation, symlink traversal, mount traversal).
2. Lookup inode par chemin.
3. API fichiers noyau (open/read/write/close/readdir/stat minimal).
4. Backend FS disque (superblock/inodes/data blocks) + pseudo-fs `/dev`/`/proc`.
5. Tests d’intégration.

---

## 8) Principes de conception retenus

- **Pas de hardcode fragile** (surtout sur devices/index/io_base).
- **Séparation claire**: bootloader, VFS, backend FS, pseudo-fs.
- **Simplicité pédagogique** avant complexité “production desktop”.
- **Évolutif**: chaque étape doit rester testable isolément.

---

## 9) Validation attendue

Avant d’aller plus loin, on valide:
1. bootloader v4 charge correctement stage1 depuis `os_disk` dynamique,
2. logs stage1 montrent init VFS/mount/symlink/dev/proc,
3. aucun hardcode `"/dev/<index>"` figé dans les données statiques de l’OS.

Une fois validé, on enchaîne sur le resolver de chemins.
