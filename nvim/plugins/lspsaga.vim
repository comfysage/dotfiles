
lua << EOF

local saga = require'lspsaga'

saga.init_lsp_saga {
  error_sign = '*',
  warn_sign = '*',
  hint_sign = '#',
  infor_sign ='*',
  border_style = 'round',
  }

EOF

" Commands {{{

function! OpenFloatTerm()
  Lspsaga open_floaterm
  nmap <buffer> <ESC><ESC> <Cmd>Lspsaga close_floaterm<CR>
endfunc

" }}}

" Maps {{{

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> <space>w <Cmd>call OpenFloatTerm()<CR>

" }}}

" Main Maps {{{

nnoremap <silent>gr :Lspsaga rename<CR>

" }}}

