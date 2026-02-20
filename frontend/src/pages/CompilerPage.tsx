
import { useEffect } from "react";

import { compileCodeV2, compileFileV2 } from "@/compiler/compiler_utils";



export const CompilerPage: React.FC = () => {

    useEffect(() => {
        const bootloaderFilepath = "bootloader/bootloader_v2.asm";
        const timer = setTimeout(() => compileFileV2(bootloaderFilepath), 100);
        return () => clearTimeout(timer);
    }, [])



    return (
        <div className="bg-background text-foreground">
            compiler
        </div>
    );
}


