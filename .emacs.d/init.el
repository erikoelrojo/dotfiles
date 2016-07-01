;; startup 
;;------------------------------------------------------------------------------ 
;; whatever this does
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)                                                ;; disable splash screen 
(tool-bar-mode -1)                                                              ;; disable toolbar
(scroll-bar-mode -1)                                                            ;; disable scrollbar
(setq column-number-mode t)                                                     ;; show column number
(global-hl-line-mode 1)                                                         ;; highlight current line
(blink-cursor-mode 0)                                                           ;; stop blinking cursor

;; backup files 
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))                   ;; store backups in .emacs

;; package manager
;;------------------------------------------------------------------------------ 
(require 'package)

(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/")
	     '("melpa" . "http://melpa.org/packages/")
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; evil 
;;------------------------------------------------------------------------------ 
(require 'evil)
(evil-mode t)

;; keybindings
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)


;; aesthetics 
;;------------------------------------------------------------------------------
(load-theme 'gruvbox)


(show-paren-mode 1)
(setq show-paren-delay 0)
(set-face-background hl-line-face "gray13")
