fts:
	mkdir ./images
	mkdir ./mnt


all: file-system dmnt


file-system:
	gcc ./design/fsdesign.c -llua5.4 -Wall -o ./mfdimg

# add Build targets for Linux
# Using Supported Lua 53 Libraries
linux:
	gcc ./design/fsdesignl.c -llua5.3 -Wall -o ./mfdimg


dmnt:
	luac -o ./images/mnt-image.dsi ./sourcecode/dmnt.lua
	cp ./images/mnt-image.dsi

