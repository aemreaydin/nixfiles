return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<Esc>"] = "actions.close",
      },
      float = {
        padding = 5,
      },
    })
  end,
  keys = {
    {
      "-",
      "<CMD>Oil --float<CR>",
      desc = "Open Oil",
    },
  },
}
