return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- FIXME: Always use opts instead of config when possible. config is almost never needed.
      require("telescope").load_extension "orgmode"
      vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
      -- Links are not concealed
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"
    end,
  },
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "chipsenkbeil/org-roam.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-orgmode/telescope-orgmode.nvim",
      "nvim-orgmode/org-bullets.nvim",
      "lukas-reineke/headlines.nvim",
    },
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/notes.org",
      org_todo_keywords = { "TODO", "WAIT", "|", "DONE" },
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n %u",
          target = "~/orgfiles/todos.org",
        },
        d = {
          description = "Distraction",
          template = "* TODO %?\n SCHEDULED: <%<%Y-%m-%d %a %H:%M +10m>> \n %u",
          target = "~/orgfiles/distractions.org",
        },
      },
    },
  },
  {
    "chipsenkbeil/org-roam.nvim",
    opts = {
      directory = "~/orgfiles/org_roam",
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        headline_highlights = false,
      },
    },
  },
}
