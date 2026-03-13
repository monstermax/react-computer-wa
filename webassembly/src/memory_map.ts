
export namespace MEMORY_MAP {

    // ## ROM ## (0x0000-0x04FF) - 1280 bytes
    //export const ROM_START: u16 = 0x0000;
    //export const ROM_END: u16 = 0x04FF;


    // ## RAM ## (0x0500-0xEFFF) - ~60KB (OS + STACK)
    //export const RAM_START: u16 = 0x0500;
    export const RAM_START: u16 = 0x0000;
    export const RAM_END: u16 = 0xEFFF;

        // RAM / BOOTLOADER (0x0000-???)
        export const BOOTLOADER_START: u16 = 0x0000;

        // ## RAM / Device Table ## (0x0500-0x057F) - 4096 bytes
        // Header: 1 byte (device count)
        // Entries: N * 6 bytes each:
        //   offset 0: device index (1 byte)
        //   offset 1: type (1 byte) - 0x01=input, 0x02=output, 0x03=input/output
        //   offset 2-3: I/O base address (2 bytes, little-endian)
        //   offset 4-5: pointer to name string (2 bytes, little-endian)
        export const DEVICE_TABLE_COUNT: u16 = 0x0500;
        export const DEVICE_TABLE_START: u16 = 0x0501;
            export const DEVICE_TABLE_ENTRY_SIZE: u8 = 6;
            export const DEVICE_TABLE_MAX_ENTRIES: u8 = 20;

        // ## Device Name Strings ## (0x0580-0x05FF) - 128 bytes
        // Null-terminated strings, allocated sequentially
        export const DEVICE_STRINGS_START: u16 = 0x0580;
        export const DEVICE_STRINGS_END: u16 = 0x05FF;


        // INTERRUPTS TABLE
        // Header: 1 byte (device count)
        // Entries: N * 6 bytes each:
        //   offset 0: syscall index (1 byte)
        //   offset 1: type (1 byte) - currently not specified
        //   offset 2-3: handler address (2 bytes, little-endian)
        //   offset 4-5: pointer to name string (2 bytes, little-endian)
        export const INTERRUPTS_TABLE_COUNT: u16 = 0x0600;
        export const INTERRUPTS_TABLE_START: u16 = 0x0601;
            export const INTERRUPTS_TABLE_ENTRY_SIZE: u8 = 6;
            export const INTERRUPTS_TABLE_MAX_ENTRIES: u8 = 20;

        export const INTERRUPTS_STRINGS_START: u16 = 0x0680;
        export const INTERRUPTS_STRINGS_END: u16 = 0x06FF;


        // SYSCALLS TABLE
        // Header: 1 byte (device count)
        // Entries: N * 6 bytes each:
        //   offset 0: syscall index (1 byte)
        //   offset 1: type (1 byte) - currently not specified (syscall return type ? arguments count ? calling convention ?)
        //   offset 2-3: handler address (2 bytes, little-endian)
        //   offset 4-5: pointer to name string (2 bytes, little-endian)
        export const SYSCALLS_TABLE_COUNT: u16 = 0x0700;
        export const SYSCALLS_TABLE_START: u16 = 0x0701;
            export const SYSCALLS_TABLE_ENTRY_SIZE: u8 = 6;
            export const SYSCALLS_TABLE_MAX_ENTRIES: u8 = 20;

        export const SYSCALLS_STRINGS_START: u16 = 0x0780;
        export const SYSCALLS_STRINGS_END: u16 = 0x07FF;


        // RAM / OS (0x1000-???)
        export const OS_START: u16 = 0x1000;

        // RAM / STACK (0xE000-0xEFFF) - 512 bytes
        export const STACK_START: u16 = 0xEE00;
        export const STACK_END: u16 = 0xEFFF;


    // ## I/O Devices ## (0xF000-0xFFFF) - 4096 ports (256 devices x 16 ports)
    export const IO_START: u16 = 0xF000;
    export const IO_END: u16 = 0xFFFF;

};



// IRQ Sources (pour référence)
export namespace IRQ_MAP {
    export const IRQ_TIMER: u8 = 0;      // Bit 0 - Timer
    export const IRQ_KEYBOARD: u8 = 1;   // Bit 1 - Clavier
    export const IRQ_DISK: u8 = 2;       // Bit 2 - Disque
    export const IRQ_UART: u8 = 3;       // Bit 3 - UART/Console
    export const IRQ_BUTTON: u8 = 4;     // Bit 4 - Boutons UI
};



export const DEVICE_TYPE_SYSTEM: u8 = 0x00;
export const DEVICE_TYPE_INPUT: u8 = 0x01;
export const DEVICE_TYPE_OUTPUT: u8 = 0x02;
export const DEVICE_TYPE_INPUT_OUTPUT: u8 = 0x03;
export const DEVICE_TYPE_STORAGE: u8 = 0x03;


//export function deviceTypeFromString(type: string): u8 {
//    if (type === 'system') return DEVICE_TYPE_SYSTEM;
//    if (type === 'input') return DEVICE_TYPE_INPUT;
//    if (type === 'output') return DEVICE_TYPE_OUTPUT;
//    if (type === 'input/output' || type === 'both') return DEVICE_TYPE_INPUT_OUTPUT;
//    if (type === 'storage') return DEVICE_TYPE_STORAGE;
//    return 0;
//}


export function isRomAddress(address: u16): boolean {
    return false;
    //return address >= MEMORY_MAP.ROM_START && address <= MEMORY_MAP.ROM_END;
}


export function isRamAddress(address: u16): boolean {
    return address >= MEMORY_MAP.RAM_START && address <= MEMORY_MAP.RAM_END;
}


export function isIoAddress(address: u16): boolean {
    return address >= MEMORY_MAP.IO_START && address <= MEMORY_MAP.IO_END;
}

