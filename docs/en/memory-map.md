# Memory Map

Reference: `web_assembly/src/memory_map.ts`

## Ranges

- ROM: `0x0000` → `0x04FF`
- RAM: `0x0500` → `0xEFFF`
- I/O: `0xF000` → `0xFFFF`

## Device table in RAM

Visible constants:

- `DEVICE_TABLE_COUNT = 0x0500`
- `DEVICE_TABLE_START = 0x0501`
- `DEVICE_TABLE_ENTRY_SIZE = 6`
- `DEVICE_TABLE_MAX_ENTRIES = 20`

Entry layout (6 bytes):

1. device index
2. type
3. I/O base low
4. I/O base high
5. name ptr low
6. name ptr high

## Device name strings area

- `DEVICE_STRINGS_START = 0x0580`
- `DEVICE_STRINGS_END = 0x05FF`

`IoManager` stores null-terminated device names there.

## Stack / OS

Exposed constants:

- `OS_START = 0x1000`
- `STACK_START = 0xEE00`
- `STACK_END = 0xEFFF`

## Helpers

Available functions:

- `isRomAddress(address)`
- `isRamAddress(address)`
- `isIoAddress(address)`
