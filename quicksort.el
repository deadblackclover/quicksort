;;; quicksort.el --- Quicksort sorting algorithm

;; Copyright (C) 2023 DEADBLACKCLOVER

;; Author: DEADBLACKCLOVER <deadblackclover@protonmail.com>
;; Version: 0.1.0
;; URL: https://github.com/deadblackclover/quicksort
;; Package-Requires: ((emacs "25.1"))

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

;; Quicksort is an efficient, general-purpose sorting algorithm.

;;; Code:
(require 'cl-lib)

(defgroup quicksort nil
  "Quicksort is an efficient, general-purpose sorting algorithm."
  :group 'comms
  :prefix "quicksort-")

(defun quicksort-lower (x xs)
  "Selection from the XS of elements less than X."
  (quicksort (seq-filter (apply-partially #'>= x) xs)))

(defun quicksort-higher (x xs)
  "Selection from the XS of elements greater than X."
  (quicksort (seq-filter (apply-partially #'< x) xs)))

(defun quicksort-sort (items)
  "Sorting ITEMS by quicksort method."
  (let ((x (car items))
        (xs (cdr items)))
    (append (quicksort-lower x xs)
            (list x)
            (quicksort-higher x xs))))

(defun quicksort (items)
  "Sorting ITEMS by quicksort method."
  (if (null items)
      (list)
    (quicksort-sort items)))

(provide 'quicksort)
;;; quicksort.el ends here
