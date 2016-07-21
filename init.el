;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

;; diable the toolbar
(tool-bar-mode -1)

(require 'package) 
(setq package-archives '(;;("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
