
import { IoDevice } from "../IoDevice";

import type { u8 } from "@/types";


/**
 * RTC (Real-Time Clock)
 *
 * Ports lecture seule :
 *   0x01  RTC_YEARS       Année % 100 (ex: 2026 → 26)
 *   0x02  RTC_MONTHS      Mois 1-12
 *   0x03  RTC_DAYS        Jour 1-31
 *   0x04  RTC_HOURS       Heures 0-23
 *   0x05  RTC_MINUTES     Minutes 0-59
 *   0x06  RTC_SECONDS     Secondes 0-59
 *   0x07  RTC_TIMESTAMP_0 Unix timestamp (secondes) byte 0 LSB
 *   0x08  RTC_TIMESTAMP_1 Unix timestamp (secondes) byte 1
 *   0x09  RTC_TIMESTAMP_2 Unix timestamp (secondes) byte 2
 *   0x0A  RTC_TIMESTAMP_3 Unix timestamp (secondes) byte 3 MSB
 *   0x0B  RTC_MILLIS_0    Date.now() (millisecondes) byte 0 LSB  ← nouveau
 *   0x0C  RTC_MILLIS_1    Date.now() (millisecondes) byte 1      ← nouveau
 *   0x0D  RTC_MILLIS_2    Date.now() (millisecondes) byte 2      ← nouveau
 *   0x0E  RTC_MILLIS_3    Date.now() (millisecondes) byte 3 MSB  ← nouveau
 *
 * Usage typique (sleep en ASM) :
 *   1. Lire MILLIS_0..3 → stocker "start"
 *   2. Calculer "target = start + duration_ms"
 *   3. Boucler : lire MILLIS_0..3, comparer avec target
 *
 * Note : RTC_MILLIS utilise Date.now() % 2^32, soit ~49 jours avant overflow.
 * Pour les usages musicaux (durées < 10s), c'est largement suffisant.
 * Les 4 bytes doivent être lus dans le même cycle pour être cohérents —
 * ils sont tous calculés depuis le même appel Date.now() snapshotté au
 * premier read du groupe (voir _millisSnapshot).
 */


const PORTS = {
    RTC_YEARS:       0x01,
    RTC_MONTHS:      0x02,
    RTC_DAYS:        0x03,
    RTC_HOURS:       0x04,
    RTC_MINUTES:     0x05,
    RTC_SECONDS:     0x06,
    RTC_TIMESTAMP_0: 0x07,
    RTC_TIMESTAMP_1: 0x08,
    RTC_TIMESTAMP_2: 0x09,
    RTC_TIMESTAMP_3: 0x0A,
    RTC_MILLIS_0:    0x0B,
    RTC_MILLIS_1:    0x0C,
    RTC_MILLIS_2:    0x0D,
    RTC_MILLIS_3:    0x0E,
    RTC_MILLIS_REL_LO:    0x0F,
    RTC_MILLIS_REL_HI:    0x10,
} as const;


export type RtcTime = {
    years: number;
    months: number;
    days: number;
    hours: number;
    minutes: number;
    seconds: number;
    time: number;
    offset: number;
};

export type RtcDeviceParams = {
    type: string;
    vendor?: string;
    model?: string;
}


export class RtcDevice extends IoDevice {
    static type = 'system';

    public time: RtcTime = {
        years: 0, months: 0, days: 0,
        hours: 0, minutes: 0, seconds: 0,
        offset: 0, time: 0,
    };

    // Snapshot millis : les 4 bytes MILLIS sont cohérents entre eux
    // car ils viennent du même Date.now() lu au moment du premier byte
    private _millisSnapshot: number = 0;
    private _millisLastPort: number = -1;
    private startTime: number = Date.now();


    constructor(idx: u8, name: string, params: RtcDeviceParams) {
        super(idx, name, params);
        this.startTime = Date.now();
        this.updateTime();
        setInterval(this.updateTime.bind(this), 1000);
    }


    updateTime(): void {
        this.time = this.getLocalTime();
        this.emit('state', { time: this.time });
    }


    getLocalTime(): RtcTime {
        const now = new Date();
        return {
            years:   now.getFullYear(),
            months:  now.getMonth() + 1,
            days:    now.getDate(),
            hours:   now.getHours(),
            minutes: now.getMinutes(),
            seconds: now.getSeconds(),
            time:    now.getTime(),
            offset:  now.getTimezoneOffset(),
        };
    }


    read(port: u8): u8 {
        const now = new Date();
        const timestamp = Math.floor(now.getTime() / 1000);

        switch (port) {
            case PORTS.RTC_YEARS:   return (now.getFullYear() % 100) as u8;
            case PORTS.RTC_MONTHS:  return (now.getMonth() + 1) as u8;
            case PORTS.RTC_DAYS:    return now.getDate() as u8;
            case PORTS.RTC_HOURS:   return now.getHours() as u8;
            case PORTS.RTC_MINUTES: return now.getMinutes() as u8;
            case PORTS.RTC_SECONDS: return now.getSeconds() as u8;

            case PORTS.RTC_TIMESTAMP_0: return (timestamp & 0xFF) as u8;
            case PORTS.RTC_TIMESTAMP_1: return ((timestamp >> 8)  & 0xFF) as u8;
            case PORTS.RTC_TIMESTAMP_2: return ((timestamp >> 16) & 0xFF) as u8;
            case PORTS.RTC_TIMESTAMP_3: return ((timestamp >> 24) & 0xFF) as u8;

            // ── Millisecondes ──────────────────────────────────────────────
            // On snapshote Date.now() au premier byte du groupe pour que
            // les 4 lectures soient cohérentes entre elles.
            case PORTS.RTC_MILLIS_0: {
                this._millisSnapshot = Date.now() >>> 0; // uint32
                this._millisLastPort = port;
                return (this._millisSnapshot & 0xFF) as u8;
            }
            case PORTS.RTC_MILLIS_1: {
                // Si on lit dans l'ordre 0→1→2→3, réutilise le snapshot
                // Sinon (lecture directe de MILLIS_1), prend un nouveau snapshot
                if (this._millisLastPort !== PORTS.RTC_MILLIS_0) {
                    this._millisSnapshot = Date.now() >>> 0;
                }
                this._millisLastPort = port;
                return ((this._millisSnapshot >> 8) & 0xFF) as u8;
            }
            case PORTS.RTC_MILLIS_2: {
                if (this._millisLastPort !== PORTS.RTC_MILLIS_1) {
                    this._millisSnapshot = Date.now() >>> 0;
                }
                this._millisLastPort = port;
                return ((this._millisSnapshot >> 16) & 0xFF) as u8;
            }
            case PORTS.RTC_MILLIS_3: {
                if (this._millisLastPort !== PORTS.RTC_MILLIS_2) {
                    this._millisSnapshot = Date.now() >>> 0;
                }
                this._millisLastPort = port;
                return ((this._millisSnapshot >> 24) & 0xFF) as u8;
            }

            case PORTS.RTC_MILLIS_REL_LO: {  // RTC_MILLIS_REL_LO — millis depuis démarrage, low byte
                const rel = (Date.now() - this.startTime) & 0xFFFF;
                this._millisSnapshot = rel;
                return (rel & 0xFF) as u8;
            }
            case PORTS.RTC_MILLIS_REL_HI: {  // RTC_MILLIS_REL_HI — millis depuis démarrage, high byte
                return ((this._millisSnapshot >> 8) & 0xFF) as u8;
            }

            default:
                console.warn(`RTC: Unknown read port 0x${port.toString(16)}`);
                return 0 as u8;
        }
    }


    write(port: u8, value: u8): void {
        console.warn(`RTC: read-only, cannot write port 0x${port.toString(16)}`);
    }


    reset(): void {
        this._millisSnapshot = 0;
        this._millisLastPort = -1;
    }
}
