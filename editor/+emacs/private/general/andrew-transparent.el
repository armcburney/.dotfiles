;;; andrew-transparent.el --- Makes Emacs GUI semi-transparent

;; Copyright (C) 2017 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2017-07-13
;; Keywords: transparent

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with GNU Emacs 25.0
;; Version: 0.0.1
;; Last-Updated: 2017-07-13

;;; License: GPLv3

;;; Commentary:

;; Makes Emacs GUI semi-transparent

;;; Code:

;; Sets the background to transparent if emacs is being run from the terminal
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (select-frame frame)
             (if window-system
                 nil
               (unless (display-graphic-p (selected-frame))
                 (set-face-background 'default "unspecified-bg" (selected-frame))))))

(provide 'andrew-transparent)

;;; andrew-transparent.el ends here
