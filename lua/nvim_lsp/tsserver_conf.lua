require'lspconfig'.tsserver.setup{
 filetypes = { "typescript", "typescriptreact", "typescript.tsx", "typescript.ts" },
  root_dir = function() return vim.loop.cwd() end   
}

