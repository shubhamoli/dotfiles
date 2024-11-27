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

;; Load lisp/ directory
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

(require 'sensible)
(require 'editor)
(require 'ui)
(require 'completion)
(require 'tree-sitter)
;;(require 'treemacs)

;; Always start emacs in server mode (only if it has not already been started)
(require 'server)
(unless (server-running-p) (server-start))

;; Move customize blocks to a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
 
;; Set backup files location to /tmp/emacsbackup
(setq backup-directory-alist  '((".*" . "/tmp/emacsbackup")))

(use-package markdown-mode
  :ensure t
  :mode ("*\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
