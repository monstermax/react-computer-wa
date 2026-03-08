
//import { useEffect, useMemo, useRef, useState } from "react";

import { type IoDevice } from "./IoDevice";
import type { u8 } from "../types";


export function useDevicesManager() {
    const devicesRef = new Map as Map<u8, IoDevice>;
    const devicesMap = new Map as Map<string, u8>;


    const getDeviceByIdx = <T extends IoDevice>(deviceIdx: u8): T | null => {
        const device = devicesRef.get(deviceIdx) as T | null ?? null;
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
        getDeviceByIdx,
        getDeviceByName,
    }

    return devicesManagerHook;
}


export type DevicesManagerHook = {
    devicesRef: Map<u8, IoDevice>;
    devicesMap: Map<string, u8>;
    getDeviceByIdx: <T extends IoDevice>(deviceIdx: u8) => T | null
    getDeviceByName: <T extends IoDevice>(deviceName: string) => T | null;
}



export type useDeviceParams = {
    deviceName: string;
    devicesRef: Map<u8, IoDevice>;
    devicesMap: Map<string, u8>;
}

export function useDevice<T>(devicesManager: DevicesManagerHook, deviceName: string, deviceClass: any, optionalParams: any) {
    const { devicesRef, devicesMap } = devicesManager;

    const deviceIdx: u8 | null = devicesMap.get(deviceName) ?? null;

    const instance: T | null = (devicesRef && deviceIdx !== null)
        ? (devicesRef.get(deviceIdx) ?? null) as T
        : null;

    const instanciate = (deviceIdx: u8) => {
        const deviceType: string = deviceClass.type;
        const device = new deviceClass(deviceIdx, deviceName, { type: deviceType, vendor: '', model: '', ...optionalParams });
        devicesManager.devicesRef.set(deviceIdx, device);
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




export const DEVICE_TYPE_SYSTEM: u8 = 0x00 as u8;
export const DEVICE_TYPE_INPUT: u8 = 0x01 as u8;
export const DEVICE_TYPE_OUTPUT: u8 = 0x02 as u8;
export const DEVICE_TYPE_INPUT_OUTPUT: u8 = 0x03 as u8;
export const DEVICE_TYPE_STORAGE: u8 = 0x03 as u8;


export function deviceTypeFromString(type: string): u8 {
    if (type === 'system') return DEVICE_TYPE_SYSTEM;
    if (type === 'input') return DEVICE_TYPE_INPUT;
    if (type === 'output') return DEVICE_TYPE_OUTPUT;
    if (type === 'input/output' || type === 'both') return DEVICE_TYPE_INPUT_OUTPUT;
    if (type === 'storage') return DEVICE_TYPE_STORAGE;
    return 0 as u8;
}
