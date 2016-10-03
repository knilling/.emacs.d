;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

;; diable the toolbar
(tool-bar-mode -1)

;; enable line numbers
(global-linum-mode t)

;; don't wrap lines, by default
(set-default 'truncate-lines t)

;; adjust default font
(set-face-attribute 'default nil :height 140)
(if (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :family "Consolas"))

;;;;;;;;;;;;;;
;; PACKAGES ;;
;;;;;;;;;;;;;;
;; https://melpa.org/#/getting-started
(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;; https://marmalade-repo.org/
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)

;; Customize load path
(add-to-list 'load-path "~/.emacs.d/customizations/")
(add-to-list 'load-path "~/.emacs.d/pkgs/")

(if (not (eq system-type 'darwin))
    (progn
      ;; JSShell
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

(require 'restclient)

;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)


;; Borrowing these from https://github.com/flyingmachine/emacs-for-clojure
;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'cyberpunk t)
