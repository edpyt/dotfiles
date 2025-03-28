---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        },
        t = {
          ["<Leader>n"] = false,
        },
      },
    },
  },
}
