# I/O Devices

Référence : `web_assembly/src/IoManager.ts`

## Modèle

- Un device = 16 ports (`DEVICE_PORT_SIZE = 0x10`)
- Base I/O device `N` = `MEMORY_MAP.IO_START + N * 0x10`
- Read/write transitent par `jsIo.read(...)` / `jsIo.write(...)`

## Enregistrement

`IoManager.addDevice(name, typeId)` :

- crée un index device
- persiste une entrée dans la table device RAM
- stocke le nom en RAM (zone strings)
- met à jour le compteur de devices

## Reset

`resetDevices()` appelle `jsIo.reset(idx)` pour chaque device enregistré.

## Types constants

Dans `memory_map.ts` :

- `DEVICE_TYPE_SYSTEM = 0x00`
- `DEVICE_TYPE_INPUT = 0x01`
- `DEVICE_TYPE_OUTPUT = 0x02`
- `DEVICE_TYPE_INPUT_OUTPUT = 0x03`
- `DEVICE_TYPE_STORAGE = 0x03`

Note factuelle : `DEVICE_TYPE_INPUT_OUTPUT` et `DEVICE_TYPE_STORAGE` ont actuellement la même valeur (`0x03`).
