return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]itsigns' },
      { '<leader>m', group = '[M]Formatting' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]ree' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>x', group = '[X]code' },
    }
  end,
}
