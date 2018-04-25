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

(if (display-graphic-p)
    (enable-theme 'atom-one-dark)
  (enable-theme 'lush))

;; Adds space between line-number in terminal mode
(unless (display-graphic-p)
  (load "~/.emacs.d/private/evil-terminal-cursor-changer.el")
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate)
  (setq linum-relative-format "%3s "))

;; Terminal mode hook to limit the maximum size (for performance)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

;;(evil-set-initial-state 'term-mode 'vim)

(provide 'andrew-terminal)

;;; andrew-terminal.el ends here
