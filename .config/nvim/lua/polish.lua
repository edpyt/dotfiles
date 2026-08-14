require("matugen").setup()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function(args) vim.treesitter.start(args.buf, "org") end,
})
