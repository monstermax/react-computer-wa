# Dma

## Description

Direct Memory Access controller used to copy byte ranges between RAM and a selected I/O device.

In current implementation, transfer logic is synchronized in `write(...)` handlers.

## Main features

- target device selection (`selectedIo`)
- source start/end range configuration
- target start address configuration
- transfer RAM <- device and RAM -> device

## Ports

### Read

- `0x00` (`DMA_IO`): selected I/O device index
- `0x01` (`DMA_ADDR_START_LOW`): source start low
- `0x02` (`DMA_ADDR_START_HIGH`): source start high
- `0x03` (`DMA_ADDR_END_LOW`): source end low
- `0x04` (`DMA_ADDR_END_HIGH`): source end high
- `0x05` (`DMA_TARGET_ADDR_LOW`): target start low
- `0x06` (`DMA_TARGET_ADDR_HIGH`): target start high
- `0x07` (`DMA_DATA`): write-triggered transfer (read returns 0)
- `0x08` (`DMA_DATA_REVERSE`): write-triggered reverse transfer (read returns 0)
- `0x09` (`DMA_STATUS`): reserved status (currently 0)

### Write

- `0x00`: set selected I/O device index
- `0x01` / `0x02`: set source start address low/high
- `0x03` / `0x04`: set source end address low/high
- `0x05` / `0x06`: set target start address low/high
- `0x07` (`DMA_DATA`): copy selected device range -> RAM
- `0x08` (`DMA_DATA_REVERSE`): copy RAM range -> selected device
- `0x09`: no-op (read-only status in current code)
