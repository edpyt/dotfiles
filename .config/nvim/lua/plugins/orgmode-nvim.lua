return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    -- FIXME: Temporary: PR #1120 fixes embedded code block indentation.
    -- Remove when PR is merged upstream.
    commit = "499c002dd90651388665381ef3b555dfba7e1c64",

    dependencies = {
      "nvim-orgmode/telescope-orgmode.nvim",

      {
        "nvim-orgmode/org-bullets.nvim",
        opts = {},
      },
      {
        "folke/snacks.nvim",
        opts = {
          image = {
            doc = { enabled = true },
          },
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
      {
        "chipsenkbeil/org-mouse.nvim",
        config = function() require("org-mouse").setup() end,
      },
    },

    config = function()
      require("orgmode").setup {
        org_agenda_files = "~/Documents/orgfiles/*.org",
        org_todo_keywords = { "TODO(t)", "WAIT(w)", "|", "DONE(d)", "DELEGATED(g)" },
        org_hide_emphasis_markers = true,
        org_agenda_show_future_repeats = "next",
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
          u = {
            description = "University",
            template = "* TODO %?\n %u",
            target = "~/Documents/orgfiles/uni.org",
          },
          h = {
            description = "Habits",
            template = "* TODO %?\n %u",
            target = "~/Documents/orgfiles/habits.org",
          },
        },
      }

      vim.lsp.enable "org"

      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"

      require "functions.orgmode_clock_report"
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
}
