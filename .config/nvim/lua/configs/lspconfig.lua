require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

require("lspconfig")["tinymist"].setup({
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
        formatterPrintWidth = 80,
        formatterProseWrap = true,
        lint = {
            enable = true,
            when = "onType"
        }
		-- lintenable = "enable",
	},
})
