# Screen_canvas

Source file: [`web/src/components/devices/screen_canvas.tsx`](../../../web/src/components/devices/screen_canvas.tsx)

## Description

High-definition canvas-based screen device (used as "screen HD").

Like `screen`, it uses cursor-based pixel writes, but rendering is done on HTML canvas for higher-resolution display output.

## Main features

- configurable width/height
- configurable pixel size (`pixelSize`)
- pixel framebuffer with per-pixel updates
- full clear/reset support

## Ports

### Read

- `0x00` (`PIXEL_X`): current X cursor
- `0x01` (`PIXEL_Y`): current Y cursor
- `0x02` (`PIXEL_COLOR`): color at current cursor

### Write

- `0x00`: set X cursor (`value % width`)
- `0x01`: set Y cursor (`value % height`)
- `0x02`: write pixel color at current cursor
