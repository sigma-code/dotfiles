HOME = vim.fn.expand('$HOME')
CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

local set = vim.o


set.autoread = true -- set autoread
set.encoding = "UTF-8" -- set encoding=UTF-8
set.fileencoding = "UTF-8" -- set fileencoding=UTF-8
set.expandtab = true -- set expandtab
set.number = true -- set number
set.relativenumber = true -- set relativenumber
set.nu = true -- set nu
set.signcolumn = "yes" -- set signcolumn=yes
set.updatetime = 250 -- set updatetime=250
set.mouse = "a" -- set mouse=a
set.shiftwidth = 2 -- set shiftwidth=2
set.showtabline = 2 -- set showtabline=2
set.showcmd = true -- set showcmd
set.autoindent = true -- set autoindent
set.smarttab = true -- set smarttab
set.smartindent = true -- set smartindent
set.tabstop = 2 -- set tabstop=2
set.wildmenu = true -- set wildmenu
set.hidden = true -- set hidden
set.splitbelow = true -- set splitbelow
set.background = 000000

vim.cmd('set termguicolors')
vim.cmd('syntax on')
vim.cmd('set noswapfile') -- set noswapfile
vim.cmd('set nowrap') -- set nowrap

require('config.plugins')
require('config.keymaps')
require('config.treesitter')
require('config.telescope')
require('config.cmp')
require('config.lualine')
require('config.toggleterm')
require('config.comment')
require('config.gitsigns')
require('lsp')

-- jdtls
vim.cmd [[
  augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'lsp.java-ls'.setup()
  augroup end
]]

-- colorscheme override
vim.cmd [[
  augroup colorscheme_override
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=000000
  augroup end
]]

-- vim.cmd('colorscheme allure')
-- vim.cmd('colorscheme lunar')
-- vim.cmd('colorscheme nord')
vim.cmd('colorscheme dracula')

