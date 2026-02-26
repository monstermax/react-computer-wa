import { Node, parse, Program } from 'acorn'

// ============================================================
// ASM AST Types
// ============================================================

interface AsmAst {
    instructions: AsmInstruction[]
    data: DataDefinition[]
    includes: string[]
}

interface DataDefinition {
    name: string
    type: 'db' | 'dw' | 'equ' | 'resb'
    values: (number | string)[]
    comment?: string | undefined
}

interface AsmInstruction {
    mnemonic: string
    operands: (string | number)[]
    comment?: string | undefined
    label?: string | undefined
}

// ============================================================
// Compiler
// ============================================================

class JsToAsmCompiler {
    private ast: AsmAst = { instructions: [], data: [], includes: [] }
    private labelCounter = 0
    private vars = new Set<string>()
    private constants = new Map<string, number>()
    private arrays = new Map<string, { label: string, size: number }>()
    private strings = new Map<string, string>()
    private stringCounter = 0
    private functions = new Map<string, { label: string, paramCount: number }>()
    private paramMap = new Map<string, number>()
    private insideFunction = false

    parse(source: string): Program {
        return parse(source, { ecmaVersion: 2020, sourceType: 'module' })
    }

    compile(program: Program): AsmAst {
        this.ast = { instructions: [], data: [], includes: [] }
        this.labelCounter = 0
        this.vars.clear()
        this.constants.clear()
        this.arrays.clear()
        this.strings.clear()
        this.stringCounter = 0
        this.functions.clear()

        this.ast.includes.push('os/v3/arithmetic/lib_math.asm')
        this.ast.includes.push('os/v3/drivers/lib_console.asm')
        this.ast.includes.push('os/v3/strings/lib_string.asm')

        this.emit('call', ['_main'], 'entry point')
        this.emit('int3', [])
        this.emit('ret', [])

        // Pre-scan: collect constants (so functions can reference them)
        for (const node of (program as any).body) {
            if (node.type === 'VariableDeclaration' && node.kind === 'const') {
                for (const decl of node.declarations) {
                    if (decl.init?.type === 'Literal' && typeof decl.init.value === 'number') {
                        this.constants.set(decl.id.name, decl.init.value & 0xFF)
                    }
                }
            }
        }

        // First pass: functions
        for (const node of (program as any).body) {
            if (node.type === 'FunctionDeclaration') {
                this.visitFunctionDeclaration(node)
            }
        }

        // Second pass: main code
        this.emitLabel('_main')
        this.emit('call', ['init_device_console'], 'init console I/O')
        for (const node of (program as any).body) {
            if (node.type !== 'FunctionDeclaration') {
                this.visitNode(node)
            }
        }

        this.emit('ret', [])
        this.peepholeOptimize()
        return this.ast
    }

    // ============================================================
    // Visitor
    // ============================================================

    private visitNode(node: any): void {
        switch (node.type) {
            case 'VariableDeclaration':     this.visitVarDeclaration(node); break
            case 'ExpressionStatement':     this.visitExpression(node.expression); break
            case 'ReturnStatement':         this.visitReturn(node); break
            case 'IfStatement':             this.visitIf(node); break
            case 'WhileStatement':          this.visitWhile(node); break
            case 'DoWhileStatement':        this.visitDoWhile(node); break
            case 'ForStatement':            this.visitFor(node); break
            case 'SwitchStatement':         this.visitSwitch(node); break
            case 'BlockStatement':
                for (const child of node.body) this.visitNode(child)
                break
            case 'BreakStatement':          break
            default:
                this.emitComment(`unhandled: ${node.type}`)
        }
    }

    // ============================================================
    // Variable Declaration
    // ============================================================

    private visitVarDeclaration(node: any): void {
        for (const decl of node.declarations) {
            const name: string = decl.id.name

            // const x = 42 → equ
            if (node.kind === 'const' && decl.init?.type === 'Literal'
                && typeof decl.init.value === 'number') {
                const val = decl.init.value & 0xFF
                this.constants.set(name, val)
                this.ast.data.push({ name, type: 'equ', values: [val], comment: `const` })
                return
            }

            // let arr = [1, 2, 3]
            if (decl.init?.type === 'ArrayExpression') {
                const elements: number[] = decl.init.elements.map((el: any) =>
                    (el?.type === 'Literal' && typeof el.value === 'number') ? el.value & 0xFF : 0
                )
                this.ast.data.push({ name, type: 'db', values: elements, comment: `array[${elements.length}]` })
                this.arrays.set(name, { label: name, size: elements.length })
                return
            }

            // const/let str = "hello"
            if (decl.init?.type === 'Literal' && typeof decl.init.value === 'string') {
                this.ast.data.push({ name, type: 'db', values: [decl.init.value, 0], comment: `string` })
                this.strings.set(name, name)
                return
            }

            // Normal var
            this.ast.data.push({ name, type: 'db', values: [0], comment: `var ${name}` })
            this.vars.add(name)
            if (decl.init) {
                this.visitExpression(decl.init)
                this.emitStoreVar(name)
            }
        }
    }

    // ============================================================
    // Expressions (result → AL)
    // ============================================================

    private visitExpression(node: any): void {
        switch (node.type) {
            case 'Literal':
                if (typeof node.value === 'number') {
                    this.emit('mov', ['al', node.value & 0xFF])
                } else if (typeof node.value === 'string') {
                    const label = this.internString(node.value)
                    this.emit('lea', ['cl', 'dl', `[${label}]`], `"${node.value.slice(0, 20)}"`)
                }
                break
            case 'Identifier':              this.emitLoadVar(node.name); break
            case 'BinaryExpression':        this.visitBinaryExpr(node); break
            case 'UnaryExpression':         this.visitUnaryExpr(node); break
            case 'UpdateExpression':        this.visitUpdate(node); break
            case 'AssignmentExpression':    this.visitAssignment(node); break
            case 'CallExpression':          this.visitCall(node); break
            case 'LogicalExpression':       this.visitLogicalExpr(node); break
            case 'ConditionalExpression':   this.visitTernary(node); break
            case 'MemberExpression':        this.visitMemberRead(node); break
            default:
                this.emitComment(`unhandled expr: ${node.type}`)
        }
    }

    // ============================================================
    // Binary
    // ============================================================

    private visitBinaryExpr(node: any): void {
        const op: string = node.operator

        if (['==', '===', '!=', '!==', '<', '>', '<=', '>='].includes(op)) {
            return this.visitComparison(node)
        }

        // Constant folding
        if (node.left.type === 'Literal' && node.right.type === 'Literal'
            && typeof node.left.value === 'number' && typeof node.right.value === 'number') {
            this.emit('mov', ['al', this.evalConst(op, node.left.value, node.right.value)],
                `const: ${node.left.value} ${op} ${node.right.value}`)
            return
        }

        // MUL/DIV/MOD
        if (['*', '/', '%'].includes(op)) {
            this.visitExpression(node.left)
            this.emit('push', ['al'])
            this.visitExpression(node.right)
            this.emit('mov', ['bl', 'al'])
            this.emit('pop', ['al'])
            this.emit('call', [op === '*' ? 'mul8' : op === '/' ? 'div8' : 'mod8'], `al = al ${op} bl`)
            return
        }

        // Right is immediate
        if (node.right.type === 'Literal' && typeof node.right.value === 'number') {
            this.visitExpression(node.left)
            this.emitAluOp(op, 'al', node.right.value & 0xFF)
            return
        }

        // Commutative with left immediate
        if (node.left.type === 'Literal' && typeof node.left.value === 'number'
            && ['+', '&', '|', '^'].includes(op)) {
            this.visitExpression(node.right)
            this.emitAluOp(op, 'al', node.left.value & 0xFF)
            return
        }

        // General
        this.visitExpression(node.left)
        this.emit('push', ['al'])
        this.visitExpression(node.right)
        this.emit('mov', ['bl', 'al'])
        this.emit('pop', ['al'])
        this.emitAluOp(op, 'al', 'bl')
    }

    private emitAluOp(op: string, target: string, source: string | number): void {
        const map: Record<string, string> = { '+': 'add', '-': 'sub', '&': 'and', '|': 'or', '^': 'xor', '<<': 'shl', '>>': 'shr' }
        if (map[op]) this.emit(map[op], [target, source])
        else this.emitComment(`unknown op: ${op}`)
    }

    // ============================================================
    // Comparison
    // ============================================================

    private visitComparison(node: any): void {
        const lblT = this.newLabel('cmp_t')
        const lblE = this.newLabel('cmp_e')

        if (node.right.type === 'Literal' && typeof node.right.value === 'number') {
            this.visitExpression(node.left)
            this.emit('cmp', ['al', node.right.value & 0xFF])
        } else {
            this.visitExpression(node.left)
            this.emit('push', ['al'])
            this.visitExpression(node.right)
            this.emit('mov', ['bl', 'al'])
            this.emit('pop', ['al'])
            this.emit('cmp', ['al', 'bl'])
        }

        const jmpMap: Record<string, string> = {
            '==': 'jz', '===': 'jz', '!=': 'jnz', '!==': 'jnz',
            '<': 'jl', '>': 'jg', '<=': 'jle', '>=': 'jge'
        }

        if (!node.operator) throw new Error('missing node.operator')
        if (!jmpMap[node.operator]) throw new Error('jmpMap[node.operator]')

        this.emit(jmpMap[node.operator] ?? '', [lblT])
        this.emit('mov', ['al', 0], 'false')
        this.emit('jmp', [lblE])
        this.emitLabel(lblT)
        this.emit('mov', ['al', 1], 'true')
        this.emitLabel(lblE)
    }

    // ============================================================
    // Logical, Unary, Ternary
    // ============================================================

    private visitLogicalExpr(node: any): void {
        const lblEnd = this.newLabel('logic_e')
        this.visitExpression(node.left)
        this.emit('cmp', ['al', 0])
        this.emit(node.operator === '&&' ? 'jz' : 'jnz', [lblEnd], `short-circuit ${node.operator}`)
        this.visitExpression(node.right)
        this.emitLabel(lblEnd)
    }

    private visitUnaryExpr(node: any): void {
        this.visitExpression(node.argument)
        switch (node.operator) {
            case '-':
                this.emit('mov', ['bl', 'al'])
                this.emit('mov', ['al', 0])
                this.emit('sub', ['al', 'bl'], 'negate')
                break
            case '!': {
                const lblT = this.newLabel('not_t')
                const lblE = this.newLabel('not_e')
                this.emit('cmp', ['al', 0])
                this.emit('jz', [lblT])
                this.emit('mov', ['al', 0])
                this.emit('jmp', [lblE])
                this.emitLabel(lblT)
                this.emit('mov', ['al', 1])
                this.emitLabel(lblE)
                break
            }
            case '~':
                this.emit('not', ['al'])
                break
        }
    }

    private visitTernary(node: any): void {
        const lblElse = this.newLabel('tern_e')
        const lblEnd = this.newLabel('tern_end')
        this.visitExpression(node.test)
        this.emit('cmp', ['al', 0])
        this.emit('jz', [lblElse])
        this.visitExpression(node.consequent)
        this.emit('jmp', [lblEnd])
        this.emitLabel(lblElse)
        this.visitExpression(node.alternate)
        this.emitLabel(lblEnd)
    }

    // ============================================================
    // Update, Assignment
    // ============================================================

    private visitUpdate(node: any): void {
        const name: string = node.argument.name
        const op = node.operator === '++' ? 'inc' : 'dec'
        if (node.prefix) {
            this.emitLoadVar(name)
            this.emit(op, ['al'])
            this.emitStoreVar(name)
        } else {
            this.emitLoadVar(name)
            this.emit('push', ['al'], 'save old value')
            this.emit(op, ['al'])
            this.emitStoreVar(name)
            this.emit('pop', ['al'], 'result = old value')
        }
    }

    private visitAssignment(node: any): void {
        // arr[i] = expr
        if (node.left.type === 'MemberExpression') {
            this.visitMemberWrite(node.left, node.right)
            return
        }

        const name: string = node.left.name
        if (node.operator === '=') {
            this.visitExpression(node.right)
            this.emitStoreVar(name)
            return
        }

        // Compound: +=, -=, etc.
        this.emitLoadVar(name)
        this.emit('push', ['al'])
        this.visitExpression(node.right)
        this.emit('mov', ['bl', 'al'])
        this.emit('pop', ['al'])
        const baseOp = node.operator.slice(0, -1)
        if (['*', '/', '%'].includes(baseOp)) {
            this.emit('call', [baseOp === '*' ? 'mul8' : baseOp === '/' ? 'div8' : 'mod8'])
        } else {
            this.emitAluOp(baseOp, 'al', 'bl')
        }
        this.emitStoreVar(name)
    }

    // ============================================================
    // Array: arr[i] read / write
    // ============================================================

    /** arr[i] → AL */
    private visitMemberRead(node: any): void {
        if (node.object.type !== 'Identifier' || !node.computed) {
            this.emitComment('unsupported member access')
            return
        }
        const arrInfo = this.arrays.get(node.object.name)
        if (!arrInfo) {
            this.emitComment(`not an array: ${node.object.name}`)
            return
        }

        this.visitExpression(node.property) // AL = index
        this.emit('push', ['cl'])
        this.emit('push', ['dl'])
        this.emit('mov', ['el', 'al'], 'E = index')
        this.emit('lea', ['cl', 'dl', `[${node.object.name}]`])
        this.emit('call', ['add_cd_e'], 'C:D = &arr[i]')
        this.emit('ldi', ['al', 'cl', 'dl'], `${node.object.name}[i]`)
        this.emit('pop', ['dl'])
        this.emit('pop', ['cl'])
    }

    /**
     * arr[i] = expr
     *
     * Strategy:
     *   1. eval index → push
     *   2. eval value → FL (via AL)
     *   3. pop index → EL
     *   4. save C:D, lea + add_cd_e
     *   5. sti cl, dl, fl
     *   6. restore C:D
     */
    private visitMemberWrite(member: any, value: any): void {
        if (member.object.type !== 'Identifier' || !member.computed) {
            this.emitComment('unsupported member write')
            return
        }
        const name = member.object.name
        if (!this.arrays.has(name)) {
            this.emitComment(`not an array: ${name}`)
            return
        }

        this.emitComment(`${name}[i] = expr`)

        // 1. Eval index → push
        this.visitExpression(member.property)
        this.emit('push', ['al'], 'save index')

        // 2. Eval value → FL
        this.visitExpression(value)
        this.emit('mov', ['fl', 'al'], 'FL = value')

        // 3. Pop index → EL
        this.emit('pop', ['el'], 'EL = index')

        // 4. Compute address in C:D
        this.emit('push', ['cl'])
        this.emit('push', ['dl'])
        this.emit('lea', ['cl', 'dl', `[${name}]`])
        this.emit('call', ['add_cd_e'], 'C:D = &arr[i]')

        // 5. Store
        this.emit('sti', ['cl', 'dl', 'fl'], `${name}[i] = FL`)

        // 6. Restore C:D
        this.emit('pop', ['dl'])
        this.emit('pop', ['cl'])
    }

    // ============================================================
    // Function Call + console.log
    // ============================================================

    private visitCall(node: any): void {
        // console.log(...)
        if (node.callee.type === 'MemberExpression'
            && node.callee.object?.name === 'console'
            && node.callee.property?.name === 'log') {
            return this.visitConsoleLog(node.arguments)
        }

        const args: any[] = node.arguments
        for (let i = 0; i < args.length; i++) {
            this.visitExpression(args[i])
            this.emit('push', ['al'], `arg${i}`)
        }

        if (node.callee.type === 'Identifier') {
            const funcInfo = this.functions.get(node.callee.name)
            if (funcInfo) this.emit('call', [funcInfo.label], `${node.callee.name}()`)
            else this.emitComment(`unknown function: ${node.callee.name}`)
        }

        for (let i = 0; i < args.length; i++) {
            this.emit('pop', ['bl'], i === 0 ? `clean ${args.length} args` : undefined)
        }
    }

    // ============================================================
    // console.log(...) → console I/O
    // ============================================================

    private visitConsoleLog(args: any[]): void {
        this.emitComment('console.log')
        this.emit('push', ['cl'])
        this.emit('push', ['dl'])

        for (const arg of args) {
            if (arg.type === 'Literal' && typeof arg.value === 'string') {
                // String literal
                const label = this.internString(arg.value)
                this.emit('lea', ['cl', 'dl', `[${label}]`])
                this.emit('call', ['console_print_string'])

            } else if (arg.type === 'Identifier' && this.strings.has(arg.name)) {
                // String variable
                this.emit('lea', ['cl', 'dl', `[${arg.name}]`])
                this.emit('call', ['console_print_string'])

            } else {
                // Numeric → int_to_str → print
                this.visitExpression(arg)
                this.ensureLogBuf()
                this.emit('lea', ['cl', 'dl', '[_log_buf]'])
                this.emit('call', ['int_to_str'], 'AL → string')
                this.emit('lea', ['cl', 'dl', '[_log_buf]'])
                this.emit('call', ['console_print_string'])
            }
        }

        // Newline (CR = 13)
        this.emit('mov', ['al', 13])
        this.emit('call', ['console_print_char'], 'newline')

        this.emit('pop', ['dl'])
        this.emit('pop', ['cl'])
    }

    private ensureLogBuf(): void {
        if (!this.vars.has('_log_buf')) {
            this.ast.data.push({ name: '_log_buf', type: 'db', values: [0, 0, 0, 0], comment: 'int_to_str buffer' })
            this.vars.add('_log_buf')
        }
    }

    private internString(value: string): string {
        for (const d of this.ast.data) {
            if (d.comment === 'string' && d.values[0] === value) return d.name
        }
        const label = `_str_${this.stringCounter++}`
        this.ast.data.push({ name: label, type: 'db', values: [value, 0], comment: 'string' })
        this.strings.set(label, label)
        return label
    }

    // ============================================================
    // Return
    // ============================================================

    private visitReturn(node: any): void {
        if (node.argument) this.visitExpression(node.argument)
        this.emit('ret', [])
    }

    // ============================================================
    // Control Flow
    // ============================================================

    private visitIf(node: any): void {
        const lblElse = this.newLabel('else')
        const lblEnd = this.newLabel('endif')
        this.visitExpression(node.test)
        this.emit('cmp', ['al', 0])
        this.emit('jz', [node.alternate ? lblElse : lblEnd])
        this.visitNode(node.consequent)
        if (node.alternate) {
            const last = this.ast.instructions[this.ast.instructions.length - 1]
            if (last?.mnemonic !== 'ret') this.emit('jmp', [lblEnd])
            this.emitLabel(lblElse)
            this.visitNode(node.alternate)
        }
        this.emitLabel(lblEnd)
    }

    private visitWhile(node: any): void {
        const lblStart = this.newLabel('while')
        const lblEnd = this.newLabel('endw')
        this.emitLabel(lblStart)
        this.visitExpression(node.test)
        this.emit('cmp', ['al', 0])
        this.emit('jz', [lblEnd])
        this.visitNode(node.body)
        this.emit('jmp', [lblStart])
        this.emitLabel(lblEnd)
    }

    private visitDoWhile(node: any): void {
        const lblStart = this.newLabel('do')
        this.emitLabel(lblStart)
        this.visitNode(node.body)
        this.visitExpression(node.test)
        this.emit('cmp', ['al', 0])
        this.emit('jnz', [lblStart])
    }

    private visitFor(node: any): void {
        if (node.init) {
            if (node.init.type === 'VariableDeclaration') this.visitVarDeclaration(node.init)
            else this.visitExpression(node.init)
        }
        const lblStart = this.newLabel('for')
        const lblEnd = this.newLabel('endf')
        this.emitLabel(lblStart)
        if (node.test) {
            this.visitExpression(node.test)
            this.emit('cmp', ['al', 0])
            this.emit('jz', [lblEnd])
        }
        this.visitNode(node.body)
        if (node.update) this.visitExpression(node.update)
        this.emit('jmp', [lblStart])
        this.emitLabel(lblEnd)
    }

    // ============================================================
    // Switch
    // ============================================================

    private visitSwitch(node: any): void {
        const lblEnd = this.newLabel('endsw')

        // Eval discriminant, keep in memory
        this.visitExpression(node.discriminant)
        this.emit('push', ['al'], 'switch value')

        for (const caseNode of node.cases) {
            if (caseNode.test) {
                // case X: peek switch value, compare
                this.emit('pop', ['al'])
                this.emit('push', ['al'])

                if (caseNode.test.type === 'Literal' && typeof caseNode.test.value === 'number') {
                    this.emit('cmp', ['al', caseNode.test.value & 0xFF])
                } else {
                    this.emit('push', ['al'])
                    this.visitExpression(caseNode.test)
                    this.emit('mov', ['bl', 'al'])
                    this.emit('pop', ['al'])
                    this.emit('cmp', ['al', 'bl'])
                }

                const lblNext = this.newLabel('case')
                this.emit('jnz', [lblNext])

                for (const stmt of caseNode.consequent) {
                    if (stmt.type === 'BreakStatement') {
                        this.emit('pop', ['bl'], 'clean switch value')
                        this.emit('jmp', [lblEnd])
                    } else {
                        this.visitNode(stmt)
                    }
                }
                this.emitLabel(lblNext)
            } else {
                // default:
                for (const stmt of caseNode.consequent) {
                    if (stmt.type === 'BreakStatement') {
                        this.emit('pop', ['bl'], 'clean switch value')
                        this.emit('jmp', [lblEnd])
                    } else {
                        this.visitNode(stmt)
                    }
                }
            }
        }

        this.emit('pop', ['bl'], 'clean switch value (fallthrough)')
        this.emitLabel(lblEnd)
    }

    // ============================================================
    // Function Declaration
    // ============================================================

    private visitFunctionDeclaration(node: any): void {
        const name: string = node.id.name
        const params: any[] = node.params
        const label = `_fn_${name}`

        this.functions.set(name, { label, paramCount: params.length })

        const prevInside = this.insideFunction
        const prevParams = new Map(this.paramMap)
        this.insideFunction = true
        this.paramMap.clear()

        // arg0 pushed first (deepest), argN-1 pushed last (shallowest)
        // SP+1 = ret_low, SP+2 = ret_high
        // SP+3 = argN-1, SP+4 = argN-2, ..., SP+2+N = arg0
        for (let i = 0; i < params.length; i++) {
            this.paramMap.set(params[i].name, 2 + params.length - i)
        }

        this.emitLabel(label)
        if (node.body.type === 'BlockStatement') {
            for (const stmt of node.body.body) this.visitNode(stmt)
        }

        const last = this.ast.instructions[this.ast.instructions.length - 1]
        if (!last || last.mnemonic !== 'ret') this.emit('ret', [])

        this.insideFunction = prevInside
        this.paramMap = prevParams
    }

    // ============================================================
    // Memory access
    // ============================================================

    private emitLoadVar(name: string): void {
        // Compile-time constant
        if (this.constants.has(name)) {
            this.emit('mov', ['al', this.constants.get(name)!], name)
            return
        }

        // Function param → SP-relative read
        if (this.insideFunction && this.paramMap.has(name)) {
            const offset = this.paramMap.get(name)!
            const adjusted = offset + 3  // +3 for saved cl, dl, el
            this.emitComment(`load param ${name} [SP+${offset}]`)
            this.emit('push', ['cl'])
            this.emit('push', ['dl'])
            this.emit('push', ['el'])
            this.emit('mov', ['cl', 'dl', 'esp'], 'C:D = SP')
            this.emit('mov', ['el', adjusted])
            this.emit('call', ['add_cd_e'], `C:D += ${adjusted}`)
            this.emit('ldi', ['al', 'cl', 'dl'])
            this.emit('mov', ['bl', 'al'])
            this.emit('pop', ['el'])
            this.emit('pop', ['dl'])
            this.emit('pop', ['cl'])
            this.emit('mov', ['al', 'bl'])
            return
        }

        // Global variable
        if (this.vars.has(name)) {
            this.emit('mov', ['al', `[${name}]`], name)
            return
        }

        // String variable → LEA into C:D
        if (this.strings.has(name)) {
            this.emit('lea', ['cl', 'dl', `[${name}]`], `&${name}`)
            return
        }

        this.emitComment(`undefined: ${name}`)
    }

    private emitStoreVar(name: string): void {
        if (this.constants.has(name)) {
            this.emitComment(`cannot store to const ${name}`)
            return
        }
        this.emit('mov', [`[${name}]`, 'al'], name)
    }

    // ============================================================
    // Peephole Optimizer
    // ============================================================

    private peepholeOptimize(): void {
        let changed = true
        while (changed) {
            changed = false
            const ins = this.ast.instructions
            for (let i = 0; i < ins.length - 1; i++) {
                const a = ins[i], b = ins[i + 1]

                if (!a) throw new Error('missing a')
                if (!b) throw new Error('missing b')

                // mov bl, al → mov al, bl  ⇒  remove both (identity)
                if (a.mnemonic === 'mov' && b.mnemonic === 'mov'
                    && a.operands[0] === 'bl' && a.operands[1] === 'al'
                    && b.operands[0] === 'al' && b.operands[1] === 'bl'
                    && !b.label) {
                    ins.splice(i, 2); changed = true; break
                }

                // push X → pop X  ⇒  remove both
                if (a.mnemonic === 'push' && b.mnemonic === 'pop'
                    && a.operands[0] === b.operands[0] && !b.label) {
                    ins.splice(i, 2); changed = true; break
                }

                // mov al, X → mov al, Y  ⇒  remove first (dead store)
                if (a.mnemonic === 'mov' && b.mnemonic === 'mov'
                    && a.operands[0] === 'al' && b.operands[0] === 'al'
                    && !b.label && !a.label) {
                    ins.splice(i, 1); changed = true; break
                }

                // add al, 1 → inc al
                if (a.mnemonic === 'add' && a.operands[0] === 'al' && a.operands[1] === 1) {
                    a.mnemonic = 'inc'; a.operands = ['al']; changed = true; break
                }

                // sub al, 1 → dec al
                if (a.mnemonic === 'sub' && a.operands[0] === 'al' && a.operands[1] === 1) {
                    a.mnemonic = 'dec'; a.operands = ['al']; changed = true; break
                }

                // add/sub al, 0 → remove
                if ((a.mnemonic === 'add' || a.mnemonic === 'sub')
                    && a.operands[0] === 'al' && a.operands[1] === 0 && !a.label) {
                    ins.splice(i, 1); changed = true; break
                }
            }
        }
    }

    // ============================================================
    // Emit helpers
    // ============================================================

    private emit(mnemonic: string, operands: (string | number)[], comment?: string): void {
        this.ast.instructions.push({ mnemonic, operands, comment })
    }

    private emitLabel(label: string): void {
        this.ast.instructions.push({ mnemonic: '', operands: [], label })
    }

    private emitComment(text: string): void {
        this.ast.instructions.push({ mnemonic: ';', operands: [], comment: text })
    }

    private newLabel(prefix: string): string {
        return `.${prefix}_${this.labelCounter++}`
    }

    private evalConst(op: string, left: any, right: any): number {
        const l = Number(left) & 0xFF, r = Number(right) & 0xFF
        switch (op) {
            case '+': return (l + r) & 0xFF
            case '-': return (l - r) & 0xFF
            case '*': return (l * r) & 0xFF
            case '/': return r ? Math.floor(l / r) : 0
            case '%': return r ? l % r : 0
            case '&': return l & r
            case '|': return l | r
            case '^': return l ^ r
            default: return 0
        }
    }
}


// ============================================================
// ASM Text Output
// ============================================================

function convertToAsmText(asm: AsmAst): string {
    const lines: string[] = []

    lines.push('; Generated by js-to-asm compiler')

    if (asm.includes.length > 0) {
        lines.push('')
        for (const inc of asm.includes) lines.push(`.include "${inc}"`)
    }

    if (asm.data.length > 0) {
        lines.push('')
        lines.push('')
        lines.push('section .data')
        for (const d of asm.data) {
            const comment = d.comment ? `  ; ${d.comment}` : ''
            if (d.type === 'equ') {
                const fmtVal = typeof d.values[0] === 'number' ? formatHex8(d.values[0]) : d.values[0]
                lines.push(`    ${d.name.padEnd(16)} equ ${fmtVal}${comment}`)
            } else if (d.type === 'resb') {
                lines.push(`    ${d.name.padEnd(16)} resb ${d.values[0]}${comment}`)
            } else {
                const vals = d.values.map(v =>
                    typeof v === 'string' ? `"${v}"` : formatHex8(v as number)
                ).join(', ')
                lines.push(`    ${d.name.padEnd(16)} ${d.type} ${vals}${comment}`)
            }
        }
    }

    lines.push('')
    lines.push('')
    lines.push('section .text')

    for (const instr of asm.instructions) {
        if (instr.label) {
            lines.push(instr.label.startsWith('.') ? `  ${instr.label}:` : `\n${instr.label}:`)
        }
        if (instr.mnemonic === ';') {
            lines.push(`    ; ${instr.comment || ''}`)
            continue
        }
        if (instr.mnemonic) {
            const ops = instr.operands.map(o =>
                typeof o === 'number' ? (o >= 0 && o <= 9 ? o.toString() : formatHex8(o)) : o
            ).join(', ')
            const comment = instr.comment ? `  ; ${instr.comment}` : ''
            lines.push(`    ${ops ? instr.mnemonic.padEnd(5) + ops : instr.mnemonic}${comment}`)
        }
    }

    return lines.join('\n')
}

function formatHex8(n: number): string {
    return `0x${(n & 0xFF).toString(16).toUpperCase().padStart(2, '0')}`
}


// ============================================================
// Test
// ============================================================

const testCode = `
let x = 10
let y = 20
let result = 0

const MAX = 100

let arr = [5, 10, 15, 20, 25]
const greeting = "Hello World!"

function add(a, b) {
    return a + b
}

function max(a, b) {
    if (a > b) {
        return a
    } else {
        return b
    }
}

function clamp(val) {
    return val > MAX ? MAX : val
}

result = add(x, y)

console.log("[01] result = ", result)

let i = 0
while (i < 5) {
    result = result + arr[i]
    i++
}

console.log("[02] after loop: ", result)

if (result > 30) {
    result = max(result, MAX)
}

switch (x) {
    case 10:
        result = 1
        break
    case 20:
        result = 2
        break
    default:
        result = 0
        break
}

for (let j = 0; j < 3; j++) {
    arr[j] = j * 10
}

do {
    result = result - 1
} while (result > 0)

console.log(greeting)
console.log("[04] final: ", result)
`

const compiler = new JsToAsmCompiler()
const program = compiler.parse(testCode)
const asmAst = compiler.compile(program)
const asmText = convertToAsmText(asmAst)
console.log(asmText)
