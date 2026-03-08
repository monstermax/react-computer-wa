import React, { useEffect, useState } from "react";

import { toHex } from "@/lib/lib_numbers";
import { basename } from "@/lib/lib_strings";

import type { u16, u8 } from "@/types/computer.types";
import type { Token } from "@/compiler/compiler_lexer";


export type RegistersProps = {
    cyclesCount: number,
    registers8: Record<string, u8>;
    registers16: Record<string, u8 | u16 | bigint>;
    modifiedRegisters: string[];
    codeMapping: Record<string, Token | undefined>;
    openAssemblyFileInEditor: (filepath: string, markerLine?: number | undefined, debugLine?: number | undefined) => Promise<void>;
};

export const Registers: React.FC<RegistersProps> = (props) => {
    const { cyclesCount, registers8, registers16, modifiedRegisters, codeMapping, openAssemblyFileInEditor } = props;

    const [currentCodeMapped, setCurrentCodeMapped] = useState<Token | undefined>(undefined)

    useEffect(() => {
        const PC = toHex(Number(registers16.PC), 4);
        const _currentCodeMapped = codeMapping[PC]
        //console.log('currentCodeMapped:', _currentCodeMapped)
        setCurrentCodeMapped(_currentCodeMapped)
    }, [registers16, codeMapping])


    return (
        <>
            <h2>CPU State</h2>

            <div className="flex flex-col gap-1 border-t pt-1 mt-1">
                <div>
                    Cycles: {toHex(Number(cyclesCount))} ({Number(cyclesCount)})
                </div>
            </div>

            <div className="grid grid-cols-2 border-t pt-1 mt-1">
                <div>
                    PC: {toHex(Number(registers16.PC ?? 0), 4)} ({Number(registers16.PC ?? 0)})
                </div>
                <div className="text-xs">
                    {currentCodeMapped && (
                        <div
                            className="cursor-pointer"
                            onClick={() => openAssemblyFileInEditor(currentCodeMapped.file, currentCodeMapped.line, undefined)}
                            title={currentCodeMapped.file}
                        >
                            {basename(currentCodeMapped.file)}:{currentCodeMapped.line} [{currentCodeMapped.value}]
                        </div>
                    )}
                </div>
                <div>
                    SP: {toHex(Number(registers16.SP ?? 0), 4)} ({Number(registers16.SP ?? 0)})
                </div>
                <div>IR: {toHex(Number(registers16.IR ?? 0))} ({Number(registers16.IR ?? 0)})</div>
            </div>

            <div className="grid grid-cols-2 border-t pt-1 mt-1">
                {Object.entries(registers8).map(([name, value]) => {
                    const modifiedRegister = modifiedRegisters.includes(name);

                    return (
                        <div key={name} className={`${modifiedRegister ? "bg-yellow-950" : ""} px-1 m-1`}>
                            {name}: {toHex(value ?? 0)} ({Number(value ?? 0)})
                        </div>
                    )
                })}
            </div>
        </>
    );
};


