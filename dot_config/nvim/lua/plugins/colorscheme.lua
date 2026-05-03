return {
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  {
    -- Hook into colorscheme load to override highlights
    "Mofiqul/dracula.nvim",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "dracula",
        callback = function()
          vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6272a4", italic = true })
        end,
      })
      require("dracula").setup({})
      vim.cmd("colorscheme dracula")
    end,
  },
}
