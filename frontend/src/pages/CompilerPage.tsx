
import { useEffect, useRef, useState } from "react";

import { compileCodeV2, compileFileV2, formatBytecode, getAssemblyCodeMapping } from "@/compiler/compiler_utils";
import { toHex } from "@/lib/lib_numbers";


const demoCode = `
section .text

_start:
    nop
    nop

    int3

    ; your code here
    nop
    nop
    nop
    nop

    int3

    nop
    nop
    nop

    ret
`;


export const CompilerPage: React.FC = () => {
    //const [logs, setLogs] = useState('')
    const [machineCodeLabels, setMachineCodeLabels] = useState('')
    const [machineCode, setMachineCode] = useState<string | null>(null);

    useEffect(() => {
        const timer = setTimeout(compile, 100);
        return () => clearTimeout(timer);
    }, [])


    const compile = async () => {
        //const bootloaderFilepath = "user/tests/lcd_test.asm";
        //const bootloaderFilepath = "bootloader/bootloader_v2.asm";
        //const bootloaderFilepath = "os/v3/shell/lib_shell.asm";
        const bootloaderFilepath = "os/os_v3.asm";

        const startAddress = 0xA000;
        //const compiled = await compileFileV2(bootloaderFilepath, { startAddress })
        const compiled = await compileCodeV2(demoCode, 'custom.asm', { startAddress })

        console.log("labels:", compiled.labels)
        console.log("sections:", compiled.sections)

        const machineCodeRaw: string = formatBytecode(compiled);
        const _machineCode = `// === MACHINE CODE ===\n\n[\n${machineCodeRaw.trim()}\n]`;
        setMachineCode(_machineCode)

        const codeMapping = getAssemblyCodeMapping(compiled);
        const codeMappingFormattedList = Object.entries(codeMapping)
        codeMappingFormattedList.sort(([a], [b]) => Number(a) - Number(b))
        console.log('codeMapping:', Object.keys(codeMapping).length, codeMappingFormattedList)

        let _machineCodeLabels = "";
        compiled.labels.forEach((labelInfo, name) => {
            const labelAddress = labelInfo.address ?? 0xFFFF;
            _machineCodeLabels += `  ${name.padEnd(20)} : ${toHex(labelAddress, 4)} (line ${labelAddress} - section ${labelInfo.section})\n`;
        });
        _machineCodeLabels += "\n";
        setMachineCodeLabels(_machineCodeLabels)
    }


    return (
        <div className="bg-background text-foreground">
            compiler
            <hr />

            <div className="flex gap-8">
                <div className="flex flex-col gap-4">

                    <div>
                        <h2>=== LABELS ===</h2>

                        <pre className="text-xs">{machineCodeLabels}</pre>
                    </div>
                </div>


                <div className="flex flex-col gap-4">
                    <h2>=== MACHINE CODE ===</h2>

                    <pre className="text-xs">{machineCode}</pre>
                </div>
            </div>
        </div>
    );
}


