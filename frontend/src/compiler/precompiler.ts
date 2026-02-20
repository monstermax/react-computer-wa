
import type { CompilerOptions, CPUArchitecture, InstructionDef } from "@/types/compiler.types";
import { MEMORY_MAP } from "../../../web_assembly/src/memory_map";
import { CUSTOM_CPU } from "./arch_custom";
import { Compiler } from "./compiler";

import { Lexer, type Token } from "./compiler_lexer";
import { loadSourceCodeFromFile } from "./compiler_utils";


export type ParsedFiles = {
    files: Map<string, ParsedFile>;
    nextFileIdx: number;
}

export type ParsedFile = {
    filepath: string;
    tokens: Token[];
    includesFilepaths: string[];
    references: string[];
    fileIdx: number;
    sourceCode: string;
}


export function assembleSourceCode(files: ParsedFile[]) {
    // 1. Source Code
    const filePrefix = "; " +  "#".repeat(10) + " %%FILEPATH%% " +  "#".repeat(10) + "\n" + "\n";
    const fileSuffix = "";
    const assembledSourcesCode: string[] = files.map(file => filePrefix.replace('%%FILEPATH%%', file.filepath) + file.sourceCode + fileSuffix);

    // 2. Tokens
    const allTokens = files.flatMap(t => t.tokens)

    return { assembledSourcesCode, allTokens };
}



export async function parseSourceCodeFile(arch: CPUArchitecture, filepath='main.asm', parsedFiles?: ParsedFiles, referrer?: string, caseSensitive=false): Promise<ParsedFiles> {
    const sourceCode = await loadSourceCodeFromFile(filepath);
    parsedFiles = await parseSourceCode(arch, sourceCode, filepath, parsedFiles, referrer, caseSensitive);
    return parsedFiles;
}


export async function parseSourceCode(arch: CPUArchitecture, sourceCode: string, filepath='main.asm', parsedFiles?: ParsedFiles, referrer?: string, caseSensitive=false): Promise<ParsedFiles> {
    parsedFiles = parsedFiles ?? { files: new Map, nextFileIdx: 0 };
    const fileIdx = parsedFiles.nextFileIdx++;

    // ajouter les references à ce fichier
    const references: string[] = referrer ? [referrer] : [];

    // 1. extraire tous les tokens du fichier courant
    const tokens = await extractTokens(arch, sourceCode, filepath, caseSensitive);

    // 2. traiter les include
    const includesFilepaths = extractIncludes(tokens);

    for (const includeFilepath of includesFilepaths) {
        const includeFile = parsedFiles.files.get(includeFilepath);

        if (includeFile) {
            includeFile.references.push(filepath);

        } else {
            parsedFiles = await parseSourceCodeFile(arch, includeFilepath, parsedFiles, filepath, caseSensitive);
        }
    }

    // 3. ajouter les donner de ce fichier au 'parsedFiles'
    const parsedFile: ParsedFile = {
        filepath,
        tokens,
        sourceCode,
        includesFilepaths: includesFilepaths,
        references,
        fileIdx,
    };

    //parsedFiles = parsedFiles ?? { files: new Map, nextFileIdx: 0 }; // si typescript indique une erreur de "parsedFiles can be undefined"
    parsedFiles.files.set(filepath, parsedFile);

    return parsedFiles;
}


function extractIncludes(tokens: Token[]): string[] {
    const includesDirectives = tokens.map((t, idx) => {
        const isInclude = (t.type === 'DIRECTIVE') && ['include', '.include', '%include'].includes(t.value.toLowerCase());
        return [idx, isInclude] as [number, boolean];
    });

    const includesFilenames: string[] = includesDirectives.filter(([idx, isInclude]) => isInclude).map(([idx]) => {
        for (let i=idx+1; i<includesDirectives.length; i++) {
            const token = tokens[i];

            if (token.type === 'STRING') {
                return token.value; // filename
            }

            throw new Error(`Unexpected token : ${token.type} => ${token.value}`);
        }

        return "" // error: filename not found for an "include" directive
    });

    return includesFilenames;
}


async function extractTokens(arch: CPUArchitecture, sourceCode: string, filepath: string, caseSensitive=false) {
    const registerMap = buildRegisterMap(arch, caseSensitive);
    const instructionMap = buildInstructionMap(arch, caseSensitive);
    const instructions = Array.from(instructionMap.keys());

    const registers = Array.from(registerMap.keys());

    const directives = [
        'DB', 'DW', 'DD', 'DQ',
        'RESB', 'RESW', 'RESD', 'RESQ',
        'EQU', 'TIMES',
        'SECTION', 'GLOBAL', 'EXTERN',
        '.DATA', '.CODE', '.TEXT', '.BSS',
        '.ORG', '.INCLUDE',
    ];

    const lexer = new Lexer(sourceCode, instructions, registers, directives, caseSensitive, filepath);
    const tokens = lexer.tokenize()

    return tokens;
}



// Build register name/alias to ID mapping
function buildRegisterMap(arch: CPUArchitecture, caseSensitive=false): Map<string, string> {
    const registerMap: Map<string, string> = new Map(); // Register name/alias to ID mapping

    for (const reg of arch.registers) {
        // Add register name
        registerMap.set(
            caseSensitive ? reg.name : reg.name.toUpperCase(),
            reg.id
        );

        // Add all aliases
        for (const alias of reg.aliases) {
            registerMap.set(
                caseSensitive ? alias : alias.toUpperCase(),
                reg.id
            );
        }
    }

    return registerMap;
}


// Build instruction mnemonic to definition mapping
function buildInstructionMap(arch: CPUArchitecture, caseSensitive=false): Map<string, InstructionDef> {
    const instructionMap: Map<string, InstructionDef> = new Map(); // Instruction mnemonic to definition mapping

    for (const instr of arch.instructions) {
        const key = caseSensitive ? instr.mnemonic : instr.mnemonic.toUpperCase();
        instructionMap.set(key, instr);
    }

    return instructionMap;
}
