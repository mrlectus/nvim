require("lspconfig").jedi_language_server.setup({
  initializationOptions = {
    codeAction = {
      nameExtractVariable = "jls_extract_var",
      nameExtractFunction = "jls_extract_def",
    },
    diagnostics = {
      enable = true,
      didOpen = true,
      didChange = true,
      didSave = true,
    },
    jediSettings = {
      autoImportModules = {},
      caseInsensitiveCompletion = true,
      debug = false,
    },
  },
})
