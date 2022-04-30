
" Terminal {{{

command! -nargs=1 Tr topleft 40vs term://<args> | startinsert
command! -nargs=1 Draw sp term://<args> 

" }}}

" Autocommands {{{



" }}}

" Note Commands {{{

command! -nargs=1 Ngrep vimgrep "<args>" /mnt/d/home/kitchen/Dropbox/notes/**/*.md
command! -nargs=1 Nedit e /mnt/d/home/kitchen/Dropbox/notes/<args>.md
command! -nargs=0 Fuzzy call fzf#run({ 'window': {'width': 0.8, 'height': 0.8 }, 'options': ["--preview", "bat {} --line-range=0:10 --color=always --style=numbers"] })

" }}}

" Note keybinds {{{

" Press space after keybind to start command
nnoremap <silent> ,n :Nnew
nnoremap <silent> ,[ :Ngrep
nnoremap <silent> <leader>a <cmd>lua require('comfy.telescope').explorer{cwd = '~/Dropbox/notes'}<CR>

" Quick Fix List {{{

nnoremap <silent> <C-n> <cmd>cnext<CR>
nnoremap <silent> <C-b> <cmd>cprev<CR>

" }}}

" }}}

" Markdown Manipulation {{{

" Make link of Selection
vnoremap <silent> ,l c[]<ESC>Pwa()<ESC>Pa.md<ESC>vi(

" italisize
vnoremap <silent> ,i c**<ESC>Pw
nnoremap <silent> ,i viwc**<ESC>Pw

" bold
vnoremap <silent> ,b c****<ESC>hPw
nnoremap <silent> ,b viwc****<ESC>hPw

" }}}

" HighlightGroups {{{

hi markdownBold guifg=#dcdadb
hi markdownItalic guifg=#bdae93

hi markdownHeadingDelimiter guifg=#c8a0b2
hi markdownH1 guifg=#fb4934
hi markdownH2 guifg=#b8bb26
hi markdownH3 guifg=#fabd2f

hi markdownUrl guifg=#d3869b
hi markdownLinkDelimiter guifg=#bdae93
hi markdownLinkText guifg=#a293a4
hi markdownListMarker guifg=#928374

" }}}
