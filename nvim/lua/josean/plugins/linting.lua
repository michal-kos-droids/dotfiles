return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- swiftlint
    local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
    local groups = { "lnum", "col", "severity", "message" }
    local defaults = { ["source"] = "swiftlint" }
    local severity_map = {
      ["error"] = vim.diagnostic.severity.ERROR,
      ["warning"] = vim.diagnostic.severity.WARN,
    }

    -- get config file path
    local cwd = vim.fn.getcwd()
    local swiftlintPath = vim.fn.system("find '" .. cwd .. "'" .. " -iname .swiftlint.yml -maxdepth 1")
    swiftlintPath = vim.split(swiftlintPath, "\n", { plain = true })
    if swiftlintPath[1] then
      swiftlintPath = string.match(swiftlintPath[1], "^%s*(.-)%s*$")
    end

    lint.linters.swiftlint = {
      cmd = "swiftlint",
      stdin = false,
      args = {
        "lint",
        "--force-exclude",
        "--use-alternative-excluding",
        "--config",
        swiftlintPath or os.getenv("HOME") .. "/.config/nvim/.swiftlint.yml",
      },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
    }

    -- setup
    lint.linters_by_ft = {
      swift = { "swiftlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ml", function()
      require("lint").try_lint()
    end, { desc = "Lint file" })
  end,
}
