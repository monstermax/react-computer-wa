# Leds

## Description

8-bit LED output register.

Each bit controls one LED in the UI.

## Main features

- single 8-bit state register
- readback support
- reset to `0x00`

## Ports

### Read

- `0x00`: current LED register value (8 bits)

### Write

- `0x00`: set LED register value
