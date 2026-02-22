# Buzzer

Source file: [`frontend/src/components/devices/buzzer.tsx`](../../../frontend/src/components/devices/buzzer.tsx)

## Description

Simple tone generator based on Web Audio API.

Writing frequency configures the tone. Writing duration triggers playback.

## Main features

- frequency mapping from byte to ~100-2000 Hz
- duration in 10 ms units
- square-wave buzzer style output
- playback state readable by CPU

## Ports

### Read

- `0x00` (`BUZZER_FREQ`): current frequency value mapped back to byte range
- `0x01` (`BUZZER_DURATION`): `1` while playing, `0` otherwise

### Write

- `0x00` (`BUZZER_FREQ`): set frequency
- `0x01` (`BUZZER_DURATION`): trigger playback (`value * 10` ms)
