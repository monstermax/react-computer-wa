
import { useEffect, useState } from "react";


interface FileModalProps {
    isOpen: boolean;
    onClose: () => void;
    onSelectFile: (filePath: string) => void;
}

interface FileIndex {
    generated: string;
    count: number;
    files: string[];
}


const fileIndexUrl = "/asm-files.json";


export const FileModal: React.FC<FileModalProps> = ({
    isOpen,
    onClose,
    onSelectFile
}) => {
    const [files, setFiles] = useState<string[]>([]);
    const [loading, setLoading] = useState(false);
    const [search, setSearch] = useState('');

    useEffect(() => {
        if (isOpen) {
            loadFileList();
            setSearch('');
        }
    }, [isOpen]);

    const loadFileList = async () => {
        setLoading(true);
        try {
            const response = await fetch(fileIndexUrl);
            const fileIndex: FileIndex = await response.json();
            setFiles(fileIndex.files);
        } catch (error) {
            console.error('Failed to load file list:', error);
            setFiles([]);
        } finally {
            setLoading(false);
        }
    };

    if (!isOpen) return null;

    const handleFileClick = (filePath: string) => {
        onSelectFile(filePath);
        onClose();
    };

    const filtered = search
        ? files.filter(f => f.toLowerCase().includes(search.toLowerCase()))
        : files;

    // Group files by directory
    const grouped = filtered.reduce<Record<string, string[]>>((acc, file) => {
        const parts = file.split('/');
        const dir = parts.length > 1 ? parts.slice(0, -1).join('/') : '.';
        if (!acc[dir]) acc[dir] = [];
        acc[dir].push(file);
        return acc;
    }, {});

    return (
        <div
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 backdrop-blur-sm"
            onClick={onClose}
        >
            <div
                className="bg-[#111119] border border-zinc-700/50 rounded-xl w-[480px] max-h-[70vh] overflow-hidden flex flex-col shadow-2xl shadow-black/50"
                onClick={e => e.stopPropagation()}
                style={{ fontFamily: "'JetBrains Mono', 'Fira Code', 'SF Mono', monospace" }}
            >
                {/* Header */}
                <div className="flex justify-between items-center px-5 py-4 border-b border-zinc-800/60">
                    <div className="flex items-center gap-2.5">
                        <span className="text-indigo-400 text-sm">&#9776;</span>
                        <h2 className="text-sm font-semibold text-zinc-200 tracking-wide">Open File</h2>
                        {!loading && (
                            <span className="text-[10px] px-1.5 py-0.5 rounded bg-zinc-800 text-zinc-500">
                                {filtered.length} file{filtered.length !== 1 ? 's' : ''}
                            </span>
                        )}
                    </div>
                    <button
                        onClick={onClose}
                        className="text-zinc-500 hover:text-zinc-300 transition-colors text-lg leading-none px-1 cursor-pointer"
                    >
                        &#x2715;
                    </button>
                </div>

                {/* Search */}
                <div className="px-4 py-3 border-b border-zinc-800/40">
                    <input
                        type="text"
                        value={search}
                        onChange={e => setSearch(e.target.value)}
                        placeholder="Search files..."
                        autoFocus
                        className="w-full px-3 py-2 text-xs bg-[#0a0a10] border border-zinc-700/40 rounded-lg text-zinc-300 placeholder:text-zinc-600 focus:outline-none focus:border-indigo-500/50 transition-colors"
                    />
                </div>

                {/* File list */}
                <div className="flex-1 overflow-y-auto px-2 py-2 min-h-0">
                    {loading ? (
                        <div className="text-center py-8 text-zinc-500 text-xs">Loading files...</div>
                    ) : filtered.length === 0 ? (
                        <div className="text-center py-8 text-zinc-500 text-xs">
                            {search ? 'No matching files' : 'No files found'}
                        </div>
                    ) : (
                        Object.entries(grouped).map(([dir, dirFiles]) => (
                            <div key={dir} className="mb-2">
                                <div className="px-3 py-1.5 text-[10px] uppercase tracking-wider text-zinc-500 font-medium">
                                    {dir}
                                </div>
                                {dirFiles.map((file, index) => {
                                    const fileName = file.split('/').pop() || file;
                                    return (
                                        <button
                                            key={index}
                                            onClick={() => handleFileClick(file)}
                                            className="w-full text-left px-3 py-2 text-xs rounded-lg cursor-pointer transition-colors text-zinc-300 hover:bg-indigo-500/10 hover:text-indigo-300 flex items-center gap-2 group"
                                        >
                                            <span className="text-zinc-600 group-hover:text-indigo-400/60 text-[10px] shrink-0">
                                                &#x25B8;
                                            </span>
                                            <span className="truncate">{fileName}</span>
                                        </button>
                                    );
                                })}
                            </div>
                        ))
                    )}
                </div>

                {/* Footer */}
                <div className="flex justify-end px-4 py-3 border-t border-zinc-800/50">
                    <button
                        onClick={onClose}
                        className="px-4 py-1.5 text-xs rounded-lg bg-zinc-800 hover:bg-zinc-700 text-zinc-400 transition-colors cursor-pointer"
                    >
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    );
};



