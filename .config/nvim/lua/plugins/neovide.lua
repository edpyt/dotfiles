if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<C-v>"] = { '"+P', desc = "Paste normal mode" },
      },
      v = {
        ["<C-v>"] = { '"+P', desc = "Paste visual mode" },
      },
      c = {
        ["<C-v>"] = { "<C-R>+", desc = "Paste command mode" },
      },
      i = {
        ["<C-v>"] = { '<ESC>l"+Pli', desc = "Paste insert mode" },
      },
    },
    options = {
      opt = { -- configure vim.opt options
      },
      g = { -- configure vim.g variables
        neovide_cursor_vfx_mode = "wireframe",
        -- configure padding
        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,
      },
    },
  },
}
