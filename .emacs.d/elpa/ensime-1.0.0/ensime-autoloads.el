;;; ensime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "ensime" "ensime.el" (22615 15469 0 0))
;;; Generated autoloads from ensime.el

(autoload 'ensime "ensime" "\
Read config file for settings then start an ensime-server and connect.

\(fn)" t nil)

(autoload 'ensime-remote "ensime" "\
Read config file for settings. Then connect to an existing ENSIME server.

\(fn HOST PORT)" t nil)

;;;***

;;;### (autoloads nil "ensime-mode" "ensime-mode.el" (22615 15469
;;;;;;  0 0))
;;; Generated autoloads from ensime-mode.el

(autoload 'ensime-mode "ensime-mode" "\
ENSIME: The ENhanced Scala Interaction Mode for Emacs (minor-mode).
\\{ensime-mode-map}

\(fn &optional ARG)" t nil)

(add-hook 'scala-mode-hook 'ensime-mode)

;;;***

;;;### (autoloads nil nil ("ensime-auto-complete.el" "ensime-client.el"
;;;;;;  "ensime-comint-utils.el" "ensime-company.el" "ensime-completion-util.el"
;;;;;;  "ensime-config.el" "ensime-debug.el" "ensime-doc.el" "ensime-editor.el"
;;;;;;  "ensime-expand-region.el" "ensime-goto-testfile.el" "ensime-helm.el"
;;;;;;  "ensime-http.el" "ensime-inf.el" "ensime-inspector.el" "ensime-macros.el"
;;;;;;  "ensime-model.el" "ensime-notes.el" "ensime-pkg.el" "ensime-popup.el"
;;;;;;  "ensime-refactor.el" "ensime-sbt.el" "ensime-search.el" "ensime-semantic-highlight.el"
;;;;;;  "ensime-stacktrace.el" "ensime-startup.el" "ensime-ui.el"
;;;;;;  "ensime-undo.el" "ensime-util.el" "ensime-vars.el") (22615
;;;;;;  15469 453245 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ensime-autoloads.el ends here
