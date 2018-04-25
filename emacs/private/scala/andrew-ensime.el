;;; andrew-ensime.el --- Ensime related configuration

;; Copyright (C) 2017 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2017-07-13
;; Keywords: scala, ensime

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2017-07-13

;;; License: GPLv3

;;; Commentary:

;; Ensime related configuration

;;; Code:

;; Set ensime startup notifications off
(defvar ensime-startup-notification)
(defvar ensime-startup-snapshot-notification)

(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)

(provide 'andrew-ensime)

;;; andrew-ensime.el ends here
