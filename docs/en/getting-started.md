# Getting Started

## Prerequisites

According to the project `README.md`:

```bash
npm install
npm run dev
```

To build the WASM module from `web_assembly/`:

```bash
npm run asbuild
```

## Minimal structure

From the current repository layout:

- `frontend/`: web application (React / Vite / TypeScript)
- `web_assembly/`: low-level CPU/runtime code in AssemblyScript

## Startup flow (summary)

1. Install dependencies
2. Start the frontend app
3. Rebuild the WASM module when AssemblyScript code changes
