-- https://github.com/nvim-orgmode/orgmode/issues/1065

local function parse_duration_to_seconds(duration_str)
  local hours, minutes = duration_str:match "^(%d+):(%d+)$"
  if not hours or not minutes then return 0 end
  local h = tonumber(hours)
  local m = tonumber(minutes)
  return (h * 3600) + (m * 60)
end

local function format_seconds_to_duration(total_seconds)
  local total_minutes = math.floor(total_seconds / 60)
  local hours = math.floor(total_minutes / 60)
  local minutes = total_minutes % 60
  return string.format("%d:%02d", hours, minutes)
end

function ClockSumSelectedLines()
  local total_seconds = 0
  local count = 0

  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"

  -- Safety check for selection or single line
  if start_line > end_line then
    start_line = vim.fn.line "."
    end_line = vim.fn.line "."
  end

  -- Get the content of the selected lines (start is 1-indexed, so we use start_line - 1)
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- 1. Determine Indent from the first line
  local first_line = lines[1] or ""
  -- Lua pattern: ^(%s*) captures all leading whitespace at the start of the line.
  local indent = first_line:match "^(%s*)" or ""

  -- 2. Calculate Sum
  for _, line in ipairs(lines) do
    local duration = line:match "=> (%d+:%d+)$"

    if duration then
      total_seconds = total_seconds + parse_duration_to_seconds(duration)
      count = count + 1
    end
  end

  if count == 0 then
    print "No valid clock lines found in selection."
    return
  end

  local total_duration_str = format_seconds_to_duration(total_seconds)

  -- 3. Prepend Indent to the Result Row
  local result_row_content = string.format("TOTAL_CLOCK_SUM: %s (from %d rows)", total_duration_str, count)
  local result_row = indent .. result_row_content -- Add the captured indent here

  -- Insert the result row below the selection.
  vim.api.nvim_buf_set_lines(0, end_line, end_line, true, { result_row })

  -- Move the cursor to the newly inserted line
  vim.api.nvim_win_set_cursor(0, { end_line + 1, #indent + 1 }) -- Move cursor past the indent

  print(string.format("Clock sum calculated: %s", total_duration_str))
end

vim.api.nvim_create_user_command("ClockSum", ClockSumSelectedLines, {
  range = true,
  desc = "Calculates total time from CLOCK rows and inserts the total below.",
})
vim.keymap.set(
  "v",
  "<leader>cs",
  ":'<,'>ClockSum<CR>",
  { noremap = true, silent = true, desc = "Calculate Clock Sum for Selection" }
)
