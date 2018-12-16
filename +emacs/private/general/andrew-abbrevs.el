;;; andrew-abbrevs.el --- Fix abbrevs with abbrev-mode

;; Copyright (C) 2017 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2017-08-07
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2017-08-07

;;; License: GPLv3

;;; Commentary:

;; Fix abbrevs with abbrev-mode

;;; Code:

(define-abbrev-table 'global-abbrev-table '())

(define-abbrev-table 'eshell-mode-abbrev-table
  '(
    ("gcr" "git commit -m\"r\"" nil 3)
    ("l" "ls -CF" nil 3)
    ("la" "ls -A" nil 3)
    ("ll" "ls -alF" nil 3)
    ("ls" "ls -G" nil 3)
    ("k9" "kill -9" nil 3)
    ("port" "lsof -i -P -n | grep" nil 3)
    ))

(define-abbrev-table 'text-mode-abbrev-table
  '(
    ("i" "I" nil 3)
    ))

(define-abbrev-table 'markdown-mode-abbrev-table
  '(
    ("i" "I" nil 3)
    ))

;; Use abbrev mode by default
(setq-default abbrev-mode t)

(provide 'andrew-abbrevs)

;;; andrew-abbrevs.el ends here
