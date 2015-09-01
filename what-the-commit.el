;;; what-the-commit.el --- Random commit message generator

;; Copyright (C) 2015 Free Software Foundation, Inc.
;; Author: Dan Barbarito <dan@barbarito.me>
;; Version: 1.0
;; Keywords: git, commit, message
;; URL: http://barbarito.me/
;; Created: 30th August 2015

;;; Commentary:

;; This package gets a random commit message from "whatthecommit.com" and adds it to your kill ring

;;; Code:

;;;###autoload
(defun what-the-commit ()
  "Get a random commit message from whatthecommit.com and adds it to the kill ring"
  (interactive)
    (let ((url-request-method "GET"))
      (url-retrieve "http://whatthecommit.com/index.txt"
        (lambda (status)
          (switch-to-buffer (current-buffer))
          (goto-char (point-min))
          (search-forward-regexp "^$")
          (delete-region (point) (point-min))
          (buffer-string)
          (beginning-of-buffer)
          (kill-line)
          (mark-whole-buffer)
          (kill-region (point-min) (point-max))
          (kill-buffer)
          (message "Commit message generated!")))))

(provide 'what-the-commit)
;;; what-the-commit.el ends here
