# Screen

Source file: [`frontend/src/components/devices/screen.tsx`](../../frontend/src/components/devices/screen.tsx)

## Description

Pixel output device with a 2D framebuffer.

Default geometry is `32x32`. Drawing uses a cursor model (`currentX`, `currentY`) plus a color byte write.

## Main features

- read/write pixel at current cursor
- cursor X/Y selection via ports
- color byte storage per pixel
- clear/reset support

## Ports

### Read

- `0x00` (`PIXEL_X`): current X cursor
- `0x01` (`PIXEL_Y`): current Y cursor
- `0x02` (`PIXEL_COLOR`): color byte at current `(X,Y)`

### Write

- `0x00` (`PIXEL_X`): set X cursor (`value % width`)
- `0x01` (`PIXEL_Y`): set Y cursor (`value % height`)
- `0x02` (`PIXEL_COLOR`): write color at current `(X,Y)`
