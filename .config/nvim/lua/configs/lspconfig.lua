require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")

lspconfig["tinymist"].setup({
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
		-- lintenable = "enable",
	},
})

lspconfig.ruff.setup({
	init_options = {
		settings = {
			lineLength = 80,
            organizeImports = true,
		},
	},
})

lspconfig.pyright.setup({
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
