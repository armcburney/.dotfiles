;;
;; .emacs config file
;; Andrew McBurney
;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/atom-one-dark-theme/")
(add-to-list 'exec-path "/usr/local/bin")

(load-theme 'atom-one-dark t)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 2)

;; modes
(electric-indent-mode 0)

;;
;; Package manager
;;
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;
;; Packages
;;
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package ensime
  :ensure t
  :pin melpa-stable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
