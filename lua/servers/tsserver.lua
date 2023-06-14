--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = on_attach,
  },
})
require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
})
require("lspconfig").custom_elements_ls.setup({})
require("lspconfig").prismals.setup({})
require("flutter-tools").setup({}) -- use defaults
