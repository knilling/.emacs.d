;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

;; diable the toolbar
(tool-bar-mode -1)

;; enable line numbers
(global-linum-mode t)

;; don't wrap lines, by default
(set-default 'truncate-lines t)

(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)

;; Add customizations to the load path
(add-to-list 'load-path "~/.emacs.d/customizations/")

(if (not (eq system-type 'darwin))
    (progn
      ;; JSShell
      ;;; Add jsshell to the load path
      (add-to-list 'load-path "~/.emacs.d/jsshell/")
      (require 'jsshell-bundle)
      ;;; Borrowed this technique from http://superuser.com/a/684404
      (with-eval-after-load 'js
        (define-key js-mode-map "\C-x\C-e" 'jsshell-send-last-sexp)
        (define-key js-mode-map "\C-c\C-e" 'jsshell-send-region)
        (define-key js-mode-map "\C-\M-x"  'jsshell-send-last-sexp-and-pop)
        (define-key js-mode-map "\C-cb"    'jsshell-send-buffer)
        (define-key js-mode-map "\C-c\C-b" 'jsshell-send-buffer-and-pop)
        (define-key js-mode-map "\C-cl"    'jsshell-load-file-and-pop))
      )
  )

;; restcleint
;;; Add jsshell to the load path
(add-to-list 'load-path "~/.emacs.d/restclient/")
(require 'restclient)

;; Borrowing these from https://github.com/flyingmachine/emacs-for-clojure
;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")
