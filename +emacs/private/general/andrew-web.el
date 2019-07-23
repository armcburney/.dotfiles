;;; andrew-web.el --- A bunch of website shortcuts

;; Copyright (C) 2019 Andrew Robert McBurney

;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2019-07-22
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/emacs.d
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2019-07-22

;;; License: GPLv3

;;; Commentary:

;; A bunch of website shortcuts

;;; Code:

(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; GitHub

(defun arm/github ()
  "Opens a new tab on my browser with all my pull requests for a given repo."
  (interactive)
  (browse-url (format "https://github.com/DataDog/%s/pulls/armcburney" (read-string "Repository name: "))))

;; Product Management

(defun arm/trello ()
  "Opens a new tab on my browser with my trello."
  (interactive)
  (browse-url (getenv "WORK_TRELLO_BOARD")))

;; G Suite

(defun arm/calendar ()
  "Opens a new tab on my browser with my calendar."
  (interactive)
  (browse-url "https://calendar.google.com/calendar/r?pli=1"))

(defun arm/drive ()
  "Opens a new tab on my browser with my drive."
  (interactive)
  (browse-url "https://drive.google.com/drive/u/0/my-drive"))

(defun arm/gmail ()
  "Opens a new tab on my browser with my gmail."
  (interactive)
  (browse-url "https://mail.google.com/mail/u/0/#inbox"))

;; Datadog

(defun arm/dd-api ()
  "Opens a new tab on my browser with the Datadog API docs."
  (interactive)
  (browse-url "https://docs.datadoghq.com/api/?lang=ruby#overview"))

;; Create a new custom prefix for shortcuts to my important websites.
(spacemacs/declare-prefix "o" "websites")

;; GitHub
(spacemacs/set-leader-keys "og" 'arm/github)

;; Product Management
(spacemacs/set-leader-keys "ot" 'arm/trello)

;; G Suite
(spacemacs/set-leader-keys "oc" 'arm/calendar)
(spacemacs/set-leader-keys "of" 'arm/drive)
(spacemacs/set-leader-keys "om" 'arm/gmail)

;; Datadog
(spacemacs/set-leader-keys "oa" 'arm/dd-api)

(provide 'andrew-web)

;;; andrew-web.el ends here
