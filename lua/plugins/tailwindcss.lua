return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end,
  },
}
