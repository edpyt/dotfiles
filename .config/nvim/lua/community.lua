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
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- other
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.media.image-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
}
