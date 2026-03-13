declare namespace __AdaptedExports {
  /** Exported memory */
  export const memory: WebAssembly.Memory;
  /**
   * src/index/instanciateComputer
   * @returns `src/devices/Computer/Computer`
   */
  export function instanciateComputer(): __Internref4;
  /**
   * src/index/allocate
   * @param size `i32`
   * @returns `usize`
   */
  export function allocate(size: number): number;
  /**
   * src/index/computerloadCodeInROM
   * @param computer `src/devices/Computer/Computer`
   * @param valPtr `usize`
   * @param dataLen `i32`
   */
  export function computerloadCodeInROM(computer: __Internref4, valPtr: number, dataLen: number): void;
  /**
   * src/index/computerloadCodeInRAM
   * @param computer `src/devices/Computer/Computer`
   * @param valPtr `usize`
   * @param dataLen `i32`
   */
  export function computerloadCodeInRAM(computer: __Internref4, valPtr: number, dataLen: number): void;
  /**
   * src/index/computerRunCycles
   * @param computer `src/devices/Computer/Computer`
   * @param cycles `u32`
   * @param skipBreakpoints `bool`
   * @returns `bool`
   */
  export function computerRunCycles(computer: __Internref4, cycles: number, skipBreakpoints?: boolean): boolean;
  /**
   * src/index/computerGetCycles
   * @param computer `src/devices/Computer/Computer`
   * @returns `u64`
   */
  export function computerGetCycles(computer: __Internref4): bigint;
  /**
   * src/index/computerGetRegisterPC
   * @param computer `src/devices/Computer/Computer`
   * @returns `u16`
   */
  export function computerGetRegisterPC(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterSP
   * @param computer `src/devices/Computer/Computer`
   * @returns `u16`
   */
  export function computerGetRegisterSP(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterIR
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterIR(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterA
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterA(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterB
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterB(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterC
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterC(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterD
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterD(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterE
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterE(computer: __Internref4): number;
  /**
   * src/index/computerGetRegisterF
   * @param computer `src/devices/Computer/Computer`
   * @returns `u8`
   */
  export function computerGetRegisterF(computer: __Internref4): number;
  /**
   * src/index/computerGetMemory
   * @param computer `src/devices/Computer/Computer`
   * @param address `u16`
   * @returns `u8`
   */
  export function computerGetMemory(computer: __Internref4, address: number): number;
  /**
   * src/index/computerSetMemory
   * @param computer `src/devices/Computer/Computer`
   * @param address `u16`
   * @param value `u8`
   */
  export function computerSetMemory(computer: __Internref4, address: number, value: number): void;
  /**
   * src/index/computerAddDevice
   * @param computer `src/devices/Computer/Computer`
   * @param namePtr `usize`
   * @param nameLen `i32`
   * @param typeId `u8`
   * @returns `u8`
   */
  export function computerAddDevice(computer: __Internref4, namePtr: number, nameLen: number, typeId: number): number;
  /**
   * src/index/computerResetComputer
   * @param computer `src/devices/Computer/Computer`
   */
  export function computerResetComputer(computer: __Internref4): void;
  /**
   * src/index/computerSetBreakpoints
   * @param computer `src/devices/Computer/Computer`
   * @param addresses `~lib/array/Array<u16>`
   * @param files `~lib/array/Array<~lib/string/String>`
   * @param lines `~lib/array/Array<u16>`
   */
  export function computerSetBreakpoints(computer: __Internref4, addresses: Array<number>, files: Array<string>, lines: Array<number>): void;
}
/** src/devices/Computer/Computer */
declare class __Internref4 extends Number {
  private __nominal4: symbol;
  private __nominal0: symbol;
}
/** Instantiates the compiled WebAssembly module with the given imports. */
export declare function instantiate(module: WebAssembly.Module, imports: {
  env: unknown,
}): Promise<typeof __AdaptedExports>;
