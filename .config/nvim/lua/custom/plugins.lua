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
                "rust-analyzer",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
    }

}

return plugins
