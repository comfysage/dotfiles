
au BufEnter,BufNew *.cpp nnoremap <silent> ,p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ,p :e %<.cpp<CR>

au BufEnter,BufNew *.c nnoremap <silent> ,p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ,p :e %<.c<CR>

autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.hpp setlocal colorcolumn=80

autocmd BufRead,BufNewFile *.c setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=80
