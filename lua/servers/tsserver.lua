--Enable (broadcasting) snippet capability for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
})

-- require("lspconfig").custom_elements_ls.setup({
--   filetypes = {
--     "javascriptreact",
--     "javascript.jsx",
--     "typescriptreact",
--     "typescript.tsx",
--     "html",
--   },
-- })
require("lspconfig").prismals.setup({})
require("flutter-tools").setup({}) -- use defaults
require("typescript-tools").setup({
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
  },
})
require("lspconfig").solc.setup({})
