;; -*- mode: emacs-lisp; lexical-binding: t -*-

;;; .spacemacs --- Configuration file for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>

;; URL: https://github.com/AndrewMcBurney/.dotfiles
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2010-02-01

;;; License: GPLv3

;;; Commentary:

;; My personal Spacemacs configuration file.

;;; Code:

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;;; Language layers.
     (c-c++
      :variables
      c-c++-default-mode-for-headers 'c++-mode
      c-c++-enable-clang-support t)
     (csv)
     (emacs-lisp)
     (go
      :variables
      go-tab-width 2)
     (html
      :variables
      set-fill-column 100)
     (java
      :variables
      set-fill-column 100)
     (javascript
      :variables
      set-fill-column 100)
     (lua)
     (markdown
      :variables
      markdown-live-preview-engine 'vmd)
     (protobuf)
     (python
      :variables
      python-enable-yapf-format-on-save t)
     (ruby
      :variables
      ruby-version-manager 'rbenv
      ruby-enable-ruby-on-rails-support t
      ruby-test-runner 'rspec)
     (ruby-on-rails)
     (scala
      :variables
      scala-indent:use-javadoc-style t
      scala-use-java-doc-style t
      scala-auto-insert-asterisk-in-comments t
      scala-auto-start-ensime t
      set-fill-column 120)
     (shell
      :variables
      shell-default-height 30
      shell-default-position 'bottom
      shell-default-shell 'multi-term)
     (sql)
     (swift)
     (typescript
      :variables
      typescript-fmt-on-save t
      set-fill-column 100)
     (yaml)

     ;;; General layers.
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-enable-help-tooltip t
      auto-completion-enable-sort-by-usage t
      auto-completion-return-key-behavior 'complete
      auto-completion-tab-key-behavior 'cycle
      auto-completion-complete-with-key-sequence nil
      auto-completion-complete-with-key-sequence-delay 0.01
      auto-completion-private-snippets-directory t)
     (chrome)
     (cscope)
     (dash)
     (docker)
     (emoji)
     (finance)
     (git
      :variables
      git-magit-status-fullscreen t)
     (github)
     (helm)
     (ibuffer
      :variables
      ibuffer-group-buffers-by 'projects)
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp")
     (multiple-cursors)
     (neotree)
     (org
      :variables
      org-ellipsis " ⤵"
      org-hide-leading-stars t
      org-enable-github-support t
      org-enable-bootstrap-support t
      org-enable-org-journal-support t
      org-journal-dir "~/me/journal/"
      )
     (osx)
     (search-engine)
     (slack)
     (spotify)
     (spell-checking)
     (syntax-checking)
     (treemacs)
     (vagrant)
     (version-control)
     )

   dotspacemacs-additional-packages
   '(ag
     flycheck-package
     (zerodark-theme
      :location
      (recipe :fetcher github :repo "NicolasPetton/zerodark-theme"))
     (atom-one-dark-theme
      :location
      (recipe :fetcher github :repo "jonathanchu/atom-one-dark-theme"))
     (atom-one-light-theme
      :location
      (recipe :fetcher github :repo "jonathanchu/atom-one-light-theme"))
     (flycheck-ledger
      :location
      (recipe :fetcher github :repo "purcell/flycheck-ledger"))
     skeletor
     )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives nil
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (agenda . 5)
                                (todos . 5)
                                (projects . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(zerodark atom-one-dark atom-one-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("SourceCodePro+Powerline+Awesome Regular"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers '(:relative t)
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server t
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs t))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; Move custom-set-variables to a separate file.
  (setq custom-file
        (file-truename
         (concat "~/.dotfiles/+emacs/" "custom.el")))
  (load custom-file)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Fix: https://github.com/syl20bnr/spacemacs/issues/11640#issuecomment-441538099.
  (ido-mode -1)

  ;; Fix: https://github.com/syl20bnr/spacemacs/issues/10316.
  (setq yas-snippet-dirs
        '(
          "~/.emacs.d/private/snippets/"
          "~/.emacs.d/private/snippets/private/"))

  ;; Load all code from the `/private` directory.
  (let ((default-directory "~/.emacs.d/private/"))
    (normal-top-level-add-subdirs-to-load-path))

  ;; Make _ a word character for languages that use snake_case.
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (require 'andrew-company)
  (require 'andrew-global)
  (require 'andrew-helm)
  (require 'andrew-org)
  (require 'andrew-skeletor)
  (require 'andrew-style)
  (require 'andrew-terminal)
  (require 'andrew-transparent)
  (require 'andrew-c++-style)
  (require 'andrew-javascript)
  (require 'andrew-ruby)
  (require 'andrew-ensime)
  (require 'andrew-shell)
  (require 'andrew-web)
  )
