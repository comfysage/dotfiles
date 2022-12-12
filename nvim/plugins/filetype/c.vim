au BufEnter,BufNew *.c setlocal ft=cpp
au BufEnter,BufNew *.h setlocal ft=cpp

au BufEnter,BufNew *.c nnoremap <silent> ,p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ,p :e %<.c<CR>

autocmd BufRead,BufNewFile *.c setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=80
