;; 
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult)
(use-package embark)
(use-package embark-consult)

(use-package corfu
  :custom
  (corfu-auto t)
  :hook
  ((prog-mode . corfu-mode))
  :init
  (global-corfu-mode))

;; Ends here
(provide 'completion)
