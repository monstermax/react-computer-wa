# Disk

## Role

Storage device used by boot sequence.

## Addressing model

- Devices are memory-mapped through `0xF000-0xFFFF`.
- Device base address is assigned by index: `0xF000 + index * 0x10`.
- Each device exposes 16 ports (`0x10`).

## Host bridge

Runtime I/O calls are forwarded through `jsIo.read(device, port)` and `jsIo.write(device, port, value)`.

## Ports

TBD (to document exact per-port semantics for this device).
