--Enable (broadcasting) snippet capability for completion
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local on_attach = function(client)
  require "completion".on_attach(client)
end

vim.api.nvim_set_option("termguicolors", true)

vim.lsp.set_log_level("debug")

--Set highlight on search
vim.o.hlsearch = false

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--[[ --Remap space as leader key ]]
--[[ vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true }) ]]
--[[ vim.g.mapleader = ' ' ]]
--[[ vim.g.maplocalleader = ' ' ]]
--[[  ]]
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
require("nvim_lsp/bashls_conf")
require("nvim_lsp/clangd_conf")
require("nvim_lsp/cssls_conf")
--require("nvim_lsp/ccls_conf")
require "lspconfig".clangd.setup {}
require("nvim_lsp/gopls_conf")
require("nvim_lsp/html_conf")
require("nvim_lsp/phpactor_conf")
require("nvim_lsp/pylsp_conf")
require("nvim_lsp/rust_analyzer_conf")
require("nvim_lsp/sqls_conf")
require("nvim_lsp/texlab_conf")
require("nvim_lsp/tsserver_conf")
require("nvim_ext/barbar_conf")
require("nvim_ext/cheatsheet_conf")
require("nvim_ext/colors_conf")
require("nvim_ext/autopair_conf")
require("nvim_ext/devicons_conf")
require("nvim_ext/evil_lualine_conf")
require("nvim_ext/lspkind_conf")
require("nvim_ext/compe_conf")
--require("nvim_ext/cmp_conf")
require("nvim_ext/lspsaga_conf")
require("nvim_ext/signature_conf")
require("nvim_ext/telescope_conf")
require("nvim_ext/treesitter_conf")
require("nvim_ext/trouble_conf")
require("nvim_lsp/keybind")
require("nvim_ext/gitsign_conf")
require("nvim_ext/luasnip_conf")
require("nvim_ext/format_conf")
require("nvim_ext/dap_config")
require "nvim-tree".setup()
require "lspconfig".emmet_ls.setup {}
require("which-key").setup {}
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
require("lualine").setup {options = {theme = "enfocado"}}
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
    debounce_delay = 135
  }
)
