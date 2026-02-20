
import type { Token } from "@/compiler/compiler_lexer";
import type { u16 } from "./computer.types";


export type OperandType = 
    | 'NONE'
    | 'REG'
    | 'IMM8'
    | 'IMM8_IMM8'
    | 'IMM8_REG'
    | 'IMM8_MEM'
    | 'IMM16'
    | 'IMM32'
    | 'MEM'
    | 'REG_REG'
    | 'REG_IMM8'
    | 'REG_IMM16'
    | 'REG_MEM'
    | 'REG_MEM_IMM16'
    | 'MEM_REG'
    | 'MEM_IMM8'
    | 'REG_IMM8_IMM8'
    | 'REG_REG_MEM'
    | 'REG_REG_REG'
    | 'REG_REG_IMM8'
    | 'REG_REG_IMM16'
    | 'REG_REG_MEM_IMM16'
    ;

export interface InstructionDef {
    mnemonic: string;
    opcode: number;
    operands: OperandType;
    size: number;
    variants?: InstructionVariant[];
}

export interface InstructionVariant {
    operands: OperandType;
    opcode: number;
    size: number;
    condition?: (operands: ParsedOperand[]) => boolean;
    mnemonic: string;
}

export interface RegisterDef {
    name: string;
    aliases: string[];
    id: string;
    size: number;
}

export type Label = {
    section: string,
    addressStep1: u16 | null,
    address: u16 | null,
    //values?: any[] | null,
    immValue?: string;
    dataSize: number | null,
}

export interface CPUArchitecture {
    name: string;
    addressSize: number;
    registers: RegisterDef[];
    instructions: InstructionDef[];
    endianness: 'little' | 'big';
}

export interface ParsedOperand {
    type: 'REGISTER' | 'IMMEDIATE' | 'MEMORY' | 'LABEL' | 'SKIP';
    value: string;
    register?: string;
    size?: number;
    address?: number | null;
    base?: string;
    index?: string;
    scale?: number;
    displacement?: number;
}

export interface CompilerOptions {
    architecture: CPUArchitecture;
    startAddress?: number;
    startLine?: number;
    caseSensitive?: boolean;
}

export interface Section {
    name: string;
    type: 'code' | 'data' | 'bss';
    startAddress: number | null;
    compileInstructions: CompileInstruction[]; // input
    data: ByteEntry[]; // output
}

export type CompileInstruction = {
    section: string;
    type: 'DIRECTIVE' | 'INSTRUCTION';
    instruction: string;
    step1Address: number;
    size: number;
    startPos: number;
    endPos: number;
    tokens: Token[];
}


export interface ByteEntry {
    address: number;
    //value: number;
    valueResolver: (offset: number) => number;
    //section: string;
    label?: string;
    comment?: string;
    isOpcode?: boolean;
    opcodeToken?: Token;
    labelRef?: string;
}

export interface CompiledProgram {
    sections: Section[];
    labels: Map<string, Label>;
    symbols: Map<string, SymbolInfo>;
    entryPoint?: number;
    errors: CompilerError[];
    compilerVersion: string;
}

export interface SymbolInfo {
    address: number;
    section: string;
    type: 'label' | 'variable' | 'function';
    size?: number;
    global?: boolean;
    extern?: boolean;
}

export interface CompilerError {
    line: number;
    column: number;
    message: string;
    severity: 'error' | 'warning';
}

