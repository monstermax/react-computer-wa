# Périphériques I/O

Pages détaillées des devices : [`docs/en/devices/README.md`](../en/devices/README.md)

## Modèle

- Un périphérique possède 16 ports (`0x10`)
- Base du périphérique `N` : `0xF000 + N * 0x10`
- Les accès passent par le bus mémoire

## Enregistrement

`computerAddDevice(...)` appelle `IoManager.addDevice(name, typeId)`.

L'enregistrement :

1. crée un index
2. écrit les métadonnées dans la table RAM
3. stocke le nom dans la zone de chaînes
4. met à jour le compteur de périphériques

## Flux read/write

- le CPU lit/écrit `0xF000-0xFFFF`
- `MemoryBus` route vers `IoManager`
- `IoManager` calcule `(device, port)`
- appel hôte via `jsIo.read` / `jsIo.write`
