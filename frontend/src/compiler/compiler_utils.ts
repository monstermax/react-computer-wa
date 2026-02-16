
import { Compiler } from "./compiler";
import { resolveIncludes } from "./compiler_preprocessor";
import { CUSTOM_CPU } from "./arch_custom";

import type { CompiledProgram, CompilerOptions, CPUArchitecture } from "@/types/compiler.types";
import type { u16, u8 } from "@/types/computer.types";


export let compilationAsmBaseUrl = '';

export function setCompilationAsmBaseUrl(newBaseUrl: string) {
    compilationAsmBaseUrl = newBaseUrl;
}


export async function loadSourceCodeFromFile(filePath: string): Promise<string> {
    const response = await fetch(`${compilationAsmBaseUrl}/asm/${filePath}`);
    if (!response.ok) return '';

    const content = await response.text();
    return content;
}


export async function compileFile(filePath: string, architecture: CPUArchitecture = CUSTOM_CPU, options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    const source = await loadSourceCodeFromFile(filePath);

    const result = await compileCode(source, architecture, options);
    return result;
}


export async function compileCode(source: string, architecture: CPUArchitecture = CUSTOM_CPU, options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    const { source: resolvedSource, stats } = await resolveIncludes(source);

    // Log des stats si besoin
    if (stats.size > 0) {
        console.log('Include stats:');
        stats.forEach((stat, file) => {
            console.log(`  ${stat.file}: ${stat.references} references from [${stat.includedBy.join(', ')}]`);
        });
    }

    const compiler = new Compiler({
        architecture,
        startAddress: options.startAddress || 0,
        startLine: options.startLine || 0,
        caseSensitive: options.caseSensitive || false
    });

    const compiled = await compiler.compile(resolvedSource);

    if (compiled.errors.length > 0) {
        compiled.errors.forEach(error => {
            console.warn(JSON.stringify(error));
        })
        //throw new Error(`Compilation completed with errors`)
    }

    return compiled
}


export function formatBytecode(program: CompiledProgram): string {
    const lines: string[] = [];

    for (const section of program.sections) {
        if (section.data.length === 0) continue;

        lines.push(`\n// Section: ${section.name}`);

        for (const entry of section.data) {
            const hexAddr = `0x${entry.address.toString(16).padStart(4, '0').toUpperCase()}`;
            const hexValue = `0x${entry.value.toString(16).padStart(2, '0').toUpperCase()}`;

            let line = `    [${hexAddr}, ${hexValue}],`;

            if (entry.comment) {
                line += ` // ${entry.comment}`;
            }

            lines.push(line);
        }
    }

    return lines.join('\n');
}


export function getBytecodeArray(program: CompiledProgram, sectionName?: string): Map<u16, u8> {
    const code: Map<u16, u8> = new Map;

    for (const section of program.sections) {
        if (sectionName && section.name !== sectionName) continue;

        for (const entry of section.data) {
            code.set(entry.address as u16, entry.value as u8);
        }
    }

    return code;
}

