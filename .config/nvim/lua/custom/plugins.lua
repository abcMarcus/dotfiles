local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "ruff",
                "ruff-lsp",
                "clangd",
                "clang-format",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }
}

return plugins
