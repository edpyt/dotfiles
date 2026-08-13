require("matugen").setup()

-- FIXME:  nvim-treesitter does not automatically start highlighting for org files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function(args) vim.treesitter.start(args.buf, "org") end,
})
