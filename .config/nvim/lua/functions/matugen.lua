local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#1a1b26", -- Default Background
    base01 = "#24283b", -- Lighter Background (status bars)
    base02 = "#2c3148", -- Selection Background
    base03 = "#586691", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#9aa5ce", -- Dark Foreground (status bars)
    base05 = "#c0caf5", -- Default Foreground
    base06 = "#c0caf5", -- Light Foreground
    base07 = "#c0caf5", -- Lightest Foreground
    -- Accent colors
    base08 = "#f7768e", -- Variables, XML Tags, Errors
    base09 = "#9ece6a", -- Integers, Constants
    base0A = "#bb9af7", -- Classes, Search Background
    base0B = "#7aa2f7", -- Strings, Diff Inserted
    base0C = "#c1e996", -- Regex, Escape Chars
    base0D = "#87abf8", -- Functions, Methods
    base0E = "#af89f6", -- Keywords, Storage
    base0F = "#bb0023", -- Deprecated, Embedded Tags
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
