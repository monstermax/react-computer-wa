# Memory Map

## Address ranges

- ROM: `0x0000 - 0x04FF`
- RAM: `0x0500 - 0xEFFF`
- I/O: `0xF000 - 0xFFFF`

## Device table in RAM

Location:

- count byte: `0x0500`
- entries start: `0x0501`
- entry size: `6` bytes
- max entries: `20`

Entry format:

1. device index
2. device type
3. I/O base low
4. I/O base high
5. name pointer low
6. name pointer high

## Device name strings

- start: `0x0580`
- end: `0x05FF`
- encoding: null-terminated bytes

## OS / stack constants

- `OS_START = 0x1000`
- `STACK_START = 0xEE00`
- `STACK_END = 0xEFFF`
