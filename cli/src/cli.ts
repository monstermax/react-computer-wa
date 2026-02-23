
import fs from 'fs';

import * as releaseModule from "../../web_assembly/build/release";

import { EmulatorHook, getBytecodeArray, RegistersDump, useEmulator } from "./frontend_dependencies/useEmulator";

//import { compileCode, compileCodeV2, getAssemblyCodeMapping, getBytecodeArray, loadSourceCodeFromFile } from "../../frontend/src/compiler/compiler_utils";

import { CompiledProgram, CompilerError } from "../../frontend/src/types/compiler.types";

import type { u16, u32, u8 } from './types';
import { useDevice } from './frontend_dependencies/useDevice';
import { InterruptDevice } from './frontend_dependencies/devices/interrupt';
import { InterruptTimerDevice } from './frontend_dependencies/devices/interrupt_timer';
import { DiskDevice } from './frontend_dependencies/devices/disk';
import { DmaDevice } from './frontend_dependencies/devices/dma';
import { RtcDevice } from './frontend_dependencies/devices/rtc';
import { RngDevice } from './frontend_dependencies/devices/rng';
import { toHex } from './lib/lib_numbers';
import { SwitchsDevice } from './frontend_dependencies/devices/switchs';


export type WasmExports = typeof releaseModule.__AdaptedExports;

export type Token = any;


async function main() {
    let modifiedRegisters = [] as string[];
    let registers8 = {} as Record<string, u8>;
    let registers16 = {} as Record<string, u8 | u16 | bigint>;
    let cyclesCount = 0 as number;

    let clockFrequency = 1 as u32;
    let speedMultiplier = 10 as u32;
    let osDiskData = null as [u16, u8][] | null;


    const dumpRegisters = async (): Promise<RegistersDump | null> => {
        if (!emulator.wasmExports || !emulator.computerPointer) return null;

        const registers8_new = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);
        const registers16_new = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        const cyclesCount_new = Number(emulator.getCyclesCount(emulator.wasmExports, emulator.computerPointer));

        const _modifiedRegisters: string[] = [];

        Object.entries(registers8).forEach(([regName, regValueOld]) => {
            const regValueNew = registers8_new[regName as keyof typeof registers8_new];

            if (regValueNew !== regValueOld) {
                _modifiedRegisters.push(regName);
            }
        })

        modifiedRegisters = _modifiedRegisters;

        registers8 = registers8_new;
        registers16 = registers16_new;
        cyclesCount = cyclesCount_new;

        return {
            registers8: registers8_new,
            registers16: registers16_new,
            cyclesCount: cyclesCount_new,
        }
    };



    const emulator = await useEmulator({ clockFrequency, speedMultiplier, addLog, dumpRegisters })

    if (emulator.wasmExports && emulator.computerPointer) {


        let codeMapping: any = {};

        if (true) {
            // Load bootloader

            //const bootloaderFileUrl = "bootloader/bootloader_v2.asm";
            //const sourceCode = await loadSourceCodeFromFile(bootloaderFileUrl);

            //const compiled = await compileCode(sourceCode, { startAddress: MEMORY_MAP.ROM_START, architecture: CUSTOM_CPU });
            //const compiled = await compileCodeV2(sourceCode, bootloaderFileUrl, { startAddress: MEMORY_MAP.ROM_START });
            const compiled = JSON.parse(fs.readFileSync(`${__dirname}/../compiled/booloader_v2.bin.json`).toString()) as CompiledProgram;

            if (compiled.errors.length > 0) {
                const errMsg = compiled.errors.map((e: CompilerError) => `Line ${e.line}: ${e.message}`).join('\n');
                console.warn(`Bootloader Compilation errors:`, errMsg)
                throw new Error();
            }

            emulator.loadBootloader(compiled);

            const newCodeMapping = getAssemblyCodeMapping(compiled);
            codeMapping = { ...codeMapping, ...newCodeMapping };
        }


        if (true) {
            // Load OS

            const compiled = JSON.parse(fs.readFileSync(`${__dirname}/../compiled/os_v3.bin.json`).toString()) as CompiledProgram;

            //const newCodeMapping = getAssemblyCodeMapping(compiled);
            //updateCodeMapping(newCodeMapping)

            const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
            const byteCodeArr = Array.from(byteCodeMap);
            const data = byteCodeArr ?? [];

            osDiskData = data;

            const newCodeMapping = getAssemblyCodeMapping(compiled);
            codeMapping = { ...codeMapping, ...newCodeMapping };
        }

        //const keyboardDeviceHook = useDevice<KeyboardDevice>(emulator.devicesManager, 'keyboard', KeyboardDevice, {})
        //const consoleDeviceHook = useDevice<ConsoleDevice>(emulator.devicesManager, 'console', ConsoleDevice, { width: 80, height: 25 });
        //const screenDeviceHook = useDevice<ScreenDevice>(emulator.devicesManager, 'screen', ScreenDevice, {});
        //const screenHdDeviceHook = useDevice<ScreenCanvasDevice>(emulator.devicesManager, 'screen_hd', ScreenCanvasDevice, { width: 256, height: 256, pixelSize: 2 });
        const switchsDeviceHook = useDevice<SwitchsDevice>(emulator.devicesManager, 'switchs', SwitchsDevice, {});
        //const ledsDeviceHook = useDevice<LedsDevice>(emulator.devicesManager, 'leds', LedsDevice, {});
        const osDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'os_disk', DiskDevice, { data: osDiskData });
        const userDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'user_disk', DiskDevice, { persistent: true });
        const dmaDeviceHook = useDevice<DmaDevice>(emulator.devicesManager, 'dma', DmaDevice, { devicesRef: emulator.devicesManager.devicesRef, readRam: emulator.readRam, writeRam: emulator.writeRam });
        const interruptDeviceHook = useDevice<InterruptDevice>(emulator.devicesManager, 'interrupt', InterruptDevice, {});
        const timerDeviceHook = useDevice<InterruptTimerDevice>(emulator.devicesManager, 'timer', InterruptTimerDevice, {});
        const rtcDeviceHook = useDevice<RtcDevice>(emulator.devicesManager, 'rtc', RtcDevice, {});
        const rngDeviceHook = useDevice<RngDevice>(emulator.devicesManager, 'rng', RngDevice, {});
        //const buzzerDeviceHook = useDevice<BuzzerDevice>(emulator.devicesManager, 'buzzer', BuzzerDevice, {});
        //const speakerDeviceHook = useDevice<SpeakerDevice>(emulator.devicesManager, 'speaker', SpeakerDevice, { pollsPerMs: 20 });
        //const lcdDeviceHook = useDevice<LcdDevice>(emulator.devicesManager, 'lcd', LcdDevice, {});


        emulator.addDevicesToComputer([
            //keyboardDeviceHook,
            //consoleDeviceHook,
            //ledsDeviceHook,
            //screenDeviceHook,
            osDiskDeviceHook,
            userDiskDeviceHook,
            dmaDeviceHook,
            interruptDeviceHook,
            timerDeviceHook,
            rtcDeviceHook,
            rngDeviceHook,
            //buzzerDeviceHook,
            switchsDeviceHook,
            //screenHdDeviceHook,
            //speakerDeviceHook,
            //lcdDeviceHook,
        ]);

        console.log({controlRegisters: emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer), dataRegisters: emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer)})

        //emulator.clock.start()
        //if (1) return;


        for (let i=0; i<10_000; i++) {
            emulator.runCycles(speedMultiplier);

            const controlRegisters = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
            const dataRegisters = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);

            const PC = controlRegisters.PC;
            const currentRaw = codeMapping[toHex(PC, 4)]
            const current = `${currentRaw.file}:${currentRaw.line} [${currentRaw.value}]`;

            console.log({controlRegisters, dataRegisters, current})

            await sleep(10);
        }

    }

}


export function getAssemblyCodeMapping(program: CompiledProgram): Record<string, Token | undefined> {
    const mapping: Record<string, Token | undefined> = {}

    for (const section of program.sections) {
        if (section.data.length === 0) continue;


        for (const entry of section.data) {
            const hexAddr = toHex(entry.address + program.startAddress, 4);
            mapping[hexAddr] = entry.opcodeToken;
        }
    }

    return mapping;
}


const sleep = (t: number) => new Promise(r => setTimeout(r, t));


const addLog = (text: string) => {
    console.log(`[LOG] ${text}`);
}


main();

