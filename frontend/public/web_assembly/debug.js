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
      "console.log"(text) {
        // ~lib/bindings/dom/console.log(~lib/string/String) => void
        text = __liftString(text >>> 0);
        console.log(text);
      },
      "console.warn"(text) {
        // ~lib/bindings/dom/console.warn(~lib/string/String) => void
        text = __liftString(text >>> 0);
        console.warn(text);
      },
    }, Object.assign(Object.create(globalThis), imports.env || {})),
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  const memory = exports.memory || imports.env.memory;
  const adaptedExports = Object.setPrototypeOf({
    instanciateComputer() {
      // src/index/instanciateComputer() => src/Computer/Computer
      return __liftInternref(exports.instanciateComputer() >>> 0);
    },
    loadTmpCode(memoryBus) {
      // src/index/loadTmpCode(src/Memory/MemoryBus) => void
      memoryBus = __lowerInternref(memoryBus) || __notnull();
      exports.loadTmpCode(memoryBus);
    },
    allocate(size) {
      // src/index/allocate(i32) => usize
      return exports.allocate(size) >>> 0;
    },
    computerloadCode(computer, valPtr, dataLen) {
      // src/index/computerloadCode(src/Computer/Computer, usize, i32) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerloadCode(computer, valPtr, dataLen);
    },
    computerRunCycles(computer, cycles) {
      // src/index/computerRunCycles(src/Computer/Computer, u32) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerRunCycles(computer, cycles);
    },
    computerGetCycles(computer) {
      // src/index/computerGetCycles(src/Computer/Computer) => u64
      computer = __lowerInternref(computer) || __notnull();
      return BigInt.asUintN(64, exports.computerGetCycles(computer));
    },
    computerGetRegisterPC(computer) {
      // src/index/computerGetRegisterPC(src/Computer/Computer) => u16
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterPC(computer);
    },
    computerGetRegisterSP(computer) {
      // src/index/computerGetRegisterSP(src/Computer/Computer) => u16
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterSP(computer);
    },
    computerGetRegisterIR(computer) {
      // src/index/computerGetRegisterIR(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterIR(computer);
    },
    computerGetRegisterA(computer) {
      // src/index/computerGetRegisterA(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterA(computer);
    },
    computerGetRegisterB(computer) {
      // src/index/computerGetRegisterB(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterB(computer);
    },
    computerGetRegisterC(computer) {
      // src/index/computerGetRegisterC(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterC(computer);
    },
    computerGetRegisterD(computer) {
      // src/index/computerGetRegisterD(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterD(computer);
    },
    computerGetRegisterE(computer) {
      // src/index/computerGetRegisterE(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterE(computer);
    },
    computerGetRegisterF(computer) {
      // src/index/computerGetRegisterF(src/Computer/Computer) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetRegisterF(computer);
    },
    computerGetMemory(computer, address) {
      // src/index/computerGetMemory(src/Computer/Computer, u16) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerGetMemory(computer, address);
    },
    computerSetMemory(computer, address, value) {
      // src/index/computerSetMemory(src/Computer/Computer, u16, u8) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerSetMemory(computer, address, value);
    },
    computerAddDevice(computer, namePtr, nameLen, typeId) {
      // src/index/computerAddDevice(src/Computer/Computer, usize, i32, u8) => u8
      computer = __lowerInternref(computer) || __notnull();
      return exports.computerAddDevice(computer, namePtr, nameLen, typeId);
    },
    destroyComputer(computer) {
      // src/index/destroyComputer(src/Computer/Computer) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.destroyComputer(computer);
    },
    computerResetComputer(computer) {
      // src/index/computerResetComputer(src/Computer/Computer) => void
      computer = __lowerInternref(computer) || __notnull();
      exports.computerResetComputer(computer);
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
  return adaptedExports;
}
