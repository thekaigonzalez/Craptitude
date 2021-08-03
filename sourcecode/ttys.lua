--- ttys - Initialize the lua-bash with tokens

local bashFile = loadfile("./mnt/lua-bash.dsi")()

print("Loading Lua Bash....")

bashFile:main(0x01)