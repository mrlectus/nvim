local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").html.setup({
  capabilities = capabilities,
})
require("lspconfig").emmet_ls.setup({})
require("lspconfig").tailwindcss.setup({
  root_dir = require("lspconfig").util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts"
  ),
  filetypes = {
    "astro",
    "astro-markdown",
    "blade",
    "django-html",
    "htmldjango",
    "ejs",
    "html",
    "php",
    "css",
    "postcss",
    "javascript.jsx",
    "typescript.tsx",
    "vue",
    "svelte",
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
})
require("lspconfig").astro.setup({})
require("lspconfig").svelte.setup({})
