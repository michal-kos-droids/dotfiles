--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
-- vim.opt.breakindent = true
vim.env.SOURCEKIT_LOGGING = 3
-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- search
vim.opt.incsearch = true -- highlight search results

-- scroll
vim.opt.scrolloff = 8 -- keep 8 lines above and below cursor

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes' -- show sign column so that text doesn't shift
vim.opt.colorcolumn = '80'

-- backspace
-- vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

vim.opt.exrc = true
vim.opt.secure = true

-- opt.spelllang = 'en_us,pl'
-- opt.spell = true
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = false
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste without yanking' }) -- paste without yanking

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' }) -- move line down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' }) -- move line up

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines' }) -- join lines

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' }) -- scroll down
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' }) -- scroll up
vim.keymap.set('n', 'n', 'nzz', { desc = 'Jump to next match' }) -- jump to next match
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Jump to previous match' }) -- jump to previous match

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' }) -- copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' }) -- copy to clipboard
vim.keymap.set('n', '<leader>Y', 'gg"+yG', { desc = 'Copy all to clipboard' }) -- copy all to clipboard

vim.keymap.set('n', '<leader>S', ':%s/\\<<C-r><C-w>\\>/', { desc = 'Search and replace' }) -- search and replace

-- use jk to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- close all buffers but the current one
vim.keymap.set('n', '<leader>bd', '<cmd>bd|e#<CR>', { desc = 'Close all buffers but the current one' })

-- clear search highlights
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '[i', '<cmd>silent cn<cr>zz', { desc = 'Jump to next issue' })
vim.keymap.set('n', ']i', '<cmd>silent cp<cr>zz', { desc = 'Jump to previous issue' })

-- DAPUI
vim.keymap.set('n', '<Leader>dq', function()
  require('dapui').toggle()
end)

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })

-- LazyGit
vim.keymap.set('n', '<C-g>', '<CMD>LazyGit<CR>', { desc = 'Git' })

-- Splits
vim.keymap.set('n', '<leader>o', '<CMD>:only<CR>', { desc = 'Close all but focused split' })

-- TODO comments
vim.keymap.set('n', '<leader>st', '<CMD>TodoTelescope<CR>', { desc = 'Search TODO comments' })

-- Open file in finder
vim.keymap.set('n', '<leader>so', '<CMD>lua require("telescope.builtin").file_browser()<CR>', { desc = 'Open file in finder' })

-- Inlay hints
-- if vim.lsp

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*.swift',
  callback = function(ev)
    local lines = #vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)

    if lines > 1 then
      return
    end

    local filename = string.match(ev.file, '([^/]*)%.swift')
    local name = filename

    -- TODO: make sure this path leads to your folder with templates!!
    local basepath = os.getenv 'HOME' .. '/.config/templates/swift/'
    local templates = { 'View', 'ViewModel', 'Builder', 'Router', 'ViewTests', 'Tests', 'Spec', 'Coordinator', 'Presenter', 'Interactor' }

    local template
    local cursor

    for _, templateSuffix in ipairs(templates) do
      if vim.endswith(filename, templateSuffix) then
        template = vim.fn.readfile(basepath .. string.lower(templateSuffix) .. '.txt')
        name = string.gsub(name, templateSuffix, '')
        break
      end
    end

    template = template or vim.fn.readfile(basepath .. 'empty.txt')

    for i = 1, #template do
      template[i] = string.gsub(template[i], '{date}', os.date '%d/%m/%Y')
      template[i] = string.gsub(template[i], '{year}', os.date '%Y')
      template[i] = string.gsub(template[i], '{filename}', filename)
      template[i] = string.gsub(template[i], '{name}', name)

      if cursor == nil and string.find(template[i], '{cursor}') then
        cursor = { i, tonumber(string.find(template[i], '{cursor}')) + 1 }
      end
      template[i] = string.gsub(template[i], '{cursor}', ' ')
    end

    vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, template)

    if cursor then
      vim.api.nvim_win_set_cursor(0, cursor)
    end

    vim.cmd 'w'
  end,
})

vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'type.qualifier.swift', { link = 'Keyword' })
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = { 'XcodebuildBuildFinished', 'XcodebuildTestsFinished' },
  callback = function(event)
    if event.data.cancelled then
      return
    end

    if event.data.success then
      require('trouble').close()
    elseif not event.data.failedCount or event.data.failedCount > 0 then
      require('trouble').open { focus = false }
      require('trouble').refresh()
    end
  end,
})
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
