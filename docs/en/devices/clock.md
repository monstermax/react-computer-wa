# Clock

Source file: [`frontend/src/components/devices/clock.tsx`](../../../frontend/src/components/devices/clock.tsx)

## Description

Internal timing utility used by frontend runtime components.

This file defines an event-emitting clock (`tick`) with configurable frequency.

## Main features

- start/stop periodic timer
- dynamic frequency update
- tick event emitter

## Ports

Not an I/O mapped device class (`IoDevice`) in current code, so no read/write ports are exposed.
