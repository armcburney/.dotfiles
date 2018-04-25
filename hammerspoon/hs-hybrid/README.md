# hybrid
System-wide hybrid emacs/vim keybindings for macOS.

## Usage
1. Download hammerspoon: http://www.hammerspoon.org/.
2. Clone the repo into your `~/.hammerspoon/` directory.
3. Add the module in your `init.lua` hammerspoon config file.

```lua
-- init.lua 
-- @see: ~/.hammerspoon/init.lua

-- Including the hybrid module
local hybrid = require("hs-hybrid")
```
Enable and disable hybrid mode with `cmd` + `esc` when hammerspoon is running. When you press `esc`, you will enter `vim normal-mode`. By default you are in `emacs-mode`, which functions as `vim insert-mode`, with the addition of emacs keybindings.

## Motivation
The motivation behind this repo is that I get annoyed when I can't use vim or emacs keybindings in my daily computer use.
This lua script for hammerspoon was made to provide system-wide, vim and emacs keybindings akin to those offered in [spacemacs](http://spacemacs.org/).

`insert-mode` for vim has all of the emacs keybindings by default. Pressing `esc` in this mode will let you enter the modal `normal-mode` for vim.
