
import fs from 'fs';

import * as releaseModule from "../../webassembly/build/release";

import { EmulatorHook, getBytecodeArray, RegistersDump, useEmulator } from "./web_dependencies/useEmulator";

//import { compileCode, compileCodeV2, getAssemblyCodeMapping, getBytecodeArray, loadSourceCodeFromFile } from "../../web/src/compiler/compiler_utils";

import { CompiledProgram, CompilerError } from "../../web/src/types/compiler.types";

import type { u16, u32, u8 } from './types';
import { useDevice } from './web_dependencies/useDevice';
//import { InterruptDevice } from './web_dependencies/devices/interrupt';
//import { InterruptTimerDevice } from './web_dependencies/devices/interrupt_timer';
import { DiskDevice } from './web_dependencies/devices/disk';
import { DmaDevice } from './web_dependencies/devices/dma';
import { RtcDevice } from './web_dependencies/devices/rtc';
import { RngDevice } from './web_dependencies/devices/rng';
import { toHex } from './lib/lib_numbers';
import { SwitchsDevice } from './web_dependencies/devices/switchs';
import { NetworkTcpDevice } from './web_dependencies/devices/network_tcp';


export type WasmExports = typeof releaseModule.__AdaptedExports;

export type Token = any;


async function main() {
    let modifiedRegisters = [] as string[];
    let registers8 = {} as Record<string, u8>;
    let registers16 = {} as Record<string, u8 | u16 | bigint>;
    let cyclesCount = 0 as number;

    let clockFrequency = 1 as u32;
    let speedMultiplier = 1000 as u32;
    let osDiskData = null as [u16, u8][] | null;

    let codeMapping: any = {};

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


    const showState = () => {
        if (!emulator.wasmExports || !emulator.computerPointer) return null;

        const controlRegisters = emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer);
        const dataRegisters = emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer);

        const PC = controlRegisters.PC;
        const currentRaw = codeMapping[toHex(PC, 4)]
        const current = currentRaw
            ? `${currentRaw.file}:${currentRaw.line} [${currentRaw.value}]`
            : null;

        console.log({controlRegisters, dataRegisters, current})

        if (!current) {
            process.exit();
        }
    }


    console.log(`Running Emulator`)


    const emulator = await useEmulator({ clockFrequency, speedMultiplier, addLog, dumpRegisters })

    if (emulator.wasmExports && emulator.computerPointer) {

        if (true) {
            // Load bootloader

            console.log(`Loading Bootloader`)

            //const bootloaderFileUrl = "bootloader/bootloader_v2.asm";
            //const sourceCode = await loadSourceCodeFromFile(bootloaderFileUrl);

            //const compiled = await compileCode(sourceCode, { startAddress: MEMORY_MAP.ROM_START, architecture: CUSTOM_CPU });
            //const compiled = await compileCodeV2(sourceCode, bootloaderFileUrl, { startAddress: MEMORY_MAP.ROM_START });

            const jsonContent = fs.readFileSync(`${__dirname}/../compiled/booloader_v2.bin.json`).toString();
            const compiled = JSON.parse(jsonContent) as CompiledProgram;

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

            console.log(`Loading OS`)

            const jsonContent = fs.readFileSync(`${__dirname}/../compiled/os_v3.bin.json`).toString();
            const compiled = JSON.parse(jsonContent) as CompiledProgram;

            //const newCodeMapping = getAssemblyCodeMapping(compiled);
            //updateCodeMapping(newCodeMapping)

            const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
            const byteCodeArr = Array.from(byteCodeMap);
            const data = byteCodeArr ?? [];

            osDiskData = data;

            const newCodeMapping = getAssemblyCodeMapping(compiled);
            codeMapping = { ...codeMapping, ...newCodeMapping };
        }


        if (true) {
            // Load Program

            console.log(`Loading Program`)

            const programName = "network_tcp_client_test";
            //const programName = "network_tcp_server_test";

            const compiled = JSON.parse(fs.readFileSync(`${__dirname}/../compiled/${programName}.bin.json`).toString()) as CompiledProgram;

            //const newCodeMapping = getAssemblyCodeMapping(compiled);
            //updateCodeMapping(newCodeMapping)

            const byteCodeMap: MapIterator<[u16, u8]> = getBytecodeArray(compiled).entries();
            const byteCodeArr = Array.from(byteCodeMap);
            const data = byteCodeArr ?? [];

            //osDiskData = data;

            const addr = 0xA000 as u16;

            if (isNaN(addr) || addr < 0 || addr > 0xFFFF) {
                throw new Error('Invalid load address');
            }

            // Write each byte to emulator RAM at the correct address
            for (const [offset, value] of data) {
                emulator.writeRam(addr + offset as u16, value as u8);
            }


            const newCodeMapping = getAssemblyCodeMapping(compiled);
            codeMapping = { ...codeMapping, ...newCodeMapping };
        }


        console.log(`Loading Devices`)

        //const keyboardDeviceHook = useDevice<KeyboardDevice>(emulator.devicesManager, 'keyboard', KeyboardDevice, {})
        //const consoleDeviceHook = useDevice<ConsoleDevice>(emulator.devicesManager, 'console', ConsoleDevice, { width: 80, height: 25 });
        //const screenDeviceHook = useDevice<ScreenDevice>(emulator.devicesManager, 'screen', ScreenDevice, {});
        //const screenHdDeviceHook = useDevice<ScreenCanvasDevice>(emulator.devicesManager, 'screen_hd', ScreenCanvasDevice, { width: 256, height: 256, pixelSize: 2 });
        const switchsDeviceHook = useDevice<SwitchsDevice>(emulator.devicesManager, 'switchs', SwitchsDevice, {});
        //const ledsDeviceHook = useDevice<LedsDevice>(emulator.devicesManager, 'leds', LedsDevice, {});
        const osDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'os_disk', DiskDevice, { data: osDiskData });
        const userDiskDeviceHook = useDevice<DiskDevice>(emulator.devicesManager, 'user_disk', DiskDevice, { persistent: true });
        const dmaDeviceHook = useDevice<DmaDevice>(emulator.devicesManager, 'dma', DmaDevice, { devicesRef: emulator.devicesManager.devicesRef, readRam: emulator.readRam, writeRam: emulator.writeRam });
        //const interruptDeviceHook = useDevice<InterruptDevice>(emulator.devicesManager, 'interrupt', InterruptDevice, {});
        //const timerDeviceHook = useDevice<InterruptTimerDevice>(emulator.devicesManager, 'timer', InterruptTimerDevice, {});
        const rtcDeviceHook = useDevice<RtcDevice>(emulator.devicesManager, 'rtc', RtcDevice, {});
        const rngDeviceHook = useDevice<RngDevice>(emulator.devicesManager, 'rng', RngDevice, {});
        //const buzzerDeviceHook = useDevice<BuzzerDevice>(emulator.devicesManager, 'buzzer', BuzzerDevice, {});
        //const speakerDeviceHook = useDevice<SpeakerDevice>(emulator.devicesManager, 'speaker', SpeakerDevice, { pollsPerMs: 20 });
        //const lcdDeviceHook = useDevice<LcdDevice>(emulator.devicesManager, 'lcd', LcdDevice, {});
        const networkTcpHook = useDevice<NetworkTcpDevice>(emulator.devicesManager, 'network_tcp', NetworkTcpDevice, {});


        emulator.addDevicesToComputer([
            //keyboardDeviceHook,
            //consoleDeviceHook,
            //ledsDeviceHook,
            //screenDeviceHook,
            osDiskDeviceHook,
            userDiskDeviceHook,
            dmaDeviceHook,
            //interruptDeviceHook,
            //timerDeviceHook,
            rtcDeviceHook,
            rngDeviceHook,
            //buzzerDeviceHook,
            switchsDeviceHook,
            //screenHdDeviceHook,
            //speakerDeviceHook,
            //lcdDeviceHook,
            networkTcpHook,
        ]);

        console.log({controlRegisters: emulator.readControlRegisters(emulator.wasmExports, emulator.computerPointer), dataRegisters: emulator.readDataRegisters(emulator.wasmExports, emulator.computerPointer)})

        //emulator.clock.start()
        //if (1) return;



        console.log(`Running Cycles`)

        let error: any | null = null;

        for (let i=0; i<50_000; i++) {
            try {
                const canContinue = emulator.runCycles(speedMultiplier);
                if (!canContinue) error = true;

            } catch (err: any) {
                error = err;
            }

            showState()

            if (error) {
                process.exit();
            }

            if (emulator.cpuHalted) {
                process.exit();
            }

            await sleep(100);
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

