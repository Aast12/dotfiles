(use-package! conda
  :defer t
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell)
  (conda-env-autoactivate-mode t)
  :init
  (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
  (setq conda-env-home-directory (expand-file-name "~/anaconda3")))

(setq auto-save-default t
      auto-revert-use-notify nil
      auto-revert-verbose nil)

(global-auto-revert-mode 1)

(defmacro func-ignore (fnc)
  `(lambda (&rest _rest)
     (funcall ,fnc)))

(advice-add 'org-deadline       :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-schedule       :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-store-log-note :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-todo           :after (func-ignore #'org-save-all-org-buffers))

(setq doom-font (font-spec :family "Fira Code" :size 16)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

(setq doom-theme 'doom-ayu-mirage)

(setq doom-themes-treemacs-theme 'doom-ayu-mirage)


;; org-modern
(with-eval-after-load 'org (global-org-modern-mode))

(use-package! org-modern
  :config
  (dolist
      (face '(window-divider
              window-divider-first-pixel
              window-divider-last-pixel))
    (face-spec-reset-face face)
    (set-face-foreground face
                         (face-attribute 'default :background)))

  (set-face-background 'fringe (face-attribute 'default :background))

  (setq org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t

        ;; Org styling, hide markup etc.
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "…"

        ;; Agenda styling
        org-agenda-tags-column 0
        org-agenda-block-separator ?─
        org-agenda-time-grid
        '((daily today require-timed)
          (800 1000 1200 1400 1600 1800 2000)
          " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
        org-agenda-current-time-string
        "⭠ now ─────────────────────────────────────────────────"))

(setq projectile-project-search-path '("~/projs/" "~/Documents/COSSE/"))

(setq org-directory "~/org/")

(after! org
  (setq org-log-done 'time
        org-log-done-with-time t
        org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(b)" "PROJ(p)" "IDEA(i)"
                                        "|" "DONE(d)" "ABANDONED(a)" "DIGESTED(x)")
                            (sequence "PENDING(p)" "STARTED(s)" "SUBMITTED(c!)"
                                      "|" "ACCEPTED(a)" "REJECTED(r)" "ABANDONED(x)"))
        org-todo-keyword-faces '(("TODO" :foreground "#8491A3" :weight bold)
                                 ("STARTED" :foreground "#75d4fa" :weight bold)
                                 ("WAITING" :foreground "#eeb044" :weight bold)
                                 ("PROJ" :foreground "#ff934f" :weight bold)
                                 ("IDEA" :foreground "#e5eafa" :weight bold)
                                 ("DONE" :foreground "#d5ff80" :weight bold)
                                 ("ABANDONED" :foreground "#d11149" :weight bold)
                                 ("DIGESTED" :foreground "#857ba3" :weight bold)
                                 )))

(use-package! org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/brain")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(setq org-agenda-files '("~/org/agenda/"
                          "~/org/grad/gradprep.org"
                          "~/org/grad/scholarships.org"))

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
    (setq org-fancy-priorities-list '("A" "B" "C")))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-defatult t))

(setq avy-all-windows t)

(setq which-key-idle-delay 0.5)
