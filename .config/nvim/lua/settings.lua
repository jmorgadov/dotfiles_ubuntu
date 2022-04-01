vim.opt.compatible = false
vim.opt.colorcolumn = "87"
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.updatetime = 500
vim.opt.backspace = "indent,eol,start"
vim.opt.guifont = "hack_nerd_font:h21"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.syntax = "on"
vim.g.mapleader = " "

vim.cmd [[
  filetype off
  filetype plugin indent on
  colorscheme hybrid
  hi DiagnosticError guifg=#CC6666
  hi DiagnosticWarn  guifg=#F0C674
  hi DiagnosticInfo  guifg=#81A2BE
  hi DiagnosticHint  guifg=#B5BD68
]]

