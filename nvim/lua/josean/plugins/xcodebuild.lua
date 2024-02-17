return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("xcodebuild").setup({
      auto_focus = true,
      logs = { -- build & test logs
        auto_open_on_success_tests = false, -- open logs when tests succeeded
        auto_open_on_failed_tests = false, -- open logs when tests failed
        auto_open_on_success_build = false, -- open logs when build succeeded
        auto_open_on_failed_build = false,
      },
    })
  end,
}
