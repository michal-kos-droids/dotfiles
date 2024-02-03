return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("xcodebuild").setup({
      auto_focus = true,
      logs = {
        auto_open_on_success_tests = false,                  -- open logs when tests succeeded
        auto_open_on_failed_tests = true,                   -- open logs when tests failed
        auto_open_on_success_build = false,                  -- open logs when build succeeded
        auto_open_on_failed_build = true,                   -- open logs when build failed
      },
    })
  end,
}
