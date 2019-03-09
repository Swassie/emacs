
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

(use-package ggtags
  :ensure t
  )

(use-package magit
  :ensure t
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  (global-set-key (kbd "C-x g") 'magit-status)
  )

(use-package ag
  :ensure t
  )

(use-package wgrep-ag
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t)
  )

(use-package iedit
  :ensure t
  )

(require 'org)
(setq org-log-done t)

(winner-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs.d/.emacsBackups"))
	  backward-delete-char-untabify-method 'hungry
	  read-file-name-completion-ignore-case t
	  read-buffer-completion-ignore-case t
	  c-default-style "bsd"
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
  (ggtags-mode 1)
  )

(defun my-python-config ()
  (setq python-indent-offset 4)
  )

(add-hook 'prog-mode-hook 'my-prog-mode-config)
(add-hook 'c-mode-common-hook 'my-c-mode-common-config)
(add-hook 'python-mode-hook 'my-python-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
