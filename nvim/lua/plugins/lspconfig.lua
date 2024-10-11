return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rnix = {},
    },
    inlay_hints = {
      enable = false,
      exclude = { "rust" },
    },
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
