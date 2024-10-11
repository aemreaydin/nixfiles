return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<Esc>"] = "actions.close",
      },
      float = {
        max_height = math.ceil(vim.o.lines * 0.4),
        max_width = math.ceil(vim.o.columns * 0.4),
        border = "rounded",
        win_options = {
          winblend = 0,
        },
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
