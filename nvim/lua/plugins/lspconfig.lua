return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rnix = {},
    },
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
