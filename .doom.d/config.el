(setq doom-font (font-spec :family "Fira Code" :size 16)
        doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

(setq doom-theme 'doom-ayu-mirage)

(setq doom-themes-treemacs-theme 'doom-ayu-mirage)

(setq projectile-project-search-path '("~/projs"))

(setq org-directory "~/org/")

(after! org
  (setq org-log-done 'time
        org-log-done-with-time t
        org-todo-keywords '((sequence "TODO(t/!)" "STARTED(s)" "WAITING(b)" "PROJ(p)" "IDEA(i)"
                                        "|" "DONE(d)" "ABANDONED(a)" "DIGESTED(x)"))
        org-todo-keyword-faces '(("TODO" :foreground "#8491A3" :weight bold)
                                 ("STARTED" :foreground "#75d4fa" :weight bold)
                                 ("WAITING" :foreground "#eeb044" :weight bold)
                                 ("PROJ" :foreground "#ff934f" :weight bold)
                                 ("IDEA" :foreground "#e5eafa" :weight bold)
                                 ("DONE" :foreground "#d5ff80" :weight bold)
                                 ("ABANDONED" :foreground "#d11149" :weight bold)
                                 ("DIGESTED" :foreground "#857ba3" :weight bold)
                                 )))

(setq org-agenda-files '("~/org/agenda/"
                         "~/org/grad/gradprep.org"))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c l") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :deadline today)
                                  (:name "IMPORTANT"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)))
  :config
  (org-super-agenda-mode))

(use-package! org-fancy-priorities
    :ensure t
    :hook
    (org-mode . org-fancy-priorities-mode)
    :config
    (setq org-fancy-priorities-list '(">>>" ">>" ">")))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-defatult t))

(setq avy-all-windows t)

(setq which-key-idle-delay 0.5)
