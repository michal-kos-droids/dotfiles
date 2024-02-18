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
