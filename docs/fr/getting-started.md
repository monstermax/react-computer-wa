# Getting Started

## Prérequis

Le `README.md` du projet indique :

```bash
npm install
npm run dev
```

Et pour construire le module WASM depuis `web_assembly/` :

```bash
npm run asbuild
```

## Structure minimale

D’après l’arborescence actuelle :

- `frontend/` : app web (React / Vite / TypeScript)
- `web_assembly/` : CPU et runtime bas niveau en AssemblyScript

## Démarrage (résumé)

1. Installer les dépendances
2. Lancer l’app frontend
3. Rebuild le module WASM quand le code AssemblyScript change
