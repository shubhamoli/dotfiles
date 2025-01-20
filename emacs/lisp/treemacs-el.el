;; Setup Treemacs
;;
(use-package treemacs
  :ensure t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-litter-directories  '("/node_modules" "/.venv" "/.cask" "/.terragrunt-cache"))

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)
    
(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

;; Old habits die hard
(evil-define-key 'treemacs treemacs-mode-map (kbd "o") #'treemacs-visit-node-no-split)
(evil-define-key 'treemacs treemacs-mode-map (kbd "O") #'treemacs-move-project-up)
(evil-define-key 'treemacs treemacs-mode-map (kbd "H") #'treemacs-toggle-show-dotfiles)
(evil-define-key 'treemacs treemacs-mode-map (kbd "I") #'treemacs-hide-gitignored-files-mode)
(evil-define-key 'treemacs treemacs-mode-map (kbd "V") #'treemacs-visit-node-horizontal-split)
(evil-define-key 'treemacs treemacs-mode-map (kbd "P") #'treemacs-copy-absolute-path-at-point)
(evil-define-key 'treemacs treemacs-mode-map (kbd "r") #'treemacs-rename-file)


;; Ends here
(provide 'treemacs-el)
