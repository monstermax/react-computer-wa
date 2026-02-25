
import { MEMORY_MAP } from "../../../web_assembly/src/memory_map";

import { compileCodeV2, loadSourceCodeFromFile } from "@/compiler/compiler_utils";
import { CUSTOM_CPU } from "@/compiler/arch_custom";

import type { CompiledProgram, CompilerError } from "@/types/compiler.types";


export const useCompiler = (): CompilerHook => {

    // Compile Assembly Code
    const compileCode = async (sourceCode: string, filepath: string='main.asm', startAddress: number | u16=0): Promise<CompiledProgram> => {
        const compiled = await compileCodeV2(sourceCode, filepath, { startAddress, architecture: CUSTOM_CPU });

        if (compiled.errors.length > 0) {
            const errMsg = compiled.errors.map(e => `Line ${e.line}: ${e.message}`).join('\n');
            console.warn(`Compilation errors:`, errMsg)

            const error = new Error("Compilation Failed") as Error & { compileErrors: CompilerError[] };
            error.compileErrors = compiled.errors;
            throw error;
        }

        console.log(`Compiled code of ${filepath} :`, compiled)

        return compiled
    }

    // Compile Assembly File Code
    const compileFile = async (filepath: string, startAddress: number | u16=0): Promise<CompiledProgram> => {
        const sourceCode = await loadSourceCodeFromFile(filepath);
        const compiled = await compileCode(sourceCode, filepath, startAddress)
        return compiled;
    }

    // Compile Assembly Booloader
    const compileBootloader = async (): Promise<CompiledProgram> => {
        const filepath = "bootloader/bootloader_v2.asm";
        const startAddress = MEMORY_MAP.ROM_START;
        const compiled = await compileFile(filepath, startAddress)
        return compiled;
    }

    // Compile Assembly OS
    const compileOs = async (): Promise<CompiledProgram> => {
        const filepath = "os/os_v3.asm";
        const startAddress = MEMORY_MAP.OS_START;
        const compiled = await compileFile(filepath, startAddress)
        return compiled;
    }


    const compilerHook = {
        compileCode,
        compileFile,
        compileBootloader,
        compileOs,
    }

    return compilerHook
}


export type CompilerHook = {
    compileCode: (sourceCode: string, filepath?: string, startAddress?: number) => Promise<CompiledProgram>;
    compileFile: (filepath: string, startAddress?: number) => Promise<CompiledProgram>;
    compileBootloader: () => Promise<CompiledProgram>;
    compileOs: () => Promise<CompiledProgram>;
}

