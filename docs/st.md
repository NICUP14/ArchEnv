# Nikut's st build

This is a patched, minimal build of st that I use as the primary terminal emulator on my archlinux machine with a built-in vim keyboard select mode along transparency, clipboard, and scrollback support.

## Information

Version: 0.9.2

Configuration: [config.h](../st/config.h)

Patches:

* alpha
* clipboard
* scrollback
* keyboard select

## Shortcuts

| Function         | Key
|------------------|----
| printsel         | Print
| sendbreak        | Break
| toggleprinter    | Ctrl + Print
| printscreen      | Shift + Print
| zoom (+)         | Ctrl + =
| zoom (-)         | Ctrl + -
| clipcopy         | Ctrl + Shift + c
| clippaste        | Ctrl + Shift + v
| keyboard_select  | Ctrl + Shift + Space
| searchforward    | Ctrl + /
| searchbackward   | Ctrl + ?

## Installation

```txt
git clone https://github.com/NICUP14/ArchEnv
sudo make -C ArchEnv/st install
```
