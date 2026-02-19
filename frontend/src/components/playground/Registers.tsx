import React from "react";

import { toHex } from "@/lib/lib_numbers";

import type { u16, u8 } from "@/types/computer.types";


export type RegistersProps = {
    cyclesCount: number,
    registers8: Record<string, u8>;
    registers16: Record<string, u8 | u16 | bigint>;
    modifiedRegisters: string[];
};

export const Registers: React.FC<RegistersProps> = (props) => {
    const { cyclesCount, registers8, registers16, modifiedRegisters } = props;

    return (
        <>
            <h2>CPU State</h2>

            <div className="flex flex-col gap-1 border-t pt-1 mt-1">
                <div>
                    Cycles: {toHex(Number(cyclesCount))} ({Number(cyclesCount)})
                </div>
            </div>

            <div className="grid grid-cols-2 border-t pt-1 mt-1">
                {Object.entries(registers16).map(([name, value]) => (
                    <div key={name}>
                        {name}: {toHex(Number(value))} ({Number(value)})
                    </div>
                ))}
            </div>

            <div className="grid grid-cols-2 border-t pt-1 mt-1">
                {Object.entries(registers8).map(([name, value]) => {
                    const modifiedRegister = modifiedRegisters.includes(name);

                    return (
                        <div key={name} className={`${modifiedRegister ? "bg-yellow-950" : ""} px-1 m-1`}>
                            {name}: {toHex(value)} ({Number(value)})
                        </div>
                    )
                })}
            </div>
        </>
    );
};


