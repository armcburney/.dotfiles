--------------------------------------------------------------------------------
-- hs-keys/init.lua
--
-- @usage:  Keybindings for Andrew
-- @author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
--------------------------------------------------------------------------------

local mash = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local funkymash = {"cmd", "ctrl", "shift"}

hs.grid.GRIDWIDTH = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

hs.window.animationDuration = 0

local volumeIncrement = 5

hs.hotkey.bind(mash, ';', function()
  hs.grid.snap(hs.window.focusedWindow())
end)

hs.hotkey.bind(mash, "'", function()
  hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap)
end)

hs.hotkey.bind(mash, '=', function()
  hs.grid.adjustWidth(1)
end)

hs.hotkey.bind(mash, '-', function()
  hs.grid.adjustWidth(-1)
end)

hs.hotkey.bind(mashshift, '=', function()
  hs.grid.adjustHeight(1)
end)

hs.hotkey.bind(mashshift, '-', function()
  hs.grid.adjustHeight(-1)
end)

hs.hotkey.bind(mashshift, 'left', function()
  hs.window.focusedWindow():focusWindowWest()
end)

hs.hotkey.bind(mashshift, 'right', function()
  hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(mashshift, 'up', function()
  hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(mashshift, 'down', function()
  hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(mash, 'F', function()
  hs.window.focusedWindow():toggleFullScreen()
end)

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)
hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)
hs.hotkey.bind(mash, 'U', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'O', hs.grid.resizeWindowWider)
hs.hotkey.bind(mash, 'I', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'Y', hs.grid.resizeWindowShorter)
