local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#232136", -- Default Background
    base01 = "#393552", -- Lighter Background (status bars)
    base02 = "#423d5e", -- Selection Background
    base03 = "#6d6890", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#908caa", -- Dark Foreground (status bars)
    base05 = "#e0def4", -- Default Foreground
    base06 = "#e0def4", -- Light Foreground
    base07 = "#e0def4", -- Lightest Foreground
    -- Accent colors
    base08 = "#eb6f92", -- Variables, XML Tags, Errors
    base09 = "#3e8fb0", -- Integers, Constants
    base0A = "#9ccfd8", -- Classes, Search Background
    base0B = "#ea9a97", -- Strings, Diff Inserted
    base0C = "#96d1e9", -- Regex, Escape Chars
    base0D = "#ea9895", -- Functions, Methods
    base0E = "#96dce9", -- Keywords, Storage
    base0F = "#a00833", -- Deprecated, Embedded Tags
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
