;; -*- mode: emacs-lisp -*-

;; *****************************************************************************
;; My .spacemacs configuration file
;; Maintained by: Andrew McBurney
;; *****************************************************************************

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; ************************************************************************
     ;; Language Layers
     ;; ************************************************************************

     c-c++
     emacs-lisp
     erlang
     html
     java
     javascript
     lua
     markdown
     python
     (ruby :variables
           ruby-version-manager `rvm)
     ruby-on-rails
     scala
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/zsh")
     sql
     swift
     typescript
     yaml

     ;; ************************************************************************
     ;; Other
     ;; ************************************************************************

     dash
     slack
     pdf-tools
     emoji
     chrome
     helm
     search-engine
     auto-completion
     better-defaults
     git
     spell-checking
     syntax-checking
     version-control
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((todos . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(atom-one-dark
                         minimal-light)
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
   dotspacemacs-maximized-at-startup nil
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
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code."
  )

(defun dotspacemacs/user-config ()
  "User config code"

  ;; ***************************************************************************
  ;; Startup
  ;; ***************************************************************************

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

  ;; ***************************************************************************
  ;; Language Specific
  ;; ***************************************************************************

  ;; Use default version of rvm
  (rvm-use-default)

  ;; Use c++ 11
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

  ;; ***************************************************************************
  ;; Indentation
  ;; ***************************************************************************

  ;; Java, C, C++ indentation
  (setq c-basic-offset 2)

  ;; Fix indentation in JavaScript
  (setq js-indent-level                 2
        js2-basic-offset                2
        js-switch-indent-offset         2
        js2-indent-switch-body          2
        js2-strict-missing-semi-warning t)

  ;; ***************************************************************************
  ;; Emerald
  ;; ***************************************************************************

  ;; Emacs Lisp emerald mode
  (load "~/Coding/emerald/emerald-emacs/emerald-mode.el")
  (require 'emerald-mode)

  ;; ***************************************************************************
  ;; Other
  ;; ***************************************************************************

  ;; autocomplete in every buffer
  (global-company-mode t)

  ;; Run multi-term as a login shell
  (setq multi-term-program-switches "--login")

  ;; Turn on visual line mode
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)

  ;; Use zsh for multi-term
  (setq multi-term-program "/bin/zsh")

  ;; powerline separator (utf-8)
  (setq powerline-default-separator 'utf-8)

  ;; Enable mouse support
  (unless window-system
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

  ;; Adds space between line-number in terminal mode
  (unless (display-graphic-p)
    (load "~/.emacs.d/private/evil-terminal-cursor-changer.el")
    (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate)
    (setq linum-relative-format "%3s ")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#424242" "#EF9A9A" "#C5E1A5" "#FFEE58" "#64B5F6" "#E1BEE7" "#80DEEA" "#E0E0E0"])
 '(beacon-color "#ec4780")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)) t)
 '(evil-insert-state-cursor (quote ("#E57373" bar)) t)
 '(evil-normal-state-cursor (quote ("#FFEE58" box)) t)
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)) t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#" t)
 '(frame-brackground-mode (quote dark))
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (quote (("#ec4780" . 0) ("#424242" . 100))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (sql-indent slack emojify circe oauth2 websocket ht projectile-rails inflections pdf-tools tablist gmail-message-mode ham-mode html-to-markdown feature-mode emoji-cheat-sheet-plus edit-server company-emoji alert log4e gntp wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel-dash counsel swiper ivy visual-fill-column solarized-theme evil-terminal-cursor-changer helm-dash dash-at-point erlang yaml-mode color-theme-sanityinc-solarized minimal-theme swift-mode disaster company-c-headers cmake-mode clang-format lua-mode tide typescript-mode gruber-darker-theme zenburn-theme apropospriate-theme ample-theme tao-theme yapfify xterm-color web-mode web-beautify tagedit smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org noflet mwim multi-term mmm-mode minitest markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode engine-mode emmet-mode diff-hl cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-anaconda company coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete atom-one-dark-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-foreground-color "#9E9E9E")
 '(tabbar-background-color "#353535")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "SourceCodePro+Powerline+Awesome Regular" :foundry "nil" :slant normal :weight normal :height 100 :width normal)))))
