return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = true,
  opts = function()
    return {
      highlight_groups = {
        -- NOTE: for orgmode scheduled items
        DiffAdd = { bg = "foam", fg = "foam", blend = 90 },
      },
    }
  end,
}
