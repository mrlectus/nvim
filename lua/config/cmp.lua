local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 25
local MAX_KIND_WIDTH = 14
local feedkeys = require("cmp.utils.feedkeys")
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local get_ws = function(max, len)
  return (" "):rep(max - len)
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local format = function(_, item)
  local content = item.abbr
  -- local kind_symbol = symbols[item.kind]
  -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
end
-- Set up nvim-cmp.

local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
cmp.setup({
  snippet = {
    -- REQUIRED - youlua snip must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- require("snippy").expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = format,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- snippet movement with vsnips
    ["<C-j>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](1) == 1 then
        feedkeys.call(t("<Plug>(vsnip-jump-next)"), "")
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkeys.call(t("<Plug>(vsnip-jump-prev)"), "")
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", keyword_length = 3 },
    { name = "buffer",   keyword_length = 3 },
    { name = "luasnip",  keyword_length = 3 },
    { name = "emoji" },
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = "buffer" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
