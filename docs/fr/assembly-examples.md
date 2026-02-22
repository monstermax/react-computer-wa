# Exemples Assembleur

## Chargement immédiat

```asm
MOV A, 0x2A
```

## Arithmétique registre

```asm
ADD A, 0x01
SUB A, 0x01
```

## Comparaison et saut conditionnel

```asm
CMP A, 0x00
JZ done

; ...

done:
```

## Appel de sous-routine

```asm
CALL routine
HALT

routine:
  RET
```

## Utilisation de la pile

```asm
PUSH A
POP B
```

## Écriture en I/O mémoire mappée

```asm
MOV [0xF000], A
```

La plage `0xF000-0xFFFF` est mappée vers les périphériques I/O.
