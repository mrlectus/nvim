return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "quangnguyen30192/cmp-nvim-ultisnips",
    "SirVer/ultisnips",
    config = function()
      -- optional call to setup (see customization section)
      require("cmp_nvim_ultisnips").setup({})
    end,
    -- If you want to enable filetype detection based on treesitter:
    -- requires = { "nvim-treesitter/nvim-treesitter" },
  },
}
