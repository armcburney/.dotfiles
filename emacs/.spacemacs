;;; .spacemacs --- Configuration file for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Andrew R. McBurney <andrewrobertmcburney@gmail.com>
;; URL: https://github.com/AndrewMcBurney/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun dotspacemacs/layers ()
  "Spacemacs configuration layers."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; C/C++ layer
     ;; Based on Google's C++ style guide
     (c-c++
      :variables
      c-c++-default-mode-for-headers 'c++-mode
      c-c++-enable-clang-support t
      standard-indent 2
      set-fill-column 80)

     ;; Crystal layer
     (crystal)

     ;; CSV layer
     (csv)

     ;; BEAM VM
     (elixir)
     (erlang)

     ;; Emacs Lisp layer
     (emacs-lisp)

     ;; HTML & CSS layer
     (html
      :variables
      standard-indent 2
      set-fill-column 100)

     ;; Java layer
     ;; Based on Google's Java style guide
     (java
      :variables
      standard-indent 2
      set-fill-column 100)

     ;; JavaScript layer
     ;; Based on AirBnb's JS style guide
     (javascript
      :variables
      standard-indent 2
      set-fill-column 100)

     ;; Lua layer
     ;; Based on Olivine Labs style guide
     (lua
      :variables
      standard-indent 2
      set-fill-column 80)

     ;; Markdown layer
     (markdown
      :variables
      markdown-live-preview-engine 'vmd)

     ;; Python layer
     ;; Based on PEP8 specification
     (python
      :variables
      set-fill-column 80)

     ;; Ruby layer
     ;; Based on Rubocop specification
     (ruby
      :variables
      ruby-version-manager 'rvm
      ruby-enable-ruby-on-rails-support t
      set-fill-column 80)

     (ruby-on-rails)

     ;; Scala layer
     ;; Based on Databricks Scala style guide
     (scala
      :variables
      scala-indent:use-javadoc-style t
      scala-use-java-doc-style t
      scala-auto-insert-asterisk-in-comments t
      scala-use-unicode-arrows t
      scala-auto-start-ensime t
      set-fill-column 100)

     ;; Shell layer
     (shell
      :variables
      shell-default-term-shell 'ansi-term
      shell-default-height 30
      shell-default-position 'bottom)

     ;; SQL layer
     (sql)

     ;; TypeScript layer
     ;; Based on Microsoft's TS style guide and AirBnb's JS style guide
     (typescript
      :variables
      typescript-fmt-on-save t
      standard-indent 4
      set-fill-column 100)

     ;; Vim Script layer
     (vimscript)

     ;; Yaml layer
     (yaml)

     ;; Other layers
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-return-key-behavior 'complete
      auto-completion-tab-key-behavior 'cycle
      auto-completion-complete-with-key-sequence nil
      auto-completion-complete-with-key-sequence-delay 0.1
      auto-completion-private-snippets-directory nil)
     (better-defaults)
     (chrome)
     (dash)
     (emoji)
     (git)
     (helm)
     (osx)
     (pdf-tools)
     (react)
     (search-engine)
     (slack)
     (spell-checking)
     (syntax-checking)
     (twitter)
     (version-control)
     (wakatime
      :variables
      wakatime-api-key  "70253e4e-195a-4cc7-90d8-be6a94b4733c"
      wakatime-cli-path "/usr/local/bin/wakatime"))
   dotspacemacs-additional-packages '(skeletor)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))


(defun dotspacemacs/init ()
  "Initialization for spacemacs defaults."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((todos . 5) (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(atom-one-dark zenburn dichromacy)
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
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all))


(defun dotspacemacs/user-init ()
  "Initialization function for user code."

  ;; Move custom-set-variables to a separate file
  (setq custom-file (file-truename (concat user-emacs-directory "custom.el")))
  (load custom-file)

  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  (add-hook 'focus-out-hook (lambda () (save-some-buffers t))))


(defun dotspacemacs/user-config ()
  "User configuration code."

  ;; Set ensime startup notifications off
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil)

  ;; sets the background to transparent if emacs is being run from the terminal
  (add-hook 'after-make-frame-functions
            '(lambda (frame)
               (select-frame frame)
               (if window-system
                   nil
                 (unless (display-graphic-p (selected-frame))
                   (set-face-background 'default "unspecified-bg" (selected-frame))))))

  ;; set window transparency
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85))

  (setq skeletor-project-directory "~/coding/projects/")
  (setq skeletor-user-directory "~/.skeletons")

  (skeletor-define-template "sinatra"
    :after-creation
    (lambda (dir)
      (skeletor-async-shell-command "echo 'built'")))

  ;; Global modes
  (global-company-mode t)
  (global-auto-complete-mode t)
  (global-prettify-symbols-mode t)
  (global-linum-mode t)
  (spacemacs/toggle-camel-case-motion-globally)

  ;; Turn on visual line mode
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)

  (setq powerline-default-separator 'utf-8)

  ;; Enable mouse support
  (unless window-system
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line)))
