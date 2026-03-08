# Keyboard

Source file: [`web/src/components/devices/keyboard.tsx`](../../web/src/components/devices/keyboard.tsx)

## Description

Input device that exposes queued key events to the CPU.

It accepts standard printable keys and also encodes arrow keys as ANSI-like sequences:
- `ESC` (`0x1B`)
- `[` (`0x5B`)
- final byte (`A/B/C/D`)

## Main features

- character queue (`charQueue`)
- `hasChar` status flag
- optional IRQ enable bit (`irqEnabled`)
- host-side keyboard capture (`start(...)`)

## Ports

### Read

- `0x00` (`KEYBOARD_DATA`): current character byte
- `0x01` (`KEYBOARD_STATUS`):
  - bit 0: `hasChar`
  - bit 1: `irqEnabled`

### Write

- `0x00` (`KEYBOARD_DATA`): clear current character (`lastChar=0`, `hasChar=false`)
- `0x01` (`KEYBOARD_STATUS`):
  - if bit 0 is `0`: clear `hasChar` and dequeue next char
  - bit 1 controls IRQ enable/disable
