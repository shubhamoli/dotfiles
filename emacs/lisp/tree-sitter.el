;; Configure Treesitter
;; 
(setq treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
  (cmake "https://github.com/uyha/tree-sitter-cmake")
  (elisp "https://github.com/Wilfred/tree-sitter-elisp")
  (go "https://github.com/tree-sitter/tree-sitter-go")
  (hcl "https://github.com/tree-sitter-grammars/tree-sitter-hcl")
  (html "https://github.com/tree-sitter/tree-sitter-html")
  (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
  (json "https://github.com/tree-sitter/tree-sitter-json")
  (make "https://github.com/alemuller/tree-sitter-make")
  (markdown "https://github.com/ikatyang/tree-sitter-markdown")
  (python "https://github.com/tree-sitter/tree-sitter-python")
  (toml "https://github.com/tree-sitter/tree-sitter-toml")
  (tf "https://github.com/tree-sitter-grammars/tree-sitter-hcl")
  (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Ends here
(provide 'tree-sitter)
