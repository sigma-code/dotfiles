" --------------------------------------
"               Plugins
" --------------------------------------
" https://github.com/junegunn/vim-plug 
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')

" Icons
Plug 'kyazdani42/nvim-web-devicons'
" Status line at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git support for vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" File explorer for vim
Plug 'scrooloose/nerdtree'
" Startify
Plug 'mhinz/vim-startify'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'
" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'dart-lang/dart-vim-plugin'
" Color Schemes
Plug 'joshdick/onedark.vim'
Plug 'flrnd/plastic.vim'
Plug 'sts10/vim-pink-moon'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'ayu-theme/ayu-vim'
"Plug 'rafi/awesome-vim-colorschemes'
" Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

