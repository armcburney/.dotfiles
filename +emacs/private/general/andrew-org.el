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

(require 'org-crypt)

(use-package org
  :config
  ;; Use indent-mode by default.
  (setq org-startup-indented t)

  ;; Don't export with a table of contents.
  (setq org-export-with-toc nil)
  (setq org-export-with-tags nil)

  ;; Unfold everything on startup.
  (setq org-inhibit-startup-visibility-stuff t)
  (setq epa-file-encrypt-to "andrewrobertmcburney@gmail.com")

  ;; Org-encrypt related files.
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-crypt-key "andrewrobertmcburney@gmail.com")
  (setq auto-save-default nil))

(use-package org-agenda
  :ensure nil
  :after org
  :custom
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-files '("~/me/"))
  (org-agenda-inhibit-startup t)
  (org-agenda-show-log t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-span 2)
  (org-agenda-start-on-weekday 6)
  (org-agenda-sticky nil)
  (org-agenda-tags-column -100)
  (org-agenda-time-grid '((daily today require-timed)))
  (org-agenda-use-tag-inheritance t)
  (org-directory "~/me")
  (org-enforce-todo-dependencies t)
  (org-habit-graph-column 80)
  (org-habit-show-habits-only-for-today nil)
  (org-track-ordered-property-with-tag t))

(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files (directory-files "~/me/friends/" t)))

(use-package org-journal
  :after org
  :custom
  (org-journal-enable-encryption t)
  (org-journal-file-format "%Y/%m/%d.org")
  (org-journal-time-format ""))

;; Wrap lines at 80 characters in org-mode.
(add-hook 'org-mode-hook #'auto-fill-mode)

(provide 'andrew-org)

;;; andrew-org.el ends here
