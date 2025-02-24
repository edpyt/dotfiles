-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        t = {
          ["<Leader>n"] = false,
        },
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        shell = "fish",
      }
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
    config = function()
      require("org-roam").setup {
        directory = "~/orgfiles/org_roam",
      }
      require("orgmode").setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/notes.org",
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
      }

      -- Aesthetics
      require("org-bullets").setup()
      require("headlines").setup {
        markdown = {
          headline_highlights = false,
        },
      }

      -- Customize bindings
      require("telescope").load_extension "orgmode"
      vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)

      -- Links are not concealed
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"
    end,
  },

  -- == Examples of Overriding Plugins ==
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
        " ",
      }
      return opts
    end,
  },
}
