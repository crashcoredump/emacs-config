;; This file will bootstrap a fresh VCS checkout on a vanilla Emacs
;; install and bring it up to the state where the Grail & Pallet
;; dependency management can kick in.

;; See README on how to use

(global-set-key (kbd "\C-c \C-c") 'eval-defun)

(if (not (fboundp 'package-desc-vers))
    (defalias 'package-desc-vers 'package--ac-desc-version))

(defun bootstrap-melpa ()
  (let* ((my-path (or load-file-name
		      (buffer-file-name)))
         (my-dir (file-name-directory my-path)))
    (unless (require 'package nil t)
      (grail-install-elpa))
    (save-excursion
      (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
      (when (< emacs-major-version 24)
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))))))

(defun bootstrap-pallet ()
  (package-refresh-contents)
  (package-install 'pallet))

(defun bootstrap-packages ()
  ;; Need to force it
  (require 'cask)
  (require 'pallet)
  (load-library "pallet-overrides")
  (pallet-install))

(defun bootstrap-finish ()
  (display-about-screen)
  (delete-other-windows)
  (message "Bootstrap complete!"))

(bootstrap-melpa)
(bootstrap-pallet)
(bootstrap-packages)
(bootstrap-finish)
