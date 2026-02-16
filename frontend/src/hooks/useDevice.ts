
import { useEffect, useMemo, useState } from "react";

import type { IoDevice } from "@/components/devices/IoDevice";


export type useDeviceParams = {
    deviceName: string;
    devicesRef: React.RefObject<Map<number, IoDevice>>;
    devicesMap: Map<string, u8>;
}

export function useDevice<T=IoDevice>(params: useDeviceParams) {
    const { deviceName, devicesRef, devicesMap } = params;

    const deviceIdx: number | null = useMemo(() => devicesMap.get(deviceName), [devicesMap]) ?? null;

    const device: T | null = useMemo(() => {
        return (devicesRef.current && deviceIdx !== null)
            ? (devicesRef.current.get(deviceIdx) ?? null) as T
            : null;
    }, [deviceIdx]);

    return device;
}


export const DEVICE_TYPE_SYSTEM: u8 = 0x00;
export const DEVICE_TYPE_INPUT: u8 = 0x01;
export const DEVICE_TYPE_OUTPUT: u8 = 0x02;
export const DEVICE_TYPE_INPUT_OUTPUT: u8 = 0x03;
export const DEVICE_TYPE_STORAGE: u8 = 0x03;


export function deviceTypeFromString(type: string): u8 {
    if (type === 'system') return DEVICE_TYPE_SYSTEM;
    if (type === 'input') return DEVICE_TYPE_INPUT;
    if (type === 'output') return DEVICE_TYPE_OUTPUT;
    if (type === 'input/output' || type === 'both') return DEVICE_TYPE_INPUT_OUTPUT;
    if (type === 'storage') return DEVICE_TYPE_STORAGE;
    return 0;
}
