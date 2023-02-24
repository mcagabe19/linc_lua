package hxlua;

class Types {}

@:include("lua.hpp")
@:keep
@:native("lua_State")
extern class Lua_State {}

/* type of numbers in Lua */
@:include("lua.hpp")
@:keep
@:native("lua_Number")
extern class Lua_Number {}

/* type for integer functions */
@:include("lua.hpp")
@:keep
@:native("lua_Integer")
extern class Lua_Integer {}

/* unsigned integer type */
@:include("lua.hpp")
@:keep
@:native("lua_Unsigned")
extern class Lua_Unsigned {}

/* type for continuation-function contexts */
@:include("lua.hpp")
@:keep
@:native("lua_KContext")
extern class Lua_KContext {}

/*
 * Type for C functions registered with Lua
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.Pointer<Lua_State>) -> Int>;

/*
 * Type for continuation functions
 */
typedef Lua_KFunction = cpp.Callable<(L:cpp.Pointer<Lua_State>, status:Int, ctx:Lua_KContext) -> Int>;

/*
 * Type for functions that read/write blocks when loading/dumping Lua chunks
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.Pointer<Lua_State>, ud:cpp.Pointer<cpp.Void>, sz:cpp.Pointer<cpp.SizeT>) -> String>;
typedef Lua_Writer = cpp.Callable<(L:cpp.Pointer<Lua_State>, p:String, sz:cpp.SizeT, ud:cpp.Pointer<cpp.Void>) -> String>;

/*
 * Type for memory-allocation functions
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.Pointer<cpp.Void>, ptr:cpp.Pointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.RawPointer<cpp.Void>>;

/*
 * Type for warning functions
 */
typedef Lua_WarnFunction = cpp.Callable<(L:ud:cpp.Pointer<cpp.Void>, msg:String, tocont:Int) -> Void>;