# Disk

## Description

Byte-addressable storage device with an internal address pointer.

Supports raw byte read/write through data and address ports. Optional persistence is available through browser localStorage.

## Main features

- sparse storage (`Map<u16,u8>`)
- current address pointer (`currentAddress`)
- max-size guard (`maxSize`)
- optional persistence (`persistent`)

## Ports

### Read

- `0x00` (`DISK_DATA`): read byte at `currentAddress`
- `0x01` (`DISK_SIZE_LOW`): low byte of current stored size
- `0x02` (`DISK_SIZE_HIGH`): high byte of current stored size
- `0x03` (`DISK_ADDR_LOW`): low byte of current address pointer
- `0x04` (`DISK_ADDR_HIGH`): high byte of current address pointer

### Write

- `0x00` (`DISK_DATA`): write byte at `currentAddress`, then auto-increment pointer
- `0x03` (`DISK_ADDR_LOW`): set low byte of current address pointer
- `0x04` (`DISK_ADDR_HIGH`): set high byte of current address pointer
