vim.cmd([[
    packadd nvim-cmp
    packadd nvim-colorizer.lua
    packadd nvim-dap-ui
    packadd nvim-dap
    packadd cmp-nvim-lsp
]])
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("CurtisFenner/luafmt")
  use("rafamadriz/friendly-snippets")
  use("neoclide/vim-jsx-improve")
  --[[ use(
      {
        "Pocco81/auto-save.nvim",
        config = function()
          require("auto-save").setup { debounce_delay = 135000 }
        end
      }
    ) ]]
  use("RishabhRD/nvim-lsputils")
  use("RishabhRD/popfix")
  use({
    "SirVer/ultisnips",
    requires = { { "honza/vim-snippets", rtp = "." }, { "mlaursen/vim-react-snippets" } },
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
      vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
      vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
      vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  })
  use("b3nj5m1n/kommentary")
  use("bfrg/vim-cpp-modern")
  use("folke/lsp-colors.nvim")
  use("folke/which-key.nvim")
  use("gko/vim-coloresque")
  use("glepnir/dashboard-nvim")
  use("honza/vim-snippets")
  use("nvim-lualine/lualine.nvim")
  use({ "autozimu/LanguageClient-neovim", run = "bash install.sh" })
  use("hrsh7th/vim-vsnip-integ")
  use("jlanzarotta/bufexplorer")
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  })
  use("nvim-tree/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  use("mattn/emmet-vim")
  use("mfussenegger/nvim-jdtls")
  use("mhartington/formatter.nvim")
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use("nanotee/sqls.nvim")
  use("natebosch/vim-lsc")
  use("neovim/nvim-lsp")
  use({
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "javascript", "vim", "html" },
  })
  use("nvim-lua/lsp-status.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("kdheepak/lazygit.nvim")
  use("nvim-telescope/telescope.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use("tpope/vim-surround")
  use("onsails/lspkind-nvim")
  use("navarasu/onedark.nvim")
  use("udalov/kotlin-vim")
  use("robert-oleynik/clangd-nvim")
  use("romgrk/barbar.nvim")
  use("sainnhe/gruvbox-material")
  use("simrat39/rust-tools.nvim")
  use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })
  use("simrat39/symbols-outline.nvim")
  use("sudormrfbin/cheatsheet.nvim")
  use("tpope/vim-sensible")
  use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
  use({
    "ray-x/lsp_signature.nvim",
  })
  use("voldikss/vim-floaterm")
  use("windwp/nvim-autopairs")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-calc")
  use("hrsh7th/cmp-omni")
  use("L3MON4D3/LuaSnip")

  -- Debugger
  use({
    {
      "mfussenegger/nvim-dap",
      requires = "jbyuki/one-small-step-for-vimkind",
      wants = "one-small-step-for-vimkind",
      module = "dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      requires = "nvim-dap",
      after = "nvim-dap",
      config = function()
        require("dapui").setup()
      end,
    },
  })
end)
