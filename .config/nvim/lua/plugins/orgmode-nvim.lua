return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "chipsenkbeil/org-roam.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-orgmode/telescope-orgmode.nvim",
      "nvim-orgmode/org-bullets.nvim",
      {
        "folke/snacks.nvim",
        opts = {
          image = {
            doc = { enabled = true },
          },
        },
      },
    },
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/Documents/orgfiles/*.org",
      org_default_notes_file = "~/Documents/orgfiles/notes.org",
      org_todo_keywords = { "TODO(t)", "WAIT(w)", "|", "DONE(d)", "DELEGATED(g)" },
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n %u",
          target = "~/Documents/orgfiles/todos.org",
        },
        w = {
          description = "Work",
          template = "* TODO %?\n %u",
          target = "~/Documents/orgfiles/work.org",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- FIXME:
      -- vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      -- vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      -- vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)

      -- Links are not concealed
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    opts = {
      directory = "~/Documents/orgfiles/org_roam",
      templates = {
        d = {
          description = "default",
          template = [[
#+HTML_HEAD: <link rel="stylesheet" href="../../../assets/org.css" type="text/css" />

%?
]],
          target = "%<%Y%m%d%H%M%S>-%[slug].org",
        },
      },
    },
  },
  {
    "nvim-orgmode/org-bullets.nvim",
    opts = {},
  },
}
