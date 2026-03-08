
import { useCallback, useEffect, useMemo, useRef, useState } from "react";

import { IoDevice } from "./IoDevice";
import { high16, low16, toHex, U16, U8 } from "@/lib/lib_numbers";

import type { u16, u8 } from "@/types/computer.types";


export type TemplateDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}

export class TemplateDevice extends IoDevice {
    static type = '%template%';


    constructor(idx: u8, name: string, params: TemplateDeviceParams) {
        super(idx, name, params);

    }


    read(port: u8): u8 {
        switch (port) {

            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {


        }
    }


    reset() {

    }

}


