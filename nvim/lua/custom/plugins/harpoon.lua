return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('harpoon').setup {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
      },
    }

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>a', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Mark file with harpoon' })
    keymap.set('n', '<C-n>', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = 'Go to previous harpoon mark' })
    keymap.set('n', '<C-e>', "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = 'Go to next harpoon mark' })
    keymap.set('n', '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Show harpoon marks' })
    -- keymap.set('n', '<C-m>', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Show harpoon marks' })
  end,
}
