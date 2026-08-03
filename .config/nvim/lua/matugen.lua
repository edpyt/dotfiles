 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1a23',
    base01 = '#2b2b3b',
    base02 = '#262636',
    base03 = '#646575',
    base04 = '#afafb6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#ac84ae',
    base0A = '#9781b1',
    base0B = '#8b8dc1',
    base0C = '#ceafd0',
    base0D = '#acadd3',
    base0E = '#beafd0',
    base0F = '#741d2b',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1a23' })
  hi('TelescopeBorder',         { fg = '#646575',             bg = '#1a1a23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1a23' })
  hi('TelescopePromptBorder',   { fg = '#646575',             bg = '#1a1a23' })
  hi('TelescopePromptPrefix',   { fg = '#8b8dc1',             bg = '#1a1a23' })
  hi('TelescopePromptCounter',  { fg = '#afafb6',  bg = '#1a1a23' })
  hi('TelescopePromptTitle',    { fg = '#1a1a23',             bg = '#8b8dc1' })
  hi('TelescopePreviewTitle',   { fg = '#1a1a23',             bg = '#9781b1' })
  hi('TelescopeResultsTitle',   { fg = '#1a1a23',             bg = '#ac84ae' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262636' })
  hi('TelescopeSelectionCaret', { fg = '#8b8dc1',             bg = '#262636' })
  hi('TelescopeMatching',       { fg = '#8b8dc1',             bold = true })
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
