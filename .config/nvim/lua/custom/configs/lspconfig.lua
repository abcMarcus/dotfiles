local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  settings = {
    python = {
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

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})
