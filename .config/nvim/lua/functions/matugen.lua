local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#212337", -- Default Background
    base01 = "#292e42", -- Lighter Background (status bars)
    base02 = "#31374f", -- Selection Background
    base03 = "#606b9d", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#abb4da", -- Dark Foreground (status bars)
    base05 = "#ebfafa", -- Default Foreground
    base06 = "#ebfafa", -- Light Foreground
    base07 = "#ebfafa", -- Lightest Foreground
    -- Accent colors
    base08 = "#f16c75", -- Variables, XML Tags, Errors
    base09 = "#a48cf2", -- Integers, Constants
    base0A = "#04d1f9", -- Classes, Search Background
    base0B = "#37f499", -- Strings, Diff Inserted
    base0C = "#a48cf2", -- Regex, Escape Chars
    base0D = "#86f8c1", -- Functions, Methods
    base0E = "#82e9fd", -- Keywords, Storage
    base0F = "#a8020d", -- Deprecated, Embedded Tags
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
