# Create and Share an I/O Device

## Why this exists

Many emulators exist (including browser-based ones). The core value here is different:

- programs running in the emulated machine can interact with the real host through I/O devices
- any web/JavaScript developer can build a custom device in minutes

This is the key bridge between emulated logic and real-world interaction.

Devices let programs inside the emulator:
- display data (screen, LEDs, LCD, console)
- read inputs (keyboard, switches)
- interact with host capabilities (audio, timers, storage)

In short: devices turn opcodes into real, observable behavior.

---

## Device model in this project

A device is implemented as a frontend class extending `IoDevice`.

Reference base class:
- `frontend/src/components/devices/IoDevice.ts`

Typical implementation files:
- `frontend/src/components/devices/<device>.tsx`
- or `frontend/src/components/devices/<device>.ts`

A device is accessed through memory-mapped I/O:
- global I/O range starts at `0xF000`
- each device gets 16 ports (`0x10`)
- device base address is computed by index

---

## Minimal device contract

Your class should provide:

- `read(port: u8): u8`
- `write(port: u8, value: u8): void`
- `reset(): void`

Optional (recommended):
- internal state events via `this.emit('state', {...})` for live UI/debug feedback

---

## Step-by-step: create a new device

## 1) Create the device file

Add a file in:
- `frontend/src/components/devices/`

Example filename:
- `my_device.tsx`

## 2) Extend `IoDevice`

Implement read/write/reset and define your ports.

Example skeleton:

```ts
import { IoDevice } from "./IoDevice";
import type { u8 } from "@/types/computer.types";

export class MyDevice extends IoDevice {
  static type = 'output';

  read(port: u8): u8 {
    switch (port) {
      case 0x00: return 0 as u8;
      default: return 0 as u8;
    }
  }

  write(port: u8, value: u8): void {
    switch (port) {
      case 0x00:
        // handle value
        this.emit('state', { value });
        break;
    }
  }

  reset(): void {
    // reset internal state
    this.emit('state', { reset: true });
  }
}
```

## 3) Define a stable port map

Document each port clearly:
- read vs write behavior
- data format
- side effects

Keep your port map stable once shared.

## 4) Register and test in emulator flow

A new device file does **not** appear automatically in the app.

You must register it manually in `Playground.tsx`:

- add the device to the emulated computer (using `addDevice`)
- optionally mount its React component if it has one

Validate:
- device is registered and reachable at runtime
- read/write behavior matches expectations
- reset behavior is deterministic
- no blocking behavior in read/write

## 5) Add documentation page

Create/update:
- `docs/en/devices/<device>.md`

Include:
- description
- main features
- full port table (read/write)
- source file link

---

## Sharing guidelines (recommended)

When sharing a device file:

- include header comment with:
  - device purpose
  - port map
  - expected data format
- avoid hard dependencies on app-specific globals unless required
- keep read/write side effects explicit
- prefer deterministic behavior for same input/state
- include at least one small ASM usage example (or test snippet)

Suggested metadata in file header:

- device name
- author
- version
- compatibility notes

---

## Design rules for good devices

- one clear responsibility per device
- predictable port behavior
- no hidden magic values
- explicit reset semantics
- human-readable debug state events

---

## What to share first

Good early community devices:
- sensors (virtual or host-backed)
- displays/indicators
- audio outputs
- input controllers
- storage-related helpers

These give immediate visual feedback and are easy to validate in demos.
