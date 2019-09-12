;;; andrew-python.el --- Python specific functions.

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

;; Python specific functions.

;;; Code:

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'pyimport-remove-unused)
            (add-hook 'before-save-hook 'importmagic-fix-imports)
            (add-hook 'before-save-hook 'pyimpsort-buffer)
            (add-hook 'before-save-hook 'blacken-buffer)))

(provide 'andrew-python)

;;; andrew-python.el ends here
