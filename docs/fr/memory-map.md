# Memory Map

Référence : `web_assembly/src/memory_map.ts`

## Plages

- ROM: `0x0000` → `0x04FF`
- RAM: `0x0500` → `0xEFFF`
- I/O: `0xF000` → `0xFFFF`

## Table des devices en RAM

Constantes visibles :

- `DEVICE_TABLE_COUNT = 0x0500`
- `DEVICE_TABLE_START = 0x0501`
- `DEVICE_TABLE_ENTRY_SIZE = 6`
- `DEVICE_TABLE_MAX_ENTRIES = 20`

Format d’entrée (6 bytes) :

1. index device
2. type
3. io base low
4. io base high
5. name ptr low
6. name ptr high

## Zone des strings devices

- `DEVICE_STRINGS_START = 0x0580`
- `DEVICE_STRINGS_END = 0x05FF`

`IoManager` écrit les noms en strings null-terminated dans cette zone.

## Stack / OS

Constantes exposées :

- `OS_START = 0x1000`
- `STACK_START = 0xEE00`
- `STACK_END = 0xEFFF`

## Helpers

Fonctions disponibles :

- `isRomAddress(address)`
- `isRamAddress(address)`
- `isIoAddress(address)`
