local orgmode = vim.fn.stdpath "data" .. "/lazy/orgmode"
vim.opt.runtimepath:append(orgmode)

require("orgmode").cron {
  org_agenda_files = "~/orgfiles/**/*",
  org_default_notes_file = "~/orgfiles/notes.org",
  notifications = {
    reminder_time = { 0, 5, 10 },
  },
}
