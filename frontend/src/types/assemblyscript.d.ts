
// Types

/** An 8-bit signed integer. */
declare type i8 = number;
/** A 16-bit signed integer. */
declare type i16 = number;
/** A 32-bit signed integer. */
declare type i32 = number;
/** A 64-bit signed integer. */
declare type i64 = number;
/** A 32-bit signed integer when targeting 32-bit WebAssembly or a 64-bit signed integer when targeting 64-bit WebAssembly. */
declare type isize = number;
/** An 8-bit unsigned integer. */
declare type u8 = number;
/** A 16-bit unsigned integer. */
declare type u16 = number;
/** A 32-bit unsigned integer. */
declare type u32 = number;
/** A 64-bit unsigned integer. */
declare type u64 = number;
/** A 32-bit unsigned integer when targeting 32-bit WebAssembly or a 64-bit unsigned integer when targeting 64-bit WebAssembly. */
declare type usize = number;
/** A 1-bit unsigned integer. */
declare type bool = boolean | number;
/** A 32-bit float. */
declare type f32 = number;
/** A 64-bit float. */
declare type f64 = number;
/** A 128-bit vector. */
declare type v128 = object;
/** Non-nullable function reference. */
declare type ref_func = object;
/** Canonical nullable function reference. */
declare type funcref = ref_func | null;
/** Non-nullable external reference. */
declare type ref_extern = object;
/** Canonical nullable external reference. */
declare type externref = ref_extern | null;
/** Non-nullable any reference. */
declare type ref_any = object;
/** Canonical nullable any reference. */
declare type anyref = ref_any | null;
/** Non-nullable equatable reference. */
declare type ref_eq = object;
/** Canonical nullable equatable reference. */
declare type eqref = ref_eq | null;
/** Non-nullable struct reference. */
declare type ref_struct = object;
/** Canonical nullable struct reference. */
declare type structref = ref_struct | null;
/** Non-nullable array reference. */
declare type ref_array = object;
/** Canonical nullable array reference. */
declare type arrayref = ref_array | null;
/** Non-nullable 31-bit integer reference. */
declare type ref_i31 = object;
/** Canonical nullable 31-bit integer reference. */
declare type i31ref = ref_i31 | null;
/** Non-nullable string reference. */
declare type ref_string = object;
/** Canonical nullable string reference. */
declare type stringref = ref_string | null;
/** Non-nullable WTF-8 string view. */
declare type ref_stringview_wtf8 = object;
/** Canonical nullable WTF-8 string view. */
declare type stringview_wtf8 = ref_stringview_wtf8 | null;
/** Non-nullable WTF-16 string view. */
declare type ref_stringview_wtf16 = object;
/** Canonical nullable WTF-16 string view. */
declare type stringview_wtf16 = ref_stringview_wtf16 | null;
/** Non-nullable string iterator. */
declare type ref_stringview_iter = object;
/** Canonical nullable string iterator. */
declare type stringview_iter = ref_stringview_iter | null;
