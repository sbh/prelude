(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("31deed4ac5d0b65dc051a1da3611ef52411490b2b6e7c2058c13c7190f7e199b" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" default))
 '(global-display-line-numbers-mode t)
 '(org-fold-core-style 'overlays)
 '(package-selected-packages
   '(embark marginalia vertico denote jupyter org-transclusion org-roam-ui ob-mermaid openwith org-download org-modern csv-mode groovy-mode bufler edwina hyperbole golden-ratio spacious-padding doom-modeline all-the-icons-completion all-the-icons org-beautify-theme consult-projectile iedit orderless rust-mode racket-mode cider tabbar sr-speedbar geiser-guile geiser geiser-racket geiser-stklos rg ripgrep treemacs parinfer-rust-mode clojure-mode visual-fill-column org-bullets org-roam use-package solarized-theme yaml-mode web-mode lsp-ui lsp-mode json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number nlinum move-text magit projectile imenu-anywhere hl-todo guru-mode git-modes git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring anzu ag ace-window))
 '(size-indication-mode t)
 '(speedbar-default-position 'left)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight regular :height 140 :width normal))))
 '(fringe ((t :background "#000000")))
 '(header-line ((t :box (:line-width 4 :color "#212121" :style nil))))
 '(header-line-highlight ((t :box (:color "#ffffff"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "#000000")))
 '(mode-line ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-highlight ((t :box (:color "#ffffff"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color "#1e1e1e" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "#0e0e0e" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#424242" :style nil))))
 '(tab-line-tab ((t)))
 '(tab-line-tab-active ((t)))
 '(tab-line-tab-inactive ((t)))
 '(vertical-border ((t :background "#ffffff" :foreground "#ffffff")))
 '(window-divider ((t :background "#000000" :foreground "#000000")))
 '(window-divider-first-pixel ((t :background "#000000" :foreground "#000000")))
 '(window-divider-last-pixel ((t :background "#000000" :foreground "#000000"))))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(setq whitespace-line-column 7800)

(add-to-list 'default-frame-alist '(height . 64))
(add-to-list 'default-frame-alist '(width . 256))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;(add-to-list 'load-path "~/.emacs.d/personal/")
;;(load "org-stuff")
;;(load "denote-stuff")
;;(load "geiser-stuff")
;;(load "minibuffer-stuff.el")

(setq cider-repl-history-file "~/.cider-history.el")
(setq cider-repl-history-size 10000)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-s") 'swiper-isearch)
(setq switch-to-buffer-obey-display-actions t)

(defun mp-split-below (arg)
  "Split window below from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'below nil))

(defun mp-split-right (arg)/
  "Split window right from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'right nil))

(setq ido-create-new-buffer 'always)
(pixel-scroll-precision-mode)
(tabbar-mode)
(require 'smartparens-config)

(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode))

(use-package spacious-padding
  :ensure t
  :defer
  :hook (after-init . spacious-padding-mode))

(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-auto-scale t)
  (golden-ratio-exclude-modes '(treemacs-mode occur-mode)))

(require 'undo-tree)
;;(global-undo-tree-mode)
