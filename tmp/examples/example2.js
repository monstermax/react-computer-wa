
// Pour gérer :
function add(a, b) {
    return a + b
}

// Générer :
// add:
//     push ebp
//     mov ebp, esp
//     mov eax, [ebp+8]   ; a
//     add eax, [ebp+12]  ; b
//     pop ebp
//     ret
