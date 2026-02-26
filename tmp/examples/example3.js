
// Gestion automatique des variables locales
function test() {
    let a = 1
    let b = 2
    return a + b
}

// → Allocation sur la pile
//   sub esp, 8  ; 2 variables × 4 bytes
//   mov [ebp-4], 1
//   mov [ebp-8], 2

