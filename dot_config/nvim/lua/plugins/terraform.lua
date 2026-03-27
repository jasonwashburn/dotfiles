return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "terraform", "hcl" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- to make this work, add a terraform softlink in the directory below
      vim.env.PATH = vim.fn.expand("~/.local/nvim-bin") .. ":" .. vim.env.PATH
      opts.servers = opts.servers or {}
      opts.servers.terraformls = {
        settings = {
          ["terraform-ls"] = {
            terraformExecPath = "tofu",
          },
        },
      }
      return opts
    end,
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
