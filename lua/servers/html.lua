local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({})
require("lspconfig").emmet_ls.setup({})
require("lspconfig").tailwindcss.setup({
  filetypes = { "ejs", "html", "php", "javascriptreact", "typescriptreact" },
})
