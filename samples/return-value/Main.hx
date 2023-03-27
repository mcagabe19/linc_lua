package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
  public static function main():Void
  {
    /* initialize Lua */
    var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

    /* load Lua base libraries */
    LuaL.openlibs(vm);

    /* run the script */
    LuaL.dofile(vm, "script.lua");

    trace(Lua.gettop(vm));
    trace(Lua.tointeger(vm, 1));

    /* cleanup Lua */
    Lua.close(vm);
    vm = null;
  }
}