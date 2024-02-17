return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  version = false,
  config = function()
    -- to toggle comments just hit `gc`
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return vim.api.nvim_buf_get_option(0, "ft") == "swift" and "// %s"
        end,
      },
      mappings = {
        comment_line = "gc",
      },
    })

    -- to quickly add/remove surrounding characters
    -- `sd<symbol>` to delete
    -- `sa<motion><symbol>` to add
    require("mini.surround").setup({
      mappings = {
        add = "sa",
        delete = "sd",
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        replace = "", -- Replace surrounding
        update_n_lines = "", -- Update `n_lines`
        suffix_last = "", -- Suffix to search with "prev" method
        suffix_next = "", -- Suffix to search with "next" method
      },
    })

    -- this is very useful, by hitting `sj` you can split arguments into new lines (ctrl+m in Xcode)
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "sj",
        split = "",
        join = "",
      },
    })
 
    -- to easily move code around
    require("mini.move").setup({
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    })
  end,
}
