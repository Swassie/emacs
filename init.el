
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 5)
        ("MELPA"        . 0))
      )

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(package-initialize)
(package-install 'use-package)
(eval-when-compile (require 'use-package))

(use-package color-theme-solarized
  :ensure t
  :config
  (load-theme 'solarized t)
  )

(use-package counsel
  :ensure t
  :demand t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
		ivy-use-selectable-prompt t
        ivy-count-format "%d/%d ")
  :bind ("C-s" . swiper)
  )

(use-package magit
  :ensure t
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  :bind ("C-x g" . magit-status)
  )

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t)
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
				)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  )

(add-hook 'prog-mode-hook 'my-prog-mode-config)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
