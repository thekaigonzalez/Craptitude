# Craptitude
Craptitude is a mount / unmount system written in lua.

Choose images or remove images using a simple `.dsi` file.

Run the `mfdimg` file in the main directory.

## Installation process

Before you begin,

Make sure to read this:

> This program was tested on macOS Big Sur 11.5.1 on a 
> MacBook Air (13-inch, 2017), using Lua 5.4 installed by the `brew` command line utility.
> Please check out https://brew.sh and install it.
> If you use Linux, please build using the `fts` & `linux` targets.
> The Linux version was also tested on Ubuntu 20.04 LTS on a VM named Bob.


```
$ make fts
$ make
```

## Modular Features

The Craptitude features can be compiled separately.
Including the `sudo-bash` or the `lua-bash` images.

You can build using these commands

```
$ make opt-bash
```