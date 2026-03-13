export async function instantiate(module, imports = {}) {
  const adaptedImports = {
    env: Object.setPrototypeOf({
      abort(message, fileName, lineNumber, columnNumber) {
        // ~lib/builtins/abort(~lib/string/String | null?, ~lib/string/String | null?, u32?, u32?) => void
        message = __liftString(message >>> 0);
        fileName = __liftString(fileName >>> 0);
        lineNumber = lineNumber >>> 0;
        columnNumber = columnNumber >>> 0;
        (() => {
          // @external.js
          throw Error(`${message} in ${fileName}:${lineNumber}:${columnNumber}`);
        })();
      },
      wasmConsoleLog(s) {
        // src/external_functions/console.log(~lib/string/String) => void
        s = __liftString(s >>> 0);
        wasmConsoleLog(s);
      },
      wasmConsoleWarn(s) {
        // src/external_functions/console.warn(~lib/string/String) => void
        s = __liftString(s >>> 0);
        wasmConsoleWarn(s);
      },
      "console.warn"(text) {
        // ~lib/bindings/dom/console.warn(~lib/string/String) => void
        text = __liftString(text >>> 0);
        console.warn(text);
      },
      "console.log"(text) {
        // ~lib/bindings/dom/console.log(~lib/string/String) => void
        text = __liftString(text >>> 0);
        console.log(text);
      },
    }, Object.assign(Object.create(globalThis), imports.env || {})),
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  const memory = exports.memory || imports.env.memory;
  const adaptedExports = Object.setPrototypeOf({
    instanciateComputer() {
      // src/index/instanciateComputer() => src/devices/Computer/Computer
      return __liftInternref(exports.instanciateComputer() >>> 0);
    },
    allocate(size) {
      // src/index/allocate(i32) => usize
      return exports.allocate(size) >>> 0;
    },
    computerloadCodeInROM(computer, valPtr, dataLen) {
      // src/index/computerloadCodeInROM(src/devices/Computer/Computer, usize, i32) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerloadCodeInROM(computer, valPtr, dataLen);
    },
    computerloadCodeInRAM(computer, valPtr, dataLen) {
      // src/index/computerloadCodeInRAM(src/devices/Computer/Computer, usize, i32) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerloadCodeInRAM(computer, valPtr, dataLen);
    },
    computerRunCycles(computer, cycles, skipBreakpoints) {
      // src/index/computerRunCycles(src/devices/Computer/Computer, u32, bool?) => bool
      computer = __lowerInternref(computer) || __notnull();
      skipBreakpoints = skipBreakpoints ? 1 : 0;
      exports.__setArgumentsLength(arguments.length);
      return exports.computerRunCycles(computer, cycles, skipBreakpoints) != 0;
    },
    computerGetCycles(computer) {
      // src/index/computerGetCycles(src/devices/Computer/Computer) => u64
      computer = __lowerInternref(computer) || __notnull();
      return BigInt.asUintN(64, exports.computerGetCycles(computer));
    },
    computerGetRegisterPC(computer) {
      // src/index/computerGetRegisterPC(src/devices/Computer/Computer) => u16
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterPC(computer);
    },
    computerGetRegisterSP(computer) {
      // src/index/computerGetRegisterSP(src/devices/Computer/Computer) => u16
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterSP(computer);
    },
    computerGetRegisterIR(computer) {
      // src/index/computerGetRegisterIR(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterIR(computer);
    },
    computerGetRegisterA(computer) {
      // src/index/computerGetRegisterA(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterA(computer);
    },
    computerGetRegisterB(computer) {
      // src/index/computerGetRegisterB(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterB(computer);
    },
    computerGetRegisterC(computer) {
      // src/index/computerGetRegisterC(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterC(computer);
    },
    computerGetRegisterD(computer) {
      // src/index/computerGetRegisterD(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterD(computer);
    },
    computerGetRegisterE(computer) {
      // src/index/computerGetRegisterE(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterE(computer);
    },
    computerGetRegisterF(computer) {
      // src/index/computerGetRegisterF(src/devices/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterF(computer);
    },
    computerGetMemory(computer, address) {
      // src/index/computerGetMemory(src/devices/Computer/Computer, u16) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetMemory(computer, address);
    },
    computerSetMemory(computer, address, value) {
      // src/index/computerSetMemory(src/devices/Computer/Computer, u16, u8) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerSetMemory(computer, address, value);
    },
    computerAddDevice(computer, namePtr, nameLen, typeId) {
      // src/index/computerAddDevice(src/devices/Computer/Computer, usize, i32, u8) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerAddDevice(computer, namePtr, nameLen, typeId);
    },
    computerResetComputer(computer) {
      // src/index/computerResetComputer(src/devices/Computer/Computer) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerResetComputer(computer);
    },
    computerSetBreakpoints(computer, addresses, files, lines) {
      // src/index/computerSetBreakpoints(src/devices/Computer/Computer, ~lib/array/Array<u16>, ~lib/array/Array<~lib/string/String>, ~lib/array/Array<u16>) => void
      computer = __retain(__lowerInternref(computer) || __notnull());
      addresses = __retain(__lowerArray(__setU16, 35, 1, addresses) || __notnull());
      files = __retain(__lowerArray((pointer, value) => { __setU32(pointer, __lowerString(value) || __notnull()); }, 36, 2, files) || __notnull());
      lines = __lowerArray(__setU16, 35, 1, lines) || __notnull();
      try {
        exports.computerSetBreakpoints(computer, addresses, files, lines);
      } finally {
        __release(computer);
        __release(addresses);
        __release(files);
      }
    },
  }, exports);
  function __liftString(pointer) {
    if (!pointer) return null;
    const
      end = pointer + new Uint32Array(memory.buffer)[pointer - 4 >>> 2] >>> 1,
      memoryU16 = new Uint16Array(memory.buffer);
    let
      start = pointer >>> 1,
      string = "";
    while (end - start > 1024) string += String.fromCharCode(...memoryU16.subarray(start, start += 1024));
    return string + String.fromCharCode(...memoryU16.subarray(start, end));
  }
  function __lowerString(value) {
    if (value == null) return 0;
    const
      length = value.length,
      pointer = exports.__new(length << 1, 2) >>> 0,
      memoryU16 = new Uint16Array(memory.buffer);
    for (let i = 0; i < length; ++i) memoryU16[(pointer >>> 1) + i] = value.charCodeAt(i);
    return pointer;
  }
  function __lowerArray(lowerElement, id, align, values) {
    if (values == null) return 0;
    const
      length = values.length,
      buffer = exports.__pin(exports.__new(length << align, 1)) >>> 0,
      header = exports.__pin(exports.__new(16, id)) >>> 0;
    __setU32(header + 0, buffer);
    __dataview.setUint32(header + 4, buffer, true);
    __dataview.setUint32(header + 8, length << align, true);
    __dataview.setUint32(header + 12, length, true);
    for (let i = 0; i < length; ++i) lowerElement(buffer + (i << align >>> 0), values[i]);
    exports.__unpin(buffer);
    exports.__unpin(header);
    return header;
  }
  class Internref extends Number {}
  const registry = new FinalizationRegistry(__release);
  function __liftInternref(pointer) {
    if (!pointer) return null;
    const sentinel = new Internref(__retain(pointer));
    registry.register(sentinel, pointer);
    return sentinel;
  }
  function __lowerInternref(value) {
    if (value == null) return 0;
    if (value instanceof Internref) return value.valueOf();
    throw TypeError("internref expected");
  }
  const refcounts = new Map();
  function __retain(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount) refcounts.set(pointer, refcount + 1);
      else refcounts.set(exports.__pin(pointer), 1);
    }
    return pointer;
  }
  function __release(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount === 1) exports.__unpin(pointer), refcounts.delete(pointer);
      else if (refcount) refcounts.set(pointer, refcount - 1);
      else throw Error(`invalid refcount '${refcount}' for reference '${pointer}'`);
    }
  }
  function __notnull() {
    throw TypeError("value must not be null");
  }
  let __dataview = new DataView(memory.buffer);
  function __setU16(pointer, value) {
    try {
      __dataview.setUint16(pointer, value, true);
    } catch {
      __dataview = new DataView(memory.buffer);
      __dataview.setUint16(pointer, value, true);
    }
  }
  function __setU32(pointer, value) {
    try {
      __dataview.setUint32(pointer, value, true);
    } catch {
      __dataview = new DataView(memory.buffer);
      __dataview.setUint32(pointer, value, true);
    }
  }
  return adaptedExports;
}
