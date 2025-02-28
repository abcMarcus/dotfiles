local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

lspconfig.ruff.setup({
})

lspconfig.clangd.setup({
    filetypes = {"c"},
    on_attach = function (client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})
