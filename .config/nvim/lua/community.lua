-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- packs
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.docker" },

  -- media
  { import = "astrocommunity.media.image-nvim" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- completions
  -- { import = "astrocommunity.completion.codeium-nvim" },
  { import = "astrocommunity.completion.supermaven-nvim" },

  -- other
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
}
