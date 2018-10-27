;;; andrew-style.el --- General Spacemacs style configuration

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

;; General Spacemacs style configuration
;;
;; Turns on visual line mode, sets the default powerline separator, and enables
;; mouse support for scrolling upwards and downwards

;;; Code:

;; Turn on visual line mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(defvar powerline-default-separator)
(setq powerline-default-separator 'utf-8)

;; Enable mouse support
(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(provide 'andrew-style)

;;; andrew-style.el ends here
