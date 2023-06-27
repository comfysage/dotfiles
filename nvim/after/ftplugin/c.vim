
au BufEnter,BufNew *.c nnoremap <silent> ,p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ,p :e %<.c<CR>

setlocal colorcolumn=80
