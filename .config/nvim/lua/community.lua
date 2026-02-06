---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- pack
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.sql" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- media
  { import = "astrocommunity.media.vim-wakatime" },

  -- test
  { import = "astrocommunity.test.neotest" },

  -- other
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
}
