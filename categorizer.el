;; 
;; categorizer.el
;; --------------

;; Author: Michael Dickens <mdickens93@gmail.com>
;; Created: 2016-07-05

;;; Commentary:

;; Useful utilities for managing org-mode tags.


;;; Code:

(defun random-entry-with-tags ()
  "Choose a random entry from the list of tagged entries returned
  by `org-tags-view'. See `org-tags-view' for tag search syntax."
  (interactive)
  (org-tags-view)
  (next-line) ; skip header lines
  (next-line)
  (setq num-lines (count-lines (point) (point-max)))
  (setq chosen-line-num (random num-lines))
  (dotimes (_ chosen-line-num _)
    (next-line))
  (beginning-of-line)
  (set-mark (point))
  (next-line)
  (kill-ring-save (mark) (point))
  (pop-mark)
  (kill-this-buffer)
  (setq buf (generate-new-buffer "*Random Entry*"))
  (switch-to-buffer buf)
  (yank)
  (beginning-of-line))

(provide 'categorizer)

;;; categorizer.el ends here
