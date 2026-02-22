# Console

## Description

Output text console device.

It accumulates characters into `currentLine`, pushes lines on CR/LF, supports backspace handling, and can clear screen state.

## Main features

- line buffer + scrollback (`lines`)
- max line retention (`maxLines`)
- control-character handling
- ESC sequence handling for arrow-key related cursor position updates

## Ports

### Read

- none (returns `0`, write-oriented device)

### Write

- `0x00` (`CONSOLE_CHAR`): write one character/control byte
  - printable ASCII: append to current line
  - CR/LF: commit current line
  - backspace: delete one character
  - ESC sequences: parse and update cursor position handling
- `0x01` (`CONSOLE_CLEAR`): reset/clear console state
