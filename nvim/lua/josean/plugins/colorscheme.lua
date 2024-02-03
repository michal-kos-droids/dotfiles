return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        disable_background = true,
        disable_italics = true,
      })

      vim.cmd('colorscheme rose-pine-moon')
      vim.api.nvim_set_hl(0, "@type.qualifier.swift", { link = "Keyword" })

    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
      highlight_groups = {
        Type = { fg = "pine" }, 
      },
    },
  },
}
