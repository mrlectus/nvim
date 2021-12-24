local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end
return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "CurtisFenner/luafmt"
    use "sheerun/vim-polyglot"
    use "Yggdroot/indentLine"
    use "joshdick/onedark.vim"
    use "jacquesg/p5-Neovim-Ext"
    use "rafamadriz/friendly-snippets"
    use "L3MON4D3/LuaSnip"
    use "Pocco81/AutoSave.nvim"
    use "RishabhRD/nvim-lsputils"
    use "RishabhRD/popfix"
    use "SirVer/ultisnips"
    use "alexanderjeurissen/lumiere.vim"
    use "anott03/nvim-lspinstall"
    use "b3nj5m1n/kommentary"
    use "bfrg/vim-cpp-modern"
    use "ericbn/vim-solarized"
    use "folke/lsp-colors.nvim"
    use "folke/which-key.nvim"
    use "gko/vim-coloresque"
    use "glepnir/dashboard-nvim"
    use "honza/vim-snippets"
    use "nvim-lualine/lualine.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/nvim-compe"
    use {"hrsh7th/vim-vsnip", opt = true}
    use {"hrsh7th/vim-vsnip-integ", opt = true}
    -- use 'hrsh7th/vim-vsnip'
    -- use "hrsh7th/vim-vsnip-integ"
    use "jlanzarotta/bufexplorer"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"
    use "lifepillar/vim-gruvbox8"
    use "mattn/emmet-vim"
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-jdtls"
    use "mhartington/formatter.nvim"
    use {"michaelb/sniprun", run = "bash ./install.sh"}
    use "nanotee/sqls.nvim"
    use "natebosch/vim-lsc"
    use "neovim/nvim-lsp"
    use "neovim/nvim-lspconfig"
    use "norcalli/nvim-colorizer.lua"
    use "nvim-lua/lsp-status.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "nvim-treesitter/playground"
    use "onsails/lspkind-nvim"
    use "prabirshrestha/asyncomplete-lsp.vim"
    use "prabirshrestha/asyncomplete.vim"
    use {"ray-x/guihua.lua", run = "cd lua/fzy && make"}
    use "rcarriga/nvim-dap-ui"
    use "rcarriga/nvim-notify"
    use "robert-oleynik/clangd-nvim"
    use "romgrk/barbar.nvim"
    use "ryanoasis/vim-devicons"
    use "sainnhe/gruvbox-material"
    use "simrat39/rust-tools.nvim"
    use "simrat39/symbols-outline.nvim"
    use "sudormrfbin/cheatsheet.nvim"
    use "tpope/vim-sensible"
    use {"tzachar/compe-tabnine", run = "./install.sh"}
    use "voldikss/vim-floaterm"
    use "windwp/nvim-autopairs"
    use "wuelnerdotexe/vim-enfocado"
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
