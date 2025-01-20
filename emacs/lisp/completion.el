;; 
(use-package vertico
  :custom
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(flex orderless basic)
        completion-category-defaults nil
        completion-category-overrides nil))

(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)) 

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim))
  :init)

(use-package embark-consult
             :ensure t
             :hook
             (embark-collect-mode . consult-preview-at-point-mode))

(define-key vertico-map (kbd "C-v") (kbd "C-. o")) 

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :hook
  ((prog-mode . corfu-mode))
  :init
  (global-corfu-mode))

;; Ends here
(provide 'completion)
