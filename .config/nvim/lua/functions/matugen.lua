local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#1f1f28", -- Default Background
    base01 = "#2a2a37", -- Lighter Background (status bars)
    base02 = "#333343", -- Selection Background
    base03 = "#676785", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#717c7c", -- Dark Foreground (status bars)
    base05 = "#c8c093", -- Default Foreground
    base06 = "#c8c093", -- Light Foreground
    base07 = "#c8c093", -- Lightest Foreground
    -- Accent colors
    base08 = "#c34043", -- Variables, XML Tags, Errors
    base09 = "#7e9cd8", -- Integers, Constants
    base0A = "#c0a36e", -- Classes, Search Background
    base0B = "#76946a", -- Strings, Diff Inserted
    base0C = "#96b1e9", -- Regex, Escape Chars
    base0D = "#ade996", -- Functions, Methods
    base0E = "#e9cb96", -- Keywords, Storage
    base0F = "#430d0e", -- Deprecated, Embedded Tags
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
