--------------------------------------------------------------------------------
-- hybrid.lua
--
-- System-wide Vim and Emacs keybindings for Mac
-- @author Andrew McBurney
--------------------------------------------------------------------------------

-- History of vim commands, max size of 10
local command_history = {}

-- Boolean flag for hybrid mode
local hybrid_mode_enabled = false

-- Images for notifications
local emacs_image   = hs.image.imageFromPath("./images/emacs.png")
local vim_image     = hs.image.imageFromPath("./images/vim.png")

-- Modal keybindings
local emacs = hs.hotkey.modal.new()
local normal = hs.hotkey.modal.new()

-- Notify the user what mode they're in
local function notify_user(title, text, image)
  hs.notify.new({title=title, informativeText=text, contentImage=image}):send()
end

-- Enable / Disable hybrid mode
hs.hotkey.bind({"cmd"}, "escape", function()
  if hybrid_mode_enabled then
    hybrid_mode_enabled = false
    emacs:exit()
    normal:exit()
    notify_user(
      'Hybrid-mode Disabled',
      'Hybrid-mode disabled. \'command\' + \'esc\' to enable',
      nil
    )
  else
    hybrid_mode_enabled = true
    emacs:enter()
    notify_user(
      'Hybrid-mode Enabled',
      'Hybrid-mode enabled. \'command\' + \'esc\' to disable',
      nil
    )
  end
end)

-- Movement related functions
local function right()              hs.eventtap.keyStroke({}, "Right")      end
local function left()               hs.eventtap.keyStroke({}, "Left")       end
local function up()                 hs.eventtap.keyStroke({}, "Up")         end
local function down()               hs.eventtap.keyStroke({}, "Down")       end
local function forward_word()       hs.eventtap.keyStroke({"alt"}, "Right") end
local function backward_word()      hs.eventtap.keyStroke({"alt"}, "Left")  end
local function forward_line()       hs.eventtap.keyStroke({"cmd"}, "Right") end
local function backward_line()      hs.eventtap.keyStroke({"cmd"}, "Left")  end
local function forward_paragraph()  hs.eventtap.keyStroke({"alt"}, "Up")    end
local function backward_paragraph() hs.eventtap.keyStroke({"alt"}, "Down")  end

-- Deletion related functions
local function delete_word_forward()
  hs.eventtap.keyStroke({"alt", "shift"}, "Right")
  hs.eventtap.keyStroke({}, "delete")
end

local function delete_word_backward()
  hs.eventtap.keyStroke({"alt", "shift"}, "Left")
  hs.eventtap.keyStroke({}, "delete")
end

local function delete_line()
  backward_line()
  hs.eventtap.keyStroke({"ctrl"}, "k")
end

local function delete()
  hs.eventtap.keyStroke({}, "delete")
end

local function fndelete()
  right()
  hs.eventtap.keyStroke({}, "delete")
end

--------------------------------------------------------------------------------
-- Vim
--
-- Keybindnigs for normal vim-mode
--------------------------------------------------------------------------------

-- Movement related bindings
normal:bind({}, 'h', left, nil, left)
normal:bind({}, 'l', right, nil, right)
normal:bind({}, 'k', up, nil, up)
normal:bind({}, 'j', down, nil, down)
normal:bind({}, 'w', forward_word, nil, forward_word)
normal:bind({}, 'e', forward_word, nil, forward_word)
normal:bind({}, 'b', backward_word, nil, backward_word)
normal:bind({"shift"}, '4', forward_line, nil, forward_line)
normal:bind({"shift"}, '6', backward_line, nil, backward_line)

-- Deletion related bindings
normal:bind({}, 'd', delete, nil, delete)
normal:bind({}, 'x', fndelete, nil, fndelete)

-- Enter insert mode
normal:bind({}, 'i', function()
  normal:exit()
  emacs:enter()
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({"shift"}, 'i', function()
  backward_line()
  normal:exit()
  emacs:enter()
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({}, 'a', function()
  right()
  normal:exit()
  emacs:enter()
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({"shift"}, 'a', function()
  forward_line()
  normal:exit()
  emacs:enter()
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({}, 'o', nil, function()
  forward_line()
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({}, "Return")
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({"shift"}, 'o', nil, function()
  backward_line()
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({}, "Return")
  hs.eventtap.keyStroke({}, "Up")
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
end)

normal:bind({"shift"}, 'D', nil, function()
  normal:exit()
  emacs:enter()
  hs.eventtap.keyStroke({"ctrl"}, "k")
  normal:enter()
end)

normal:bind({}, 's', function()
  normal:exit()
  emacs:enter()
  notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    emacs_image
  )
  fndelete()
end)

-- Search
normal:bind({}, '/', function() hs.eventtap.keyStroke({"cmd"}, "f") end)

-- Undo
normal:bind({}, 'u', function()
  hs.eventtap.keyStroke({"cmd"}, "z")
end)

-- Redo
normal:bind({"ctrl"}, 'r', function()
  hs.eventtap.keyStroke({"cmd", "shift"}, "z")
end)

-- Yank
normal:bind({}, 'y', function()
  hs.eventtap.keyStroke({"cmd"}, "c")
end)

-- Paste
normal:bind({}, 'p', function()
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

--------------------------------------------------------------------------------
-- Emacs
--
-- Mac already has a lot of emacs keybindings by default, which is why this mode
-- has less keybindings than the vim-mode
--------------------------------------------------------------------------------

-- Switch to vim normal mode
emacs:bind({}, 'escape', function()
  emacs:exit()
  normal:enter()
  notify_user(
    'Vim',
    'Vim-mode enabled. Enter \'insert-mode\' for emacs bindings',
    vim_image
  )
end)

-- Movement related bindings
emacs:bind({"alt"}, 'b', backward_word, nil, backward_word)
emacs:bind({"alt"}, 'f', forward_word, nil, forward_word)
emacs:bind({"alt", "shift"}, '[', forward_paragraph, nil, forward_paragraph)
emacs:bind({"alt", "shift"}, ']', backward_paragraph, nil, backward_paragraph)

-- Deletion related bindings
emacs:bind({"alt"}, 'delete', delete_word_forward, nil, delete_word_forward)
emacs:bind({"alt"}, 'd', delete_word_backward, nil, delete_word_backward)
