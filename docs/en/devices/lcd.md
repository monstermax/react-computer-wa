# Lcd

Source file: [`frontend/src/components/devices/lcd.tsx`](../../../frontend/src/components/devices/lcd.tsx)

## Description

Character display device with cursor control.

Default size is 16x2 characters.

## Main features

- character write at current cursor
- auto-advance cursor
- clear/home commands
- cursor visibility command
- direct cursor positioning

## Ports

### Read

- no dedicated readable data (device is effectively write-oriented)

### Write

- `0x00` (`LCD_DATA`): write character at current cursor
- `0x01` (`LCD_COMMAND`): command register
  - `0x01`: clear display + home cursor
  - `0x02`: home cursor
  - `0x0C`: cursor off
  - `0x0E`: cursor on
  - `0x10`: cursor left
  - `0x14`: cursor right
- `0x02` (`LCD_CURSOR`): set cursor from linear index (`row*width + col`)
