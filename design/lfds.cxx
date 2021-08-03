//
// Created by Kai Gonzalez on 8/2/21.
//
extern "C" {
#include <lua5.4/lualib.h>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lua.hpp>
#include <readline/readline.h>
#include <readline/history.h>
}
#include <vector>
#include <iostream>
#include <filesystem>
int get_filenumber(lua_State* L)
{
    try {
        int i = 0;
        for (const auto& I : std::filesystem::directory_iterator(luaL_checkstring(L, 1)))
        {
            ++ i;
        }
        lua_pushinteger(L, i);
    }
    catch (std::filesystem::filesystem_error& e) {
        lua_pushnil(L);
    }
    return 1;
}
int print_allstrings(lua_State* L)
{
    try {
        try {
            int i = 0;
            for (const auto& I : std::filesystem::directory_iterator(luaL_checkstring(L, 1)))
            {
                printf("%s\n", I.path().filename().c_str());
            }
        }
        catch (std::filesystem::filesystem_error& e) {
            lua_pushnil(L);
        }
    }
    catch (std::filesystem::filesystem_error & e) {
        lua_pushnil(L);
    }

    return 1;
}

int rl(lua_State* L)
{
    char* a = readline(luaL_checkstring(L, 1));

    add_history(a);

    lua_pushstring(L, a);
    return 1;
}

int FFIndex(lua_State* L)
{
    std::vector <std::string>Filenames{};
    try {
        try {
            int i = 0;
            for (const auto& I : std::filesystem::directory_iterator(luaL_checkstring(L, 1)))
            {
                Filenames.push_back(I.path().filename().string().substr(0, I.path().filename().string().find('.')));
            }
        }
        catch (std::filesystem::filesystem_error& e) {
            lua_pushnil(L);
        }
    }
    catch (std::filesystem::filesystem_error & e) {
        lua_pushnil(L);
    }

    lua_pushstring(L, Filenames[luaL_checkinteger(L, 2)].c_str()); // checks and returns a file from the array
    // lol
    return 1;
}
int FFIndexExt(lua_State* L)
{
    std::vector <std::string>Filenames{};
    try {
        try {
            int i = 0;
            for (const auto& I : std::filesystem::directory_iterator(luaL_checkstring(L, 1)))
            {
                Filenames.push_back(I.path().filename().string());
            }
        }
        catch (std::filesystem::filesystem_error& e) {
            lua_pushnil(L);
        }
    }
    catch (std::filesystem::filesystem_error & e) {
        lua_pushnil(L);
    }

    lua_pushstring(L, Filenames[luaL_checkinteger(L, 2)].c_str()); // checks and returns a file from the array
    // lol
    return 1;
}

int PWD(lua_State* L)
{
    lua_pushstring(L, std::filesystem::current_path().c_str());
    return 1;
}

extern "C" {
    int luaopen_liblfds(lua_State* L)
    {
        lua_register(L, "getdirnumber", get_filenumber);
        lua_register(L, "getallfiles", print_allstrings);
        lua_register(L, "getallfilesi", FFIndex);
        lua_register(L, "getallfilesiE", FFIndexExt);
        lua_register(L, "readline", rl);
        lua_register(L, "pwd",PWD);
        return 1;
    }
}