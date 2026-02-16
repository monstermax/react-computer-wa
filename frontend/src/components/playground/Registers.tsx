import React from "react";

import { toHex } from "@/lib/lib_numbers";

import type { u16, u8 } from "@/types/computer.types";


export type RegistersProps = {
    registers8: Record<string, u8>;
    registers16: Record<string, u8 | u16 | bigint>;
};

export const Registers: React.FC<RegistersProps> = (props) => {
    const { registers8, registers16 } = props;

    return (
        <>
            <h2>CPU State</h2>

            <div className="flex flex-col gap-1">
                {Object.entries(registers16).map(([name, value]) => (
                    <div key={name}>
                        {name}: {toHex(Number(value))} ({Number(value)})
                    </div>
                ))}
            </div>

            <div className="grid grid-cols-2">
                {Object.entries(registers8).map(([name, value]) => (
                    <div key={name}>
                        {name}: {toHex(value)} ({Number(value)})
                    </div>
                ))}
            </div>
        </>
    );
};


