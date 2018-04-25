;;; andrew-shell.el --- A few shell specific helper functions

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

;; A few shell specific helper functions:
;;  - Makes reverse search work in multiterm

;;; Code:

(defun bb/setup-term-mode ()
  (evil-local-set-key 'insert (kbd "C-r") 'bb/send-C-r))

(defun bb/send-C-r ()
  (interactive)
  (term-send-raw-string "\C-r"))

(add-hook 'term-mode-hook 'bb/setup-term-mode)

(provide 'andrew-shell)

;;; andrew-shell.el ends here
