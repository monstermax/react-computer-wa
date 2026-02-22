# Rtc

Source file: [`frontend/src/components/devices/rtc.tsx`](../../../frontend/src/components/devices/rtc.tsx)

## Description

Real-time clock device reading host system time.

## Main features

- calendar fields (year/month/day)
- time fields (hour/minute/second)
- Unix timestamp bytes
- read-only behavior

## Ports

### Read

- `0x01`: year (2 digits, `year % 100`)
- `0x02`: month (`1-12`)
- `0x03`: day (`1-31`)
- `0x04`: hour (`0-23`)
- `0x05`: minute (`0-59`)
- `0x06`: second (`0-59`)
- `0x07`: Unix timestamp byte 0 (LSB)
- `0x08`: Unix timestamp byte 1
- `0x09`: Unix timestamp byte 2
- `0x0A`: Unix timestamp byte 3 (MSB)

### Write

- all writes are ignored (read-only device)
