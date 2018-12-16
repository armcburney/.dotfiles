;;; andrew-helm.el --- Helm and Projectile related configuration

;; Copyright (C) 2017 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2017-07-14
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2017-07-14

;;; License: GPLv3

;;; Commentary:

;; Helm and Projectile related configuration
;; - Use ag instead of default
;; - Use caching for projectile projects

;;; Code:

(setq helm-ag-base-command "/usr/local/bin/ag --vimgrep")
(setq helm-ag-use-agignore t)
(setq projectile-enable-caching t)

(provide 'andrew-helm)

;;; andrew-helm.el ends here
