;; Setup LSP and language configs
;;

(use-package hcl-mode
  :init
  (hcl-mode))
(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))

(use-package markdown-mode
  :ensure t
  :mode ("*\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; Ends here
(provide 'languages)
