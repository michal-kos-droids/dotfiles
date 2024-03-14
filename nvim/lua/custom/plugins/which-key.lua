return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]itsigns', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = '[X]code', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = '[M]Formatting', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]ree', _ = 'which_key_ignore' },
    }
  end,
}
