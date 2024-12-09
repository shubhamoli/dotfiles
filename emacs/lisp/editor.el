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

;; Ends here
(provide 'editor)
