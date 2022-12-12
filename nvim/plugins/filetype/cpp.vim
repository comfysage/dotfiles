
au BufEnter,BufNew *.cpp nnoremap <silent> ,p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ,p :e %<.cpp<CR>

autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.hpp setlocal colorcolumn=80
