# Interrupt

Source file: [`frontend/src/components/devices/interrupt.tsx`](../../../frontend/src/components/devices/interrupt.tsx)

## Description

System interrupt controller.

Tracks enabled IRQs, pending IRQs, masking, and interrupt handler address.

## Main features

- pending IRQ bitmap management
- per-IRQ acknowledge
- enable/disable and mask control
- configurable handler address (low/high)
- optional IRQ-to-CPU/core routing metadata

## Ports

### Read

- `0x00`: interrupt enable bitmap
- `0x01`: active pending bitmap (`pending & enabled & ~mask`)
- `0x02`: ack register (read returns `0`)
- `0x03`: mask bitmap
- `0x04`: handler address low byte
- `0x05`: handler address high byte
- `0x06`: CPU handler config (currently read as `0`)
- `0x07`: core handler config (currently read as `0`)

### Write

- `0x00`: set enable bitmap
- `0x02`: acknowledge IRQ (low 3 bits)
- `0x03`: set mask bitmap
- `0x04`: set handler low byte
- `0x05`: set handler high byte
- `0x06`: set IRQ CPU handler (high nibble=IRQ, low nibble=CPU)
- `0x07`: set IRQ core handler (high nibble=IRQ, low nibble=core)
