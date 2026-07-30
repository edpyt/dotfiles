 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#142029',
    base01 = '#223544',
    base02 = '#1f303d',
    base03 = '#5d6b71',
    base04 = '#afb4b6',
    base05 = '#f2f3f3',
    base06 = '#f2f3f3',
    base07 = '#f2f3f3',
    base08 = '#fd4663',
    base09 = '#8266cc',
    base0A = '#5c79d6',
    base0B = '#67c3e4',
    base0C = '#ad96e9',
    base0D = '#93d4ec',
    base0E = '#96aae9',
    base0F = '#910017',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f3f3',          bg = '#142029' })
  hi('TelescopeBorder',         { fg = '#5d6b71',             bg = '#142029' })
  hi('TelescopePromptNormal',   { fg = '#f2f3f3',          bg = '#142029' })
  hi('TelescopePromptBorder',   { fg = '#5d6b71',             bg = '#142029' })
  hi('TelescopePromptPrefix',   { fg = '#67c3e4',             bg = '#142029' })
  hi('TelescopePromptCounter',  { fg = '#afb4b6',  bg = '#142029' })
  hi('TelescopePromptTitle',    { fg = '#142029',             bg = '#67c3e4' })
  hi('TelescopePreviewTitle',   { fg = '#142029',             bg = '#5c79d6' })
  hi('TelescopeResultsTitle',   { fg = '#142029',             bg = '#8266cc' })
  hi('TelescopeSelection',      { fg = '#f2f3f3',          bg = '#1f303d' })
  hi('TelescopeSelectionCaret', { fg = '#67c3e4',             bg = '#1f303d' })
  hi('TelescopeMatching',       { fg = '#67c3e4',             bold = true })
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
