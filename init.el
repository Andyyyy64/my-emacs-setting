;; ----------------

;; key bind
;; ----------------
;; C-h
(global-set-key "\C-h" 'delete-backward-char)
;; help
(global-set-key "\C-c\C-h" 'help-command)
;; comment out
(global-set-key "\C-c;" 'comment-dwim)
;; window operation
(global-set-key "\C-t" 'other-window)
;; vterm comand
(global-set-key "\C-x\C-t" 'multi-vterm)

; ----
; preferences
; ----
; Enable automatic completion of parentheses
(electric-pair-mode 1)
;; diable scroolbar
(scroll-bar-mode -1)
;; set default tab-width for 4
(setq-default tab-width 4 indent-tabs-mode nil)
;; no startup msg
(setq inhibit-startup-message t)
;; line number
(column-number-mode t)
;; display line number
(global-linum-mode t)
;; scroll conservatively
(setq scroll-conservatively 1)
;; show paren
(show-paren-mode 1)
;; display menu bar
(menu-bar-mode -1)
;; show tool bar 
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; change startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(defun my-startup-commands ()
  "Execute a series of commands at startup."
  (beacon-mode)
  (nyan-mode)
  (multi-vterm))

(my-startup-commands)

;; recentf

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\C-r" 'recentf-open-files)

;; slime
(setq inferior-lisp-program "sbcl")

;; for automatic syntax highlight
(global-font-lock-mode t)

;; prettier configure
(require 'prettier-js)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(setq prettier-js-args '(
                        "--trailing-comma" "all"
                        "--single-quote" "true"
                        "--print-width" "120"
                        "--tab-width" "2"
                        "--use-tabs" "false"
                        "--semi" "true"
                        "--bracket-spacing" "true"
                        "--jsx-bracket-same-line" "false"
                        "--arrow-parens" "avoid"
                        "--prose-wrap" "always"
                        "--end-of-line" "lf"
                        ))


;; -------------use-package------------


;; multivterm
(use-package multi-vterm :ensure t)
(use-package beacon-mode :ensure t)
;; for filetreeview
(use-package neotree
  :ensure t
  :bind (("C-c t" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd)))


;; for js
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")


;; for ts
;;(use-package typescript-mode
  ;;:ensure t
  ;;:mode "\\.ts\\'")
;;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))


;; for react...
;;(use-package rjsx-mode
;; :ensure t
;; :mode "\\.tsx\\'"aa)

;;(use-package tide
;;:ensure t
;;:after (rjsx-mode)
;;:hook (rjsx-mode . tide-setup))

;; for react
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

  :config
  (setq web-mode-attr-indent-offset nil)

  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)

  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)


  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  )

;; for c,c++
(use-package cc-mode
  :ensure t
  :mode "\\.cpp\\'" "\\.h\\'" "\\.c\\'")


;; for auto code completion
(use-package company
  :ensure t
  :init (global-company-mode))


;; .emacs.d/init.el
(server-start)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" "05626f77b0c8c197c7e4a31d9783c4ec6e351d9624aa28bc15e7f6d6a6ebd926" default))
 '(package-selected-packages
   '(nyan-mode prettier slime prettier-js beacon multi-vterm zoom gruber-darker-theme web-mode dracula-theme vterm helm))
 '(warning-suppress-log-types '((server))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
