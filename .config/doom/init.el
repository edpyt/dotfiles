;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(doom!
 :input

 :completion
 (corfu +orderless)
 vertico

 :ui
 doom
 dashboard
 hl-todo
 modeline
 tabs
 ophints
 (popup +defaults)
 vc-gutter
 vi-tilde-fringe
 workspaces
 zen

 :editor
 (evil +everywhere)
 file-templates
 fold
 multiple-cursors
 snippets
 (whitespace +guess +trim)
 (format +onsave)

 :emacs
 dired
 electric
 ibuffer
 tramp
 undo
 vc

 :term
 vterm

 :checkers
 syntax
 (spell +flyspell)

 :tools
 debugger
 direnv
 docker
 eval
 lookup
 (lsp +eglot)
 magit
 tree-sitter
 pdf

 :os
 (:if (featurep :system 'macos) macos)
 tty

 :lang
 (emacs-lisp +lsp)
 data
 docker
 (go +lsp)
 (java +lsp)
 javascript
 json
 (lua +lsp)
 markdown
 (org +roam +evil +lsp)
 (python +lsp +uv)
 (rust +lsp)
 sh
 sql
 yaml
 (csharp +lsp)

 :email

 :app

 :config
 (default +bindings +smartparens))
