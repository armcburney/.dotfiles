--------------------------------------------------------------------------------
-- @module: hs-hybrid
--
-- @usage:  System-wide Vim and Emacs keybindings for Mac
-- @author: Andrew McBurney
--------------------------------------------------------------------------------

-- Table storing session vim history
local vim_history = ""

-- Empty function definition to eat up modal keypress in vim
local function nothing() end

-- Declare functions above definition
local listener

-- Boolean flag for hybrid mode
local hybrid_mode_enabled = false

-- Modal keybindings
local emacs  = hs.hotkey.modal.new()
local normal = hs.hotkey.modal.new()

-- Notify the user what mode they're in
local function notify_user(title, text, image)
  hs.notify.new({title=title, informativeText=text}):setIdImage(image):send()
end

--------------------------------------------------------------------------------
-- Change Mode Functions
--
-- @see: Functions to change mode and notify user of the changes
--------------------------------------------------------------------------------

-- Images for notifications
local vim_image    = hs.image.imageFromPath("./hs-hybrid/images/vim.png")
local emacs_image  = hs.image.imageFromPath("./hs-hybrid/images/emacs.png")
local hybrid_image = hs.image.imageFromPath("./hs-hybrid/images/hybrid.png")

-- Notification message informativeText
local vim_message = 'Vim-mode enabled. Enter \'insert-mode\' for emacs bindings'
local emacs_message  = 'Emacs-mode enabled. \'esc\' to enable Vim-mode'
local hybrid_enable  = 'Hybrid-mode enabled. \'command\' + \'esc\' to disable'
local hybrid_disable = 'Hybrid-mode disabled. \'command\' + \'esc\' to enable'

-- Enter vim normal mode
function enter_vim_normal()
  emacs:exit()
  normal:enter()
  listener:start()
  notify_user('Vim', vim_message, vim_image)
end

-- Enter emacs / vim insert mode
function enter_emacs()
  listener:stop()
  normal:exit()
  vim_history = ""
  emacs:enter()
  notify_user('Emacs', emacs_message, emacs_image)
end

-- Enable / Disable hybrid mode
hs.hotkey.bind({"cmd"}, "escape", function()
  if hybrid_mode_enabled then
    hybrid_mode_enabled = false
    vim_history = ""
    listener:stop()
    normal:exit()
    emacs:exit()
    notify_user('Hybrid-mode Disabled', hybrid_disable, hybrid_image)
  else
    hybrid_mode_enabled = true
    emacs:enter()
    notify_user('Hybrid-mode Enabled', hybrid_enable, hybrid_image)
  end
end)

--------------------------------------------------------------------------------
-- Binding Functions
--
-- @see: Functions for binding to modal key modes
--------------------------------------------------------------------------------

-- Movement related functions
local function right() hs.eventtap.keyStroke({}, "Right") end
local function left() hs.eventtap.keyStroke({}, "Left")end
local function up() hs.eventtap.keyStroke({}, "Up") end
local function down() hs.eventtap.keyStroke({}, "Down") end
local function forward_word() hs.eventtap.keyStroke({"alt"}, "Right") end
local function backward_word() hs.eventtap.keyStroke({"alt"}, "Left") end
local function forward_line() hs.eventtap.keyStroke({"cmd"}, "Right") end
local function backward_line() hs.eventtap.keyStroke({"cmd"}, "Left") end
local function forward_paragraph() hs.eventtap.keyStroke({"alt"}, "Up") end
local function backward_paragraph() hs.eventtap.keyStroke({"alt"}, "Down") end

-- Undo related functions
local function undo() hs.eventtap.keyStroke({"cmd"}, "z") end

-- Deletion related functions
local function delete() hs.eventtap.keyStroke({}, "delete") end
local function fndelete() right(); hs.eventtap.keyStroke({}, "delete") end
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
  delete()
end

-- Vim specific functions
local function vim_a() enter_emacs(); right(); delete() end
local function vim_shift_a() enter_emacs(); forward_line(); delete() end
local function vim_i() enter_emacs(); delete() end
local function vim_shift_i() enter_emacs(); backward_line(); delete() end
local function vim_o() forward_line(); hs.eventtap.keyStroke({}, "Return") end

--------------------------------------------------------------------------------
-- Vim Commands
--
-- @see: Table representing vim commands and key listener
--------------------------------------------------------------------------------

-- Table representation of vim commands
local vim = {}
vim["nil"] = nothing

-- Key to last used vim command
local last_vim_command = "nil"

-- Non-terminal commands
vim[""]  = ""
vim["d"] = ""

vim["a"] = vim_a
vim["A"] = vim_shift_a
vim["i"] = vim_i
vim["I"] = vim_shift_i
vim["o"] = vim_o
vim["O"] = vim_shift_o
vim["u"] = undo

-- Movement related bindings
vim["h"] = left
vim["l"] = right
vim["k"] = up
vim["j"] = down
vim["b"] = backward_word
vim["e"] = forward_word

-- Deletion related bindings
vim["x"]  = fndelete
vim["dd"] = delete_line
vim["db"] = delete_word_backward
vim["dw"] = delete_word_forward

-- Event listener for keys, used in vim normal mode
listener = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
  local key_code    = e:getKeyCode()
  local key_pressed = e:getCharacters()
  print(key_code)

  if key_code == 14 then
    vim[last_vim_command]()
  elseif key_code >= 0 and key_code < 51 then
    vim_history = vim_history .. key_pressed
  else
    return false
  end

  print(vim_history)

  if type(vim[vim_history]) == "function" then
    vim[vim_history]()
    last_vim_command = vim_history
    vim_history = ""
  end
end)

--------------------------------------------------------------------------------
-- Vim
--
-- @see: Keybindings for normal vim-mode. Bind these to nil so they don't have
-- an effect on the key listener
--------------------------------------------------------------------------------

normal:bind({}, '.', nothing, nil)
normal:bind({}, 'a', nothing, nil)
normal:bind({"shift"}, 'a', nothing, nil)
normal:bind({}, 'b', nothing, nil)
normal:bind({}, 'd', nothing, nil)
normal:bind({}, 'e', nothing, nil)
normal:bind({}, 'i', nothing, nil)
normal:bind({"shift"}, 'i', nothing, nil)
normal:bind({}, 'o', nothing, nil)
normal:bind({}, 'u', nothing, nil)
normal:bind({}, 'w', nothing, nil)
normal:bind({}, 'x', nothing, nil)
normal:bind({"shift"}, '4', forward_line, nil, forward_line)   -- $
normal:bind({"shift"}, '6', backward_line, nil, backward_line) -- ^
normal:bind({}, 'p', function() hs.eventtap.keyStroke({"cmd"}, "v") end)
normal:bind({}, 'escape', function() vim_history = "" end)

--------------------------------------------------------------------------------
-- Emacs
--
-- @see: Mac already has a lot of emacs keybindings by default, which is why
-- this mode has less keybindings than the vim-mode
--------------------------------------------------------------------------------

-- Switch to vim normal mode
emacs:bind({}, 'escape', function() enter_vim_normal() end)

-- Movement related bindings
emacs:bind({"alt"}, 'b', backward_word, nil, backward_word)
emacs:bind({"alt"}, 'f', forward_word, nil, forward_word)
emacs:bind({"alt", "shift"}, '[', forward_paragraph, nil, forward_paragraph)
emacs:bind({"alt", "shift"}, ']', backward_paragraph, nil, backward_paragraph)

-- Deletion related bindings
emacs:bind({"alt"}, 'delete', delete_word_forward, nil, delete_word_forward)
emacs:bind({"alt"}, 'd', delete_word_backward, nil, delete_word_backward)
