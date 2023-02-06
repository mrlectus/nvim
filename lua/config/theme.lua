require("onedark").setup({
  style = "warmer",
  transparent = true,
  code_style = {
    functions = "bold",
    keywords = "bold",
  },
})
require("onedark").load()
require("lualine").setup({ options = { theme = "onedark" } })
--[[
local default_colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local my_colors = {
    -- use the palette color name...
    sumiInk1 = "black",
    fujiWhite = "#FFFFFF",
    -- ...or the theme name
    bg = "#272727",
    -- you can also define new colors if you want
    -- this will be accessible from require("kanagawa.colors").setup()
    -- AFTER calling require("kanagawa").setup(config)
    new_color = "teal"
}

local overrides = {
    -- create a new hl-group using default palette colors and/or new ones
    MyHlGroup1 = { fg = default_colors.waveRed, bg = "#AAAAAA", underline = true, bold = true, guisp="blue" },

    -- override existing hl-groups, the new keywords are merged with existing ones
    VertSplit  = { fg = default_colors.bg_dark, bg = "NONE" },
    TSError    = { link = "Error" },
    TSKeywordOperator = { bold = true},
    StatusLine = { fg = my_colors.new_color }
}

require'kanagawa'.setup({ overrides = overrides, colors = my_colors })
vim.cmd("colorscheme kanagawa") ]]
