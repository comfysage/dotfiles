
lua R('comfy.lspsaga')

" Commands {{{

function! Float_term()
  Lspsaga open_floaterm
  tnoremap <buffer> <ESC> <cmd>Lspsaga close_floaterm<cr>
endfunction

" }}}

" Maps {{{

" nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
" nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> <space>w <cmd>call Float_term()<cr>

" }}}

" Main Maps {{{

" nnoremap <silent>gr :Lspsaga rename<CR>

" }}}

