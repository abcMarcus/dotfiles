require("nvchad.configs.lspconfig").defaults()

-- Use the new Neovim 0.11+ LSP configuration system
-- This avoids the "require('lspconfig') framework is deprecated" warning

-- Set up servers that don't need custom config
local servers = { "html", "cssls" }
for _, lsp in ipairs(servers) do
	vim.lsp.enable(lsp)
end

-- Tinymist (typst)
vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
		formatterPrintWidth = 80,
		formatterProseWrap = true,
		lint = {
			enable = true,
			when = "onType",
		},
	},
})
vim.lsp.enable("tinymist")

-- Ruff (python linter/formatter)
vim.lsp.config("ruff", {
	init_options = {
		settings = {
			lineLength = 80,
			organizeImports = true,
		},
	},
})
vim.lsp.enable("ruff")

-- Pyright (python LSP)
vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoImportCompletions = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})
vim.lsp.enable("pyright")

-- Clangd (c/c++)
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=never",
	},
})
vim.lsp.enable("clangd")
