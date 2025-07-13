# Nikut's dwm build

This is an unpatched, minimal build of dwm that I use as the primary window manager on my archlinux machine for efficient, keyboard-centric navigation.

## Information

Version: 6.5

Configuration: [config.h](../dwm/config.h)

## Shortcuts

| Function            | Key
|---------------------|----
| spawn (st)          | Super + `
| dmenu_run           | Super + r
| togglebar           | Super + b
| focusstack          | Super + d
| focusstack          | Super + a
| incnmaster          | Super + w
| incnmaster          | Super + s
| setmfact            | Super + q
| setmfact            | Super + e
| zoom                | Super + 1
| view                | Super + 2
| togglefloating      | Super + 4
| setlayout (tiled)   | Super + z
| setlayout (floating)| Super + x
| setlayout (monocle) | Super + c
| setlayout (toggle)  | Super + 3
| spawn (iwgtk)       | Alt + e
| spawn (firefox)     | Alt + f
| spawn (qutebrowser) | Alt + c
| killclient          | Alt + q
| toggletag           | Alt + 1–9
| quit                | Alt + Shift + q

## Installation

```txt
git clone https://github.com/NICUP14/ArchEnv
sudo make -C ArchEnv/dwm install
```
