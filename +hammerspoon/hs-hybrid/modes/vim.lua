--------------------------------------------------------------------------------
-- Vim normal mode
--
-- @see: Keybindings for normal vim-mode.
--------------------------------------------------------------------------------

-- Current number stored for repeated keys
local number = 0

-- Updates current number stored for repeated keys
local function set_number(num)
  number = number .. num
end

-- Execute a function 'number' amount of times
local function execute(func)
  -- Execute function at least once, and no more than 20 times
  for i = 0, math.max( 0, math.min( number - 1, 20 ) ), 1 do
    func()
  end

  last_function = func
  number = 0
end

-- Lowercase
mode.normal:bind({}, 'a', function() other.vim_a() end)
mode.normal:bind({}, 'b', function() execute( move.backward_word ) end)
mode.normal:bind({}, 'd', function() mode.enter_delete_modal() end)
mode.normal:bind({}, 'e', function() execute( move.forward_word ) end)
mode.normal:bind({}, 'h', function() execute( move.left ) end)
mode.normal:bind({}, 'i', function() other.vim_i() end)
mode.normal:bind({}, 'j', function() execute( move.down ) end)
mode.normal:bind({}, 'k', function() execute( move.up ) end)
mode.normal:bind({}, 'l', function() execute( move.right ) end)
mode.normal:bind({}, 'o', function() other.vim_o() end)
mode.normal:bind({}, 'p', function() execute( paste ) end)
mode.normal:bind({}, 'u', function() execute( undo ) end)
mode.normal:bind({}, 'w', function() execute( move.forward_word ) end)
mode.normal:bind({}, 'x', function() execute( delete.fndelete ) end)

-- Uppercase
mode.normal:bind({"shift"}, 'a', function() other.vim_shift_a() end)
mode.normal:bind({"shift"}, 'g', function() other.vim_shift_g() end)
mode.normal:bind({"shift"}, 'i', function() other.vim_shift_i() end)
mode.normal:bind({"shift"}, 'o', function() other.vim_shift_o() end)

-- Numbers
mode.normal:bind({}, '0', function() set_number(0) end)
mode.normal:bind({}, '1', function() set_number(1) end)
mode.normal:bind({}, '2', function() set_number(2) end)
mode.normal:bind({}, '3', function() set_number(3) end)
mode.normal:bind({}, '4', function() set_number(4) end)
mode.normal:bind({}, '5', function() set_number(5) end)
mode.normal:bind({}, '6', function() set_number(6) end)
mode.normal:bind({}, '7', function() set_number(7) end)
mode.normal:bind({}, '8', function() set_number(8) end)
mode.normal:bind({}, '9', function() set_number(9) end)

-- Symbols
mode.normal:bind({"shift"}, '0', function() end)
mode.normal:bind({"shift"}, '1', function() end)
mode.normal:bind({"shift"}, '2', function() end)
mode.normal:bind({"shift"}, '3', function() end)
mode.normal:bind({"shift"}, '4', function() execute( move.forward_line ) end)
mode.normal:bind({"shift"}, '5', function() end)
mode.normal:bind({"shift"}, '6', function() execute( move.backward_line ) end)
mode.normal:bind({"shift"}, '7', function() end)
mode.normal:bind({"shift"}, '8', function() end)
mode.normal:bind({"shift"}, '9', function() end)

-- Other
mode.normal:bind({}, '.', function() execute( last_function ) end)
mode.normal:bind({}, 'escape', function() number = 0 end)

--------------------------------------------------------------------------------
-- Vim delete mode
--
-- @see: Special modal mode for deletion related keybindings once 'd' key has
-- been pressed
--------------------------------------------------------------------------------

mode.vim_delete:bind({}, 'b', function() execute( delete.vim.word_backward ) end)
mode.vim_delete:bind({}, 'd', function() execute( delete.vim.line ) end)
mode.vim_delete:bind({}, 'e', function() execute( delete.vim.word_forward ) end)
mode.vim_delete:bind({}, 'w', function() execute( delete.vim.word_forward ) end)

mode.vim_delete:bind({"shift"}, '4', function()
  execute( delete.vim.forward_line )
end)

mode.vim_delete:bind({"shift"}, '6', function()
  execute( delete.vim.backward_line )
end)
