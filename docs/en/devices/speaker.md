# Speaker

Source file: [`web/src/components/devices/speaker.ts`](../../../web/src/components/devices/speaker.ts)

## Description

8-bit style chiptune speaker based on Web Audio synthesis.

Playback is controlled by note, duration, waveform, and volume registers.

## Main features

- MIDI-note driven frequency
- multiple waveform modes (pulse/square/triangle/saw)
- cycle/poll-based playing flag on read
- configurable output volume

## Ports

### Read

- `0x00` (`SPEAKER_NOTE`): current note
- `0x01` (`SPEAKER_DURATION`): `1` while playback countdown active, else `0`
- `0x02` (`SPEAKER_WAVEFORM`): waveform mode
- `0x03` (`SPEAKER_VOLUME`): volume value

### Write

- `0x00`: set note
- `0x01`: trigger playback (`value * 10` ms)
- `0x02`: set waveform (`0..3`)
- `0x03`: set volume (`0..255`)
