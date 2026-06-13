 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#282828',
    base01 = '#3c3836',
    base02 = '#474240',
    base03 = '#786f6b',
    base04 = '#ebdbb2',
    base05 = '#fbf1c7',
    base06 = '#fbf1c7',
    base07 = '#fbf1c7',
    base08 = '#fb4934',
    base09 = '#83a598',
    base0A = '#fabd2f',
    base0B = '#b8bb26',
    base0C = '#96e9c9',
    base0D = '#e8e995',
    base0E = '#fcd782',
    base0F = '#7d0d00',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#fbf1c7',          bg = '#282828' })
  hi('TelescopeBorder',         { fg = '#786f6b',             bg = '#282828' })
  hi('TelescopePromptNormal',   { fg = '#fbf1c7',          bg = '#282828' })
  hi('TelescopePromptBorder',   { fg = '#786f6b',             bg = '#282828' })
  hi('TelescopePromptPrefix',   { fg = '#b8bb26',             bg = '#282828' })
  hi('TelescopePromptCounter',  { fg = '#ebdbb2',  bg = '#282828' })
  hi('TelescopePromptTitle',    { fg = '#282828',             bg = '#b8bb26' })
  hi('TelescopePreviewTitle',   { fg = '#282828',             bg = '#fabd2f' })
  hi('TelescopeResultsTitle',   { fg = '#282828',             bg = '#83a598' })
  hi('TelescopeSelection',      { fg = '#fbf1c7',          bg = '#474240' })
  hi('TelescopeSelectionCaret', { fg = '#b8bb26',             bg = '#474240' })
  hi('TelescopeMatching',       { fg = '#b8bb26',             bold = true })
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
