# bootloader v4

## Goal

Load OS stage1 from `os_disk` into RAM at `0x1000`, then jump to `0x1000`.

## Current assumptions

- `os_disk` I/O base: `0xF050`
- disk ports:
  - `+0`: DATA
  - `+1`: SIZE_LOW
  - `+2`: SIZE_HIGH
  - `+3`: ADDR_LOW
  - `+4`: ADDR_HIGH

## Flow

1. Read stage1 size from disk device
2. Copy byte-by-byte from disk offset `0x0000` to RAM `0x1000`
3. Jump to stage1 entry (`0x1000`)

## Notes

This keeps the loader simple/pedagogic and deterministic.
