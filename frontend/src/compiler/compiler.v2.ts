import { Lexer, type Token, type TokenType } from './compiler_lexer';

import { toHex } from '@/lib/lib_numbers';

import type { CPUArchitecture, CompilerOptions, CompiledProgram, Section, ByteEntry, SymbolInfo, CompilerError, ParsedOperand, InstructionDef, InstructionVariant, CompileInstruction, Label, MemoryExprTerm } from '@/types/compiler.types';
import type { u16 } from '@/types/computer.types';


const compilerVersion = '0.2';


export class CompilerV2 {
    private arch: CPUArchitecture; // CPU architecture definition (registers, instructions, endianness)
    private tokens: Token[] = [];  // All tokens from lexer
    private pos = 0; // Current position in token stream

    private sections: Map<string, Section> = new Map(); // Memory sections (.text for code, .data for initialized data, .bss for uninitialized)
    private currentSection: Section | null = null; // Currently active section
    private currentSectionName: string = ''; // Currently active section
    private currentAddress = 0; // Current memory address being written
    private step = 0;

    private labels: Map<string, Label> = new Map(); // Label definitions with their addresses and optional data values
    private symbols: Map<string, SymbolInfo> = new Map(); // Symbol table for labels and variables
    private comments: Map<number, string> = new Map(); // Comments associated with specific addresses
    private debugAddresses: Map<string, number> = new Map();

    // Forward references to resolve after pass1
    private unresolvedRefs: Array<{
        address: number;
        section: string;
        label: string;
        size: number;
    }> = [];

    private errors: CompilerError[] = []; // Compilation errors
    private registerMap: Map<string, string> = new Map(); // Register name/alias to ID mapping
    private instructionMap: Map<string, InstructionDef> = new Map(); // Instruction mnemonic to definition mapping

    private caseSensitive: boolean; // Whether to match case-sensitive names
    private entryPoint?: number; // Entry point address (e.g., _start, main)
    private startLine: number;
    private startAddress: number;


    constructor(options: CompilerOptions) {
        this.arch = options.architecture;
        this.caseSensitive = options.caseSensitive || false;
        this.startAddress = options.startAddress || 0;
        this.startLine = options.startLine || 0;
        //console.log('this.startAddress:', this.startAddress)

        // Build lookup maps for registers and instructions
        this.buildRegisterMap();
        this.buildInstructionMap();

        // Initialize standard sections
        //this.currentSection = '.text';

        this.sections.set('', {
            name: 'None Section',
            type: 'code',
            startAddress: null,
            compileInstructions: [],
            data: [],
        });

        this.sections.set('.text', {
            name: '.text',
            type: 'code',
            startAddress: null,
            compileInstructions: [],
            data: [],
        });

        this.sections.set('.data', {
            name: '.data',
            type: 'data',
            startAddress: null,
            compileInstructions: [],
            data: [],
        });

        this.sections.set('.bss', {
            name: '.bss',
            type: 'bss',
            startAddress: null,
            compileInstructions: [],
            data: [],
        });
    }


    // Build register name/alias to ID mapping
    private buildRegisterMap(): void {
        // called by constructor

        for (const reg of this.arch.registers) {
            // Add register name
            this.registerMap.set(
                this.caseSensitive ? reg.name : reg.name.toUpperCase(),
                reg.id
            );

            // Add all aliases
            for (const alias of reg.aliases) {
                this.registerMap.set(
                    this.caseSensitive ? alias : alias.toUpperCase(),
                    reg.id
                );
            }
        }
    }


    // Build instruction mnemonic to definition mapping
    private buildInstructionMap(): void {
        // called by constructor

        for (const instr of this.arch.instructions) {
            const key = this.caseSensitive ? instr.mnemonic : instr.mnemonic.toUpperCase();
            this.instructionMap.set(key, instr);
        }
    }


    // Main compilation entry point - performs two-pass compilation
    public async compile(source: string, initialTokens?: Token[]): Promise<CompiledProgram> {
        // should be called externally

        if (initialTokens) {
            this.tokens = initialTokens;

        } else {
            // Define all recognized token types for lexer
            const instructions = Array.from(this.instructionMap.keys());
            const registers = Array.from(this.registerMap.keys());
            const directives = [
                'DB', 'DW', 'DD', 'DQ',
                'SECTION', 'GLOBAL', 'EXTERN',
                '.DATA', '.CODE', '.TEXT', '.BSS', '.ORG', '.INCLUDE',
                'RESB', 'RESW', 'RESD', 'RESQ',
                'EQU', 'TIMES',
            ];

            // Tokenize source code
            const lexer = new Lexer(source, instructions, registers, directives, this.caseSensitive);
            this.tokens = lexer.tokenize() //.filter(t => t.type !== 'COMMENT' && t.type !== 'NEWLINE');
            //console.log('lexer tokens:', this.tokens)
        }


        // Pass 1: collect all symbols and calculate addresses
        this.pass1CollectSymbols();
        const currentAddressAfterPass1 = this.currentAddress;
        //console.log('currentAddress after pass1:', currentAddressAfterPass1)


        //console.log('tokens:', this.tokens)

        // Reset for pass 2
        this.dispatchTokens();

        console.log('.NONE', this.sections.get(''))
        console.log('.data', this.sections.get('.data'))
        console.log('.text', this.sections.get('.text'))
        console.log('tokens:', this.tokens)
        //throw new Error('DEBUG')

        // Pass 2: generate actual machine code
        this.pass2GenerateCode();
        const currentAddressAfterPass2 = this.currentAddress;
        //console.log('currentAddress after pass2:', currentAddressAfterPass2)

        console.log('.NONE', this.sections.get(''))
        console.log('.data', this.sections.get('.data'))
        console.log('.text', this.sections.get('.text'))

        if (currentAddressAfterPass1 !== currentAddressAfterPass2) {
            console.warn(`addresses count mismatch (step1 = ${toHex(currentAddressAfterPass1, 4)} (${currentAddressAfterPass1}) vs step2 = ${toHex(currentAddressAfterPass2, 4)} (${currentAddressAfterPass2})).`);
            debugger
            //throw new Error(`addresses count mismatch (step1=${currentAddressAfterPass1} vs step2=${currentAddressAfterPass2}).`);
        }


        this.resolveLabels();

        // Resolve forward references
        this.resolveReferences();

        // Sync line numbers with expected offset
        const syncLines: boolean = true; // synchronise les numéros de ligne avec les offset et non avec les addresses

        if (syncLines && this.startLine !== this.startAddress) {
            const offset = this.startAddress - this.startLine
            console.log(`Applying addresses offset: ${offset}`)

            this.sections.forEach(s => {
                if (s.startAddress) {
                    s.startAddress -= offset;

                    s.data.forEach(d => {
                        d.address -= offset;
                    })

                } else if (s.data.length > 0) {
                    throw new Error("Missing startAddress (compile)")
                }

            })
        }

        return {
            sections: Array.from(this.sections.values()),
            labels: this.labels,
            symbols: this.symbols,
            entryPoint: this.entryPoint,
            errors: this.errors,
            compilerVersion,
        };
    }


    // Clear section data between passes while preserving structure
    private dispatchTokens(): void {
        // called by compile

        const tokens: Token[] = [];
        const sectionsNames = ['.text', '.data', '.bss', ''];

        for (const sectionName of sectionsNames) {
            const section = this.sections.get(sectionName);
            if (!section) throw new Error(`Missing section "${sectionName}"`);

            for (const compiledInstruction of section.compileInstructions) {
                tokens.push(...compiledInstruction.tokens);
            }
        }

        this.tokens = tokens;
    }


    // ## PASS 1 ## //


    // Pass 1: scan source to collect labels, calculate addresses, and gather comments
    private pass1CollectSymbols(): void {
        // called by compile (pass1)

        this.step = 1;
        this.setCurrentSection('')
        this.pos = 0;
        this.currentAddress = this.startAddress;

        // Track last instruction/identifier address for comment association
        let lastInstructionOrIdentifierAddress: number | null = null;
        let lastInstructionOrIdentifierPos: number | null = null;


        while (!this.isAtEnd()) {
            //const prev = this.peek(-1);
            const token = this.peek();

            // DIRECTIVE: Handle section directives, .org, global, extern
            if (token.type === 'DIRECTIVE') {
                // example => "section .text"
                this.handleDirectivePass1();
                continue;
            }

            // LABEL: Register label with current address
            if (token.type === 'LABEL') {
                // example => "main:"
                const labelName = token.value;
                lastInstructionOrIdentifierPos = this.pos;

                this.labels.set(labelName, {
                    section: this.currentSectionName,
                    addressStep1: this.currentAddress as u16,
                    address: null,
                    //values: null,
                    immValue: undefined,
                    dataSize: null,
                });

                this.symbols.set(labelName, {
                    address: this.currentAddress,
                    section: this.currentSectionName,
                    type: 'label'
                });

                this.advance();
                this.skip('COLON');

                this.appendInstructionCommentAndNewline()

                const instructionData: CompileInstruction = {
                    section: this.currentSectionName,
                    type: token.type as 'LABEL',
                    instruction: token.value,
                    step1Address: this.currentAddress,
                    size: 0,
                    startPos: lastInstructionOrIdentifierPos,
                    endPos: this.pos,
                    tokens: this.tokens.slice(lastInstructionOrIdentifierPos, this.pos + 1),
                };

                //console.log("New Instruction:", instructionData);
                if (!this.currentSection) throw new Error(`Missing currentSection`);
                this.currentSection.compileInstructions.push(instructionData);

                //if (token.value === 'sprite_sonic') debugger;

                continue;
            }


            // INSTRUCTION: Calculate instruction size and advance address
            if (token.type === 'INSTRUCTION') {
                // example => "mov eax, 4"
                lastInstructionOrIdentifierAddress = this.currentAddress;
                lastInstructionOrIdentifierPos = this.pos;

                const size = this.calculateInstructionSize();

                //console.log(`[pass1] ${token.value} at ${this.currentAddress}, size=${size}`);

                this.currentAddress += size;

                this.debugAddresses.set(`${token.file}:${token.line}:${token.column}`, size)

                this.appendInstructionCommentAndNewline()

                const instructionData: CompileInstruction = {
                    section: this.currentSectionName,
                    type: token.type, // INSTRUCTION
                    instruction: token.value,
                    step1Address: this.currentAddress,
                    size,
                    startPos: lastInstructionOrIdentifierPos,
                    endPos: this.pos,
                    tokens: this.tokens.slice(lastInstructionOrIdentifierPos, this.pos + 1),
                };

                //if (this.tokens.slice(lastInstructionOrIdentifierPos, this.pos+1)[0].line === 66) debugger;

                //console.log("New Instruction:", instructionData);
                if (!this.currentSection) throw new Error(`Missing currentSection`);
                this.currentSection.compileInstructions.push(instructionData);

                continue;
            }


            // IDENTIFIER: Handle variable declarations (e.g., "my_var db 0x12")
            if (token.type === 'IDENTIFIER') {
                // example => "my_var db 0x12"
                const next = this.peek(1);

                //if (token.value === 'STR_COMMAND_HELP_TEST') debugger;

                if (next?.type === 'DIRECTIVE') {
                    const directiveToken = next;
                    const directive = this.normalize(directiveToken.value);

                    if (['EQU', 'DB', 'DW', 'DD', 'DQ', 'RESB', 'RESW', 'RESD', 'RESQ'].includes(directive)) {
                        const varName = token.value;
                        const itemSize = getDirectiveDataSize(directive);

                        lastInstructionOrIdentifierAddress = this.currentAddress;
                        lastInstructionOrIdentifierPos = this.pos;

                        const valueStartAddress = this.currentAddress as u16;

                        this.labels.set(varName, {
                            section: this.currentSectionName,
                            addressStep1: valueStartAddress,
                            address: null,
                            //values: null,
                            immValue: undefined,
                            dataSize: itemSize,
                        });

                        this.symbols.set(varName, {
                            address: valueStartAddress,
                            section: this.currentSectionName,
                            type: 'variable',
                        });

                        this.advance(); // passe l'IDENTIFIER... pour arriver sur la DIRECTIVE

                        const isSpaceReserve = ['RESB', 'RESW', 'RESD', 'RESQ'].includes(directive)

                        const size = this.calculateDataSize(itemSize, isSpaceReserve);
                        this.currentAddress += size;

                        this.debugAddresses.set(`${directiveToken.file}:${directiveToken.line}:${directiveToken.column}`, size)

                        //this.advance();  // Passe la DIRECTIVE


                        const label = this.labels.get(varName);

                        if (!label) {
                            throw new Error("Missing created label");
                        }


                        // Parcourt les données de la directive (EQU/DB/DW/DD/DQ/RESB/RESW/RESD/RESQ)
                        while (!this.isAtEnd()) {
                            //const t = this.peek();
                            const nextAfter = this.peek(1);

                            if (['COMMA'].includes(nextAfter.type)) {
                                this.advance();

                            } else if (['STRING', 'NUMBER'].includes(nextAfter.type)) {
                                this.advance();

                                label.immValue = nextAfter.value

                            } else if (nextAfter.type === 'IDENTIFIER') {
                                // Reference to another identifier (e.g., _R equ COL_RED)
                                const twoAfter = this.peek(2);

                                // Stop if this identifier starts a new declaration (e.g., "other_var db ...")
                                if (twoAfter.type === 'DIRECTIVE') {
                                    //throw new Error("debug me: pass1CollectSymbols (1)")
                                    break;
                                }

                                this.advance();

                                //if (!label.values) label.values = [];
                                //label.values.push(t.value)
                                label.immValue = nextAfter.value;

                            } else if (['COMMENT', 'NEWLINE'].includes(nextAfter.type)) {
                                this.advance();

                            } else if (['LABEL', 'EOF'].includes(nextAfter.type)) {
                                break;

                            } else if (['DIRECTIVE'].includes(nextAfter.type)) {
                                break;
                                //this.advance();

                            } else {
                                throw new Error(`debug me: pass1CollectSymbols (2) : ${nextAfter.type}`)
                                break;
                            }
                        }

                        const endAddress = this.currentAddress as u16;

                        this.appendInstructionCommentAndNewline()

                        const instructionData: CompileInstruction = {
                            section: this.currentSectionName,
                            type: next.type, // DIRECTIVE ("my_var db 0x12")
                            instruction: token.value,
                            step1Address: this.currentAddress,
                            size,
                            startPos: lastInstructionOrIdentifierPos,
                            endPos: this.pos,
                            tokens: this.tokens.slice(lastInstructionOrIdentifierPos, this.pos + 1),
                        };

                        //if (this.tokens.slice(lastInstructionOrIdentifierPos, this.pos+1)[0].line > 40) debugger;

                        //console.log("New Instruction:", instructionData);
                        if (!this.currentSection) throw new Error(`Missing currentSection`);
                        this.currentSection.compileInstructions.push(instructionData);


                        continue;
                    }
                }
            }

            if (token.type === 'NEWLINE') {
                this.advance();
                //lastInstructionOrIdentifierAddress = null;
                continue;
            }

            // Associate comments with their instruction/data address
            if (token.type === 'COMMENT') {
                if (lastInstructionOrIdentifierAddress !== null) {
                    this.comments.set(lastInstructionOrIdentifierAddress, token.value);
                }
                this.advance();
                //lastInstructionOrIdentifierAddress = null;
                continue;
            }

            if (token.type === 'EOF') {
                this.advance();
                lastInstructionOrIdentifierAddress = null;
                this.setCurrentSection(".text")
                continue;
            }

            //console.warn(`unknown token type: ${token.type} (value = "${token.value}", line = ${token.line})`)
            this.error(token, `unknown token type: ${token.type} (value = "${token.value}", line = ${token.line})`)

            this.advance();
        }
    }


    private setCurrentSection(sectionName: string): void {
        this.currentSectionName = sectionName;
        const currentSection = this.sections.get(sectionName);

        if (!currentSection) {
            throw new Error(`Section "${sectionName} not found"`);
        }

        this.currentSection = currentSection;
    }


    // Handle directives during pass 1 (section changes, .org, global/extern)
    private handleDirectivePass1(): void {
        // called by pass1CollectSymbols (pass1)

        const directiveToken = this.peek();
        const directive = this.normalize(directiveToken.value);
        const lastInstructionOrIdentifierPos: number | null = this.pos;

        // Switch to different section (.text, .data, .bss)
        if (directive === 'SECTION' || directive.startsWith('.')) {
            this.advance();

            // toutes les directives commencant par "." (autre que ".include") sont compaté comme le nom d'une section

            let sectionName = directive;

            if (directive === 'SECTION' && !this.isAtEnd()) {
                const nameToken = this.peek();

                if (nameToken.type === 'IDENTIFIER') {
                    throw new Error("utile ?");
                    sectionName = this.normalize(nameToken.value);
                    this.advance();
                }

                if (nameToken.type === 'DIRECTIVE') {
                    // defini le nom de la section d'apres le token qui suit une DIRECTIVE "section"
                    sectionName = this.normalize(nameToken.value);
                    this.advance();
                }
            }

            if (sectionName === '.DATA' || sectionName === 'DATA') {
                this.setCurrentSection(".data")
                //console.log(`[STEP1] new section : ".data" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)

            } else if (sectionName === '.BSS' || sectionName === 'BSS') {
                this.setCurrentSection(".bss")
                //console.log(`[STEP1] new section : ".bss" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)

            } else if (sectionName === '.TEXT' || sectionName === 'TEXT') {
                this.setCurrentSection(".text")
                //console.log(`[STEP1] new section : ".text" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)

            } else if (sectionName === '.INCLUDE' || sectionName === 'INCLUDE') {
                this.skip('STRING')
                return;

            } else {
                throw new Error(`Unknown case : Unknown section "${sectionName}"`)
            }

            const section = this.sections.get(this.currentSectionName);

            if (!section) {
                throw new Error(`Unknown  section "${sectionName}" not found`)
            }

            this.appendInstructionCommentAndNewline()

            const instructionData: CompileInstruction = {
                section: this.currentSectionName,
                type: directiveToken.type as 'DIRECTIVE', // DIRECTIVE (section)
                instruction: directiveToken.value,
                step1Address: this.currentAddress,
                size: 0,
                startPos: lastInstructionOrIdentifierPos,
                endPos: this.pos,
                tokens: this.tokens.slice(lastInstructionOrIdentifierPos, this.pos + 1),
            };

            //console.log("New Instruction:", instructionData);
            if (!this.currentSection) throw new Error(`Missing currentSection`);
            this.currentSection.compileInstructions.push(instructionData);

            return;
        }


        // .ORG: Set origin address (.org directive)
        if (directive === '.ORG') {
            this.advance();

            if (this.peek().type === 'NUMBER') {
                throw new Error('EDIT ME handleDirectivePass1')
                this.currentAddress = this.parseNumber(this.peek().value);
                this.advance();

            } else {
                throw new Error("Unknown case : .org ...")
            }

            return;
        }


        // Mark symbols as global or extern
        if (directive === 'GLOBAL' || directive === 'EXTERN') {
            this.advance();

            while (!this.isAtEnd() && this.peek().type === 'IDENTIFIER') {
                const symbolName = this.peek().value;

                if (directive === 'GLOBAL') {
                    // Global symbol handling (commented out)

                    //                    const sym = this.symbols.get(symbolName);
                    //
                    //                    if (sym) {
                    //                        sym.global = true;
                    //                    }
                    //
                    //                    if (symbolName === '_start' || symbolName === 'start' || symbolName === 'main') {
                    //                        const labelInfo = this.labels.get(symbolName);
                    //
                    //                        if (labelInfo !== undefined) {
                    //                            this.entryPoint = labelInfo.address;
                    //                        }
                    //                    }

                } else {
                    // Register external symbol

                    this.symbols.set(symbolName, {
                        address: 0,
                        section: '',
                        type: 'label',
                        extern: true
                    });
                }

                this.advance();
                if (this.peek().type === 'COMMA') this.advance();
            }

            return;
        }

        // Handle bare data directives (DB/DW/DD/DQ without preceding identifier)
        // e.g., continuation lines after a label:
        //   sprite_mario:
        //       db _X, _X, _X
        //       db _X, _X, _X
        if (['DB', 'DW', 'DD', 'DQ'].includes(directive)) {
            let lastInstructionOrIdentifierPos: number | null = this.pos;

            const token = directiveToken;
            const itemSize = getDirectiveDataSize(directive);
            const size = this.calculateDataSize(itemSize, false)
            this.currentAddress += size;

            this.debugAddresses.set(`${token.file}:${token.line}:${token.column}`, size)

            //this.advance(); // consume the directive

            while (!this.isAtEnd()) {
                //const t = this.peek();
                const nextAfter = this.peek(1);

                if (['STRING', 'NUMBER', 'IDENTIFIER', 'COMMA', 'COMMENT', 'NEWLINE'].includes(nextAfter.type)) {
                    // For IDENTIFIER, stop if it starts a new declaration
                    if (nextAfter.type === 'IDENTIFIER') {
                        const twoAfter = this.peek(2);
                        if (twoAfter.type === 'DIRECTIVE') break;
                    }

                    this.advance();

                } else if (nextAfter.type === 'DIRECTIVE') {
                    break;

                } else if (nextAfter.type === 'LABEL') {
                    break;

                } else {
                    throw new Error("edit me")
                    break;
                }
            }

            this.appendInstructionCommentAndNewline()

            const instructionData: CompileInstruction = {
                section: this.currentSectionName,
                type: token.type as 'DIRECTIVE', // DIRECTIVE (DB/DW/DD/DQ without preceding identifier => "db 0x12")
                instruction: token.value,
                step1Address: this.currentAddress,
                size,
                startPos: lastInstructionOrIdentifierPos,
                endPos: this.pos,
                tokens: this.tokens.slice(lastInstructionOrIdentifierPos, this.pos + 1),
            };

            //console.log("New Instruction:", instructionData);
            if (!this.currentSection) throw new Error(`Missing currentSection`);
            this.currentSection.compileInstructions.push(instructionData);

            return;
        }

        console.log(`Unknown directive: ${directive}`)

        const token = this.peek();
        this.error(token, `Unknown directive: ${directive}`)

        this.advance();
    }


    private appendInstructionCommentAndNewline() {
        const currentToken = this.peek();

        if (!['EOF', 'NEWLINE'].includes(currentToken.type)) {
            // on cherche le NEWLINE ou EOF suivant et on l'ajoute

            let nextToken = this.peek(1);
            //if (currentToken.value.includes('indique au disk')) debugger

            if (['COMMENT'].includes(nextToken.type)) {
                this.advance()
                nextToken = this.peek();
            }

            if (['NEWLINE'].includes(nextToken.type)) {
                this.advance()
                nextToken = this.peek();
            }

            if (['EOF'].includes(nextToken.type)) {
                this.advance()
                nextToken = this.peek();
            }
        }
    }


    // Calculate instruction size in bytes (used in pass1)
    private calculateInstructionSize(): number {
        // called by pass1CollectSymbols (pass1)

        const instrToken = this.peek();
        const mnemonic = this.normalize(instrToken.value);
        const instrDef = this.instructionMap.get(mnemonic);

        if (!instrDef) {
            throw new Error(`Undefined instruction "${mnemonic}"`)
            return 1;
        }

        this.advance();
        const operands = this.parseOperands();

        const variant = this.findInstructionVariant(instrDef, operands);
        return variant ? variant.size : 1;
    }


    // Calculate data declaration size in bytes (db, dw, dd, dq with values)
    private calculateDataSize(itemSize: number, isSpaceReserve: boolean): number {
        // called by pass1CollectSymbols (pass1)

        let size = 0;
        let offset = 1; // Start after DIRECTIVE

        while (true) {
            const token = this.peek(offset);
            if (!token || ['EOF', 'NEWLINE', 'COMMENT'].includes(token.type)) break;

            if (token.type === 'INSTRUCTION' || token.type === 'LABEL') break;

            if (token.type === 'STRING') {
                // Each character is one byte
                if (isSpaceReserve) throw new Error(`unexpected string`)
                size += token.value.length;
                offset++;

            } else if (token.type === 'NUMBER') {
                size += isSpaceReserve
                    ? (itemSize * Number(token.value))
                    : itemSize;
                offset++;

            } else if (token.type === 'IDENTIFIER') {
                if (isSpaceReserve) throw new Error(`unexpected identifier`)
                const next = this.peek(offset + 1);
                if (next.type === 'DIRECTIVE') break

                size += itemSize;
                offset++;

            } else if (token.type === 'COMMA') {
                if (isSpaceReserve) throw new Error(`unexpected comma`)
                offset++;

            } else {
                throw new Error("edit me: calculateDataSize");
                break;
            }
        }

        return size;
    }


    // ## PASS 2 ## //


    // Pass 2: generate actual machine code bytes
    private pass2GenerateCode(): void {
        // called by compile

        this.step = 2;
        this.setCurrentSection('')
        this.pos = 0;
        this.currentAddress = this.startAddress;

        while (!this.isAtEnd()) {
            const token = this.peek();
            //if (this.peek(1).value === 'lcd_clear') debugger;

            // DIRECTIVE: Process section switches and directives
            if (token.type === 'DIRECTIVE') {
                // example => "section .text"
                this.handleDirectivePass2(); // size=0
                continue;
            }

            // LABEL: Skip labels (already processed in pass1)
            if (token.type === 'LABEL') {
                // example => "main:"

                const debugAddress = this.debugAddresses.get(`${token.file}:${token.line}:${token.column}`)

                if (debugAddress === undefined) {
                    //throw new Error("debugAddress not found");
                }

                if (debugAddress !== 1) {
                    //throw new Error(`debugAddress size mismatch : debugAddress=${debugAddress} VS size=${size}`);
                }

                const label = this.labels.get(token.value)
                if (!label) throw new Error(`missing label "${token.value}"`)
                label.address = this.currentAddress as u16;

                this.advance();
                this.skip('COLON');
                continue;
            }

            // IDENTIFIER: Generate data bytes for variables
            if (token.type === 'IDENTIFIER') {
                // example => "LEDS_BASE db 0x00"
                const next = this.peek(1);

                const label = this.labels.get(token.value)
                if (!label) throw new Error(`missing label "${token.value}"`)
                label.address = this.currentAddress as u16;
                const addressBefore = this.currentAddress as u16;

                if (next?.type === 'DIRECTIVE') {
                    const directive = this.normalize(next.value);

                    if (['EQU', 'DB', 'DW', 'DD', 'DQ'].includes(directive)) {
                        const varName = token.value;
                        this.advance();

                        const directiveToken = next //this.peek();
                        this.generateData(varName, this.normalize(directiveToken.value), next);

                    } else if (['RESB', 'RESW', 'RESD', 'RESQ'].includes(directive)) {
                        const directiveToken = next //this.peek();
                        this.advance();
                        this.advance();

                        this.reserveSpace(directiveToken);

                    } else {
                        throw new Error("unknown identifier+directive case")
                    }

                    const size = this.currentAddress - addressBefore;

                    const debugAddress = this.debugAddresses.get(`${next.file}:${next.line}:${next.column}`)

                    if (debugAddress === undefined) {
                        throw new Error("debugAddress not found");
                    }

                    if (debugAddress !== size) {
                        throw new Error(`debugAddress size mismatch : debugAddress=${debugAddress} VS size=${size}`);
                    }


                    this.skip('COMMENT')
                    this.skip('NEWLINE')
                    this.skip('EOF')
                    continue;
                }

            }

            // INSTRUCTION: Encode instruction to bytes
            if (token.type === 'INSTRUCTION') {
                const posBefore = this.pos;
                const addressBefore = this.currentAddress;
                this.generateInstruction();

                const size = this.currentAddress - addressBefore;

                const debugAddress = this.debugAddresses.get(`${token.file}:${token.line}:${token.column}`)

                if (debugAddress === undefined) {
                    throw new Error("debugAddress not found");
                }

                if (debugAddress !== size) {
                    throw new Error(`debugAddress size mismatch : debugAddress=${debugAddress} VS size=${size}`);
                }


                this.skip('COMMENT')
                this.skip('NEWLINE')
                this.skip('EOF')

                continue;
            }

            // NEWLINE
            if (token.type === 'NEWLINE') {
                this.advance();
                continue;
            }


            console.log('currentSection:', this.currentSection)

            const currentLineTokens = this.extractCurrentLine()
            console.log('currentLineTokens:', currentLineTokens)

            debugger
            throw new Error(`unknown token: ${token.type} (${token.value})`)

            this.advance();
        }
    }


    // Handle directives during pass 2 (simpler than pass1, just section switching)
    private handleDirectivePass2(): void {
        // called by pass2GenerateCode (pass2)

        const directiveToken = this.peek();
        const directive = this.normalize(directiveToken.value);

        if (directive === 'SECTION' || directive.startsWith('.')) {
            this.advance();

            let sectionName = directive;
            if (directive === 'SECTION' && !this.isAtEnd()) {
                const nameToken = this.peek();

                if (nameToken.type === 'IDENTIFIER' || nameToken.type === 'DIRECTIVE') {
                    sectionName = this.normalize(nameToken.value);
                    this.advance();
                }
            }

            if (sectionName === '.DATA' || sectionName === 'DATA') {
                //this.currentSectionName = '.data';
                this.setCurrentSection('.data')
                //console.log(`[STEP2] new section : ".data" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)

            } else if (sectionName === '.BSS' || sectionName === 'BSS') {
                //this.currentSectionName = '.bss';
                this.setCurrentSection('.bss')
                //console.log(`[STEP2] new section : ".bss" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)

            } else if (sectionName === '.INCLUDE' || sectionName === 'INCLUDE') {
                this.advance()
                return;

            } else {
                //this.currentSectionName = '.text';
                this.setCurrentSection('.text')
                //console.log(`[STEP2] new section : ".text" at address [${toHex(this.currentAddress, 4)}] => in file ${directiveToken.file}:${directiveToken.line}`)
            }

            const section = this.sections.get(this.currentSectionName);

            if (section) {
                //this.currentAddress = section.startAddress + section.data.length;

                // Set data/bss section start address to current position

                if (section.data.length === 0) {
                    //console.log(`[pass2] start of ${this.currentSection} : ${this.currentAddress}`)

                    section.startAddress = this.currentAddress;

                    //                    if (this.currentAddress !== section.startAddress) {
                    //                        const token = this.peek();
                    //                        throw new Error(`address mismatch : ${this.currentAddress} !== ${section.startAddress}`);
                    //                    }
                }

            } else {
                throw new Error(`Unknown section "${this.currentSectionName}"`);
            }

            return;
        }

        if (directive === '.ORG') {
            this.advance();
            if (this.peek().type === 'NUMBER') {
                this.currentAddress = this.parseNumber(this.peek().value);
                this.advance();
            }
            return;
        }

        if (directive === 'GLOBAL' || directive === 'EXTERN') {
            this.advance();
            while (!this.isAtEnd() && this.peek().type === 'IDENTIFIER') {
                this.advance();
                if (this.peek().type === 'COMMA') this.advance();
            }
            return;
        }

        // Handle bare data directives (DB/DW/DD/DQ without preceding identifier)
        if (['DB', 'DW', 'DD', 'DQ'].includes(directive)) {
            //throw new Error('code utile ?') // oui
            this.generateData(undefined, directive, directiveToken);
            return;
        }

        throw new Error(`case not handled. directive ${directiveToken.value}`)

        this.advance();
    }


    private generateData(varName: string | undefined, directiveName: string, refInstrToken: Token): void {
        // called by pass2GenerateCode (pass2) (gère les valeurs situées après un couple [IDENTIFIER, DIRECTIVE]. example "my_var db 0x05, 0x06, 0x07")

        const directive = this.normalize(directiveName);

        let itemSize = getDirectiveDataSize(directive);

        this.advance();

        while (!this.isAtEnd()) {
            const token = this.peek();
            const comment = this.comments.get(this.currentAddress);

            if (token.type === 'IDENTIFIER') {
                // Vérifier si c'est une nouvelle variable
                const nextToken = this.peek(1);

                // Stop if we encounter a new variable declaration
                if (nextToken.type === 'DIRECTIVE') {
                    // Any directive after an identifier means a new declaration, stop here
                    break;
                }

                if (nextToken.type === 'INSTRUCTION' || nextToken.type === 'LABEL') {
                    // Nouvelle instruction ou label, on arrête
                    break;
                }

                // Sinon, c'est une référence à un label

                //if (1) throw new Error('utile ?') // oui

                const tokenValue = token.value;

                // Emit label address as data (or EQU value if it's a constant)
                const labelInfo = this.labels.get(token.value);

                if (labelInfo !== undefined) {
                    // EQU constant: resolve the value (possibly chained)
                    if (labelInfo.dataSize === 0 && labelInfo.immValue !== undefined) {
                        //debugger
                        const resolvedEquValue = this.resolveEquValue(labelInfo.immValue);

                        for (let i = 0; i < itemSize; i++) {
                            const defaultComment = `${token.value} = ${toHex(resolvedEquValue)} (${resolvedEquValue})`;
                            this.emitByte((resolvedEquValue >> (i * 8)) & 0xFF, comment || defaultComment, refInstrToken);
                        }

                    } else {
                        // Regular label: emit its address

                        for (let i = 0; i < itemSize; i++) {
                            const defaultComment = i === 0
                                ? `low  byte of label ${tokenValue} = ${labelInfo.address}`
                                : `high byte of label ${tokenValue} = ${labelInfo.address}`

                            //this.emitByte((labelInfo.addressStep2 >> (i * 8)) & 0xFF, comment || defaultComment, refInstrToken);

                            console.log(`defer known label "${token.value}"`)

                            const resolver = () => {
                                const label = this.labels.get(tokenValue);
                                console.log(`resolve label ${label}`)
                                if (!label) throw new Error("missing label");
                                if (!label.address) throw new Error("missing label address");
                                return (label.address >> (i * 8)) & 0xFF;
                            }

                            this.emitByte(resolver, comment || defaultComment, refInstrToken, false);
                        }
                    }

                } else {
                    // Référence non trouvée

                    // Add to unresolved references
                    this.unresolvedRefs.push({
                        address: this.currentAddress,
                        section: this.currentSectionName,
                        label: token.value,
                        size: itemSize,
                    });

                    console.log(`defer unresolved label "${token.value}"`)

                    for (let i = 0; i < itemSize; i++) {

                        const resolver = () => {
                            const label = this.labels.get(tokenValue);
                            console.log(`resolve label ${label}`)
                            if (!label) throw new Error("missing label");
                            if (!label.address) throw new Error("missing label address");
                            return (label.address >> (i * 8)) & 0xFF;
                        }

                        this.emitByte(resolver, comment, refInstrToken, false);
                    }
                }

                this.advance();

            } else if (token.type === 'STRING') {
                // Emit string as ASCII bytes
                for (let i = 0; i < token.value.length; i++) {
                    this.emitByte(token.value.charCodeAt(i), comment || `'${token.value[i]}'`, refInstrToken, false);
                }

                this.advance();

            } else if (token.type === 'NUMBER') {
                // Emit number split into bytes
                const value = this.parseNumber(token.value);

                for (let i = 0; i < itemSize; i++) {
                    const defaultComment = (itemSize <= 1)
                        ? `number ${varName} = ${toHex(value)} (${value})`
                        : (i === 0)
                            ? ` low byte of number ${varName} = ${toHex(value)} (${value})`
                            : `high byte of number ${varName} = ${toHex(value)} (${value})`


                    const byte = (value >> (i * 8)) & 0xFF;
                    this.emitByte(byte, comment || defaultComment || (i === 0 ? token.value : undefined), refInstrToken, false);
                }

                this.advance();

            } else if (['COMMA', 'COMMENT', 'NEWLINE'].includes(token.type)) {
                this.advance();

            } else if (['EOF', 'DIRECTIVE', 'LABEL'].includes(token.type)) {
                break;

            } else {
                throw new Error("debug me: generateData")
                break;
            }
        }
    }


    // Reserve uninitialized space (resb, resw, resd, resq)
    private reserveSpace(refInstrToken: Token): void {
        // called by pass2GenerateCode (pass2)

        const comment = this.comments.get(this.currentAddress);

        if (this.peek().type === 'NUMBER') {
            const count = this.parseNumber(this.peek().value);

            for (let i = 0; i < count; i++) {
                this.emitByte(0, comment || 'reserved space', refInstrToken);
            }

            this.advance();
            return;
        }

        throw new Error("unknown case in reserveSpace");
    }


    // Encode instruction opcode and operands to bytes
    private generateInstruction(): void {
        // called by pass2GenerateCode (pass2)

        const instrToken = this.peek();
        const mnemonic = this.normalize(instrToken.value);

        const instrDef = this.instructionMap.get(mnemonic);
        if (!instrDef) {
            this.error(instrToken, `Unknown instruction: ${mnemonic}`);
            this.advance();
            return;
        }

        this.advance();

        const operands = this.parseOperands();

        // Find matching instruction variant based on operand types
        const variant = this.findInstructionVariant(instrDef, operands);
        if (!variant) {
            this.error(instrToken, `Invalid operands for ${mnemonic}`);
            return;
        }

        // Emit opcode byte
        const comment = this.comments.get(this.currentAddress);
        this.emitByte(variant.opcode, variant.mnemonic + (comment ? ` ${comment}` : ''), instrToken, true);

        // Emit operand bytes
        this.emitOperands(operands, variant, instrToken);
    }


    // Emit operand bytes based on instruction variant pattern
    private emitOperands(operands: ParsedOperand[], variant: InstructionVariant, refInstrToken: Token): void {
        // called by generateInstruction (pass2)

        const pattern = variant.operands;

        if (pattern === 'NONE') return;

        const parts = pattern.split('_');

        for (let i = 0; i < operands.length; i++) {
            const part = parts[i];
            const op = operands[i];

            if (part === 'IMM8') {
                // 8-bit immediate value
                if (op.address === undefined) throw new Error("debug me: emitOperands")

                const value = (op.address !== undefined) // TODO: a préciser
                    ? op.address
                    : this.parseNumber(op.value);

                if (value === null) {
                    throw new Error("edit me emitOperands (1)");
                }

                this.emitByte(value & 0xFF, op.value, refInstrToken, false);

            } else if (part === 'IMM16' || part === 'MEM') {
                // 16-bit immediate or memory address
                let value: number | (() => number) = 0;
                let labelRef: string | null = null
                let valueLow: (() => number) = () => 0;
                let valueHigh: (() => number) = () => 0;

                if (op.type === 'MEMORY' && op.address !== undefined) {

                    if (op.memoryExpr && op.memoryExpr.some(t => t.labelName)) {
                        // Expression avec au moins un label → resolver lazy
                        const expr = op.memoryExpr;

                        //console.log('parsing memoryExpr:', op.memoryExpr)

                        const resolver = () => {
                            if (!labelRef) throw new Error(`missing label "${labelRef}"`)

                            // parse expression
                            let result = 0;
                            //console.log(`start parsing expression for operands:`, operands)

                            for (const term of expr) {
                                let termValue: number;

                                if (term.labelName) {
                                    const label = this.labels.get(term.labelName);
                                    if (!label) throw new Error(`Missing label "${term.labelName}"`);
                                    if (label.address === null) throw new Error(`Label "${term.labelName}" has no address`);
                                    termValue = label.address;

                                } else {
                                    termValue = term.offset; // constante numérique ou EQU déjà résolu
                                }

                                result = (term.op === '+') ? result + termValue : result - termValue;
                                //console.log('tmp result:', result)
                            }

                            return result;
                        }

                        labelRef = op.value; // pour le commentaire

                        valueLow  = () => (resolver() & 0xFF);
                        valueHigh = () => ((resolver() >> 8) & 0xFF);

                    } else if (op.address) {
                        // Expression purement numérique (pas de label), déjà résolue
                        value = op.address;

                    } else {
                        throw new Error()
                    }

                } else if (op.type === 'LABEL') {
                    // example: "call print_something"
                    const labelInfo = this.labels.get(op.value);

                    if (labelInfo !== undefined) {
                        if (labelInfo.dataSize === 0 && labelInfo.immValue !== undefined) {
                            value = this.resolveEquValue(labelInfo.immValue);
                            debugger;
                            throw new Error("edit me emitOperands (3)");

                        } else {
                            const opValue = op.value;
                            labelRef = op.value;

                            const resolver = () => {
                                if (!labelRef) throw new Error(`missing label "${labelRef}"`)
                                const label = this.labels.get(opValue);
                                if (!label) throw new Error(`missing label "${labelRef}"`)
                                if (!label.address) throw new Error(`missing label "${labelRef}" address`)
                                return label.address
                            }

                            valueLow  = () => {
                                const resolved = resolver();
                                const value = (resolved) & 0xFF
                                return value
                            };

                            valueHigh = () => {
                                const resolved = resolver();
                                const value = (resolved >> 8) & 0xFF
                                return value
                            };
                        }

                    } else {
                        this.unresolvedRefs.push({
                            address: this.currentAddress,
                            section: this.currentSectionName,
                            label: op.value,
                            size: 2,
                        });
                    }

                } else if (op.type === 'MEMORY') {
                    // Fallback: no address resolved yet (shouldn't happen after parseMemoryOperand fix)
                    const label = this.labels.get(op.value);
                    if (1) throw new Error('utile ?')

                    if (!label) {
                        throw new Error(`Missing label "${op.value}"`);
                    }

                    if (label.dataSize === 0 && label.immValue !== undefined) {
                        value = this.resolveEquValue(label.immValue);

                    } else {
                        if (label.address === undefined) throw new Error("missing label address");
                        if (label.address === null) throw new Error("missing label address");
                        value = label.address;
                    }

                } else if (op.address !== undefined) {
                    if (op.address === null) {
                        throw new Error("edit me emitOperands (4)");
                    }

                    value = op.address;

                } else {
                    value = this.parseNumber(op.value);
                }


                if (labelRef || typeof value !== 'number') {
                    if (!labelRef) throw new Error(`missing label "${labelRef}"`)

                    const commentPrefix = `${isNaN(Number(op.value)) ? `${op.value} = ` : ''}${labelRef}`;

                    if (this.arch.endianness === 'little') {
                        this.emitByte(valueLow,  `${commentPrefix} (low byte little)  - defer "${labelRef}`, refInstrToken, false);
                        this.emitByte(valueHigh, `${commentPrefix} (high byte little) - defer "${labelRef}`, refInstrToken, false);

                    } else {
                        this.emitByte(valueHigh, `${commentPrefix} (high byte big) - defer "${labelRef}`, refInstrToken, false);
                        this.emitByte(valueLow,  `${commentPrefix} (low byte big)  - defer "${labelRef}`, refInstrToken, false);
                    }

                } else {
                    const commentPrefix = `${isNaN(Number(op.value)) ? `${op.value} = ` : ''}${toHex(value)} (${value})`;

                    if (this.arch.endianness === 'little') {
                        this.emitByte(value & 0xFF, `${commentPrefix} (low byte little)`, refInstrToken, false);
                        this.emitByte((value >> 8) & 0xFF, `${commentPrefix} (high byte little)`, refInstrToken, false);
                    } else {

                        this.emitByte(value & 0xFF, `${commentPrefix} (low byte big)`, refInstrToken, false);
                        this.emitByte((value >> 8) & 0xFF, `${commentPrefix} (high byte big)`, refInstrToken, false);
                    }
                }


            } else if (part === 'REG') {
                let value = 0;
                let reg = '';
                if (op.register === 'A') {
                    reg = 'A'
                    value = 1;
                }
                if (op.register === 'B') {
                    reg = 'B'
                    value = 2;
                }
                if (op.register === 'C') {
                    reg = 'C'
                    value = 3;
                }
                if (op.register === 'D') {
                    reg = 'D'
                    value = 4;
                }
                if (op.register === 'E') {
                    reg = 'E'
                    value = 5;
                }
                if (op.register === 'F') {
                    reg = 'F'
                    value = 6;
                }
                if (op.register === 'SP') {
                    reg = '';
                    value = 0; // on n'emet pas de byte pour le registre SP car il possede une instruction dédiée
                }

                if (value !== 0) {
                    const commentPrefix = `Register ${reg}`;
                    this.emitByte(value, `${commentPrefix}`, refInstrToken);
                }

            } else {
                console.warn(`Unknown operand: ${part}`);
            }
        }
    }


    // ## COMMON (pass1 & pass2) ## //


    // Parse instruction operands into structured format
    private parseOperands(): ParsedOperand[] {
        // called by calculateInstructionSize (pass1) & generateInstruction (pass2)

        const operands: ParsedOperand[] = [];

        while (!this.isAtEnd()) {
            const token = this.peek();

            if (token.type === 'REGISTER') {
                operands.push({
                    type: (token.value === 'SP') ? 'SKIP' : 'REGISTER',
                    value: token.value,
                    register: this.mapRegister(token.value)
                });
                this.advance();

            } else if (token.type === 'NUMBER') {
                operands.push({
                    type: 'IMMEDIATE',
                    value: token.value,
                    address: this.parseNumber(token.value)
                });
                this.advance();

            } else if (token.type === 'LBRACKET') {
                // Memory operand [...]
                this.advance();
                const memOperand = this.parseMemoryOperand();
                this.skip('RBRACKET');
                operands.push(memOperand);

            } else if (token.type === 'IDENTIFIER') {
                const label = this.labels.get(token.value);

                if (!label) {
                    //console.warn(`Unknown label:`, label, token);

                    this.unresolvedRefs.push({
                        address: this.currentAddress,
                        section: this.currentSectionName,
                        label: token.value,
                        size: 2,
                    });
                }

                // EQU constants become immediate value
                if (label && label.dataSize === 0) {
                    const resolvedEquValue = label?.immValue !== undefined
                        ? this.resolveEquValue(label.immValue)
                        : 0;

                    operands.push({
                        type: 'IMMEDIATE',
                        value: label?.immValue !== undefined ? label.immValue : token.value,
                        address: resolvedEquValue,
                    });

                } else {
                    // Label reference
                    const labelValue = label?.immValue !== undefined
                        ? label.immValue
                        : token.value;

                    operands.push({
                        type: 'LABEL',
                        value: labelValue,
                        address: label?.address ?? null,
                        //address: () => labelValue,
                        //size: 2,
                    });
                }

                this.advance();

            } else if (token.type === 'COMMA') {
                this.advance();

            } else {
                break;
            }
        }

        return operands;
    }


    // Parse memory addressing operand inside brackets
    // Supports expressions: [label + 1], [0x1234 + 5], [label - 2]
    private parseMemoryOperand(): ParsedOperand {
        const operand: ParsedOperand = { type: 'MEMORY', value: '' };
        const token = this.peek();

        if (token.type === 'REGISTER') {
            operand.base = this.mapRegister(token.value);
            operand.value = token.value;
            this.advance();
            return operand;
        }

        const expr: MemoryExprTerm[] = [];

        const firstTerm = this.parseMemoryTerm();
        operand.value = firstTerm.name;
        operand.address = firstTerm.value;
        expr.push({ labelName: firstTerm.labelName, offset: firstTerm.value, op: '+' });

        while (!this.isAtEnd()) {
            const next = this.peek();

            if (next.type === 'PLUS') {
                this.advance();
                const term = this.parseMemoryTerm();
                operand.address! += term.value;
                operand.value += ' + ' + term.name;
                expr.push({ labelName: term.labelName, offset: term.value, op: '+' });

            } else if (next.type === 'MINUS') {
                this.advance();
                const term = this.parseMemoryTerm();
                operand.address! -= term.value;
                operand.value += ' - ' + term.name;
                expr.push({ labelName: term.labelName, offset: term.value, op: '-' });

            } else if (next.type === 'RBRACKET') {
                break;

            } else {
                console.warn(`Unknown operand:`, operand, next);
                break;
            }
        }

        operand.memoryExpr = expr;
        return operand;
    }


    // Parse a single term inside a memory expression: NUMBER or IDENTIFIER
    private parseMemoryTerm(): { value: number, name: string, labelName?: string } {
        const token = this.peek();

        if (token.type === 'NUMBER') {
            this.advance();
            return { value: this.parseNumber(token.value), name: token.value };
        }

        if (token.type === 'IDENTIFIER') {
            const label = this.labels.get(token.value);
            this.advance();

            if (!label) {
                if (this.step === 2) throw new Error(`Unresolved label "${token.value}" in memory expression`);
                this.unresolvedRefs.push({ address: this.currentAddress, section: this.currentSectionName, label: token.value, size: 2 });
                return { value: 0, name: token.value, labelName: token.value };
            }

            if (label.dataSize === 0 && label.immValue !== undefined) {
                // EQU constant : résolu à la valeur, pas de labelName (pas de déférence)
                return { value: this.parseNumber(label.immValue), name: token.value };
            }

            // Label normal : on retourne labelName pour résolution lazy
            return { value: label.address ?? 0, name: token.value, labelName: token.value };
        }

        throw new Error(`Unexpected token "${token.value}" in memory expression at line ${token.line}`);
    }


    // Find instruction variant matching operand pattern
    private findInstructionVariant(instrDef: InstructionDef, operands: ParsedOperand[]): InstructionVariant | null {
        // called by calculateInstructionSize (pass1) & generateInstruction (pass2)

        // No variants means single encoding
        if (!instrDef.variants || instrDef.variants.length === 0) {
            if (this.matchesOperandPattern(instrDef.operands, operands)) {
                return {
                    operands: instrDef.operands,
                    opcode: instrDef.opcode,
                    size: instrDef.size,
                    mnemonic: instrDef.mnemonic,
                };
            }
            return null;
        }

        // Try each variant until pattern matches
        for (const variant of instrDef.variants) {
            if (this.matchesOperandPattern(variant.operands, operands)) {
                if (!variant.condition || variant.condition(operands)) {
                    return variant;
                }
            }
        }

        return null;
    }


    // Check if operand types match expected pattern (e.g., "REG_IMM8")
    private matchesOperandPattern(pattern: string, operands: ParsedOperand[]): boolean {
        // called by findInstructionVariant (pass1 & pass2)

        if (pattern === 'NONE') {
            return operands.length === 0;
        }

        const parts = pattern.split('_');
        if (parts.length !== operands.length) return false;

        for (let i = 0; i < parts.length; i++) {
            const part = parts[i];
            const op = operands[i];

            const isReg = (part === 'REG');
            const isImm = (part.startsWith('IMM'));
            const isMem = (part === 'MEM');

            if (isReg && op.type !== 'REGISTER') return false;

            if (isImm && op.type !== 'IMMEDIATE' && op.type !== 'LABEL') return false;

            if (isMem && op.type !== 'MEMORY' && op.type !== 'LABEL') return false;
        }

        return true;
    }


    private resolveLabels(): void {
        for (const section of Array.from(this.sections.values())) {
            const sectionName = section.name;
            console.log('resolve labels of section:', sectionName, section)

            section.data.forEach(d => {
                if (typeof d.value !== 'number') {
                    const resolver = d.value;
                    d.value = resolver()
                }
            })
        }
    }


    // Resolve forward references after both passes complete
    private resolveReferences(): void {
        // called by compile

        for (const ref of this.unresolvedRefs) {
            const labelInfo = this.labels.get(ref.label);

            if (labelInfo === undefined) {
                this.errors.push({
                    line: 0,
                    column: 0,
                    message: `Undefined label: ${ref.label}`,
                    severity: 'error'
                });

                continue;
            }

            /*
            if (1) continue;

            const section = this.sections.get(ref.section);
            if (!section) continue;

            if (!section.startAddress) throw new Error("Missing startAddress (resolveReferences)")
            const offset = ref.address - section.startAddress;

            // Patch bytes with correct endianness
            if (ref.size === 2) {
                if (this.arch.endianness === 'little') {
                    section.data[offset].value = labelInfo.addressStep2 & 0xFF;
                    section.data[offset + 1].value = (labelInfo.addressStep2 >> 8) & 0xFF;

                } else {
                    section.data[offset].value = (labelInfo.addressStep2 >> 8) & 0xFF;
                    section.data[offset + 1].value = labelInfo.addressStep2 & 0xFF;
                }

            } else {
                section.data[offset].value = labelInfo.addressStep2 & 0xFF;
            }
            */
        }
    }


    // Emit a single byte to current section
    private emitByte(valueResolver: number | (() => number), comment?: string, opcodeToken?: Token, isOpcode = false): void {
        // used at several places (step2)

        const section = this.sections.get(this.currentSectionName);
        if (!section) return;

        if (opcodeToken) {
            // Debug
            //console.log(`[STEP2] emitByte "${toHex(value)}" at address ${toHex(this.currentAddress, 4)} for token ${instrToken.type} (${instrToken.value.trim()}) => ${instrToken.file}:${instrToken.line}:${instrToken.column}`)
        }

        section.data.push({
            address: this.currentAddress++,
            //value: value & 0xFF,
            value: valueResolver,
            //section: this.currentSection,
            comment,
            isOpcode,
            opcodeToken,
        });
    }


    // Map register name/alias to ID
    private mapRegister(name: string): string {
        // used by parseMemoryOperand & parseOperands
        const normalized = this.caseSensitive ? name : name.toUpperCase();
        return this.registerMap.get(normalized) || name;
    }


    // Normalize string based on case sensitivity setting
    private normalize(str: string): string {
        // used at several places

        return this.caseSensitive ? str : str.toUpperCase();
    }


    // Resolve an EQU value that may reference another EQU identifier (chain resolution)
    // e.g., _R equ COL_RED, COL_RED equ 0x01 → resolves _R to 0x01
    private resolveEquValue(value: string, maxDepth = 10): number {
        let current = value;

        for (let i = 0; i < maxDepth; i++) {
            // Try parsing as a number first
            const asNumber = parseInt(current);
            if (!isNaN(asNumber) || current.startsWith('0x') || current.startsWith('0b') || current.startsWith('$')) {
                return this.parseNumber(current);
            }

            // Look up as a label/identifier
            const label = this.labels.get(current);
            if (label && label.dataSize === 0 && label.immValue !== undefined) {
                // EQU
                current = label.immValue;
                continue;
            }

            // If it's a known label (not EQU), return its address
            if (label) {
                throw new Error("edit me: resolveEquValue")
                //if (label.address === null) throw new Error("edit me resolveEquValue")
                //return label.address; // TODO
                return 0 // TODO: resolver
            }

            // Couldn't resolve
            break;
        }

        return this.parseNumber(current);
    }


    // Parse number from various formats (0x, $, 0b, h suffix, b suffix, decimal)
    private parseNumber(str: string): number {
        // used at several places

        const lower = str.toLowerCase();

        if (lower.startsWith('0x')) return parseInt(lower.substring(2), 16);
        if (lower.startsWith('$')) return parseInt(lower.substring(1), 16);
        if (lower.startsWith('0b')) return parseInt(lower.substring(2), 2);
        if (lower.endsWith('h')) return parseInt(lower.substring(0, lower.length - 1), 16);
        if (lower.endsWith('b') && lower.length > 1) return parseInt(lower.substring(0, lower.length - 1), 2);

        return parseInt(str, 10);
    }


    // Look ahead at token without consuming
    private peek(offset = 0): Token {
        // used at several places

        return this.tokens[this.pos + offset] || { type: 'EOF', value: '', line: 0, column: 0 };
    }


    // Consume current token and advance
    private advance(): Token {
        // used at several places

        return this.tokens[this.pos++];
    }


    // Skip token if it matches expected type
    private skip(type: TokenType): void {
        // used at several places

        if (this.peek().type === type) {
            this.advance();
        }
    }


    // Check if reached end of token stream
    private isAtEnd(): boolean {
        // used at several places

        return this.peek().type === 'EOF' && this.pos >= this.tokens.length - 1;
    }


    // Record compilation error
    private error(token: Token, message: string): void {
        // used in generateInstruction

        this.errors.push({
            line: token.line,
            column: token.column,
            message,
            severity: 'error'
        });
    }

    private extractCurrentLine(offset = 0) {
        // debug

        const current = this.peek(offset);
        const tokens: Token[] = current.type === 'NEWLINE' ? [] : [current];

        // parse vers l'arriere
        let currentPosMinus = offset - 1
        while (true) {
            const prev = this.peek(currentPosMinus);
            if (prev.type === 'EOF') break;
            if (prev.type === 'NEWLINE') break;
            tokens.unshift(prev);
            currentPosMinus--;
        }

        // parse vers l'avant (sauf si le currentToken est une nouvelle ligne)
        if (current.type !== 'NEWLINE') {
            let currentPosPlus = offset + 1
            while (true) {
                const next = this.peek(currentPosPlus);
                if (next.type === 'EOF') break;
                if (next.type === 'NEWLINE') break;
                tokens.push(next);
                currentPosPlus++;
            }
        }

        return tokens;
    }

}


// Get byte size for data directives
function getDirectiveDataSize(directive: string) {
    // called by pass1CollectSymbols

    switch (directive) {
        case 'EQU': return 0;  // Constant (no storage)
        case 'DB': return 1;   //  8 bits
        case 'DW': return 2;   // 16 bits
        case 'DD': return 4;   // 32 bits
        case 'DQ': return 8;   // 64 bits
        case 'RESB': return 1; //  8 bits (Réserve N bytes)
        case 'RESW': return 2; // 16 bits (Réserve N × 2 bytes)
        case 'RESD': return 4; // 32 bits (Réserve N × 4 bytes)
        case 'RESQ': return 8; // 64 bits (Réserve N × 8 bytes)
        default:
            throw new Error(`Unknown directive "${directive}"`)
    }
}

