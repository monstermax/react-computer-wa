# I/O Devices

Reference: `web_assembly/src/IoManager.ts`

## Model

- One device = 16 ports (`DEVICE_PORT_SIZE = 0x10`)
- I/O base for device `N` = `MEMORY_MAP.IO_START + N * 0x10`
- Read/write go through `jsIo.read(...)` / `jsIo.write(...)`

## Registration

`IoManager.addDevice(name, typeId)`:

- creates a device index
- writes a device-table entry in RAM
- stores the device name in RAM (strings area)
- updates device count

## Reset

`resetDevices()` calls `jsIo.reset(idx)` for each registered device.

## Type constants

From `memory_map.ts`:

- `DEVICE_TYPE_SYSTEM = 0x00`
- `DEVICE_TYPE_INPUT = 0x01`
- `DEVICE_TYPE_OUTPUT = 0x02`
- `DEVICE_TYPE_INPUT_OUTPUT = 0x03`
- `DEVICE_TYPE_STORAGE = 0x03`

Factual note: `DEVICE_TYPE_INPUT_OUTPUT` and `DEVICE_TYPE_STORAGE` currently share the same value (`0x03`).
