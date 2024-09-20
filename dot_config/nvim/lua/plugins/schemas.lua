return {
  {
    "nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas({
                -- additional schemas (not in the catalog)
                extra = {
                  url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
                  name = "Argo CD Application",
                  fileMatch = "argocd-application.yaml",
                },
              })
            )
          end,
        },
      },
    },
  },
}
