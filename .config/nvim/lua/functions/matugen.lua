local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#1b1c22", -- Default Background
    base01 = "#2d2e39", -- Lighter Background (status bars)
    base02 = "#292933", -- Selection Background
    base03 = "#64667a", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afafb6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#c566cc", -- Integers, Constants
    base0A = "#8d5cd6", -- Classes, Search Background
    base0B = "#6770e4", -- Strings, Diff Inserted
    base0C = "#e396e9", -- Regex, Escape Chars
    base0D = "#9399ec", -- Functions, Methods
    base0E = "#b796e9", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
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
