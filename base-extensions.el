
(use-package ace-jump-mode
  :bind
  ("C-c SPC" . ace-jump-mode)
  :ensure t)


(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :ensure t)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :ensure t)

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w")
  :ensure t)

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize))
	:ensure t)

(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  :ensure t)

(use-package flycheck
	:ensure t)


(use-package helm
  :init
  (require 'helm-config)
  :config
  (setq helm-split-window-in-side-p t
        helm-split-window-default-side 'below
	helm-idle-delay 0.0
	helm-input-idle-delay 0.01
	helm-quick-update t
	helm-ff-skip-boring-files t)
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x v" . helm-projectile)
         ("C-x c o" . helm-occur)
         ("C-x c p" . helm-projectile-ag)
         ("C-x c k" . helm-show-kill-ring)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action))
	:ensure t)

(use-package helm-ag
	:ensure t)

(use-package helm-git-grep
	:ensure t)

(use-package helm-projectile
	:ensure t)

(use-package helm-swoop
  :bind
  ("C-x c s" . helm-swoop)
  :ensure t)


(use-package hlinum
  :config
  (hlinum-activate)
  :ensure t)

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil)
  :ensure t)

(use-package magit
  :config
  
  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive)
  :ensure t)

; (use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this)
  :ensure t)

(use-package neotree
  :config
  (setq neo-theme 'arrow
        neotree-smart-optn t
        neo-window-fixed-size nil)
  ;; Disable linum for neotree
  (add-hook 'neo-after-create-hook 'disable-neotree-hook)
  :ensure t)

(use-package org
  :config
  (setq org-directory "C:/Users/vgovinda/org-files/"
        org-default-notes-file (concat org-directory "refile.org")
		org-agenda-files 
					(list
					 (concat org-directory "todo.org")
					 (concat org-directory "refile.org")
					 (concat org-directory "prog_notes.org")
					 (concat org-directory "bdc.org")
					 (concat org-directory "ae-de.org")
					 (concat org-directory "ideas.org")
					 (concat org-directory "snippets.org")
					 (concat org-directory "mails.org")
					) )
  :bind
  ("C-c l" . org-store-link)
  :ensure t
)

(use-package org-projectile
  :config
  ;;(org-projectile:per-repo)
  ;; org-projectile:per-repo-filename "todo.org"
  ;; (setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
)

; (use-package org-pomodoro
  ; :ensure t
  ; :commands (org-pomodoro)
  ; :config
    ; (setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))))

; (use-package org-bullets
  ; :config
  ; (setq org-hide-leading-stars t)
  ; (add-hook 'org-mode-hook
            ; (lambda ()
              ; (org-bullets-mode t))))

(use-package page-break-lines
:ensure t)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))
  
  (projectile-global-mode)
  :ensure t)
	
(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1)
  :ensure t)

(use-package smartparens
	:ensure t)

(use-package smex
	:ensure t)

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
  (global-undo-tree-mode 1)
  :ensure t)

(use-package which-key
  :config
  (which-key-mode)
  :ensure t)

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right)
  :ensure t)

(use-package wgrep
	:ensure t)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  :ensure t)

(use-package org-super-agenda 
  :config 
  (org-super-agenda-mode)
  :ensure t)

(provide 'base-extensions)