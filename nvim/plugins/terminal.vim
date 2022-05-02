
" Commands {{{

command! -nargs=1 Tr topleft 40vs term://<args> | startinsert
command! -nargs=1 Draw sp term://<args> 

" }}}

" Keybinds {{{

nnoremap tt <Cmd>e term://zsh<CR>startinsert

" }}}
