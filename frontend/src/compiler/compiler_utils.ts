
import { Compiler } from "./compiler";
import { resolveIncludes } from "./compiler_preprocessor";
import { CUSTOM_CPU } from "./arch_custom";
import { assembleSourceCode, parseSourceCode, parseSourceCodeFile, type ParsedFile } from "./precompiler";
import { CompilerV2 } from "./compiler.v2";
import { toHex } from "@/lib/lib_numbers";

import type { CompiledProgram, CompilerOptions, CPUArchitecture } from "@/types/compiler.types";
import type { u16, u8 } from "@/types/computer.types";
import type { Token } from "./compiler_lexer";


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


export async function compileFile(filePath: string, options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    const source = await loadSourceCodeFromFile(filePath);

    const result = await compileCode(source, options);
    return result;
}


export async function compileCode(source: string, options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    const { source: resolvedSource, stats } = await resolveIncludes(source);

    // Log des stats si besoin
    if (stats.size > 0) {
        console.log('Include stats:');
        stats.forEach((stat, file) => {
            console.log(`  ${stat.file}: ${stat.references} references from [${stat.includedBy.join(', ')}]`);
        });
    }

    const architecture = options.architecture || CUSTOM_CPU;

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




export async function compileFileV2(filePath: string, options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    const source = await loadSourceCodeFromFile(filePath);

    const result = await compileCodeV2(source, filePath, options);
    return result;
}


export async function compileCodeV2(sourceCode: string, filepath="main.asm", options: Partial<CompilerOptions> = {}): Promise<CompiledProgram> {
    //const bootloaderFilepath = "bootloader/bootloader_v2.asm";
    const caseSensitive = options.caseSensitive || false;
    const architecture = options.architecture || CUSTOM_CPU;

    // parse code files recursive (handle "include" directive)
    const parsedFiles = await parseSourceCode(architecture, sourceCode, filepath, undefined, undefined, caseSensitive);

    // assemble files
    const filesEntries: [number, ParsedFile][] = Array.from(parsedFiles.files.values()).map(v => [v.fileIdx, v] as [number, ParsedFile])
    filesEntries.sort(([a], [b]) => a - b)
    const files: ParsedFile[] = filesEntries.map(([idx, file]) => file);
    const { assembledSourcesCode, allTokens } = assembleSourceCode(files);

    // compile
    const compiler = new CompilerV2({
        architecture,
        startAddress: options.startAddress || 0,
        startLine: options.startLine || 0,
        caseSensitive,
    });

    const compiled = await compiler.compile('', allTokens);
    //console.log('compiled:', compiled)

    return compiled;
}



export function formatBytecode(program: CompiledProgram): string {
    const lines: string[] = [];

    const compilerVersion = program.compilerVersion;
    lines.push(`\n// Compiler version: ${compilerVersion}`);

    for (const section of program.sections) {
        if (section.data.length === 0) continue;

        lines.push(`\n// Section: ${section.name}`);

        for (const entry of section.data) {
            const hexAddr = toHex(entry.address, 4);
            const hexValue = entry.value === null ? null : toHex(entry.value as number); // note: ne devrait pas etre null (sauf pour des cas de debug temporaires)

            let line = `    [${hexAddr}, ${hexValue}],`;

            if (entry.comment) {
                line += ` // ${entry.comment} ${entry.opcodeToken ? `// ${entry.opcodeToken.file}:${entry.opcodeToken.line}` : ``}`;
            }

            lines.push(line);
        }
    }

    return lines.join('\n');
}


export function getAssemblyCodeMapping(program: CompiledProgram): Record<string, Token | undefined> {
    const mapping: Record<string, Token | undefined> = {}

    for (const section of program.sections) {
        if (section.data.length === 0) continue;


        for (const entry of section.data) {
            const hexAddr = toHex(entry.address + program.startAddress, 4);

            if (entry.isOpcode) {
                mapping[hexAddr] = entry.opcodeToken;
            }
        }
    }

    return mapping;
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

