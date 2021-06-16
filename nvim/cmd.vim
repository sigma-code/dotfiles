" auto source when writing to main.vim
autocmd BufWritePost main.vim source $MYVIMRC
autocmd BufWritePost keys.vim source $MYVIMRC
autocmd BufWritePost cmd.vim source $MYVIMRC
autocmd BufWritePost plugins.vim source $MYVIMRC
" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath
" Close open buffers
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif
" format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

