require "lspconfig".texlab.setup {}
require "lspconfig".ltex.setup {
  filetypes = {"bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb"}
}
