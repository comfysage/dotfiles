
" Main Call {{{

lua R('comfy.telescope')

" }}}

" Key Maps {{{

nmap <space>t :Telescope<CR>
nmap <space>v <cmd>lua require('comfy.telescope').edit_dotfiles()<CR>
nmap <space>fn <cmd>lua require('comfy.telescope').edit_notes()<CR>
nmap <space>ff <cmd>lua require('comfy.telescope').explorer{}<CR>
nmap <space>fs <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nmap <space>fa <cmd>lua require('comfy.telescope').space{}<CR>
nmap <space>fg <cmd>lua require('comfy.telescope').git_files{}<CR>
nmap <space>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nmap <space>ft <cmd>lua require('telescope.builtin').filetypes()<CR>

nmap <C-t> <cmd>lua require('telescope.builtin').colorscheme()<CR>

" }}}

