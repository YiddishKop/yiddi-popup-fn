;;; yiddi-popup-fn.el --- Pop footnotes for Emacs' org-mode

;; Copyright © 2017 yiddishkop

;; Author: yiddishkop <yiddishkop@gmail.com>
;; URL: TODO
;; Package-Version: 20170226.49
;; Package-Requires: ((popup "0.5.0") (org-mode TODO))
;; Version: 0.1
;; Created: 16 Mar 2017
;; Keywords: footnotes popup

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

;;; Commentary: TODO
;;
;; A simple Youdao Dictionary interface for Emacs
;; TODO
;; Below are commands you can use:
;; `youdao-dictionary-search-at-point'
;; Search word at point and display result with buffer
;; `youdao-dictionary-search-at-point+'
;; Search word at point and display result with popup-tip
;; `youdao-dictionary-search-from-input'
;; Search word from input and display result with buffer
;; `youdao-dictionary-search-and-replace'
;; Search word at point and display result with popup-menu, replace word with
;; selected translation.
;; `youdao-dictionary-play-voice-at-point'
;; Play voice of word at point (by [[https://github.com/snyh][@snyh]])
;; `youdao-dictionary-play-voice-from-input'
;; Play voice of word from input (by [[https://github.com/snyh][@snyh]])
;; `youdao-dictionary-search-at-point-tooltip'
;; Search word at point and display result with pos-tip

;;; Code:
(require 'org)
(require 'org-footnote)
(require 'popup)
(eval-when-compile (require 'names))

(defgroup yiddi-popup-fn nil
  "Pop footnotes for Emacs' org-mode."
  :prefix "yiddi/"
  :group 'tools
  :link '(url-link :tag "Github" "https://github.com/YiddishKop/yiddi-popup-fn.git/yiddi-pop-fn.el"))

;;;###autoload
(define-namespace yiddi/
(defcustom buffer-name "*Popup-Fn*"
  "Result Buffer name."
  :type 'string)

(define-derived-mode mode org-mode "Popup-fn"
  "Major mode for viewing fn result in org file."
  ;; (read-only-mode 1)
  ;; (define-key mode-map "q" 'quit-window)
  ;; (define-key mode-map "p" 'youdao-dictionary-play-voice-of-current-word)
  ;; (define-key mode-map "y" 'youdao-dictionary-play-voice-at-point)
  )

:autoload
(defun search-at-point ()
  "Search word at point and display result with popup-tip."
  (interactive)
  (if (org-footnote-at-reference-p)
      (popup-tip (nth 3 (org-footnote-get-definition)))
      (message "Nothing to look up")))
)


(provide 'yiddi-popup-fn)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; popup-fn.el ends here
