return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = true,
  opts = function()
    return {
      highlight_groups = {
        DiffAdd = { bg = "foam", fg = "foam", blend = 90 },
      },
    }
  end,
}
