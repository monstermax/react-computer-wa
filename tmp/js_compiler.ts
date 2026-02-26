
import { Node, parse, Program, VariableDeclaration } from 'acorn'
import { simple as walkSimple } from 'acorn-walk'


// 1. Définir la structure de ton AST assembleur
interface AsmAst {
    instructions: AsmInstruction[]
    labels: Map<string, number>
    data: DataDefinition[]
}


interface DataDefinition {
    name: string
    type: 'db' | 'dw' | 'dd' | 'dq'
    values: any[]  // Peut contenir plusieurs valeurs
    comment?: string
}

interface AsmInstruction {
    mnemonic: string
    operands: (string | number)[]
    comment?: string
    label?: string  // Optionnel : label devant l'instruction
}


// Types étendus pour acorn
interface ExtendedLiteral extends Node {
    type: 'Literal'
    value: string | number | boolean | null
}

interface ExtendedIdentifier extends Node {
    type: 'Identifier'
    name: string
}


// Transformer JS → Assembleur
class JsToAsmCompiler {
    private asmAst: AsmAst = {
        instructions: [],
        labels: new Map(),
        data: []
    }

    private labelCounter = 0
    private varMap = new Map<string, string>() // nom JS → label mémoire

    compile(sourceCode: string): AsmAst {
        const ast = parse(sourceCode, {
            ecmaVersion: 2020,
            sourceType: 'module'
        }) as Program

        this.traverse(ast)
        return this.asmAst
    }

    private traverse(node: Node) {
        walkSimple(node, {
            VariableDeclaration: (node: VariableDeclaration) => {
                for (const decl of node.declarations) {
                    const id = decl.id as ExtendedIdentifier

                    if (id.type === 'Identifier') {
                        const varName = id.name

                        let value = 0
                        if (decl.init && decl.init.type === 'Literal') {
                            value = (decl.init as ExtendedLiteral).value as number
                        }

                        this.asmAst.data.push({
                            name: varName,
                            type: 'db',
                            values: [value],
                        })
                    }
                }
            },

            AssignmentExpression: (node: any) => {
                // Exemple: x = 10
                const varName = node.left.name
                const value = node.right.value

                this.asmAst.instructions.push(
                    { mnemonic: 'mov', operands: ['eax', value] },
                    { mnemonic: 'mov', operands: [`[${varName}]`, 'eax'] }
                )
            },

            BinaryExpression: (node: any) => {
                // Exemple: a + b
                // À gérer dans un contexte plus large (return, assignation...)
                console.log('Binary op:', node.operator, node.left.type, node.right.type)
            },

            ReturnStatement: (node: any) => {
                // Exemple: return a + b
                if (node.argument?.type === 'BinaryExpression') {
                    this.genBinaryExpr(node.argument)
                    this.asmAst.instructions.push(
                        { mnemonic: 'ret', operands: [] }
                    )

                } else if (node.argument?.type === 'Identifier') {
                    // return variable
                    this.asmAst.instructions.push(
                        { mnemonic: 'mov', operands: ['eax', `[${node.argument.name}]`] },
                        { mnemonic: 'ret', operands: [] }
                    )

                } else if (node.argument?.type === 'Literal') {
                    // return constante
                    this.asmAst.instructions.push(
                        { mnemonic: 'mov', operands: ['eax', node.argument.value] },
                        { mnemonic: 'ret', operands: [] }
                    )
                }
            }
        })
    }

    private genBinaryExpr(expr: any) {
        // Gestion basique des opérations
        const leftName = expr.left.name
        const rightName = expr.right.name
        const leftValue = expr.left.value
        const rightValue = expr.right.value

        const left = leftName
        const right = rightName ?? rightValue

        if (expr.left?.type === 'Identifier' &&
            expr.right?.type === 'Literal') {

            this.asmAst.instructions.push(
                { mnemonic: 'mov', operands: ['eax', `[${leftName}]`] },
                { mnemonic: this.getAsmOp(expr.operator), operands: ['eax', rightValue] }
            )

        } else if (expr.left?.type === 'Literal' &&
            expr.right?.type === 'Identifier') {
            // Cas 5 + x
            this.asmAst.instructions.push(
                { mnemonic: 'mov', operands: ['eax', leftValue] },
                { mnemonic: this.getAsmOp(expr.operator), operands: ['eax', `[${rightName}]`] }
            )

        } else if (expr.left?.type === 'Literal' &&
            expr.right?.type === 'Literal') {
            // Cas 5 + 3
            const result = this.evalBinary(expr.operator, leftValue, rightValue)

            this.asmAst.instructions.push(
                { mnemonic: 'mov', operands: ['eax', result] }
            )

        } else {
            this.asmAst.instructions.push(
                { mnemonic: 'mov', operands: ['eax', `[${left}]`] },
                { mnemonic: 'add', operands: ['eax', right] },
                // Résultat dans eax (convention d'appel)
            )
        }
    }

    private getAsmOp(jsOp: string): string {
        switch (jsOp) {
            case '+': return 'add'
            case '-': return 'sub'
            case '*': return 'mul'
            case '/': return 'div'
            default: return 'add'
        }
    }

    private evalBinary(op: string, left: any, right: any): number {
        const l = Number(left)
        const r = Number(right)

        switch (op) {
            case '+': return l + r
            case '-': return l - r
            case '*': return l * r
            case '/': return Math.floor(l / r) // Division entière
            default: return 0
        }
    }

    private newLabel(): string {
        return `L${this.labelCounter++}`
    }

}


function convertToAsmText(asmAst: AsmAst): string {
    const lines: string[] = []

    // 1. Générer la section .data
    if (asmAst.data.length > 0) {
        lines.push('; ===== DATA SECTION =====')
        lines.push('section .data')
        lines.push('')

        for (const data of asmAst.data) {
            const values = data.values.map(v => {
                if (typeof v === 'string') return `"${v}"`
                if (typeof v === 'number') return formatNumber(v)
                return v
            }).join(', ')

            const comment = data.comment ? ` ; ${data.comment}` : ''
            lines.push(`${data.name} ${data.type} ${values}${comment}`)
        }
        lines.push('')
    }

    // 2. Générer la section .text
    lines.push('; ===== CODE SECTION =====')
    lines.push('section .text')
    lines.push('')
    lines.push('global _start')
    lines.push('')

    for (const instr of asmAst.instructions) {
        // Ajouter un label si présent
        if (instr.label) {
            lines.push(`${instr.label}:`)
        }

        // Formater les opérandes
        const operands = instr.operands.map(op => {
            if (typeof op === 'number') return formatNumber(op)
            if (op.startsWith('[')) return op // déjà formaté comme mémoire
            return op
        }).join(', ')

        // Ajouter un commentaire si présent
        const comment = instr.comment ? ` ; ${instr.comment}` : ''

        lines.push(`    ${instr.mnemonic} ${operands}${comment}`)
    }

    return lines.join('\n')
}


function formatNumber(num: number): string {
    if (num < 10) return num.toString()
    if (num < 256) return `0x${num.toString(16).toUpperCase()}`
    return `0x${num.toString(16).toUpperCase()}`
}




// Utilisation

if (false) {
    // Compile JS to AST
    const compiler = new JsToAsmCompiler()

    const asmAst = compiler.compile(`
        let x = 43
        let y = x + 10
        y++
    `);

    console.log('asmAst:', asmAst.data)

    // Compile AST to Assembly Code
    const asmSource = convertToAsmText(asmAst)
    console.log('asmSource:', asmSource)

    // Compile to Machine Code
    //const compiled = yourCompiler.compile(asmSource)
}



if (true) {
    // Precompiled AST tokens
    const asmAst: AsmAst = {
        data: [
            { name: 'x', type: 'db', values: [42], comment: 'La réponse' },
            { name: 'message', type: 'db', values: ['Hello', 0], comment: 'String terminée par null' }
        ],
        instructions: [
            { label: '_start', mnemonic: 'mov', operands: ['eax', 42], comment: 'Charger 42' },
            { mnemonic: 'mov', operands: ['[x]', 'eax'] },
            { mnemonic: 'mov', operands: ['eax', 1], comment: 'syscall exit' },
            { mnemonic: 'int', operands: ['0x80'] }
        ],
        labels: new Map([['_start', 0]])
    }

    // Compile AST to Assembly Code
    const asmText = convertToAsmText(asmAst)
    console.log(asmText)
}

