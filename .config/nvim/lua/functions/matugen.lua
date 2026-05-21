local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#1f2335",              -- Default Background
    base01 = "#2c314a",    -- Lighter Background (status bars)
    base02 = "#343957", -- Selection Background
    base03 = "#626a9e",              -- Comments, Invisibles
    -- Foreground tones
    base04 = "#c0caf5",   -- Dark Foreground (status bars)
    base05 = "#a9b1d6",           -- Default Foreground
    base06 = "#a9b1d6",           -- Light Foreground
    base07 = "#a9b1d6",        -- Lightest Foreground
    -- Accent colors
    base08 = "#f7768e",                -- Variables, XML Tags, Errors
    base09 = "#9cd58a",             -- Integers, Constants
    base0A = "#d7729f",            -- Classes, Search Background
    base0B = "#7a88cf",              -- Strings, Diff Inserted
    base0C = "#aae996",   -- Regex, Escape Chars
    base0D = "#96a3e9",    -- Functions, Methods
    base0E = "#e996bb",  -- Keywords, Storage
    base0F = "#bb0023",      -- Deprecated, Embedded Tags
  })
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
