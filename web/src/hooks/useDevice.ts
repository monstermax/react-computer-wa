
import { useEffect, useMemo, useRef, useState } from "react";

import type { IoDevice } from "@/components/devices/IoDevice";


export function useDevicesManager() {
    const devicesRef = useRef<Map<u8, IoDevice>>(new Map);
    const [devicesMap, setDevicesMap] = useState<Map<string, u8>>(new Map)


    const getDeviceByIdx = <T extends IoDevice>(deviceIdx: u8): T | null => {
        const device = devicesRef.current.get(deviceIdx) as T | null ?? null;
        return device;
    }

    const getDeviceByName = <T extends IoDevice>(deviceName: string): T | null => {
        const deviceIdx: u8 | null = devicesMap.get(deviceName) ?? null
        if (deviceIdx === null) return null;
        const device = getDeviceByIdx<T>(deviceIdx) ?? null;
        return device;
    }

    const devicesManagerHook: DevicesManagerHook = {
        devicesRef,
        devicesMap,
        setDevicesMap,
        getDeviceByIdx,
        getDeviceByName,
    }

    return devicesManagerHook;
}


export type DevicesManagerHook = {
    devicesRef: React.RefObject<Map<u8, IoDevice>>;
    devicesMap: Map<string, u8>;
    setDevicesMap: React.Dispatch<React.SetStateAction<Map<string, u8>>>;
    getDeviceByIdx: <T extends IoDevice>(deviceIdx: u8) => T | null
    getDeviceByName: <T extends IoDevice>(deviceName: string) => T | null;
}



export type useDeviceParams = {
    deviceName: string;
    devicesRef: React.RefObject<Map<u8, IoDevice>>;
    devicesMap: Map<string, u8>;
}

export function useDevice<T>(devicesManager: DevicesManagerHook, deviceName: string, deviceClass: any, optionalParams: any) {
    const { devicesRef, devicesMap } = devicesManager;

    const deviceIdx: number | null = useMemo(() => devicesMap.get(deviceName), [devicesMap]) ?? null;

    const instance: T | null = useMemo(() => {
        return (devicesRef.current && deviceIdx !== null)
            ? (devicesRef.current.get(deviceIdx) ?? null) as T
            : null;
    }, [deviceIdx]);

    const instanciate = (deviceIdx: u8) => {
        const deviceType: string = deviceClass.type;
        const device = new deviceClass(deviceIdx, deviceName, { type: deviceType, vendor: '', model: '', ...optionalParams });
        devicesManager.devicesRef.current.set(deviceIdx, device);
    }

    const deviceHook: DeviceHook<T> = {
        deviceName,
        deviceClass,
        optionalParams,
        instance,
        instanciate,
    }

    return deviceHook;
}

export type DeviceHook<T> = {
    deviceName: string,
    deviceClass: any,
    optionalParams: any
    instance: T | null;
    instanciate: (deviceIdx: u8) => void;
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
