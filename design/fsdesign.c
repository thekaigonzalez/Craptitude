// I'm too lazy to program in C.
// or C++.
// you can download mountable disk images from https://raw.githubusercontent.com/thekaigonzalez/Craptitude/master/images/
// images repository update every day until END OF SUPPORT

// inc. lua headers
#include <lua5.4/lua.h>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lualib.h>

// default std headers
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>

// begin mounting process
int main()
{
    printf("loading disk image mounter...\n");
    lua_State* L = luaL_newstate();
    luaL_openlibs(L);
    sleep(1);
    system("clear");
    luaL_dofile(L, "./mnt/mnt-image.dsi"); // do the mnt-image.dsi file in lua binary encoding
}