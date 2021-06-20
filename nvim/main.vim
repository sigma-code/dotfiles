runtime! archlinux.vim

set nocompatible
if (has("termguicolors"))
  set termguicolors
endif

syntax on

set autoindent
set autoread
set encoding=UTF-8
set expandtab
set fileencoding=UTF-8
set noswapfile
set nowrap
set number
set relativenumber
set nu
set signcolumn=yes
set updatetime=250
set mouse=a
set ruler
set shiftwidth=2
set showcmd
set smarttab
set smartindent
set tabstop=2
set wildmenu
set hidden
set splitbelow

let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_mirage'
let g:airline#extensions#tabline#enabled = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:coc_node_path = "$HOME/.nvm/versions/node/v16.1.0/bin/node"
let NERDTreeShowHidden=1
let ayucolor='mirage'

" Key mappings
source $HOME/.dotfiles/nvim/keys.vim
" Commands
source $HOME/.dotfiles/nvim/cmd.vim
" Plugins
source $HOME/.dotfiles/nvim/plugins.vim
" Lua Configs
luafile $HOME/.dotfiles/nvim/plugin-cfg/pgcfgtelescope.lua
luafile $HOME/.dotfiles/nvim/plugin-cfg/pgcfgtreesitter.lua

colorscheme ayu

