;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

;; diable the toolbar
(tool-bar-mode -1)

(require 'package) 
(setq package-archives '(;;("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Add jsshell to the load path
(add-to-list 'load-path "~/.emacs.d/jsshell/")

;; JSShell
(require 'jsshell-bundle)
;;; Borrowed this technique from http://superuser.com/a/684404
(with-eval-after-load 'js
  (define-key js-mode-map "\C-x\C-e" 'jsshell-send-last-sexp)
  (define-key js-mode-map "\C-c\C-e" 'jsshell-send-region))

