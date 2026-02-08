require "functions.orgmode_clock_report"

vim.o.background = "dark"
vim.lsp.enable "org"
vim.api.nvim_set_hl(0, "@org.agenda.scheduled", { link = "@property" })
