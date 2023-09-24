local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    -- prisma = {
    --   function()
    --     return {
    --       exe = "prisma",
    --       args = { "format", vim.api.nvim_buf_get_name(0) },
    --       stdin = false,
    --     }
    --   end,
    -- },

    python = {
      function()
        return {
          exe = "black",
          args = { "-q", "-" },
          stdin = true,
        }
      end,
    },
    dart = {
      function()
        return {
          exe = "dart",
          args = { "format" },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--edition=2018", "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand("%:p:h"),
        }
      end,
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand("%:p:h"),
        }
      end,
    },
    astro = {
      function()
        return {
          exe = "prettier",
          args = { "--write", "%", "--plugin=prettier-plugin-astro" },
          stdin = false,
        }
      end,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END
  ]],
  true
)

format_on_save.setup({
  experiments = {
    partial_update = true,
  },
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    javascriptreact = formatters.prettierd,
  },
})
