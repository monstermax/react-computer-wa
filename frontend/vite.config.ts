
import path from 'path'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

import { asmDirectoryPlugin } from './src/lib/vite_asm_index'


export default defineConfig({
    plugins: [
        react(),
        tailwindcss(),
        asmDirectoryPlugin(),
    ],
    server: {
        port: 3950,
        strictPort: true,
        host: true,
        allowedHosts: [
            "localhost",
            "127.0.0.1",
        ],
    },
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'src'),
        },
    }
})
