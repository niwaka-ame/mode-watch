;;; mode-watch.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Yu Huo
;;
;; Author: Yu Huo <yhuo@tuta.io>
;; Maintainer: Yu Huo <yhuo@tuta.io>
;; Created: September 16, 2024
;; Modified: September 16, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/niwaka-ame/mode-watch
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defvar mode-watch-filename (concat home-dir "/Desktop/test.txt"))

(defun mode-watch-write (dummy)
  (let ((mode (symbol-name major-mode)))
    (unless (string= mode "minibuffer-mode")
      (with-current-buffer (find-file-noselect mode-watch-filename)
        (goto-char (point-min))
        (let* ((first-line (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
               (prev-mode (car (split-string first-line "\t"))))
          (unless (string= mode prev-mode)
            (insert (concat mode "\t" (format "%.0f" (float-time)) "\n"))))
        (save-buffer)))))

(setq window-state-change-functions '(mode-watch-write))

(provide 'mode-watch)
;;; mode-watch.el ends here
