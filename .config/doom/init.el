;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(doom!
 :input

 :completion
 (corfu +orderless)
 vertico

 :ui
 doom
 tabs
 dashboard
 modeline
 hl-todo
 ophints
 (popup +defaults)
 vc-gutter
 vi-tilde-fringe
 workspaces
 zen
 ligatures

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
 emacs-lisp
 data
 docker
 javascript
 json
 markdown
 sh
 sql
 yaml

 (org +dragndrop +roam +evil +lsp)
 (python +lsp +tree-sitter +uv +pyright)
 (csharp +lsp +tree-sitter)
 (rust +lsp)
 (lua +lsp)
 (java +lsp)
 (go +lsp +tree-sitter)

 :email

 :app

 :config
 (default +bindings +smartparens))
