;; init.el
;;
;; Copyright (C) 2024 Shubham Oli
;;
;; Author: Shubham Oli <oli.shubham@gmail.com>
;; URL: https://github.com/shubhamoli/dotfiles
;; Version: 0.0.1


;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated . t))

;; Prevent flashing of unstyled modeline at startup
;; We're gonna use mood-line package.
(setq-default mode-line-format nil)

;; Setup user information
(setq user-full-name "Oli"
      user-mail-address "oli.shubham@gmail.com")

(require 'use-package)
(setq use-package-always-ensure t)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(use-package emacs
  :init
    (global-display-line-numbers-mode 1)
    (setq display-line-numbers-type 'relative)
    (global-hl-line-mode 1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (setq window-resize-pixelwise t)
    (setq frame-resize-pixelwise t)
    (setq ring-bell-function 'ignore)

    ;; Open every frame maximised and undecorted
    (add-to-list 'default-frame-alist '(undecorated . t))

    ;; Other useful stuff
    (setq-default word-wrap -1)
    (save-place-mode t)
    (savehist-mode t)
    (recentf-mode t)
    (electric-pair-mode t)
    (show-paren-mode 1)
    (global-auto-revert-mode t)
    (setq undo-tree-auto-save-history t)
    (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
    (setq dired-kill-when-opening-new-dired-buffer 1)

    ;; Watch for git
    (global-auto-revert-mode 1)
    (setq auto-revert-check-vc-info t)
    
    ;; Hide title bar but still able to resize using the Mouse
    (add-to-list 'default-frame-alist '(drag-internal-border . 1))
    (add-to-list 'default-frame-alist '(internal-border-width . 5))


    ;; Kill the buffer and close its windows
    (define-key global-map [remap kill-buffer] 'kill-buffer-and-window))

;; Load lisp/ directory
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

;;(require 'sensible)
(require 'editor)
(require 'ui)
(require 'completion)
(require 'tree-sitter)
(require 'languages)
;;(require 'treemacs)

(use-package neotree
  :init
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-smart-open t)
    (setq projectile-switch-project-action 'neotree-projectile-action))

(use-package nix-mode
  :mode "\\.nix\\'")

;; Always start emacs in server mode (only if it has not already been started)
(load "server")
(unless (server-running-p) (server-start))

;; Move customize blocks to a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
 
;; Set backup files location to /tmp/emacsbackup
(setq backup-directory-alist  '((".*" . "/tmp/emacsbackup")))
