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

(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer))
  (evil-collection-init))

;; Ends here
(provide 'editor)
