--------------------------------------------------------------------------------
-- hs-hybrid/init.lua
--
-- @usage:  System-wide Vim and Emacs keybindings for Mac
-- @author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
--------------------------------------------------------------------------------

-- Includes
delete = require "hs-hybrid/includes/delete"
other = require "hs-hybrid/includes/other"
mode = require "hs-hybrid/includes/mode"
move = require "hs-hybrid/includes/move"

-- Modes
local vim = require "hs-hybrid/modes/vim"
local emacs = require "hs-hybrid/modes/emacs"

-- Enable or disable hybrid mode
hs.hotkey.bind({"cmd"}, "escape", function() mode.toggle_hybrid_mode() end)
