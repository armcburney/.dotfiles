;;; andrew-company.el --- Andrew's company mode definitions. Taken from
;;; oremacs (https://oremacs.com).

;; Author: Oleh Krehel <oleh@oremacs.com>
;; Maintainer: Andrew Robert McBurney <andrewrobertmcburney@gmail.com>
;; Created: 2018-11-28
;; Keywords: style

;; URL: https://github.com/AndrewMcBurney/emacs.d
;; Compatibility: only tested with Spacemacs (Emacs 25.0)
;; Version: 0.0.1
;; Last-Updated: 2018-11-28

;;; Commentary:

;; Andrew's company mode definitions.

;;; Code:

(require 'company)
(require 'company-elisp)

(setq company-show-numbers t)

(defun andrew-company-number ()
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (or (cl-find-if (lambda (s) (string-match re s))
                        company-candidates)
            (> (string-to-number k)
               (length company-candidates)))
        (self-insert-command 1)
      (company-complete-number
       (if (equal k "0")
           10
         (string-to-number k))))))

(let ((map company-active-map))
  (mapc (lambda (x) (define-key map (format "%d" x) 'andrew-company-number))
        (number-sequence 0 9))
  (define-key map " " (lambda ()
                        (interactive)
                        (company-abort)
                        (self-insert-command 1)))
  (define-key map (kbd "<return>") nil))

(provide 'andrew-company)

;;; andrew-company.el ends here
