return {
  { "L3MON4D3/LuaSnip" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        sources = {
          { name = "luasnip" },
          -- more sources
        },
      })
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "L3MON4D3/LuaSnip",
    version = "v<CurrentMajor>.*",
    build = "make install_jsregexp",
  },
}
