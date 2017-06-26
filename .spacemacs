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

     ;; C/C++ layer
     ;; Based on Google's C++ style guide
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t
            standard-indent 2
            set-fill-column 80)

     crystal
     emacs-lisp
     html

     ;; Java layer
     ;; Based on Google's Java style guide
     (java :variables
           standard-indent 2
           set-fill-column 100)

     ;; JavaScript layer
     ;; Based on AirBnb's JS style guide
     (javascript :variables
                 standard-indent 2
                 set-fill-column 100)

     ;; Lua layer
     ;; Based on Olivine Labs style guide
     (lua :variables
          standard-indent 2
          set-fill-column 80)

     markdown

     ;; Python layer
     ;; Based on PEP8 specification
     (python :variables
             set-fill-column 80)

     ;; Ruby layer
     ;; Based on Rubocop specification
     (ruby :variables
           ruby-version-manager 'rvm
           ruby-enable-ruby-on-rails-support t
           set-fill-column 80)

     ruby-on-rails

     ;; Scala layer
     ;; Based on Databricks Scala style guide
     (scala :variables
            scala-indent:use-javadoc-style t
            scala-use-java-doc-style t
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows t
            scala-auto-start-ensime t
            set-fill-column 100)

     ;; Shell layer
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)

     sql

     swift

     ;; TypeScript layer
     ;; Based on Microsoft's TS style guide and AirBnb's JS style guide
     (typescript :variables
                 typescript-fmt-on-save t
                 standard-indent 4
                 set-fill-column 100)

     yaml

     ;; ************************************************************************
     ;; Other
     ;; ************************************************************************

     (wakatime :variables
               wakatime-api-key  "70253e4e-195a-4cc7-90d8-be6a94b4733c"
               wakatime-cli-path "/usr/local/bin/wakatime")
     osx
     dash
     slack
     pdf-tools
     twitter
     emoji
     chrome
     helm
     search-engine
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil)
     better-defaults
     git
     react
     spell-checking
     syntax-checking
     version-control
     )
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
   dotspacemacs-themes '(heroku)
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

  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

  ;; Use C++ 11
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11"))))

(defun dotspacemacs/user-config ()
  "User configuration code."

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
  ;; Global Modes
  ;; ***************************************************************************

  (global-company-mode t)
  (global-auto-complete-mode t)
  (global-prettify-symbols-mode t)
  (global-linum-mode t)
  (spacemacs/toggle-camel-case-motion-globally)

  ;; ***************************************************************************
  ;; Language Specific
  ;; ***************************************************************************

  ;; Eshell config: (setq read-file-name-completion-ignore-case t)

  ;; JavaScript should use 2 by default
  (setq js-indent-level                 2
        js2-basic-offset                2
        js-switch-indent-offset         2
        js2-indent-switch-body          2
        js2-strict-missing-semi-warning t)

  ;; SCSS mode for flycheck
  (add-hook 'scss-mode-hook 'flycheck-mode)

  ;; Bind clang-format-region to C-M-tab in all modes:
  (global-set-key [C-M-tab] 'clang-format-region)

  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [tab] 'clang-format-buffer))

  ;; ***************************************************************************
  ;; Emerald
  ;; ***************************************************************************

  ;; Emacs Lisp emerald mode
  ;;(load "~/.emacs.d/vendor/emerald-mode/emerald-mode.el")
  ;;(require 'emerald-mode)

  ;; ***************************************************************************
  ;; Other
  ;; ***************************************************************************

  ;;(load "~/.emacs.d/private/eshell-git-prompt/eshell-git-prompt.el")
  ;;(require 'eshell-git-prompt)

  ;; Save on exiting evil mode
  (defun my-save-if-bufferfilename ()
    (if (buffer-file-name)
        (progn (save-buffer))
      (message "no file is associated to this buffer: do nothing")))
  (add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)

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
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)) t)
 '(evil-insert-state-cursor (quote ("#E57373" bar)) t)
 '(evil-normal-state-cursor (quote ("#FFEE58" box)) t)
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)) t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#" t)
 '(frame-brackground-mode (quote dark))
 '(gnus-logo-colors (quote ("#1ec1c4" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
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
    (color-theme-solarized color-theme crystal-mode powerline reveal-in-osx-finder pbcopy spinner osx-trash osx-dictionary hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key packed f dash s helm avy helm-core async popup winum unfill fuzzy flymd grandshell-theme alect-themes ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode wakatime-mode diffscuss-mode launchctl twittering-mode sql-indent slack emojify circe oauth2 websocket ht projectile-rails inflections pdf-tools tablist gmail-message-mode ham-mode html-to-markdown feature-mode emoji-cheat-sheet-plus edit-server company-emoji alert log4e gntp wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel-dash counsel swiper ivy visual-fill-column solarized-theme evil-terminal-cursor-changer helm-dash dash-at-point erlang yaml-mode color-theme-sanityinc-solarized minimal-theme swift-mode disaster company-c-headers cmake-mode clang-format lua-mode tide typescript-mode gruber-darker-theme zenburn-theme apropospriate-theme ample-theme tao-theme yapfify xterm-color web-mode web-beautify tagedit smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org noflet mwim multi-term mmm-mode minitest markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode engine-mode emmet-mode diff-hl cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-anaconda company coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete atom-one-dark-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
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
 '(vc-annotate-very-old-color "#DC8CC3")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
