return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    { "saadparwaiz1/cmp_luasnip" },
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-omni",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  -- opts = function(_, opts)
  --   -- original LazyVim kind icon formatter
  --   local format_kinds = opts.formatting.format
  --   opts.formatting.format = function(entry, item)
  --     format_kinds(entry, item) -- add icons
  --     return require("tailwindcss-colorizer-cmp").formatter(entry, item)
  --   end
  -- end,
}
