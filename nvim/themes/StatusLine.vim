
" A simple StatusLine
" set statusline=%#LineNr#
" set statusline+=\ %f
" 
" set statusline+=%= " Spread...
" 
" set statusline+=\ %F
" set statusline+=%#TabLineSel#
" set statusline+=\ %y
" set statusline+=\ %r
" set statusline+=%#CursorLineNr#
" set statusline+=\ %l/%L:%c
" set statusline+=\ %p%%
" set statusline+=\

lua require 'comfy.statusline'
lua require 'plenary.reload'.reload_module('comfy.statusline')
