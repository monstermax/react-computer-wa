
import { useEffect } from "react";

import { compileCodeV2, compileFileV2 } from "@/compiler/compiler_utils";



export const CompilerPage: React.FC = () => {

    useEffect(() => {
        const timer = setTimeout(compile, 100);
        return () => clearTimeout(timer);
    }, [])


    const compile = async () => {
        const bootloaderFilepath = "bootloader/bootloader_v2.asm";
        const startAddress = 0x0000;
        const compiled = await compileFileV2(bootloaderFilepath, { startAddress })

        console.log("labels:", compiled.labels)
        console.log("sections:", compiled.sections)
    }


    return (
        <div className="bg-background text-foreground">
            compiler
        </div>
    );
}


