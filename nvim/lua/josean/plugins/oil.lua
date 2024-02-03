return {
  'stevearc/oil.nvim',
  opts = {
    -- keymaps = {
    --   ["g?"] = "actions.show_help",
    --   ["<C-s>"] = "actions.select_vsplit",
    --   ["<C-h>"] = "actions.select_split",
    --   ["<C-t>"] = "actions.select_tab",
    --   ["<C-p>"] = "actions.preview",
    --   ["<C-c>"] = "actions.close",
    --   ["<C-l>"] = "actions.refresh",
    --   ["-"] = "actions.parent",
    --   ["_"] = "actions.open_cwd",
    --   ["`"] = "actions.cd",
    --   ["~"] = "actions.tcd",
    --   ["gs"] = "actions.change_sort",
    --   ["gx"] = "actions.open_external",
    --   ["g."] = "actions.toggle_hidden",
    --   ["g\\"] = "actions.toggle_trash",
    -- },
    -- use_default_keymaps = false,
    default_file_explorer = false,
    float = {
      padding = 6,
      max_width = 100,
      max_height = 25,
      border = "rounded",
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
