return {
	{
		"stevearc/conform.nvim",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				-- python
				"ruff",
				"black",
				"isort",
				-- c
				"clangd",
				"clang-format",
				-- typst
				"tinymist",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"css",
				"html",
				"lua",
				"python",
				"vim",
				"vimdoc",
			},
		},
	},
}
