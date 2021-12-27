local lspconfig = require "lspconfig"
lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 4
    },
    clang = {
      excludeArgs = {"-frounding-math"}
    }
  }
}
