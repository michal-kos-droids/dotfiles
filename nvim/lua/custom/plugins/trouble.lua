return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<leader>xn', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Open trouble' } },
  },
  opts = {},
  config = function()
    require('trouble').setup {
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_jump = {},
      mode = 'quickfix',
      severity = vim.diagnostic.severity.ERROR,
      cycle_results = false,
    }
  end,
}
