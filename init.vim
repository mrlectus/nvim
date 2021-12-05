" required before Vundle initialization
set nocompatible        " disable compatibility mode with vi
filetype off            " disable filetype detection (but re-enable later, see below)
call plug#begin('~/.config/nvim/plugged')
  Plug 'CurtisFenner/luafmt'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'voldikss/vim-floaterm'
  Plug 'wuelnerdotexe/vim-enfocado'
  Plug 'Pocco81/AutoSave.nvim'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'RishabhRD/popfix'
  Plug 'SirVer/ultisnips'
  Plug 'alexanderjeurissen/lumiere.vim'
  Plug 'anott03/nvim-lspinstall'
  Plug 'b3nj5m1n/kommentary'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'ericbn/vim-solarized'
  Plug 'folke/lsp-colors.nvim'
  Plug 'tibabit/vim-templates'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  ""Plug 'folke/trouble.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'gko/vim-coloresque'
  Plug 'glepnir/dashboard-nvim'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'honza/vim-snippets'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'mattn/emmet-vim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'mhartington/formatter.nvim'
  Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
  Plug 'nanotee/sqls.nvim'
  Plug 'natebosch/vim-lsc'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/playground'
  Plug 'onsails/lspkind-nvim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'rcarriga/nvim-notify'
  Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
  Plug 'robert-oleynik/clangd-nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sainnhe/gruvbox-material'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'sudormrfbin/cheatsheet.nvim'
  Plug 'tpope/vim-sensible'
  Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
  Plug 'windwp/nvim-autopairs'
call plug#end()

"""" Lua config
lua require('config')
lua require'colorizer'.setup()

"""" Basic Behavior
let g:tmpl_author_email = 'lilbrown3000@gmail.com'
let mapleader = ","
set termguicolors
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set nolist
set number              " show line numbers
set wrap                " wrap lines
" set spell spelllang=en_us
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping

"" auto import
"" vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
"" folding

"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


"""" Vim Appearance
" put colorscheme files in ~/.vim/colors/
colorscheme gruvbox-material      " good colorschemes: murphy, slate, molokai, badwolf, solarized

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

" Floating stuff
noremap  <leader>t  :FloatermToggle<CR>
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_width = 100
let g:floaterm_winblend = 30

"""" Tab settings
set expandtab
set tabstop=2           " width that a <TAB> character displays as
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <silent> <S-F2> :NvimTreeToggle<CR>


"""" Miscellaneous settings that might be worth enabling
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

set cursorline         " highlight current line
set background=dark    " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim
set noswapfile
set relativenumber

let g:dashboard_default_executive ='telescope'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" go lsp
augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'go-lang',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
  autocmd FileType go setlocal omnifunc=lsp#complete
  "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
augroup END
autocmd BufWritePre *.go lua goimports(1000)
"" formating
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
nnoremap <silent> <leader>f :Format<CR>
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR><Up>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>  
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

""" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
"""""""""" Dap
nnoremap <leader>dh <cmd>lua require"dap".toggle_breakpoint()<cr>
nnoremap <S-F1> <cmd>lua require("dapui").toggle()<cr>
nnoremap <leader>dH <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
map('n', '<c-l>', ':lua require"dap".step_into()<CR>')
map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<c-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>')
map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
