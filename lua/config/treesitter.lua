require("nvim-treesitter.configs").setup({
  ignore_install = {},
  modules = { "*" },
  -- List of parsers to ignore installing (or "all")
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "dockerfile",
    "cpp",
    "cpp",
    "gitignore",
    "go",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "lua",
    "prisma",
    "python",
    "rust",
    "tsx",
    "typescript",
    "yaml",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
