
import { useEffect, useState } from 'react';

import { toHex } from '@/lib/lib_numbers';

import type { DiskDevice } from '../devices/disk';


interface MemoryExplorerProps {
    bytesPerLine?: number;
    linesPerPage?: number;
    open?: boolean;
    memory: Uint8Array<ArrayBuffer> | null;
    disks: (DiskDevice | null)[];
    offset?: number;
    dumpDisk: (diskDevice: DiskDevice | null) => void;
    dumpRam: () => void;
    dumpMemory: () => void;
}


export const MemoryExplorer = (props: MemoryExplorerProps) => {
    const { bytesPerLine = 16, linesPerPage = 16, open = false, memory, disks, offset = 0 } = props;
    const { dumpDisk, dumpRam, dumpMemory } = props;

    const [data, setData] = useState<Uint8Array>(new Uint8Array());
    const [page, setPage] = useState(0);
    const [searchValue, setSearchValue] = useState('');
    const [showQuickJump, setShowQuickJump] = useState(true);
    const [selectedSource, setSelectedSource] = useState<'ram' | 'disk' | 'wasm'>('ram');


    useEffect(() => {
        if (!memory) return;
        setData(memory);
    }, [memory]);


    const bytesPerPage = bytesPerLine * linesPerPage;
    const totalPages = Math.ceil(data.length / bytesPerPage);
    const startOffset = offset + page * bytesPerPage;

    const bytesToHex = (bytes: Uint8Array, start: number, len: number) => {
        const values: string[] = [];
        for (let i = 0; i < len; i++) {
            if (start + i < bytes.length) {
                values.push(bytes[start + i].toString(16).padStart(2, '0'));
            }
        }

        return (
            <div className="flex font-mono">
                {values.map((v, idx) => (
                    <span
                        key={idx}
                        className={`w-5 sm:w-6 text-[10px] sm:text-[11px] text-center ${idx === len / 2 ? 'ml-2 sm:ml-3' : ''} ${idx % 2 === 0 ? 'text-emerald-300' : 'text-emerald-400'
                            }`}
                    >
                        {v}
                    </span>
                ))}
            </div>
        );
    };

    const bytesToAscii = (bytes: Uint8Array, start: number, len: number) => {
        const values: string[] = [];
        for (let i = 0; i < len; i++) {
            if (start + i < bytes.length) {
                const b = bytes[start + i];
                values.push(b >= 32 && b <= 126 ? String.fromCharCode(b) : '.');
            }
        }

        return (
            <div className="flex font-mono">
                {values.map((v, idx) => (
                    <span
                        key={idx}
                        className={`w-5 sm:w-6 text-[10px] sm:text-[11px] text-center ${idx === len / 2 ? 'ml-2 sm:ml-3' : ''} ${v === '.' ? 'text-zinc-600' : 'text-zinc-300'
                            }`}
                    >
                        {v}
                    </span>
                ))}
            </div>
        );
    };

    const goToPage = (newPage: number) => {
        setPage(Math.max(0, Math.min(newPage, totalPages - 1)));
    };

    const handleSearch = (e: React.FormEvent) => {
        e.preventDefault();
        //const addr = parseInt(searchValue, 16);
        const addr = Number(searchValue);
        if (!isNaN(addr)) {
            const targetPage = Math.floor(addr / bytesPerPage);
            goToPage(targetPage);
            //setSearchValue('');
        }
    };

    if (!open) return null;

    return (
        <>

            <div>
                <div className="flex justify-center gap-4 m-1 mt-2">
                    {disks.slice(0, 3).map((disk, idx) => (
                        <button
                            key={`${idx}-${disk?.name}`}
                            disabled={!disk}
                            onClick={() => dumpDisk(disk)}
                            className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                            Dump "{disk?.name}" Disk
                        </button>
                    ))}

                    <button
                        onClick={() => dumpRam()}
                        className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                        Dump RAM
                    </button>

                    {/*
                    <button
                        onClick={() => dumpMemory()}
                        className="px-3 py-1.5 text-xs rounded bg-orange-700 hover:bg-orange-600 disabled:bg-zinc-700 text-zinc-200 transition-colors cursor-pointer">
                        Dump Wasm Memory
                    </button>
                    */}
                </div>

                {/* Header responsive */}
                <div className="flex justify-between items-center">

                    <div className="flex flex-col justify-between gap-2 px-3 sm:px-4 py-2">
                        <div className="flex items-center gap-2">

                            <span className="text-xs font-medium text-zinc-400 uppercase tracking-wider">
                                Memory
                            </span>

                            {/*
                            <span className="text-[10px] sm:text-xs text-zinc-600">
                                {data.length.toLocaleString()} bytes
                            </span>
                            */}
                        </div>
                    </div>

                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 px-3 sm:px-4 py-2 bg-[#0a0a12] my-1 border-b border-zinc-800/50">
                        <div className="flex items-center gap-2">
                            <span className="text-[10px] sm:text-xs text-zinc-600">Page</span>
                            <div className="flex items-center gap-1">
                                <button
                                    onClick={() => goToPage(0)}
                                    disabled={page === 0}
                                    className="hidden xs:block px-2 py-1 text-xs bg-zinc-800 hover:bg-zinc-700 disabled:opacity-50 disabled:hover:bg-zinc-800 rounded text-zinc-400 transition-colors"
                                >
                                    ⟪
                                </button>
                                <button
                                    onClick={() => goToPage(page - 1)}
                                    disabled={page === 0}
                                    className="px-2 py-1 text-xs bg-zinc-800 hover:bg-zinc-700 disabled:opacity-50 disabled:hover:bg-zinc-800 rounded text-zinc-400 transition-colors"
                                >
                                    ←
                                </button>
                                <input
                                    type="number"
                                    value={page + 1}
                                    onChange={(e) => goToPage(Number(e.target.value) - 1)}
                                    className="w-12 px-1 py-1 text-[10px] sm:text-xs bg-zinc-900 border border-zinc-700/50 rounded text-center text-zinc-300 focus:outline-none focus:border-emerald-500/60"
                                    min={1}
                                    max={totalPages}
                                />
                                <button
                                    onClick={() => goToPage(page + 1)}
                                    disabled={page >= totalPages - 1}
                                    className="px-2 py-1 text-xs bg-zinc-800 hover:bg-zinc-700 disabled:opacity-50 disabled:hover:bg-zinc-800 rounded text-zinc-400 transition-colors"
                                >
                                    →
                                </button>
                                <button
                                    onClick={() => goToPage(totalPages - 1)}
                                    disabled={page >= totalPages - 1}
                                    className="hidden xs:block px-2 py-1 text-xs bg-zinc-800 hover:bg-zinc-700 disabled:opacity-50 disabled:hover:bg-zinc-800 rounded text-zinc-400 transition-colors"
                                >
                                    ⟫
                                </button>
                            </div>
                            <span className="text-[10px] sm:text-xs text-zinc-600 text-nowrap">/ {totalPages || 1}</span>
                        </div>


                    </div>

                    <div className="flex items-center gap-2">
                        <form onSubmit={handleSearch} className="flex items-center">
                            <input
                                type="text"
                                value={searchValue}
                                onChange={(e) => setSearchValue(e.target.value /*.replace(/[^0-9A-Fa-f]/g, '')*/)}
                                placeholder="addr"
                                className="w-16 sm:w-20 px-1 sm:px-2 py-1 text-[10px] sm:text-xs bg-zinc-900 border border-zinc-700/50 rounded text-zinc-300 focus:outline-none focus:border-emerald-500/60 font-mono"
                            />
                            <button
                                type="submit"
                                className="ml-1 px-1.5 sm:px-2 py-1 text-[10px] sm:text-xs bg-zinc-800 hover:bg-zinc-700 rounded text-zinc-400 transition-colors"
                            >
                                Go
                            </button>
                        </form>

                        {/*
                        <button
                            onClick={() => setShowQuickJump(!showQuickJump)}
                            className="sm:hidden px-2 py-1 text-[10px] bg-zinc-800 hover:bg-zinc-700 rounded text-zinc-400 transition-colors"
                        >
                            {showQuickJump ? '▲' : '▼'}
                        </button>
                        */}
                    </div>
                </div>
            </div>

            <div className="overflow-auto overscroll-contain">
                {/* Column Headers - cachés sur mobile, visibles sur tablette+ */}
                <div className="hidden sm:grid grid-cols-[80px_1fr_auto] gap-2 px-4 py-2 bg-[#0a0a12] border-b border-zinc-800/30 text-[10px] font-medium text-zinc-500 uppercase tracking-wider">
                    <div>Offset</div>
                    <div>Hex</div>
                    <div>ASCII</div>
                </div>

                {/* Memory view responsive */}
                <div className="divide-y divide-zinc-800/20 overflow-x-auto">
                    {data.length === 0 && (
                        <div className="p-4">Empty memory</div>
                    )}

                    {Array.from({ length: linesPerPage }).map((_, i) => {
                        const addr = startOffset + i * bytesPerLine;
                        if (addr >= data.length) return null;

                        return (
                            <div key={addr} className="px-2 sm:px-4 py-1.5 hover:bg-zinc-800/20 transition-colors min-w-[320px] sm:min-w-0">
                                {/* Mobile: stacked layout */}
                                <div className="sm:hidden space-y-1">
                                    <div className="font-mono text-[10px] text-emerald-400/70">
                                        {toHex(addr, 4)}
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <span className="text-[8px] text-zinc-600 uppercase w-6">Hex</span>
                                        {bytesToHex(data, addr, bytesPerLine)}
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <span className="text-[8px] text-zinc-600 uppercase w-6">Asc</span>
                                        {bytesToAscii(data, addr, bytesPerLine)}
                                    </div>
                                </div>

                                {/* Tablet/Desktop: grid layout */}
                                <div className="hidden sm:grid grid-cols-[80px_1fr_auto] gap-2">
                                    <div className="font-mono text-[11px] text-emerald-400/70">
                                        {toHex(addr, 4)}
                                    </div>
                                    <div>
                                        {bytesToHex(data, addr, bytesPerLine)}
                                    </div>
                                    <div>
                                        {bytesToAscii(data, addr, bytesPerLine)}
                                    </div>
                                </div>
                            </div>
                        );
                    })}
                </div>

                {/* Quick jump - caché sur mobile par défaut, expandable */}
                <div className={`${showQuickJump ? 'block' : 'hidden sm:block'} px-3 sm:px-4 py-3 bg-[#0a0a12] border-t border-zinc-800/30`}>
                    <div className="text-[10px] font-medium text-zinc-600 uppercase tracking-wider mb-2">
                        Quick Jump
                    </div>

                    <div className="flex flex-col sm:flex-row gap-3 sm:gap-4">
                        <div className="space-y-1">
                            <div className="flex flex-wrap gap-1">
                                {[0x0000, 0x0500, 0x0700, 0x1000, 0xA000, 0xC000, 0xEE00].map(addr => (
                                    <button
                                        key={addr}
                                        onClick={() => {
                                            goToPage(Math.floor(addr / bytesPerPage));
                                            //setShowQuickJump(false);
                                        }}
                                        className="px-2 py-1 text-[10px] font-mono bg-zinc-800 hover:bg-zinc-700 rounded text-zinc-400 hover:text-emerald-400 transition-colors"
                                    >
                                        {toHex(addr, 4)}
                                    </button>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};
