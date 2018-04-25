;;; andrew-skeletor.el --- Skeletor templates and packages

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

;; Skeletor templates and packages

;;; Code:

(defvar skeletor-project-directory)
(defvar skeletor-user-directory)

(setq skeletor-project-directory "~/coding/projects/")
(setq skeletor-user-directory "~/.emacs.d/private/skeletons")

(skeletor-define-template "rails-es6")
(skeletor-define-template "ruby-base-project")
(skeletor-define-template "ruby-cli-activerecord")
(skeletor-define-template "scala-sbt-project")
(skeletor-define-template "sinatra-slim-sass-coffee")

(provide 'andrew-skeletor)

;;; andrew-skeletor.el ends here
