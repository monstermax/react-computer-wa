

export const basename = (filepath: string) => {
    const parts = filepath.split('/');
    const filename = parts.at(-1);
    return filename;
}

