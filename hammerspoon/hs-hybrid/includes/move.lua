--------------------------------------------------------------------------------
-- Movement related functions
--
-- @see: Functions related to movement, used by vim and emacs keybindings
--------------------------------------------------------------------------------

local move = {}

function move.right()
  hs.eventtap.keyStroke({}, "Right")
end

function move.left()
  hs.eventtap.keyStroke({}, "Left")
end

function move.up()
  hs.eventtap.keyStroke({}, "Up")
end

function move.down()
  hs.eventtap.keyStroke({}, "Down")
end

function move.forward_word()
  hs.eventtap.keyStroke({"alt"}, "Right")
end

function move.backward_word()
  hs.eventtap.keyStroke({"alt"}, "Left")
end

function move.forward_line()
  hs.eventtap.keyStroke({"cmd"}, "Right")
end

function move.backward_line()
  hs.eventtap.keyStroke({"cmd"}, "Left")
end

function move.forward_paragraph()
  hs.eventtap.keyStroke({"alt"}, "Up")
end

function move.backward_paragraph()
  hs.eventtap.keyStroke({"alt"}, "Down")
end

return move
