return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  "avneesh0612/react-nextjs-snippets",
  { "echasnovski/mini.nvim",      version = "*" },
  "p00f/clangd_extensions.nvim",
  "github/copilot.vim",
  "rafamadriz/friendly-snippets",
  "neoclide/vim-jsx-improve",
  {
    "neovim/nvim-lspconfig",
    inlay_hints = { enabled = true },
  },
  { "elentok/format-on-save.nvim" },
  { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
  "folke/lsp-colors.nvim",
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap" } },
  "nanozuki/tabby.nvim",
  "leoluz/nvim-dap-go",
  "folke/which-key.nvim",
  "gko/vim-coloresque",
  "nvim-tree/nvim-tree.lua",
  { "autozimu/LanguageClient-neovim", build = "bash install.sh" },
  "hrsh7th/vim-vsnip-integ",
  "nvim-tree/nvim-web-devicons",
  { "lukas-reineke/indent-blankline.nvim" },
  "Nash0x7E2/awesome-flutter-snippets",
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "1.2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  "mattn/emmet-vim",
  "mfussenegger/nvim-jdtls",
  "mhartington/formatter.nvim",
  "nanotee/sqls.nvim",
  "lewis6991/impatient.nvim",
  "nvim-lua/lsp-status.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "kdheepak/lazygit.nvim",
  "nvim-treesitter/playground",
  "onsails/lspkind-nvim",
  "navarasu/onedark.nvim",
  "udalov/kotlin-vim",
  "hood/popui.nvim",
  -- { "romgrk/barbar.nvim", dependencies = "nvim-web-devicons" },
  --
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  "simrat39/rust-tools.nvim",
  { "akinsho/flutter-tools.nvim",         dependencies = "nvim-lua/plenary.nvim" },
  "simrat39/symbols-outline.nvim",
  { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  "ray-x/lsp_signature.nvim",
  "voldikss/vim-floaterm",
}
