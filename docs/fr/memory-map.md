# Carte mémoire

## Plages d'adresses

- ROM : `0x0000 - 0x04FF`
- RAM : `0x0500 - 0xEFFF`
- I/O : `0xF000 - 0xFFFF`

## Table des périphériques en RAM

Emplacement :

- compteur : `0x0500`
- début des entrées : `0x0501`
- taille d'une entrée : `6` octets
- maximum : `20` entrées

Format d'une entrée :

1. index périphérique
2. type
3. base I/O low
4. base I/O high
5. pointeur nom low
6. pointeur nom high

## Zone des noms

- début : `0x0580`
- fin : `0x05FF`
- format : chaînes null-terminated

## Constantes OS / pile

- `OS_START = 0x1000`
- `STACK_START = 0xEE00`
- `STACK_END = 0xEFFF`
