;;; Overrides to make Pallet work with Grail and directories other than ~/.emacs.d

(defun pallet--cask-file ()
  "Location of the Cask file."
  (expand-file-name "Cask" grail-elisp-root))
