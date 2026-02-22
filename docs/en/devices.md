# I/O Devices

## Device model

- One device owns 16 ports (`0x10`)
- Device `N` base address: `0xF000 + N * 0x10`
- Access is memory-mapped through the global memory bus

## Registration flow

`computerAddDevice(...)` calls `IoManager.addDevice(name, typeId)`.

During registration, the runtime:

1. allocates a device index
2. writes device metadata into RAM device table
3. stores the device name in RAM string region
4. increments device count

## Runtime read/write path

- CPU reads/writes `0xF000-0xFFFF`
- Memory bus forwards to `IoManager`
- `IoManager` resolves `(device, port)`
- host callbacks are called via `jsIo.read` / `jsIo.write`

## Device type constants

- `DEVICE_TYPE_SYSTEM = 0x00`
- `DEVICE_TYPE_INPUT = 0x01`
- `DEVICE_TYPE_OUTPUT = 0x02`
- `DEVICE_TYPE_INPUT_OUTPUT = 0x03`
- `DEVICE_TYPE_STORAGE = 0x03`
