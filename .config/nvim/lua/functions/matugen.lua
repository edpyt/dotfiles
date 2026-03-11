local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#082335", -- Default Background
    base01 = "#0f3a57", -- Lighter Background (status bars)
    base02 = "#0c3450", -- Selection Background
    base03 = "#606d75", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb3b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#98cc66", -- Integers, Constants
    base0A = "#4f5de3", -- Classes, Search Background
    base0B = "#65b2e7", -- Strings, Diff Inserted
    base0C = "#bee996", -- Regex, Escape Chars
    base0D = "#91c8ee", -- Functions, Methods
    base0E = "#919aee", -- Keywords, Storage
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
