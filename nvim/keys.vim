" --- Set leader key
let g:mapleader = "\<Space>"

" --- Set leader + h to clear search
map <C-h> :noh<CR>

" --- Open terminal
nnoremap <leader>t :split term://zsh<CR>

" --- Leader Esc to exit terminal
tnoremap <leader><Esc> <C-\><C-n>

" --- Copy and Paste
vnoremap <C-c> "*y :let @+=@*<CR>

" --- Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" --- Better tabbing
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" --- Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" --- Navigation
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-s> :w<CR>
nnoremap <leader>o :setl bufhidden=delete <bar> :bp<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>J <C-W>+<CR>
nnoremap <leader>K <C-W>-<CR>
nnoremap <leader>H <C-W>><CR>
nnoremap <leader>L <C-W><<CR>
map <leader>s :Startify<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>w :NERDTreeFind<CR>
nnoremap <silent><C-p> :Telescope find_files<CR>
nnoremap <silent><C-t> :Telescope<CR>
nnoremap <silent><C-g> :Telescope coc<CR>
nnoremap <silent><C-e> :Telescope find_files cwd=~/.dotfiles/nvim<CR>
nnoremap <silent><leader>g :Telescope git_status<CR>
" Jump between git hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous

" --- Use shift + alt + hjkl to resize windows
nnoremap <S-M-j>    :resize -2<CR>
nnoremap <S-M-k>    :resize +2<CR>
nnoremap <S-M-h>    :vertical resize -2<CR>
nnoremap <S-M-l>    :vertical resize +2<CR>

" --- GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" --- Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" --- Auto complete
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Code actions
nmap <silent><leader>c <Plug>(coc-codeaction-line)
nmap <silent><leader>C :Telescope coc file_code_actions<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

