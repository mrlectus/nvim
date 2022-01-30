--Enable (broadcasting) snippet capability for completion
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local on_attach = function(client)
  require "completion".on_attach(client)
end

-- environment for home
local set = vim.opt
set.filetype = "off" --disable filetype detection (but re-enable later, see below)
HOME = os.getenv("HOME")
set.compatible = false -- disable compatibility mode with vi
vim.api.nvim_set_option("termguicolors", true)

vim.cmd [[
  colorscheme onedark
  filetype plugin indent on
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
]]
-- Set map leader
vim.g.mapleader = ","

vim.lsp.set_log_level("debug")

--Set highlight on search
set.hlsearch = true

--Enable mouse mode
set.mouse = "a"

--Enable break indent
set.breakindent = true

--Save undo history
set.undofile = true

--Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

--Decrease update time
set.updatetime = 250
vim.wo.signcolumn = "yes"

set.clipboard:prepend {"unnamedplus"}
set.completeopt:prepend("menuone,noselect,noinsert")

set.list = true
set.number = true --show line numbers
set.wrap = true --wrap lines

--set.spell spelllang=en_us
set.encoding = "utf-8" --set encoding to UTF-8 (default was "latin1")
set.mouse = "a" --enable mouse support (might not work well on Mac OS X)
set.wildmenu = true --visual autocomplete for command menu
set.lazyredraw = true --redraw screen only when we need to
set.showmatch = true --highlight matching parentheses / brackets [{()}]
set.laststatus = 2 --always show statusline (even with only single window)
set.ruler = true --show line and column number of the cursor on right side of statusline
set.visualbell = true --blink cursor on error, instead of beeping

-- Tab settings
set.expandtab = true
set.tabstop = 2 -- width that a <TAB> character displays as
set.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
set.softtabstop = 2 -- backspace after pressing <TAB> will remove up to this many spaces

set.autoindent = true -- copy indent from current line when starting a new line
set.smartindent = true -- even better autoindent (e.g. add indent after '{')

set.cursorline = true -- highlight current line
set.autoread = true -- autoreload the file in Vim if it has been changed outside of Vim
set.swapfile = false
set.relativenumber = true

-- Search settings
set.incsearch = true -- search as characters are entered
set.hlsearch = true -- highlight matches

vim.g.indentLine_setColors = 0
vim.g.indentLine_char = "▏"

vim.g.floaterm_width = 100
vim.g.floaterm_winblend = 30

vim.g.onedark_terminal_italics = 1
vim.g.python_host_prog = "/bin/python2.7"
vim.g.python3_host_prog = "/bin/python3"
vim.g.perl_host_prog = "/bin/perl"
vim.g.node_host_prog = "/bin/neovim-node-host"
vim.g.ruby_host_prog = "/home/brown/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host"

vim.g.dashboard_default_executive = "telescope"

vim.g.completion_enable_snippet = "vim-vsnip"
vim.g.vsnip_filetypes = {}
set.background = "dark" -- configure Vim to use brighter colors

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

--- require
require("servers..keybind")
require("servers..bashls")
require("servers..cssls")
require("servers..ccls")
require("servers..gopls")
require("servers..html")
require("servers..sumneco")
require("servers..phpactor")
require("servers..pylsp")
require("servers..rust_analyzer")
require("servers..sqls")
require("servers..texlab")
require("servers..lspinstall")
require("servers..tsserver")
require("config..barbar")
require("servers..javals")
require("servers..kotlinls")
require("config..luasnip")
require("config..cheatsheet")
require("config..colors")
require("config..autopair")
require("config..devicons")
require("config..evil_lualine")
require("config..lspkind")
require("config..dap")
--require("config.compe")
require("config..cmp")
require("config..telescope")
--require("config..treesitter")
require("config..gitsign")
require("config..luasnip")
require("config..format")
require("config..dap")
require "nvim-tree".setup()
require "colorizer".setup()
require "lspconfig".emmet_ls.setup {}
require("which-key").setup {}
require "lspconfig".pyre.setup {}
require("lsp_signature").setup(
  {
    floating_window = false,
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- Panda for parameter
    hint_scheme = "String"
  }
)
lsp_status.register_progress()
-- Go-to definition in a split window
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      source = "always" -- Or "if_many"
    }
  }
)

require "lspconfig".eslint.setup {}
require("lualine").setup {options = {theme = "onedark"}}
--require("lualine").setup {options = {theme = "enfocado"}}

local autosave = require("autosave")

autosave.setup(
  {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave"},
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = true,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 10000
  }
)

-- last
vim.cmd "source ~/.config/nvim/lua/script.vim"
vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]
