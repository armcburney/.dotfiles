;;; andrew-ruby.el --- Ruby-specific configuration

;; Copyright (C) 2018 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2018-02-01
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2018-02-01

;;; License: GPLv3

;;; Commentary:

;; Ruby-specific configuration

;;; Code:

;; Highlight Vagrantfile as Ruby
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(provide 'andrew-ruby)

;;; andrew-ruby.el ends here
