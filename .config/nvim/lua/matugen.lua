 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#232136',
    base01 = '#393552',
    base02 = '#423d5e',
    base03 = '#6d6890',
    base04 = '#908caa',
    base05 = '#e0def4',
    base06 = '#e0def4',
    base07 = '#e0def4',
    base08 = '#eb6f92',
    base09 = '#3e8fb0',
    base0A = '#9ccfd8',
    base0B = '#ea9a97',
    base0C = '#96d1e9',
    base0D = '#ea9895',
    base0E = '#96dce9',
    base0F = '#a00833',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0def4',          bg = '#232136' })
  hi('TelescopeBorder',         { fg = '#6d6890',             bg = '#232136' })
  hi('TelescopePromptNormal',   { fg = '#e0def4',          bg = '#232136' })
  hi('TelescopePromptBorder',   { fg = '#6d6890',             bg = '#232136' })
  hi('TelescopePromptPrefix',   { fg = '#ea9a97',             bg = '#232136' })
  hi('TelescopePromptCounter',  { fg = '#908caa',  bg = '#232136' })
  hi('TelescopePromptTitle',    { fg = '#232136',             bg = '#ea9a97' })
  hi('TelescopePreviewTitle',   { fg = '#232136',             bg = '#9ccfd8' })
  hi('TelescopeResultsTitle',   { fg = '#232136',             bg = '#3e8fb0' })
  hi('TelescopeSelection',      { fg = '#e0def4',          bg = '#423d5e' })
  hi('TelescopeSelectionCaret', { fg = '#ea9a97',             bg = '#423d5e' })
  hi('TelescopeMatching',       { fg = '#ea9a97',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
