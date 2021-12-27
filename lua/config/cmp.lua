local cmp_kinds = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  "
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require "cmp"

cmp.setup {
  insert = true,
  completion = {completeopt = "menu,menuone,noinsert"},
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  formatting = {
    with_text = true,
    format = function(_, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 0, 35)
      vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
      return vim_item
    end
  },
  mapping = {
    ["<Leader>nn"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
          else
            cmp.complete()
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
          else
            fallback()
          end
        end
      }
    ),
    ["<S-Tab>"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
          else
            cmp.complete()
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
          elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
          else
            fallback()
          end
        end
      }
    ),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {"i"}),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {"i"}),
    ["<C-n>"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
          else
            vim.api.nvim_feedkeys(t("<Down>"), "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
          else
            fallback()
          end
        end
      }
    ),
    ["<C-p>"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
          else
            vim.api.nvim_feedkeys(t("<Up>"), "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
          else
            fallback()
          end
        end
      }
    ),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<C-e>"] = cmp.mapping({i = cmp.mapping.close(), c = cmp.mapping.close()}),
    ["<CR>"] = cmp.mapping(
      {
        i = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false})
          else
            fallback()
          end
        end
      }
    )
  },
  sources = {
    {name = "nvim_lsp", max_item_count = 20},
    {name = "nvim_lua"},
    {name = "ultisnips"},
    {name = "buffer", keyword_length = 5},
    {name = "cmp_tabnine"},
    {name = "omni"},
    {name = "path"},
    {name = "luasnip"},
    {name = "emoji"},
    {name = "calc"}
  },
  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order
    }
  },
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,
    -- Let's play with this for a day or two
    ghost_text = true
  }
}
cmp.setup.cmdline(
  "/",
  {
    completion = {
      autocomplete = true
    },
    sources = {
      {name = "buffer"}
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":",
  {
    completion = {
      autocomplete = true
    },
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
