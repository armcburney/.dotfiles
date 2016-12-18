;;
;; .emacs config file
;; Andrew McBurney
;;

;; color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/atom-one-dark-theme/")
(load-theme 'atom-one-dark t)

;; disable scroll bar
(scroll-bar-mode -1)
;; disable tool bar
(tool-bar-mode -1)
