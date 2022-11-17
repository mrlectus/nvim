require "lspconfig".tsserver.setup {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "typescript.ts" },
    root_dir = function()
        return vim.loop.cwd()
    end
}
require "lspconfig".eslint.setup {}
require "lspconfig".jsonls.setup {}
