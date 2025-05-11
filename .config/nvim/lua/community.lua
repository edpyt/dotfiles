---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- pack
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.docker" },

  -- colorscheme
  -- NOTE: ./plugins/rose-pine.lua
  -- { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },

  -- media
  { import = "astrocommunity.media.vim-wakatime" },

  -- recipes
  { import = "astrocommunity.recipes.neovide" },

  -- test
  { import = "astrocommunity.test.neotest" },

  -- other
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
}
