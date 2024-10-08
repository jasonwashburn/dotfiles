return {
  {
    "nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas({
                -- additional schemas (not in the catalog)
                ignore = { "Ansible Tasks File", "Deployer Recipe" },
                extra = {
                  {
                    description = "UDS Schema",
                    fileMatch = "uds-bundle.yaml",
                    name = "uds-bundle.yaml",
                    url = "https://raw.githubusercontent.com/defenseunicorns/uds-cli/main/uds.schema.json",
                  },
                  {
                    description = "UDS Tasks Schema",
                    -- fileMatch = "tasks.yaml",
                    fileMatch = { "/**/tasks/*.yaml", "tasks.yaml" },
                    name = "tasks.yaml",
                    url = "https://raw.githubusercontent.com/defenseunicorns/uds-cli/main/tasks.schema.json",
                  },
                  {
                    description = "Zarf Schema",
                    fileMatch = "zarf.yaml",
                    name = "zarf.yaml",
                    url = "https://raw.githubusercontent.com/defenseunicorns/uds-cli/main/zarf.schema.json",
                  },
                },
              })
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
      },
      setup = {
        yamlls = function()
          -- Neovim < 0.10 does not have dynamic registration for formatting
          if vim.fn.has("nvim-0.10") == 0 then
            LazyVim.lsp.on_attach(function(client, _)
              client.server_capabilities.documentFormattingProvider = true
            end, "yamlls")
          end
        end,
      },
    },
  },
}
