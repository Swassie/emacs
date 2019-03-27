
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(setq package-archives
	  '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		("MELPA Stable" . "https://stable.melpa.org/packages/")
		("MELPA"        . "https://melpa.org/packages/"))
	  package-archive-priorities
	  '(("MELPA Stable" . 10)
		("GNU ELPA"     . 5)
		("MELPA"        . 0))
	  )

(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package powerline
  :ensure t
  :config
  (setq powerline-display-buffer-size nil
		powerline-display-mule-info nil
		powerline-display-hud nil)
  (powerline-default-theme)
  (remove-hook 'focus-out-hook 'powerline-unset-selected-window)
  )

(use-package counsel
  :ensure t
  :demand t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
		ivy-count-format "%d/%d ")
  :bind ("C-s" . swiper)
  )

(use-package ggtags
  :ensure t
  :hook (c-mode-common . ggtags-mode)
  )

(use-package magit
  :ensure t
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  :bind ("C-x g" . magit-status)
  )

(use-package ag
  :ensure t
  :defer t
  )

(use-package wgrep-ag
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t)
  :defer t
  )

(use-package iedit
  :ensure t
  )

(winner-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs.d/.emacsBackups"))
	  backward-delete-char-untabify-method 'hungry
	  read-file-name-completion-ignore-case t
	  read-buffer-completion-ignore-case t
	  c-default-style "bsd"
	  org-log-done t
	  )

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   2)))
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 2)))

(defun my-prog-mode-config ()
  (setq indent-tabs-mode t
		tab-width 4
		)

  (show-paren-mode 1)
  (electric-pair-mode 1)
  )

(defun my-c-mode-common-config ()
  (setq c-basic-offset 4)
  )

(defun my-python-config ()
  (setq python-indent-offset 4)
  )

(add-hook 'prog-mode-hook 'my-prog-mode-config)
(add-hook 'c-mode-common-hook 'my-c-mode-common-config)
(add-hook 'python-mode-hook 'my-python-config)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Faces
(set-face-attribute 'mode-line nil :foreground "black" :background "#30bc2b" :box nil)
(set-face-attribute 'mode-line-inactive nil :foreground "grey20" :background "grey90" :box nil)
(set-face-attribute 'powerline-active1 nil :background "grey22" :foreground "white" :inherit 'mode-line)
(set-face-attribute 'powerline-active2 nil :background "grey40" :foreground "white" :inherit 'mode-line)
(set-face-attribute 'powerline-inactive1 nil :background "grey22" :foreground "white" :inherit 'mode-line-inactive)
(set-face-attribute 'powerline-inactive2 nil :background "grey40" :foreground "white" :inherit 'mode-line-inactive)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (powerline use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
