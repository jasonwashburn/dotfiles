return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- templ will be automatically installed with mason and loaded with lspconfig
      templ = {
        setup = {
          root_dir = require("lspconfig").util.root_pattern("go.mod"),
        },
      },
    },
  },
  vim.filetype.add({ extension = { templ = "templ" } }),
}
