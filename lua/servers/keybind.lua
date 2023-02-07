-- local lspconfig = require("lspconfig")
--[[ local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities()) ]]
-- Mappings.
--
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

----To check ---
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<space>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

---END---
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local do_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local servers = {
  "tsserver",
  "marksman",
  "remark_ls",
  "ansiblels",
  "dockerls",
  "sumneko_lua",
  "eslint",
  "solc",
  "vimls",
  "solidity_ls",
  "bashls",
  "clangd",
  "tailwindcss",
  "texlab",
  "html",
  "dartls",
  "cssls",
  "phpactor",
  "gopls",
  "intelephense",
  "rust_analyzer",
  "pylsp",
  "kotlin_language_server",
  "jdtls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    capabilities = capabilities,
    on_attach = do_attach,
    flags = lsp_flags,
  })
end

--source lua & vim
--map("n", "<leader>")

-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)

-- Window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

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
map("v", "j", "gj", { silent = true })
map("v", "k", "gk", { silent = true })

-- Floating stuffnnn
map("n", "<leader>t", ":FloatermToggle<CR>", opts)
map("n", "<leader>t", "<Esc>:FloatermToggle<CR>", opts)
map("t", "<leader>t", "<C-\\><C-n>:FloatermToggle<CR>", opts)

-- turn off search highlighting with <CR> (carriage-return)
map("n", "<CR>", ":nohlsearch<CR><CR>", opts)
map("n", "<F13>", ":NvimTreeToggle<CR>", opts)

-- Dashboard provides session support. With SessionLoad and SessionSave
map("n", "<leader>ss", ":SessionSave<CR>", opts)
map("n", "<leader>sl", ":SessionLoad<CR>", opts)
-- formating
--map("n", "ff", "vim.lsp.buf.formatting()<CR>", opts)
--map("n", "<leader>s", "vim.lsp.buf.formatting()<CR>", opts)
vim.cmd([[
  autocmd BufWritePre *.cpp lua vim.lsp.buf.format()
  autocmd BufWritePre *.h lua vim.lsp.buf.format()
  autocmd BufWritePre *.css lua vim.lsp.buf.format()
  autocmd BufWritePre *.html lua vim.lsp.buf.format()
  autocmd BufWritePre *.java lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  autocmd BufWritePre *.scss lua vim.lsp.buf.format()
  autocmd BufWritePre *.php lua vim.lsp.buf.format()
  autocmd BufWritePre *.kts lua vim.lsp.buf.format()
  autocmd BufWritePre *.kt lua vim.lsp.buf.format()
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
]])

-- Jumping
map("n", "<leader>nb", "<C-o>", opts)
