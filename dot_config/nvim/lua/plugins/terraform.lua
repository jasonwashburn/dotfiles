return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "terraform", "hcl" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          settings = {
            ["terraform-ls"] = {
              terraformExecPath = "tofu",
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        terraform_fmt = {
          command = "tofu",
        },
      },
    },
  },
  -- Filetype detection
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.filetype.add({
        extension = {
          tf = "terraform",
          tfvars = "terraform",
        },
      })
    end,
  },
}
