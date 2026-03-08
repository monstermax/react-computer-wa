# Switchs

Source file: [`web/src/components/devices/switchs.tsx`](../../../web/src/components/devices/switchs.tsx)

## Description

8-switch input bank with queued state-change acknowledgements.

## Main features

- 8-bit switch state register
- pending switch index for event handling
- queue of pending switch transitions
- CPU ack mechanism per switch event

## Ports

### Read

- `0x00` (`SWITCHS_DATA`): current 8-bit switch state
- `0x01` (`SWITCHS_STATUS`): pending switch index (`0..7`) or `0xFF` if none

### Write

- `0x00`: direct state write + clear pending index
- `0x01`: acknowledge pending switch index (on match, dequeues next event)
