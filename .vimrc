filetype off                  " required
set nocompatible              " required
set colorcolumn=87
set relativenumber
set clipboard=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set incsearch
set number
set scrolloff=8
set signcolumn=yes
set ignorecase
set updatetime=500
set backspace=indent,eol,start
set guifont=hack_nerd_font:h21
set completeopt=menu,menuone,noselect
set nofoldenable
set mouse=a
let mapleader=" "
syntax on

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'nvim-lua/plenary.nvim'
Plug 'godlygeek/tabular'

" Navegation
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'preservim/nerdtree'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ray-x/material_plus.nvim'
Plug 'jnurmine/Zenburn'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'

" Languages
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" Plug 'jose-elias-alvarez/null-ls.nvim'

" Languages general
Plug 'neovim/nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
" Plug 'ycm-core/YouCompleteMe'	" Autocompletion
Plug 'dense-analysis/ale'		" Linter
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Utilf
Plug 'akinsho/toggleterm.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'     " Toggle comentaries on code
Plug 'vim-airline/vim-airline'  " Powerline
Plug 'SirVer/ultisnips'			" Some snippets
Plug 'puremourning/vimspector'	" Debugging
Plug 'tpope/vim-fugitive'		" Git
Plug 'junegunn/gv.vim'
Plug 'szw/vim-maximizer'		" Maximize a buffer temporarly (util for vimspector)
Plug 'norcalli/nvim-colorizer.lua'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
colorscheme hybrid

" Personal mappings
map <leader>p :PlugInstall<Enter>
map n nzz
map N Nzz
nnoremap <C-B> :NERDTreeToggle<CR>
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
nnoremap # :set hlsearch<CR>#
nnoremap * :set hlsearch<CR>*
xmap <C-Space> <C-X><C-O>
nnoremap J 7j
nnoremap K 7k
nmap <leader>t :ToggleTerm size=90 direction=vertical<CR>
nnoremap // :vs<CR>
nnoremap -- :sp<CR>
nmap <leader>rc //:e ~/.config/nvim/init.vim<CR>
nmap <leader>rl :so ~/.vimrc<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :update<CR>:q<CR>
nnoremap <C-S> :update<cr>
" nnoremap <C-C> <ESC>
nnoremap G Gzz
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <leader>at :ALEToggle<CR>
map <leader>gg :G<CR>
" map <leader>gl :G log --oneline --graph<CR>
map <leader>hh :set hlsearch!<CR>
map <leader>ss :mks! .session.vim<CR>
map <leader>ds :Pydocstring<CR>
map <leader>tr :Telescope resume<CR>
map <leader>gl :GV --all<CR>

" Vim markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_follow_anchor = 1
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown :normal zR

" OmniSharp
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height':0.8 } }

" Status line + Airline
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
set statusline+=%{FugitiveHead()}

" Python
autocmd FileType python :normal zR
let g:ale_linters={ 'python': ['pylint'] }
let g:ale_fixers = { 'python': ['black', 'isort'] }
" let g:ale_python_black_options = '--line-length 80'
" let g:ale_fix_on_save=1
map <leader>fi :ALEFix<CR>
let g:ale_python_executable='python3'
let g:ale_python_pylint_use_global=1


if (has("termguicolors"))
 set termguicolors
endif

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=> <CR>
nmap <leader>ff :FZF<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

" colorscheme material
" lua require('material.functions').change_style("mariana")

let g:UltiSnipsExpandTrigger="<C-S>"

highlight ALEWarning ctermfg=none cterm=underline

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
map <leader>v :call vimspector#Launch()<CR>

map <F5> <Plug>VimspectorContinue
map <F6> <Plug>VimspectorStop
map <F7> <Plug>VimspectorRestart
map <C-Right> <Plug>VimspectorStepOver
map <C-Down> <Plug>VimspectorStepInto
map <C-Up> <Plug>VimspectorStepOut
map <leader>b <Plug>VimspectorToggleBreakpoint
map <leader>vw <Plug>VimspectorWatch
map <leader>vq <Plug>VimspectorUnwatch

" Vimtex
autocmd FileType tex map <F5> :call vimtex#compiler#start()<CR>
autocmd FileType tex map <F6> :call vimtex#compiler#stop()<CR>

highlight ALEErrorSign ctermbg=none
highlight ALEWarningSign ctermbg=none
let g:ale_pattern_options = {
\	'.*tests/.*' : { 'ale_enabled': 0 },
\}

let g:pydocstring_formatter = 'numpy'
let g:pydocstring_ignore_init = 1

set background=dark
" let g:transparent_enabled = v:true

lua require('telescope').setup{ defaults = { file_ignore_patterns = {".git"} } }



" LSP config
lua << EOF

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>kk', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = { on_attach = on_attach }
    server:setup(opts)
end)

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
EOF

hi DiagnosticError guifg=#CC6666
hi DiagnosticWarn  guifg=#F0C674
hi DiagnosticInfo  guifg=#81A2BE
hi DiagnosticHint  guifg=#B5BD68



" Autocompletion config

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  --}
EOF


" Trouble config
nnoremap <leader>xx <cmd>TroubleToggle<cr>
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


" " Linter config
" lua << EOF
" local null_ls = require("null-ls")
" null_ls.setup({
"     sources = {
"         null_ls.builtins.formatting.black,
"         null_ls.builtins.diagnostics.pylint,
"         -- null_ls.builtins.completion.spell,
"     },
" })
" EOF
" map <leader>fi :lua vim.lsp.buf.formatting_sync()<CR>
