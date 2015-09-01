;;; what-the-commit.el --- Random commit message generator

;; Copyright (C) 2015 Free Software Foundation, Inc.
;; Author: Dan Barbarito <dan@barbarito.me>
;; Version: 1.0
;; Keywords: git, commit, message
;; URL: http://barbarito.me/
;; Created: 30th August 2015

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package gets a random commit message from "whatthecommit.com"
;; and adds it to your kill ring

;;; Code:

(defvar url-http-end-of-headers)

;;;###autoload
(defun what-the-commit ()
  "Get a random commit message from whatthecommit.com and add it to the kill ring."
  (interactive)
  (let ((url-request-method "GET"))
    (url-retrieve "http://whatthecommit.com/index.txt"
                  (lambda (status)
                    (goto-char url-http-end-of-headers)
                    (forward-line 1)
                    (copy-region-as-kill (point) (point-max))
                    (kill-buffer)
                    (message "Commit message generated!")))))

(provide 'what-the-commit)
;;; what-the-commit.el ends here
