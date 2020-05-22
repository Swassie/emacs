
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
        ("GNU ELPA"     . 0))
      )

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(package-install 'use-package)
(eval-when-compile (require 'use-package))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-light t)
  )

(use-package counsel
  :ensure t
  :demand t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t
        ivy-count-format "%d/%d "
        )
  :bind ("C-s" . swiper)
  )

(use-package eglot
  :ensure t
  :hook ((c++-mode c-mode) . eglot-ensure)
  :config (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  )

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  )

(use-package wgrep
  :ensure t
  :config (setq wgrep-auto-save-buffer t)
  :defer t
  )

(setq backup-directory-alist '(("." . "~/.emacs.d/.emacsBackups"))
      backward-delete-char-untabify-method 'hungry
      org-log-done t
      inhibit-startup-screen t
      )

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(winner-mode 1)

(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   2)))
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 2)))

(defun my-prog-mode-config ()
  (setq-default c-default-style "stroustrup"
                indent-tabs-mode nil
                tab-width 4
                display-fill-column-indicator-column 80
                )
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (display-fill-column-indicator-mode 1)
  )

(add-hook 'prog-mode-hook 'my-prog-mode-config)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
