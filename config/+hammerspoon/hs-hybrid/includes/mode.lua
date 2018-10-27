--------------------------------------------------------------------------------
-- Change Mode Functions
--
-- @see: Functions to change mode and notify user of the changes
--------------------------------------------------------------------------------

local mode = {}

-- Modal keybindings
mode.emacs = hs.hotkey.modal.new()
mode.normal = hs.hotkey.modal.new()
mode.vim_delete = hs.hotkey.modal.new()

-- Boolean flag for hybrid mode
mode.hybrid_mode_enabled = false

-- Enter vim normal mode
function mode.enter_vim_normal()
  mode.emacs:exit()
  mode.vim_delete:exit()
  mode.normal:enter()
  other.notify_user(
    'Vim',
    'Vim-mode enabled. Enter \'insert-mode\' for emacs bindings',
    hs.image.imageFromPath("./hs-hybrid/images/vim.png")
  )
end

-- Enter vim delete mode
function mode.enter_delete_modal()
  mode.normal:exit()
  mode.vim_delete:enter()
end

-- Enter emacs / vim insert mode
function mode.enter_emacs()
  mode.normal:exit()
  mode.vim_delete:exit()
  mode.emacs:enter()
  other.notify_user(
    'Emacs',
    'Emacs-mode enabled. \'esc\' to enable Vim-mode',
    hs.image.imageFromPath("./hs-hybrid/images/emacs.png")
  )
  last_function = nil
end

-- Enable or disable hybrid mode
function mode.toggle_hybrid_mode()
  if mode.hybrid_mode_enabled then
    mode.hybrid_mode_enabled = false
    mode.normal:exit()
    mode.vim_delete:exit()
    mode.emacs:exit()
    other.notify_user(
      'Hybrid-mode Disabled',
      'Hybrid-mode disabled. \'command\' + \'esc\' to enable',
      hs.image.imageFromPath("./hs-hybrid/images/hybrid.png")
    )
  else
    mode.hybrid_mode_enabled = true
    mode.emacs:enter()
    other.notify_user(
      'Hybrid-mode Enabled',
      'Hybrid-mode enabled. \'command\' + \'esc\' to disable',
      hs.image.imageFromPath("../hs-hybrid/images/hybrid.png")
    )
  end
end

return mode
