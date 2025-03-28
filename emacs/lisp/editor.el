;; Setup the editor
;; 
(use-package evil
  :init
  (evil-mode)
  :config
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-u-scroll t)
  (evil-undo-system 'undo-redo) ;; C-r to redo
  (org-return-follows-link t)
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)
              ("TAB" . nil)))

;; Personal key bindings; Old habits die hard
;;
(define-key evil-normal-state-map (kbd "C-p") 'project-find-file)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)

(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer))
  (evil-collection-init))

;;(use-package perspective
;;  :bind
;;  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
;;  :custom
;;  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
;;  :init
;;  (persp-mode))
;;(add-hook 'kill-emacs-hook #'persp-state-save)
;;


;; Ends here
(provide 'editor)
