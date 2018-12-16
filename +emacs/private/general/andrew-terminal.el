;;; andrew-terminal.el --- Terminal specific configuration for emacs daemon

;; Copyright (C) 2017 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2017-07-13
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2017-07-13

;;; License: GPLv3

;;; Commentary:

;; Terminal specific configuration for emacs daemon

;;; Code:

(unless (display-graphic-p)
  ;; Load the script to fix the issue with iterm cursors.
  (load "~/.emacs.d/private/evil-terminal-cursor-changer.el")
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate)

  ;; Adds space between line-number in terminal mode
  (setq linum-relative-format "%3s "))

;; Set the background to nil in terminal mode.
(custom-set-faces (if (not window-system)
                      '(default ((t (:background "nil"))))))

;; Terminal mode hook to limit the maximum size (for performance)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 5000)))

(provide 'andrew-terminal)

;;; andrew-terminal.el ends here
