local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings(
  {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    },
    --install_root_dir = path.concat {vim.fn.stdpath "data", "lsp_servers"}
    --install_root_dir = path.concat {vim.fn.stdpath "data", "/site/pack/packer/start/"}
  }
)

