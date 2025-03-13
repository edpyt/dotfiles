return {
  "TabbyML/vim-tabby",
  lazy = false,
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          tabby_inline_completion_keybinding_accept = "<C-e>",
        },
      },
    },
  },
}
