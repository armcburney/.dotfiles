;;; andrew-go.el --- Go specific functions.

;; Copyright (C) 2019 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2019-09-12
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/emacs.d
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2019-09-12

;;; License: GPLv3

;;; Commentary:

;; Go specific functions.

;;; Code:

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'go-remove-unused-imports)
            (add-hook 'before-save-hook 'gofmt)))

(provide 'andrew-go)

;;; andrew-go.el ends here
