local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#1e1e2e",              -- Default Background
    base01 = "#313244",    -- Lighter Background (status bars)
    base02 = "#3a3b50", -- Selection Background
    base03 = "#646789",              -- Comments, Invisibles
    -- Foreground tones
    base04 = "#a3b4eb",   -- Dark Foreground (status bars)
    base05 = "#cdd6f4",           -- Default Foreground
    base06 = "#cdd6f4",           -- Light Foreground
    base07 = "#cdd6f4",        -- Lightest Foreground
    -- Accent colors
    base08 = "#f38ba8",                -- Variables, XML Tags, Errors
    base09 = "#c6a0f6",             -- Integers, Constants
    base0A = "#f5bde6",            -- Classes, Search Background
    base0B = "#b4befe",              -- Strings, Diff Inserted
    base0C = "#b98bf4",   -- Regex, Escape Chars
    base0D = "#8192fd",    -- Functions, Methods
    base0E = "#ee90d5",  -- Keywords, Storage
    base0F = "#c8043a",      -- Deprecated, Embedded Tags
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
