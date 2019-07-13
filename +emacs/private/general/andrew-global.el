;;; andrew-global.el --- Spacemacs global modes configuration

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

;; Spacemacs global modes configuration
;;
;; Adds autocomplete in every buffer

;;; Code:

(global-company-mode t)
(global-auto-complete-mode t)
(global-prettify-symbols-mode t)
(spacemacs/toggle-camel-case-motion-globally)
(global-prettify-symbols-mode)

(setq locale-coding-system    'utf-8)
(set-terminal-coding-system   'utf-8)
(set-keyboard-coding-system   'utf-8)
(set-selection-coding-system  'utf-8)
(prefer-coding-system         'utf-8)
(set-language-environment     'utf-8)

;; IBuffer
(with-eval-after-load 'projectile
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "__pycache__")
  )

(provide 'andrew-global)

;;; andrew-global.el ends here
