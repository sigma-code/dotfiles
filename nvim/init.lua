HOME = vim.fn.expand('$HOME')
CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

vim.o.autoread = true -- set autoread
vim.o.encoding = "UTF-8" -- set encoding=UTF-8
vim.o.fileencoding = "UTF-8" -- set fileencoding=UTF-8
vim.o.expandtab = true -- set expandtab
vim.o.number = true -- set number
vim.o.relativenumber = true -- set relativenumber
vim.o.nu = true -- set nu
vim.o.signcolumn = "yes" -- set signcolumn=yes
vim.o.updatetime = 250 -- set updatetime=250
vim.o.mouse = "a" -- set mouse=a
vim.o.clipboard = "unnamedplus" -- set clipboard=unnamedplus
vim.o.shiftwidth = 2 -- set shiftwidth=2
vim.o.showtabline = 2 -- set showtabline=2
vim.o.showcmd = true -- set showcmd
vim.o.autoindent = true -- set autoindent
vim.o.smarttab = true -- set smarttab
vim.o.smartindent = true -- set smartindent
vim.o.tabstop = 2 -- set tabstop=2
vim.o.wildmenu = true -- set wildmenu
vim.o.hidden = true -- set hidden
vim.o.splitbelow = true -- set splitbelow

vim.cmd('set termguicolors')
vim.cmd('syntax on')
vim.cmd('set noswapfile') -- set noswapfile
vim.cmd('set nowrap') -- set nowrap

vim.cmd('let g:airline_powerline_fonts = 1')
vim.cmd('let g:airline_theme = "ayu_mirage"')
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd('let g:python3_host_prog = "/usr/bin/python3"')
vim.cmd('let ayucolor="mirage"')

-- Plugins
require('my-keymaps')
require('my-plugins')
require('my-whichkey')
require('my-treesitter')
require('my-telescope')
require('my-lsp')
require('my-gitsigns')

vim.cmd('colorscheme lunar')

