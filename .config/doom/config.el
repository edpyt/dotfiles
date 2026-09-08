;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setopt frame-inhibit-implied-resize t)

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

(setq +format-on-save-enabled t)

(setq browse-url-browser-function 'browse-url-default-browser)

;; ----
;; mappings
;; ----
(map! "C-'" #'+vterm/toggle)
(map! :nv "\\" #'+evil/window-split-and-follow
      :nv "|"  #'+evil/window-vsplit-and-follow)

;; ----
;; packages
;; ----
(after! centaur-tabs
  (setq centaur-tabs-set-bar nil
        centaur-tabs-show-new-tab-button nil
        centaur-tabs-height 22))

;; ----
;; org stuff
;; ----
(setq org-directory "~/Documents/orgfiles/"
      org-roam-directory "~/Documents/orgfiles/org_roam/")

(after! org
  (add-to-list 'org-modules 'org-habit))

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

(after! org-agenda
  (setq org-agenda-span 'day)
  (setq org-agenda-start-day nil))

(after! org-clock
  (setq org-clock-persist 'clock
        org-clock-mode-line-total 'current
        org-clock-persist-query-resume nil)
  (org-clock-persistence-insinuate))

(after! org-caldav
  (setq org-caldav-url "http://localhost:5232/edpyt"
        org-caldav-calendar-id "org"
        org-caldav-files
        '("~/Documents/orgfiles/todos.org"
          "~/Documents/orgfiles/habits.org"
          "~/Documents/orgfiles/uni.org")
        org-caldav-inbox nil

        org-caldav-todo-percent-states '((0 "TODO") (0 "WAIT") (100 "DONE") (100 "DELEGATED"))
        org-caldav-sync-direction 'org->cal

        org-icalendar-include-todo t
        ;; org-caldav-sync-todo nil

        org-icalendar-use-scheduled
        '(todo-start event-if-todo)

        org-icalendar-use-deadline
        '(event-if-todo todo-due)

        org-icalendar-timezone "Asia/Yekaterinburg"))

(setq org-html-head
      (format "<link rel=\"stylesheet\" href=\"%s\" type=\"text/css\" />"
              (expand-file-name "~/.config/doom/org.css")))

(after! org-roam
  (setq org-roam-dailies-directory "daily/"
        org-roam-dailies-capture-templates
        '(("d" "default" entry "* %<%H:%M %p>\n%?"
           :if-new (file+head "%<%Y>/%<%m>/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n")))))

;; ----
;; org custom packages
;; ----
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

(use-package! org-wild-notifier
  :after org
  :config
  (org-wild-notifier-mode)

  (setq alert-default-style 'libnotify
        org-wild-notifier-alert-time '(0 5 10)
        org-wild-notifier-ignore-done t))
