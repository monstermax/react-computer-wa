# Rng

Source file: [`web/src/components/devices/rng.tsx`](../../../web/src/components/devices/rng.tsx)

## Description

Pseudo-random number generator (LCG based).

## Main features

- byte random output (`0-255`)
- internal 32-bit seed
- seed override via I/O

## Ports

### Read

- `0x00` (`RNG_OUTPUT`): generate and return a random byte
- `0x01` (`RNG_SEED`): returns high byte of current seed

### Write

- `0x01` (`RNG_SEED`): set high byte of seed (low bytes preserved)
