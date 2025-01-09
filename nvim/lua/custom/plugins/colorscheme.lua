return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('rose-pine').setup {
      variant = 'dawn',
      -- disable_background = true,
      disable_italics = true,
    }

    vim.cmd.colorscheme 'rose-pine-dawn'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}

-- return { -- You can easily change to a different colorscheme.
--   -- Change the name of the colorscheme plugin below, and then
--   -- change the command in the config to whatever the name of that colorscheme is
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
--   'catppuccin',
--   name = 'catppuccin',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('catppuccin').setup {
--       flavour = 'latte',
--       -- disable_background = true,
--       disable_italics = true,
--     }
--
--     vim.cmd.colorscheme 'catppuccin'
--
--     -- You can configure highlights by doing something like
--     vim.cmd.hi 'Comment gui=none'
--   end,
-- }

-- return { -- You can easily change to a different colorscheme.
--   -- Change the name of the colorscheme plugin below, and then
--   -- change the command in the config to whatever the name of that colorscheme is
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
--   'arzg/vim-colors-xcode',
--   name = 'vim-colors-xcode',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- require('arzg/vim-colors-xcode').setup {
--     --   flavour = 'latte',
--     --   -- disable_background = true,
--     --   disable_italics = true,
--     -- }
--
--     vim.cmd.colorscheme 'xcodelight'
--
--     -- You can configure highlights by doing something like
--     vim.cmd.hi 'Comment gui=none'
--   end,
-- }
