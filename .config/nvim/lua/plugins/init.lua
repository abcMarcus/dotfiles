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
				"prettier",
				-- typst
				"tinymist",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,

		config = function()
			-- ensure parsers are installed
			require("nvim-treesitter").install({
				"c",
				"cpp",
				"css",
				"html",
				"lua",
				"python",
				"vim",
				"vimdoc",
				"yaml",
			})

			-- enable treesitter highlighting
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
