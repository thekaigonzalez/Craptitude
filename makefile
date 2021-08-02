fts:
	mkdir ./images
	mkdir ./mnt


all: file-system dmnt

sources: file-system dmnt opt-bash build-libs disk-data

opt-bash:
	luac -o ./images/lua-bash.dsi sourcecode/bash.lua
	cp ./images/lua-bash.dsi ./mnt/ || exit

file-system:
	gcc ./design/fsdesign.c -llua5.4 -Wall -o ./mfdimg

# add Build targets for Linux
# Using Supported Lua 53 Libraries
# Contains build-libs, file-system and others.
linux:
	gcc ./design/fsdesignl.c -llua5.3 -Wall -o ./mfdimg
	gcc ./design/lfdsl.cxx -llua5.3 -Wall -std=c++17 -fPIC -shared -o ./liblfds.so

build-libs:
	gcc ./design/lfds.cxx -llua5.4 -lreadline -lstdc++ -std=c++17 -fPIC -shared -o ./liblfds.so

disk-data:
	luac -o ./mnt/lua-bash.rc ./sourcecode/bashrc.lua
	luac -o ./mnt/mnt-image.rc ./sourcecode/dmntrc.lua
dmnt:
	luac -o ./images/mnt-image.dsi ./sourcecode/dmnt.lua
	cp ./images/mnt-image.dsi ./mnt/

