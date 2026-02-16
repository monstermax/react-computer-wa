
export namespace console {
    // @ts-ignore
    @external("env", "wasmConsoleLog")
    export declare function log(s: string): void

    // @ts-ignore
    @external("env", "wasmConsoleWarn")
    export declare function warn(s: string): void
}


export namespace jsCpu {
    // @ts-ignore
    @external("env", "jsCpuHalted")
    export declare function halted(): void;

    // @ts-ignore
    @external("env", "jsCpuBreakpoint")
    export declare function breakpoint(): void;

}

export namespace jsIo {
    // @ts-ignore
    @external("env", "jsIoRead")
    export declare function read(deviceIdx: u8, port: u8): u8;

    // @ts-ignore
    @external("env", "jsIoWrite")
    export declare function write(deviceIdx: u8, port: u8, value: u8): void;

    // @ts-ignore
    @external("env", "jsIoReset")
    export declare function reset(deviceIdx: u8): void;
}

