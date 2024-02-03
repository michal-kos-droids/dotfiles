return {}
-- local expand_swift_closure = function()
--
--   local currentLine = vim.api.nvim_get_current_line()
--   local closurePattern = "^(%s*)([^%(]*)%(([^%(]*), %w+%: %(([^%)]*)%) %-%> %([^%)]*%)%)"
--
--   if not string.find(currentLine, closurePattern) then
--     return
--   end
--
--   local padding, foo, params, closureParams = string.match(currentLine, closurePattern)
--   local _, numberOfParams = string.gsub(closureParams, ",", "")
--   local funcCall = padding .. foo .. "(" .. params .. ") { "
--   local expandedClosure = funcCall
--
--   if string.len(closureParams) > 0 then
--     numberOfParams = numberOfParams + 1
--   end
--
--   for i = 1, numberOfParams do
--     expandedClosure = expandedClosure .. (i > 1 and ", " or "") .. "param" .. i
--   end
--
--   if numberOfParams > 0 then
--     expandedClosure = expandedClosure .. " in"
--   end
--
--   local newLines = {
--     expandedClosure,
--     padding .. "    ",
--     padding .. "}",
--   }
--
--   local row = vim.api.nvim_win_get_cursor(0)[1]
--
--   vim.api.nvim_buf_set_lines(0, row - 1, row, false, newLines)
--
--   if numberOfParams > 0 then
--     vim.api.nvim_win_set_cursor(0, { row, string.len(funcCall) })
--   else
--     vim.api.nvim_win_set_cursor(0, { row + 1, string.len(padding) + 5 })
--   end
-- end
--
-- vim.keymap.set("n", "se", expand_swift_closure, { desc = "Expand Swift Closure" })