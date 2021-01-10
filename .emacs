(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(setq-default truncate-lines 1)
(setq-default left-margin-width 1 right-margin-width 1)
(set-window-buffer nil (current-buffer))
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package evil
  :ensure t
  :config
  (evil-mode t))
  
(use-package evil-leader
  :after evil
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "e" 'helm-find-files
    "b" 'helm-buffers-list
    "k" 'kill-buffer
    "." 'helm-projectile-find-file
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wk" 'evil-window-up
    "wl" 'evil-window-right
    "ws" 'evil-window-split
    "wv" 'evil-window-vsplit))

(use-package treemacs
  :ensure t)

(use-package treemacs-evil
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-hook 'after-init-hook 'projectile-global-mode))

(use-package ag
  :ensure t)
  
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojurescript-mode-hook #'rainbow-delimiters-mode))


(add-hook 'clojure-mode-hook '(lambda ()
  (show-paren-mode 1)
;  (setq show-paren-style 'parenthesis)
  (setq show-paren-style 'expression)
  (set-face-background 'show-paren-match "#dedede")
;  (set-face-foreground 'show-paren-match "blue")
;  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  ))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x))

(use-package helm-projectile
  :ensure t
  :after (helm projectile))

(use-package helm-ag
  :ensure t)

(use-package cider
  :ensure t)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(load-theme 'tsdh-light)

;(use-package typescript-mode
;  :ensure t)

;(use-package tide
;  :ensure t
;  :after (typescript-mode company flycheck)
;  :hook ((typescript-mode . tide-setup)
;         (typescript-mode . tide-hl-identifier-mode)
;         (before-save . tide-format-before-save)))

