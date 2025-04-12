return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "chipsenkbeil/org-roam.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-orgmode/telescope-orgmode.nvim",
      "nvim-orgmode/org-bullets.nvim",
    },
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/notes.org",
      org_todo_keywords = { "TODO(t)", "WAIT(w)", "|", "DONE(d)", "DELEGATED(g)" },
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n %u",
          target = "~/orgfiles/todos.org",
        },
        w = {
          description = "Work",
          template = "* TODO %?\n %u",
          target = "~/orgfiles/work.org",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- FIXME: rewrite to AstroNvim way
      -- vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      -- vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      -- vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)

      -- Links are not concealed
      opts.conceallevel = 2
      opts.concealcursor = "nc"
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    opts = {
      directory = "~/orgfiles/org_roam",
    },
  },
  {
    "nvim-orgmode/org-bullets.nvim",
    opts = {},
  },
}
