# Interrupt_timer

Source file: [`web/src/components/devices/interrupt_timer.tsx`](../../../web/src/components/devices/interrupt_timer.tsx)

## Description

Programmable timer device that raises timer IRQ through the interrupt controller.

## Main features

- tick counter
- programmable period
- enable/disable control
- manual tick trigger via I/O write
- requests `IRQ_TIMER` when counter reaches period

## Ports

### Read

- `0x00`: current counter
- `0x01`: control/status (`1` if enabled, else `0`)
- `0x02`: period value
- `0x03`: tick register (write-only behavior)

### Write

- `0x01`: control
  - bit 0: enable/disable
  - bit 1: reset counter
- `0x02`: set period
- `0x03`: force one timer tick
