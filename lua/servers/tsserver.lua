local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
})
require("lspconfig").prismals.setup({})
require("flutter-tools").setup({}) -- use defaults
require("typescript-tools").setup({
	settings = {
		code_lens = "all",
		-- tsserver_path = "typescript-language-server --stdio",
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
			quotePreference = "auto",
			separate_diagnostic_server = true,
			includeInlayEnumMemberValueHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayVariableTypeHints = true,
		},
	},
})
require("lspconfig").solc.setup({})
