;;; andrew-org.el --- Org-mode configuration.

;; Copyright (C) 2018 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2018-10-27
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/emacs.d
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2018-10-27

;;; License: GPLv3

;;; Commentary:

;; Org-mode configuration.

;;; Code:

;; Don't export with a table of contents
(setq org-export-with-toc nil)
(setq org-export-with-tags nil)

;; Use indent-mode by default.
(use-package org
  :config
  (setq org-startup-indented t))

;; Wrap lines at 80 characters in org-mode.
(add-hook 'org-mode-hook #'auto-fill-mode)

(provide 'andrew-org)

;;; andrew-org.el ends here
