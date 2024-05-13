return {
  'rcarriga/nvim-dap-ui',
  requires = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dapui = require 'dapui'

    dapui.setup()
    -- local dap = require("dap")
    -- dap.listeners.after.event_initialized["stopped"] = function(session, body)
    --   print('Stopped', vim.inspect(session), vim.inspect(body))
    --   dapui.open()
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end
  end,
}
