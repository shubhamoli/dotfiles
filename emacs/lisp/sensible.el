;; UI tweaks
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist '(undecorated . t))

;; Other useful stuff
(setq-default word-wrap -1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(electric-pair-mode t)
(show-paren-mode 1)
(global-auto-revert-mode t)
(setq dired-kill-when-opening-new-dired-buffer t)

;; This line must be at the end
(provide 'sensible)
