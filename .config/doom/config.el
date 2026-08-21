;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Maple Mono NF")
      doom-theme 'noctalia
      display-line-numbers-type 'relative
      confirm-kill-emacs nil)
(setq-default
 truncate-lines t
 word-wrap nil
 indent-tabs-mode nil)
(setq scroll-margin 4
      scroll-step 1
      scroll-conservatively 101
      auto-window-vscroll nil)

;; ----
;; packages
;; ----
(use-package! kdl-mode
  :mode "\\.kdl\\'")
(after! treesit
  (add-to-list 'treesit-language-source-alist
               '(kdl "https://github.com/tree-sitter-grammars/tree-sitter-kdl")))

;; ----
;; term
;; ----
(map! "C-'" #'+vterm/toggle)

;; ----
;; org stuff
;; ----
(setq org-directory "~/Documents/orgfiles/"
      org-roam-directory "~/Documents/orgfiles/org_roam/")

(after! org
  (setq org-agenda-files
        (directory-files
         "~/Documents/orgfiles/"
         t
         "\\.org\\'")

        org-todo-keywords
        '((sequence
           "TODO(t)"
           "WAIT(w)"
           "|"
           "DONE(d)"
           "DELEGATED(g)"))

        org-agenda-show-future-repeats 'next
        org-hide-emphasis-markers t
        org-startup-with-inline-images t

        org-capture-templates
        '(("t" "Task"
           entry
           (file "~/Documents/orgfiles/todos.org")
           "* TODO %?\n %u")

          ("w" "Work"
           entry
           (file "~/Documents/orgfiles/work.org")
           "* TODO %?\n %u")

          ("u" "University"
           entry
           (file "~/Documents/orgfiles/uni.org")
           "* TODO %?\n %u")

          ("h" "Habits"
           entry
           (file "~/Documents/orgfiles/habits.org")
           "* TODO %?\n %u"))))

(after! org-roam
  (setq org-roam-directory "~/Documents/orgfiles/org_roam/"

        org-roam-capture-templates
        '(("d" "default" plain
           "#+HTML_HEAD: <link rel=\"stylesheet\" href=\"../../../assets/org.css\" type=\"text/css\" />\n%?"
           :target
           (file+head "%<%Y%m%d%H%M%S>-%[slug].org" "")
           :unnarrowed t))))

(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star 'replace
        org-modern-hide-stars 'leading)

  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t
        org-appear-autolinks t
        org-appear-autoentities t
        org-appear-autosubmarkers t))
