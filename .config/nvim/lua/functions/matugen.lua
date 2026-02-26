local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#282828", -- Default Background
    base01 = "#3c3836", -- Lighter Background (status bars)
    base02 = "#474240", -- Selection Background
    base03 = "#786f6b", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#ebdbb2", -- Dark Foreground (status bars)
    base05 = "#fbf1c7", -- Default Foreground
    base06 = "#fbf1c7", -- Light Foreground
    base07 = "#fbf1c7", -- Lightest Foreground
    -- Accent colors
    base08 = "#fb4934", -- Variables, XML Tags, Errors
    base09 = "#83a598", -- Integers, Constants
    base0A = "#fabd2f", -- Classes, Search Background
    base0B = "#b8bb26", -- Strings, Diff Inserted
    base0C = "#96e9c9", -- Regex, Escape Chars
    base0D = "#e8e995", -- Functions, Methods
    base0E = "#fcd782", -- Keywords, Storage
    base0F = "#7d0d00", -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["functions.matugen"] = nil
    require("functions.matugen").setup()
  end)
)

return M
