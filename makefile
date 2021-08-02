fts:
	mkdir ./images
	mkdir ./mnt


all: file-system dmnt

sources: file-system dmnt opt-bash

opt-bash:
	luac -o ./images/lua-bash.dsi sourcecode/bash.lua
	cp ./images/lua-bash.dsi ./mnt/ || exit

file-system:
	gcc ./design/fsdesign.c -llua5.4 -Wall -o ./mfdimg

# add Build targets for Linux
# Using Supported Lua 53 Libraries
linux:
	gcc ./design/fsdesignl.c -llua5.3 -Wall -o ./mfdimg


dmnt:
	luac -o ./images/mnt-image.dsi ./sourcecode/dmnt.lua
	cp ./images/mnt-image.dsi ./mnt/

