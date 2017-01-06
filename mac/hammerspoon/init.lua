--------------------------------------------------------------------------------
-- hybrid.lua
-- Vim and Emacs keybindings for Mac
--------------------------------------------------------------------------------

-- Boolean flag for hybrid mode
hybrid_mode_enabled = false

-- Modal keybindings
local emacs = hs.hotkey.modal.new()
local normal = hs.hotkey.modal.new()

-- Notify the user what mode they're in
function notify_user(title, text)
  hs.notify.new({title=title, informativeText=text}):send()
end

-- Enable / Disable hybrid mode
enterNormal = hs.hotkey.bind({"cmd"}, "escape", function()
  if hybrid_mode_enabled then
    hybrid_mode_enabled = false
    emacs:exit()
    normal:exit()
    notify_user('Hybrid', 'Hybrid Mode Disabled')
  else
    hybrid_mode_enabled = true
    emacs:enter()
    notify_user('Hybrid', 'Hybrid Mode Enabled')
  end
end)

--------------------------------------------------------------------------------
-- Vim
--------------------------------------------------------------------------------

-- Movement related bindings
function left()  hs.eventtap.keyStroke({}, "Left") end
function right() hs.eventtap.keyStroke({}, "Right") end
function up()    hs.eventtap.keyStroke({}, "Up") end
function down()  hs.eventtap.keyStroke({}, "Down") end
function back()  hs.eventtap.keyStroke({"alt"}, "Left") end
function word()  hs.eventtap.keyStroke({"alt"}, "Right") end

normal:bind({}, 'h', left, nil, left)
normal:bind({}, 'l', right, nil, right)
normal:bind({}, 'k', up, nil, up)
normal:bind({}, 'j', down, nil, down)
normal:bind({}, 'b', back, nil, back)
normal:bind({}, 'w', word, nil, word)
normal:bind({}, 'e', word, nil, word)

normal:bind({}, 'i', function()
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

normal:bind({"shift"}, 'i', function()
  hs.eventtap.keyStroke({"cmd"}, "Left")
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

normal:bind({}, 'a', function()
  hs.eventtap.keyStroke({}, "Right")
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

normal:bind({"shift"}, 'a', function()
  hs.eventtap.keyStroke({"cmd"}, "Right")
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

normal:bind({}, 'o', nil, function()
  hs.eventtap.keyStroke({"cmd"}, "Right")
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({}, "Return")
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

normal:bind({"shift"}, 'o', nil, function()
  hs.eventtap.keyStroke({"cmd"}, "Left")
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({}, "Return")
  hs.eventtap.keyStroke({}, "Up")
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
end)

local function delete()
  hs.eventtap.keyStroke({}, "delete")
end
normal:bind({}, 'd', delete, nil, delete)

local function fndelete()
  hs.eventtap.keyStroke({}, "Right")
  hs.eventtap.keyStroke({}, "delete")
end
normal:bind({}, 'x', fndelete, nil, fndelete)

normal:bind({"shift"}, 'D', nil, function()
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({"ctrl"}, "k")
  normal:enter()
end)

normal:bind({}, 'f', function()
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
  hs.eventtap.keyStroke({"alt"}, "space")
end)

normal:bind({}, 's', function()
  normal:exit()
  emacs:enter()
  notify_user('Emacs', 'Emacs Mode / Vim Insert Mode')
  hs.eventtap.keyStroke({"alt"}, "space")
end)

-- Search functionality
normal:bind({}, '/', function() hs.eventtap.keyStroke({"cmd"}, "f") end)

normal:bind({}, 'u', function()
  hs.eventtap.keyStroke({"cmd"}, "z")
end)

normal:bind({"ctrl"}, 'r', function()
  hs.eventtap.keyStroke({"cmd", "shift"}, "z")
end)

normal:bind({}, 'y', function()
  hs.eventtap.keyStroke({"cmd"}, "c")
end)

normal:bind({}, 'p', function()
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

--------------------------------------------------------------------------------
-- Emacs
--------------------------------------------------------------------------------

-- Switch to vim normal mode
emacs:bind({}, 'escape', function()
  emacs:exit()
  normal:enter()
  notify_user('Normal', 'Vim Normal Mode')
end)
