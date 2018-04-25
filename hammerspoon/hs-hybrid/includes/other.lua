--------------------------------------------------------------------------------
-- Other functions
--
-- @see
--------------------------------------------------------------------------------

local other = {}

function other.undo()
  hs.eventtap.keyStroke({"cmd"}, "z")
end

function other.paste()
  hs.eventtap.keyStroke({"cmd"}, "v")
end

function other.vim_a()
  mode.enter_emacs()
  move.right()
end

function other.vim_shift_a()
  mode.enter_emacs()
  move.forward_line()
end

function other.vim_shift_g()
  hs.eventtap.keyStroke({"cmd"}, "Down")
end

function other.vim_i()
  mode.enter_emacs()
end

function other.vim_shift_i()
  mode.enter_emacs()
  move.backward_line()
end

function other.vim_o()
  move.forward_line()
  hs.eventtap.keyStroke({}, "Return")
end

function other.vim_shift_o()
  print("implement me")
end

function other.notify_user(title, text, image)
  hs.notify.new({title=title, informativeText=text}):setIdImage(image):send()
end

return other
