require("cheatsheet").setup({
    bundled_cheatsheets = {
        -- only show the default cheatsheet
        enabled = { "default" },
    },
    bundled_plugin_cheatsheets = {
        -- show cheatsheets for all plugins except gitsigns
        disabled = { "gitsigns.nvim" },
    }
})

