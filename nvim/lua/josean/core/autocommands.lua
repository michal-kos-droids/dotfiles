-- ~/.config/nvim/lua/core/autocommands.lua

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost", "BufWritePost" }, {
  pattern = "*.swift",
  callback = function(ev)
    local lines = #vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)

    if lines > 1 then
      return
    end

    local filename = string.match(ev.file, "([^/]*)%.swift")
    local name = filename

    -- TODO: make sure this path leads to your folder with templates!!
    local basepath = os.getenv("HOME") .. "/.config/templates/swift/"
    local templates = { "View", "ViewModel", "Builder", "Router", "ViewTests" ,"Tests", "Spec", "Coordinator", "Presenter", "Interactor"} 

    local template
    local cursor

    for _, templateSuffix in ipairs(templates) do
      if vim.endswith(filename, templateSuffix) then
        template = vim.fn.readfile(basepath .. string.lower(templateSuffix) .. ".txt")
        name = string.gsub(name, templateSuffix, "")
        break
      end
    end

    template = template or vim.fn.readfile(basepath .. "empty.txt")

    for i = 1, #template do
      template[i] = string.gsub(template[i], "{date}", os.date("%d/%m/%Y"))
      template[i] = string.gsub(template[i], "{year}", os.date("%Y"))
      template[i] = string.gsub(template[i], "{filename}", filename)
      template[i] = string.gsub(template[i], "{name}", name)

      if cursor == nil and string.find(template[i], "{cursor}") then
        cursor = { i, tonumber(string.find(template[i], "{cursor}")) + 1 }
      end
      template[i] = string.gsub(template[i], "{cursor}", " ")
    end

    vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, template)

    if cursor then
      vim.api.nvim_win_set_cursor(0, cursor)
    end

    vim.cmd("w")
  end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function() 
    vim.api.nvim_set_hl(0, "type.qualifier.swift", { link = "Keyword" }) 
  end, 
})

vim.api.nvim_create_autocmd("User", {
  pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
  callback = function(event)
    if event.data.cancelled then
      return
    end

    if event.data.success then
      require("trouble").close()
    elseif not event.data.failedCount or event.data.failedCount > 0 then
      require("trouble").open({ focus = false })
      require("trouble").refresh()
    end
  end,
})

-- Define local variables
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
--
-- augroup('write_pre', { clear = true})
-- autocmd('BufWritePre', {
--   callback = function()
--     local cursor_pos = vim.fn.getpos('.')
--     vim.cmd('%s/\\s\\+$//e')
--     vim.fn.setpos('.', cursor_pos)
--   end,
--   group = 'write_pre',
--   desc = "Remove trailing whitespaces",
-- })
--
-- -- Highlight text on yank
-- augroup('YankHighlight', { clear = true })
-- autocmd('TextYankPost', {
--   group = 'YankHighlight',
--   callback = function()
--     vim.highlight.on_yank { higroup = 'IncSearch', timeout = '700' }
--   end,
--   desc = "Highlight yanked text",
-- })
--
-- -- -- augroup('auto_working_dir', { clear = true})
-- -- -- autocmd('BufEnter', {
-- -- --   pattern = "*",
-- -- --   group = "auto_working_dir",
-- -- --   command = "silent! lcd %:p:h",
-- -- --   desc = "Automatically sets working dir"
-- -- -- })
-- -- --
-- -- augroup("lsp_disable_diagnostic", { clear = true})
-- -- autocmd('BufEnter', {
-- --   group = 'lsp_disable_diagnostic',
-- --   pattern = "*",
-- --   command = "lua vim.diagnostic.disable()",
-- --   desc = "Disable diagnostic for a while"
-- -- })
--
-- augroup("MatchRedundantSpaces", { clear = true})
-- autocmd("InsertLeave", {
--   pattern = "*",
--   callback = function()
--     vim.cmd([[highlight RedundantSpaces ctermbg=red guibg=red]])
--     vim.cmd([[match RedundantSpaces /\s\+$/]])
--   end,
--   desc = "Higlight extra spaces",
-- })
--
-- augroup("clear_matches", { clear = true})
-- autocmd("InsertEnter", {
--   pattern = "*",
--   callback = function()
--     vim.cmd([[call clearmatches()]])
--     vim.cmd([[highlight RedundantSpaces ctermbg=red guibg=red]])
--   end,
--   desc = "Do not show extra spaces during typing",
-- })
--
-- augroup('yankpost', { clear = true })
-- autocmd({ "VimEnter", "CursorMoved" }, {
--   group = 'yankpost',
--   pattern = "*",
--   callback = function()
--     cursor_pos = vim.fn.getpos('.')
--   end,
--   desc = "Stores cursor position",
-- })
--
-- autocmd("TextYankPost", {
--   pattern = "*",
--   group = 'yankpost',
--   callback = function()
--     if vim.v.event.operator == 'y' then
--       vim.fn.setpos('.', cursor_pos)
--     end
--   end,
-- })
--
-- -- Automatically rebalance windows on vim resize
-- autocmd('VimResized', {
--   callback = function()
--     vim.cmd('tabdo wincmd =')
--   end,
--   desc = "Auto resize windows when size changes",
-- })
--
-- -- -- Never insert line as a comment when using 'o' to enter insert mode
-- -- autocmd('BufWinEnter', {
-- --   callback = function()
-- --     vim.cmd('setlocal formatoptions-=o')
-- --   end,
-- -- })
--
-- -- Close man and help with just <q>
-- autocmd('FileType', {
--   pattern = {
--     'help',
--     'man',
--     'lspinfo',
--     'checkhealth',
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set('n', 'q', '<cmd>q<cr>', { buffer = event.buf, silent = true })
--   end,
-- })
--
-- -- Auto create dir when saving a file where some intermediate directory does not exist
-- autocmd('BufWritePre', {
--   group = 'write_pre',
--   callback = function(event)
--     if event.match:match('^%w%w+://') then
--       return
--     end
--     local file = vim.loop.fs_realpath(event.match) or event.match
--     vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
--   end,
-- })
--
-- -- Check for spelling in text filetypes and enable wrapping, and set gj and gk keymaps
-- autocmd('FileType', {
--   pattern = {
--     'gitcommit',
--     'markdown',
--     'text',
--   },
--   callback = function()
--     local opts = { noremap = true, silent = true }
--     vim.opt_local.spell = true
--     vim.opt_local.wrap = true
--     vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', opts)
--     vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', opts)
--   end,
-- })
--
-- -- Go to the last loc when opening a buffer
-- augroup('bufcheck', { clear = true })
-- autocmd('BufReadPost', {
--   group = 'bufcheck',
--   callback = function()
--     local exclude = { "gitcommit" }
--     local buf = vim.api.nvim_get_current_buf()
--     if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
--       return
--     end
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })
--
-- -- Check if the file needs to be reloaded when it's changed
-- augroup('userconf', {clear = true})
-- autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
--   command = 'checktime',
--   group = 'userconf',
-- })
--
-- -- Toggle relative numbers based on certain events
-- augroup('GainFocus', { clear = true })
-- autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
--   pattern = '*',
--   group = 'GainFocus',
--   callback = function()
--     if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
--       vim.opt.relativenumber = true
--     end
--   end,
-- })
--
-- autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
--   pattern = '*',
--   group = 'GainFocus',
--   callback = function()
--     if vim.o.nu then
--       vim.opt.relativenumber = false
--       vim.cmd('redraw')
--     end
--   end,
-- })
--
-- -- Set cmdheight to 1 when recording, and put it back to normal when it stops
-- augroup('record_action', { clear = true })
-- autocmd('RecordingEnter', {
--   callback = function()
--     vim.opt_local.cmdheight = 1
--   end,
--   group = 'record_action',
-- })
--
-- autocmd('RecordingLeave', {
--   callback = function()
--     vim.opt_local.cmdheight = 0
--   end,
--   group = 'record_action',
-- })
-- commands
-- -- Filename: /home/sergio/.config/nvim/lua/core/commands.lua
-- -- Last Change: Fri, 09 Dec 2022 - 19:18
-- -- vim:set ft=lua nolist softtabstop=2 shiftwidth=2 tabstop=2 expandtab:
--
-- -- commands and abbreviations
-- vim.api.nvim_create_user_command('ClearBuffer', 'enew | bd! #', { nargs = 0, bang = true})
-- vim.api.nvim_create_user_command('CopyUrl', 'let @+=expand("<cfile>")', { nargs = 0, bang = true})
-- vim.api.nvim_create_user_command('HarponDel', ':lua require("harpoon.mark").rm_file()', { nargs = 0, bang = true})
-- vim.api.nvim_create_user_command('BlockwiseZero', ':lua require("core.utils").blockwise_register("0")<CR>', { nargs = '?', bang = false})
-- vim.api.nvim_create_user_command('BlockwisePlus', ':lua require("core.utils").blockwise_register("+")<CR>', { nargs = '?', bang = false})
-- vim.api.nvim_create_user_command('BlockwisePrimary', ':lua require("core.utils").blockwise_register("*")<CR>', { nargs = '?', bang = false})
-- vim.cmd([[cnoreab Bz BlockwiseZero]])
-- vim.cmd([[cnoreab B+ BlockwisePlus]])
-- vim.cmd([[cnoreab B* BlockwisePrimary]])
--
-- vim.api.nvim_create_user_command("OpenGithubRepo", function(_)
--   local ghpath = vim.api.nvim_eval("shellescape(expand('<cfile>'))")
--   local formatpath = ghpath:sub(2, #ghpath - 1)
--   local repourl = "https://www.github.com/" .. formatpath
--   vim.fn.system({ "xdg-open", repourl })
-- end, {
-- desc = "Open Github Repo",
-- force = true,
-- })
--
-- vim.cmd([[command! Dos2unix lua require('core.utils').dosToUnix()]])
--
-- vim.cmd([[cnoreab Cb ClearBuffer]])
-- vim.cmd([[cabbrev vb vert sb]]) --vertical split buffer :vb <buffer>
-- vim.cmd([[cnoreab cls Cls]])
-- vim.cmd([[command! Cls lua require("core.utils").preserve('%s/\\s\\+$//ge')]])
-- vim.cmd([[command! Reindent lua require('core.utils').preserve("sil keepj normal! gg=G")]])
--
-- vim.cmd([[highlight MinhasNotas ctermbg=Yellow ctermfg=red guibg=Yellow guifg=red]])
-- vim.cmd([[match MinhasNotas /NOTE:/]])
--
-- -- vim.cmd([[command! BufOnly lua require('core.utils').preserve("silent! %bd|e#|bd#")]])
-- vim.api.nvim_create_user_command('BufOnly',function()
--   pcall(function()
--     -- vim.fn.Preserve("exec '%bd|e#|bd#'")
--     require('core.utils').preserve("silent! up|%bd|e#|bd#")
--   end)
-- end,{})
--
-- vim.cmd([[cnoreab Bo BufOnly]])
-- vim.cmd([[cnoreab W w]])
-- vim.cmd([[cnoreab W! w!]])
-- vim.cmd([[command! CloneBuffer new | 0put =getbufline('#',1,'$')]])
-- vim.api.nvim_create_user_command('CloneBuffer', "new | 0put =getbufline('#',', '$')", { nargs = 0, bang = true} )
-- -- vim.cmd([[command! Mappings drop ~/.config/nvim/lua/user/mappings.lua]])
-- vim.cmd([[command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu]])
-- vim.cmd([[syntax sync minlines=64]]) --  faster syntax hl
-- -- vim.cmd([[command! Blockwise lua require('core.utils').blockwise_clipboard()]])
-- vim.api.nvim_create_user_command('Blockwise', function()
--   require'core.utils'.blockwise_clipboard()
-- end,
-- { desc = "Make + register blockwise", nargs = 0, bang = true}
-- )
-- vim.cmd([[cnoreab Bw Blockwise]])
--
-- -- Use ':Grep' or ':LGrep' to grep into quickfix|loclist
-- -- without output or jumping to first match
-- -- Use ':Grep <pattern> %' to search only current file
-- -- Use ':Grep <pattern> %:h' to search the current file dir
-- vim.cmd("command! -nargs=+ -complete=file Grep noautocmd grep! <args> | redraw! | copen")
-- vim.cmd("command! -nargs=+ -complete=file LGrep noautocmd lgrep! <args> | redraw! | lopen")
--
-- -- save as root, in my case I use the command 'doas'
-- vim.cmd([[cmap w!! w !doas tee % >/dev/null]])
-- vim.cmd([[command! SaveAsRoot w !doas tee %]])
--
-- -- vim.cmd([[hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233]])
-- -- vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])
--
-- -- vim.cmd('command! ReloadConfig lua require("utils").ReloadConfig()')
-- vim.cmd('command! ReloadConfig lua require("core.utils").ReloadConfig()')
--
-- -- inserts filename and Last Change: date
-- -- vim.cmd([[inoreab lc -- File: <c-r>=expand("%:p")<cr><cr>-- Last Change: <c-r>=strftime("%b %d %Y - %H:%M")<cr><cr>]])
--
-- vim.cmd('inoreabbrev Fname <c-r>=expand("%:p")<cr>')
-- vim.cmd('inoreabbrev Iname <c-r>=expand("%:p")<cr>')
-- vim.cmd('inoreabbrev fname <c-r>=expand("%:t")<cr>')
-- vim.cmd('inoreabbrev iname <c-r>=expand("%:t")<cr>')
--
-- vim.cmd('inoreabbrev idate <c-r>=strftime("%a, %d %b %Y %T")<cr>')
-- vim.cmd([[cnoreab cls Cls]])
--
-- vim.api.nvim_create_user_command("BiPolar", function(_)
--   local moods_table = {
--     ["true"] = "false",
--     ["false"] = "true",
--     ["on"] = "off",
--     ["off"] = "on",
--     ["Up"] = "Down",
--     ["Down"] = "Up",
--     ["up"] = "down",
--     ["down"] = "up",
--     ["enable"] = "disable",
--     ["disable"] = "enable",
--     ["no"] = "yes",
--     ["yes"] = "no",
--   }
--   local cursor_word = vim.api.nvim_eval("expand('<cword>')")
--   if moods_table[cursor_word] then
--     vim.cmd("normal ciw" .. moods_table[cursor_word] .. "")
--   end
-- end, { desc = "Switch Moody Words", force = true })
