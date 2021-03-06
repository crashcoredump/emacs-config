;; Look at README for description of how the packages and dependencies
;; are managed, and how to initialise and fetch packages on a fresh
;; Emacs

;; Pallet takes care of summarising installed packages as a Cask manifest
(require 'pallet)
;; We need to coax it to play nice with grail
(load-library "pallet-overrides")

;;; Customisations begin here
(require 'ls-lisp)

(add-to-list 'Info-directory-list (expand-file-name "info" grail-elisp-root))

(server-mode t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/projects.org"
                             "~/org/misc.org"))

(set-language-environment "UTF-8")

(setq diff-switches "-u")
(setq ediff-custom-diff-options "-u")
