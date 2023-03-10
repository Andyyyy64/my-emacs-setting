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
(global-set-key (kbd "C-c v") 'multi-vterm)
;; vim like window move
(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x j") 'windmove-down)
(global-set-key (kbd "C-x l") 'windmove-right)
(global-set-key (kbd "C-x h") 'windmove-left)
;; ctrl-z = undo
(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)
;; find-file-other-window
(global-set-key (kbd "C-x f") 'find-file-other-window)
;; ace-windows
(global-set-key (kbd "C-x g") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


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

;; tide
(require 'tide)
(global-set-key (kbd "<f10>") 'tide-format)

;; flycheck
(use-package flycheck
  :config
  (when (locate-library "flycheck-irony")
    (flycheck-irony-setup))
  (global-flycheck-mode t)
  )

;; irony
(use-package irony
  :commands irony-mode
  :config
  (custom-set-variables '(irony-additional-clang-options '("-std=c++17")))
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode)
  )

;; change startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(defun my-startup-commands ()
  "Execute a series of commands at startup."
  (beacon-mode)
  (nyan-mode)
  (multi-vterm))
(my-startup-commands)


;; find file in tarminal
(setq multi-vterm-find-file-function #'multi-vterm-find-file-in-current-directory)


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


;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "C-c t") 'treemacs-select-window)))


;; multivterm
(use-package multi-vterm :ensure t)


;; beacon-mode
(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#008080")


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
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(use-package cc-mode
  :ensure t
  :mode "\\.cpp\\'" "\\.h\\'" "\\.c\\'")


;; for auto code completion
(use-package company
  :ensure t
  :init (global-company-mode))
  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" "05626f77b0c8c197c7e4a31d9783c4ec6e351d9624aa28bc15e7f6d6a6ebd926" default))
 '(package-selected-packages
   '(flycheck-irony irony-eldoc all-the-icons treemacs nyan-mode prettier slime prettier-js beacon multi-vterm zoom gruber-darker-theme web-mode dracula-theme vterm helm))
 '(warning-suppress-log-types '((server))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
