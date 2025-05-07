local orgmode = vim.fn.stdpath "data" .. "/lazy/orgmode"
vim.opt.runtimepath:append(orgmode)

require("orgmode").cron {
  org_agenda_files = "~/Documents/orgfiles/**/*",
  notifications = {
    reminder_time = { 0, 5, 10 },
  },
}
