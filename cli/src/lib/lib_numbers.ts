
import type { u16, u8 } from "@/types";


export function U8(value: number | u16): u8 {
    return (value & 0xFF) as unknown as u8;
}


export function U16(value: number | u8): u16 {
    return (value & 0xFFFF) as unknown as u16;
}


export function high16(value: u16): u8 {
    return U8(value >> 8);
}

export function low16(value: u16): u8 {
    return U8(value);
}


export function toHex(intValue: number, padleft=0) {
    //if (intValue === null) return 'NULL'; // ne derait pas etre null. sauf pour cas de debug temporaire
    if (intValue === undefined) return 'UNDEFINED'; // ne derait pas etre undefined. sauf pour cas de debug temporaire

    const hex = intValue.toString(16).toUpperCase();
    let val = (hex.length % 2 === 0 ? hex : `0${hex}`);

    if (padleft && val.length < padleft) {
        val = val.padStart(padleft, '0')
    }

    return '0x' + val;
}

