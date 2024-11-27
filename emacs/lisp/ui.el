
;; Catpuccin theme
(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'mocha)
(catppuccin-reload)

;; Font
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono-14" :weight 'Light)

(use-package mood-line
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

(use-package all-the-icons
  :if (display-graphic-p))

;; Ends here
(provide 'ui)
