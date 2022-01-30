local nvim_lsp = require("lspconfig")

-- Mappings.
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gbr", ":lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>e", ":lua vim.diagnostic.show()<CR>", opts)
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "tsserver",
  "ccls",
  "texlab",
  "html",
  "cssls",
  "phpactor",
  "gopls",
  "ltex",
  "intelephense",
  "rust_analyzer",
  "pylsp",
  "kotlin_language_server",
  "jdtls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
end

vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler

--source lua & vim
--map("n", "<leader>")

-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)

-- Window movement
map("n", "<C-h>", "<C-w>h", {silent = true})
map("n", "<C-j>", "<C-w>j", {silent = true})
map("n", "<C-k>", "<C-w>k", {silent = true})
map("n", "<C-l>", "<C-w>l", {silent = true})

-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)

-- Buffer movement
map("n", "<leader>l", ":ls<CR>", opts)
map("n", "<leader>p", ":bp<CR>", opts)
map("n", "<leader>n", ":bn<CR>", opts)
map("n", "<leader>g", ":e#<CR>", opts)
map("n", "<leader>1", ":1b<CR>", opts)
map("n", "<leader>2", ":2b<CR>", opts)
map("n", "<leader>3", ":3b<CR>", opts)
map("n", "<leader>4", ":4b<CR>", opts)
map("n", "<leader>5", ":5b<CR>", opts)
map("n", "<leader>6", ":6b<CR>", opts)
map("n", "<leader>7", ":7b<CR>", opts)
map("n", "<leader>8", ":8b<CR>", opts)
map("n", "<leader>9", ":9b<CR>", opts)
map("n", "<leader>0", ":10b<CR>", opts)

-- Resize Buffer
map("n", "<Leader>+", ':exe "resize " . (winheight(0) * 3/2)<CR>', opts)
map("n", "<Leader>-", ':exe "resize " . (winheight(0) * 2/3)<CR>', opts)

-- Telescope 🔭
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- move vertically by visual line (don't skip wrapped lines)
map("v", "j", "gj", {silent = true})
map("v", "k", "gk", {silent = true})

-- Floating stuffnnn
map("n", "<leader>t", ":FloatermToggle<CR>", opts)
map("n", "<leader>t", "<Esc>:FloatermToggle<CR>", opts)
map("t", "<leader>t", "<C-\\><C-n>:FloatermToggle<CR>", opts)

-- turn off search highlighting with <CR> (carriage-return)
map("n", "<CR>", ":nohlsearch<CR><CR>", opts)
map("n", "<S-F1>", ":NvimTreeToggle<CR>", opts)

-- Dashboard provides session support. With SessionLoad and SessionSave
map("n", "<leader>ss", ":SessionSave<CR>", opts)
map("n", "<leader>sl", ":SessionLoad<CR>", opts)
-- formating
--map("n", "ff", "vim.lsp.buf.formatting()<CR>", opts)
--map("n", "<leader>s", "vim.lsp.buf.formatting()<CR>", opts)
vim.cmd [[
  autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.php lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.kts lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.kt lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
]]

-- Jumping
map("n", "<leader>nb", "<C-o>", opts)
