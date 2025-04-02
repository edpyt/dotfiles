---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              ignored = {
                leptos_macro = {
                  "server",
                },
              },
            },
            rustfmt = {
              overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
            },
          },
        },
      },
    },
  },
}
