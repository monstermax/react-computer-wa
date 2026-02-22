# Assembly Examples

Exemples minimaux basés sur les instructions observées dans le code CPU.

> Remarque: la syntaxe exacte de l’assembleur (format source) est définie côté compiler frontend. Ces exemples décrivent surtout l’intention des instructions.

## 1) Charger une valeur immédiate dans un registre

```asm
; idée: A = 0x2A
MOV A, 0x2A
```

Correspond à la famille `MOV_REG_IMM`.

## 2) Addition registre + immédiat

```asm
; idée: A = A + 1
ADD A, 0x01
```

Correspond à `ADD_REG_IMM`.

## 3) Comparer puis saut conditionnel

```asm
; idée: compare A à 0 puis saute si égal
CMP A, 0x00
JZ target
```

Correspond à `CMP_REG_IMM` puis `JZ`.

## 4) Appel de sous-routine

```asm
CALL subroutine
; ...
subroutine:
  ; travail
  RET
```

`CALL` pousse l’adresse de retour sur la pile, `RET` la récupère.

## 5) I/O mémoire mappée

```asm
; idée: écrire une valeur vers une adresse I/O
MOV [0xF000], A
```

Les adresses `0xF000-0xFFFF` sont routées vers le gestionnaire I/O.
