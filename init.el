
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA"        . 5)
        ("GNU ELPA"     . 0)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(package-install 'use-package)
(eval-when-compile (require 'use-package))
(require 'bind-key)

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-light t))

(use-package vertico
  :ensure t
  :init (vertico-mode)
  :bind (:map vertico-map
              ("DEL" . vertico-directory-delete-char)))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-s" . consult-line)))

(use-package eglot
  :ensure t
  :bind (("C-c n" . flymake-goto-next-error)
         ("C-c a" . eglot-code-actions)))

(use-package company
  :ensure t
  :bind ("C-<tab>" . company-complete))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package wgrep
  :ensure t
  :config (setq wgrep-auto-save-buffer t)
  :defer t)

(use-package csharp-mode
  :ensure t)

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

(setq-default backup-directory-alist '(("." . "~/.emacs.d/.emacs_backups"))
              backward-delete-char-untabify-method 'hungry
              org-log-done t
              inhibit-startup-screen t
              buffer-file-coding-system 'utf-8-unix)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated . t))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(winner-mode 1)
(savehist-mode)

(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   2)))
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 2)))

(defun my-prog-mode-config ()
  (setq-default c-default-style "stroustrup"
                indent-tabs-mode nil
                tab-width 4
                display-fill-column-indicator-column 80)
  (c-set-offset 'case-label '+)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (display-fill-column-indicator-mode 1)
  (company-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))

(add-hook 'prog-mode-hook 'my-prog-mode-config)
