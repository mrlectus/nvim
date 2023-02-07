return {
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end,
  },
  "CurtisFenner/luafmt",
  "rafamadriz/friendly-snippets",
  "neoclide/vim-jsx-improve",
  "rebelot/kanagawa.nvim",
  {
    "SirVer/ultisnips",
    dependencies = { { "honza/vim-snippets", rtp = "." }, { "mlaursen/vim-react-snippets" } },
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
      vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
      vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
      vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  "b3nj5m1n/kommentary",
  "bfrg/vim-cpp-modern",
  "folke/lsp-colors.nvim",
  "folke/which-key.nvim",
  "gko/vim-coloresque",
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({})
    end,
  },
  "honza/vim-snippets",
  "nvim-lualine/lualine.nvim",
  { "autozimu/LanguageClient-neovim", build = "bash install.sh" },
  "hrsh7th/vim-vsnip-integ",
  "jlanzarotta/bufexplorer",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "mattn/emmet-vim",
  "mfussenegger/nvim-jdtls",
  "mhartington/formatter.nvim",
  "nanotee/sqls.nvim",
  "natebosch/vim-lsc",
  "neovim/nvim-lsp",
  "norcalli/nvim-colorizer.lua",
  "nvim-lua/lsp-status.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "kdheepak/lazygit.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  },
  "nvim-treesitter/playground",
  "tpope/vim-surround",
  "onsails/lspkind-nvim",
  "navarasu/onedark.nvim",
  "udalov/kotlin-vim",
  "robert-oleynik/clangd-nvim",
  "romgrk/barbar.nvim",
  "sainnhe/gruvbox-material",
  "simrat39/rust-tools.nvim",
  { "akinsho/flutter-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },
  "simrat39/symbols-outline.nvim",
  "sudormrfbin/cheatsheet.nvim",
  "tpope/vim-sensible",
  { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  {
    "ray-x/lsp_signature.nvim",
  },
  "voldikss/vim-floaterm",
  "windwp/nvim-autopairs",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-emoji",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-omni",
  "L3MON4D3/LuaSnip",
}
