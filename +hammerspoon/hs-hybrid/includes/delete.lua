--------------------------------------------------------------------------------
-- Deletion related functions
--
-- @see: Functions to handle deletions in vim
--------------------------------------------------------------------------------

local delete = {}

function delete.delete()
  hs.eventtap.keyStroke({}, "delete")
end

function delete.fndelete()
  move.right()
  delete.delete()
end

function delete.word_forward()
  hs.eventtap.keyStroke({"alt", "shift"}, "Right")
  delete.delete()
end

function delete.word_backward()
  hs.eventtap.keyStroke({"alt", "shift"}, "Left")
  delete.delete()
end

function delete.line()
  move.backward_line()
  hs.eventtap.keyStroke({"ctrl"}, "k")
  delete.delete()
  move.down()
end

delete.vim = {}

function delete.vim.line()
  delete.line()
  mode.enter_vim_normal()
end

function delete.vim.word_backward()
  delete.word_backward()
  mode.enter_vim_normal()
end

function delete.vim.word_forward()
  delete.word_forward()
  mode.enter_vim_normal()
end

function delete.vim.forward_line()
  hs.eventtap.keyStroke({"cmd", "shift"}, "Right")
  delete.delete()
  mode.enter_vim_normal()
end

function delete.vim.backward_line()
  hs.eventtap.keyStroke({"cmd", "shift"}, "Left")
  delete.delete()
  mode.enter_vim_normal()
end

return delete
