;;; andrew-javascript.el --- JavaScript mode configuration

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

;; JavaScript mode configuration
;; Fixes JavaScript default offset to be 2 spaces rather than 4

;;; Code:

(setq js-indent-level                 2
      js2-basic-offset                2
      js-switch-indent-offset         2
      js2-indent-switch-body          2
      js2-strict-missing-semi-warning t)

(provide 'andrew-javascript)

;;; andrew-javascript.el ends here
