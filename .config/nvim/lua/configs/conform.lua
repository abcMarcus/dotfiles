local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		yaml = { "prettier" },
	},
	-- format_on_save = {
	--        timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
}

return options
