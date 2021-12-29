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
" set guicursor+=i-v-c-n:blinkon1
set nofoldenable
syntax on
set mouse=a
let mapleader=" "

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
" Plug 'xiyaowong/nvim-transparent'

" Languages
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
" Plug 'OmniSharp/omnisharp-vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'machakann/vim-Verdin'

" Languages general
Plug 'ycm-core/YouCompleteMe'	" Autocompletion
Plug 'dense-analysis/ale'		" Linter
" Plug 'neovim/nvim-lspconfig'

" Utilf
Plug 'akinsho/toggleterm.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'     " Toggle comentaries on code
Plug 'vim-airline/vim-airline'  " Powerline
Plug 'SirVer/ultisnips'			" Some snippets
Plug 'puremourning/vimspector'	" Debugging
Plug 'honza/vim-snippets'		" More snippets
Plug 'tpope/vim-fugitive'		" Git
Plug 'szw/vim-maximizer'		" Maximize a buffer temporarly (util for vimspector)
Plug 'norcalli/nvim-colorizer.lua'

" Plug 'vimwiki/vimwiki'
" Plug 'neovim/nvim-lsp'
" Plug 'davidhalter/jedi-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
colorscheme nord

" Personal mappings
map <leader>p :PlugInstall<Enter>
map n nzz
map N Nzz
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
map <leader>gc :G commit<CR>
map <leader>gl :G log --oneline --graph<CR>
map <leader>dd :YcmCompleter GoToDefinition<CR>
map <leader>rr :YcmCompleter GoToReferences<CR>
map <leader>n :YcmCompleter RefactorRename 
map <leader>k :YcmCompleter GetDoc<CR>
map <leader>o :NERDTreeToggle<CR>
map <leader>hh :set hlsearch!<CR>
map <leader>ss :mks! .session.vim<CR>
map <leader>ds :Pydocstring<CR>

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
let g:airline_theme='nord'
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
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=> <CR>
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
