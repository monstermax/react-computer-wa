
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
