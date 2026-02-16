
import { useEffect, useMemo, useState } from "react";

import type { IoDevice } from "@/components/devices/IoDevice";


export type useDeviceParams = {
    deviceName: string;
    devicesRef: React.RefObject<Map<number, IoDevice>>;
    devicesMap: Map<string, u8>;
}

export function useDevice<T=IoDevice>(params: useDeviceParams) {
    const { deviceName, devicesRef, devicesMap } = params;

    const deviceIdx = useMemo(() => devicesMap.get(deviceName), [devicesMap]);

    const device: T | null = useMemo(() => {
        return (devicesRef.current && deviceIdx !== undefined)
            ? (devicesRef.current.get(deviceIdx) ?? null) as T
            : null;
    }, [deviceIdx]);

    return device;
}

