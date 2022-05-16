
" init.vim @ comfy {{{

set runtimepath+=,/mnt/d/home/kitchen/config/nvim
nmap <silent> <leader>r :source /mnt/d/home/kitchen/config/nvim/init.vim<CR>
nmap <silent> <leader>v :e /mnt/d/home/kitchen/config/nvim/init.vim<CR>

nnoremap <silent> <leader>s <Cmd>source %<CR>
nmap <silent> <C-s> :w<CR>

" }}}

" Plugins {{{

source /mnt/d/home/kitchen/config/nvim/plugins/plugins.vim

" }}}

" Lua {{{

lua require('comfy.init')

lua require('comfy.globals')

lua R('comfy.plugins').plugin('lua')

augroup Telescope 
 autocmd User TelescopePreviewerLoaded setlocal wrap
augroup END

lua <<EOF

require'nvim-web-devicons'.setup {
  default = true;
  }

EOF

"}}}

" Ranger {{{

let g:ranger_map_keys = 0
map <leader>f :Ranger<CR>
map <leader>g :RangerNewTab<CR>

command! -nargs=0 RangerTree :vs | :wincmd l | :RangerWorkingDirectory 
map <space>r :RangerTree<CR>

"open ranger when vim opens a directory
" let g:ranger_replace_netrw = 1

" }}}

" Basic UI {{{

if (has("termguicolors"))
 set termguicolors
endif

set foldcolumn=0
set laststatus=3

source /mnt/d/home/kitchen/config/nvim/scripts/folds.vim

set fillchars=fold:-,foldclose:>,eob:·

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set t_Co=256

set background=dark
"hi Normal guibg=NONE ctermbg=NONE

" }}}

" Theme Settings {{{

" augroup ColorSchemeChange
"   " Source to change background on Highlight Groups
"   au ColorScheme * source ~/.config/nvim/themes/transparent.vim
" augroup END

" GruvboxTheme {{{

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1
let g:gruvbox_improved_strings = 0

" }}}

" GruvboxMaterialTheme {{{

let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_cursor = 'auto'
let g:gruvbox_material_current_word = 'grey background'
let g:gruvbox_material_transparent_background = 1

"}}}

" EdgeTheme {{{

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
let g:edge_transparent_background = 1

" }}}

" EverforestTheme {{{

let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 1
let g:everforest_transparent_background = 1

" }}}

" Fantastic {{{

let g:fantastic_rose_pine = 1

" }}}

" OneDark {{{

let g:onedark_color_overrides = {
      \}
let null = {
      \ "red": { "gui": "#E06C75", "cterm": "204", "cterm16": "1" },
      \ "dark_red": { "gui": "#BE5046", "cterm": "196", "cterm16": "9" },
      \ "green": { "gui": "#98C379", "cterm": "114", "cterm16": "2" },
      \ "yellow": { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" },
      \ "dark_yellow": { "gui": "#D19A66", "cterm": "173", "cterm16": "11" },
      \ "blue": { "gui": "#61AFEF", "cterm": "39", "cterm16": "4" },
      \ "purple": { "gui": "#C678DD", "cterm": "170", "cterm16": "5" },
      \ "cyan": { "gui": "#56B6C2", "cterm": "38", "cterm16": "6" },
      \ "white": { "gui": "#ABB2BF", "cterm": "145", "cterm16": "15" },
      \ "black": { "gui": "#282C34", "cterm": "235", "cterm16": "0" },
      \ "foreground": { "gui": "#ABB2BF", "cterm": "145", "cterm16": "NONE" },
      \ "background": { "gui": "#d8a657", "cterm": "235", "cterm16": "NONE" },
      \ "comment_grey": { "gui": "#5C6370", "cterm": "59", "cterm16": "7" },
      \ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238", "cterm16": "8" },
      \ "cursor_grey": { "gui": "#2C323C", "cterm": "236", "cterm16": "0" },
      \ "visual_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },
      \ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "7" },
      \ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "7" },
      \ "vertsplit": { "gui": "#3E4452", "cterm": "59", "cterm16": "7" },
      \}

"source ~/.vim/plugged/onedark.vim/autoload/onedark.vim

" }}}

" }}}

" Colour Highlights {{{

"hi! Normal guibg=#292c35
"hi Cursor guibg=#d8a657

"hi Normal guibg=#303731
"hi Normal guibg=#2e3537

" hi! link ModeMsg Variable

command! Highlights source $VIMRUNTIME/syntax/hitest.vim

function! SynStack()
  if !exists("*synstack")
    return
  endif
  let s:val = map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
  echo s:val 
  echo " > " .. synIDattr(synIDtrans(hlID(s:val[len(s:val) - 1])), "name")
endfunc

nmap <leader>sp :call SynStack()<CR>

" }}}

" Theme {{{

lua R('comfy.plugins').plugin 'color'

" }}}

" General Settings {{{

syntax on
set encoding=UTF-8
set spelllang=en_gb,fr
set mouse=nv

" Settings {{{

" Basic UI
set noerrorbells
set nocursorline
set relativenumber&
set number
set numberwidth=5
set smarttab
set conceallevel=2

" When editing vim and markdown files don't show numbers
au BufReadPost,BufRead,BufNewFile *.vim set nonu
au BufReadPost,BufRead,BufNewFile *.markdown set nonu
let g:vim_markdown_follow_anchor = 1

" Indention
set cindent
set smartindent

" Tab indention
set tabstop=1 softtabstop=1
set shiftwidth=2
set expandtab

" Lifecycle
set noswapfile
set nobackup
set undodir=~/.undodir
set undofile
set hidden

" Searching
set incsearch
set nohlsearch
set ignorecase
set smartcase

" Scrolling
set scrolloff=5

" }}}

" Basic Keybinds {{{

"inoremap jk <ESC>
nmap ; viw

nmap <silent> <space>s <cmd>PrettierAsync<CR>

nmap <space>e $<ESC>
nmap <space>q ^<ESC>
nmap <space><space> <ESC>:<BACKSPACE>zz

" Invert NumberLine
nmap <silent> <leader>n :set invnu<CR>

" vmap <leader>c "*y
" nmap <leader>v "*p

" Move Selected Line up and down
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

" < and > indents
vnoremap < <gv
vnoremap > >gv

" Surround Selection
vnoremap o <ESC>'<O<ESC>'>o<ESC>gv

nmap ++ gcc
vmap ++ gcc

nnoremap gqp gqap

nnoremap ga $<ESC>
nnoremap gi ^<ESC>

nnoremap C cc<ESC>

nnoremap ss <C-o>

nmap qw :wq
nmap qq :q
nmap Q :qa

nmap B :Bclose 

" }}}

" Move through wrapping lines {{{

" j/k will move virtual (wrapping) lines.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" }}}

" }}}

" Folding {{{

set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=marker

" }}}

" Goyo & LimeLight {{{

nmap <silent> <space>g <cmd>Goyo<CR>
nmap <silent> <space>G <cmd>Goyo 75%x82%<CR>

let g:goyo_width = '80'
let g:goyo_height = '82%'
let g:goyo_linenr = 0

let g:limelight_paragraph_span = 1

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

function! s:goyo_enter()
  set noshowcmd
  " set noshowmode
  set scrolloff=999
  Limelight
  "nnoremap <buffer> <silent> l :Limelight!!<CR>
endfunction

function! s:goyo_leave()
  set showcmd
  " set showmode
  set scrolloff=5
  Limelight!
  source /mnt/d/home/kitchen/config/nvim/plugins/color.vim
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" }}}

" StatusLine {{{

" source /mnt/d/home/kitchen/config/nvim/themes/StatusLine.vim
lua R'soil'

" Toggle StatusLine
command! -nargs=0 ToggleStatusLine if &ls == 0 | set ls=3 | else | set ls=0 | endif
nnoremap <space><ESC> <Cmd>ToggleStatusLine<CR>

" }}}

" Startify {{{

" let g:startify_custom_header =
"       \ 'startify#pad(split(system("bonfai"), "\n"))'
let g:startify_custom_footer = ['', '']
let g:startify_padding_left = 6
let g:startify_files_number = 5
let g:startify_bookmarks = [ {'p': '/mnt/d/home/kitchen/pan'}, {'k': '/mnt/d/home/kitchen'}, '~/.zshrc', {'n': '/mnt/d/home/kitchen/config/nvim'} ]

" }}}

" Dashboard {{{

let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_section = {
      \ 'config': {
        \ 'description': [ 'config' ],
        \ 'command': ':e /mnt/d/home/kitchen/config/nvim/'
        \}
      \}

augroup Dashboard
 " autocmd FileType dashboard setlocal showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
 autocmd FileType dashboard nnoremap e <Cmd>DashboardNewFile<CR>
augroup END

" }}}

" VimWiki {{{

let g:vimwiki_list = [{'path': '/home/comfy/Dropbox/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'links_space_char': '_'}]

let g:vimwiki_auto_header = 1

au BufReadPost,BufRead,BufNewFile *.md set filetype=markdown

" }}}

" Window Settings {{{

" Splits {{{

nmap sv <C-w>v
nmap sh <Cmd>sp<CR>
nmap sq <C-w>q

set splitright splitbelow

" }}}  

" Split File {{{

nmap <silent> <C-\>  :vs<CR>:wincmd l<CR>
" nmap <silent> <space>w :vs<CR>:wincmd l<CR>:RangerWorkingDirectory<CR>

" }}}

" Split Navigation {{{

nmap <silent> <space><Left> :wincmd h<CR>
nmap <silent> <space><Down> :wincmd j<CR>
nmap <silent> <space><Up> :wincmd k<CR>
nmap <silent> <space><Right> :wincmd l<CR>

nmap <silent> <space>h :wincmd h<CR>
nmap <silent> <space>j :wincmd j<CR>
nmap <silent> <space>k :wincmd k<CR>
nmap <silent> <space>l :wincmd l<CR>

" }}}

" Terminal {{{

tnoremap <Esc> <C-\><C-n>
" tmap <silent> <C-Left>  <Cmd>wincmd h<CR>
" tmap <silent> <C-Down>  <Cmd>wincmd j<CR>
" tmap <silent> <C-Up>    <Cmd>wincmd k<CR>
" tmap <silent> <C-Right> <Cmd>wincmd l<CR>

" tmap <silent> <C-h> :wincmd h<CR>
" tmap <silent> <C-j> :wincmd j<CR>
" tmap <silent> <C-k> :wincmd k<CR>
" tmap <silent> <C-l> :wincmd l<CR>

" }}}

" Scripts {{{

source /mnt/d/home/kitchen/config/nvim/scripts/floatWin.vim

" }}}

" }}}

" Tab Settings {{{

nmap <silent> <TAB> :tabnext<CR>
nmap <silent> <S-TAB> :tabprev<CR>

nmap <silent> <space><TAB> :$tabedit<CR>

" }}}

" coc.nvim {{{

"source /mnt/d/home/kitchen/config/nvim/plugins/coc.vim

" }}}

" NERDTree {{{

nmap <space>n :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 0
let g:NERDTreeDirArrows = 1

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '/'

let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeIgnore = ['\~$', 'node_modules/*']
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortOrder = ['\/$', '\.*', '*', '\.swp$', '\.bak$', '\~$']

" NERDTree Git
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'+',
                \ 'Untracked' :'_',
                \ 'Renamed'   :'/',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'-',
                \ 'Dirty'     :'*',
                \ 'Ignored'   :'#',
                \ 'Clean'     :' ',
                \ 'Unknown'   :'?',
                \ }

" }}}

" Surround {{{

vmap ( S(
vmap { S{
vmap [ S[
vmap " S"
vmap ' S'

" }}}

" fzf {{{

nnoremap <C-p> :FZF<CR>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd FileType fzf nmap <buffer> <ESC><ESC> :q<CR>
augroup END

" fzf config {{{

let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
let g:fzf_preview_window = ['right:40%']

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function("s:build_quickfix_list"),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'PreProc'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }

let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'vimCommand'],
\ 'bg+': ['bg', 'Normal'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'PreProc'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }

" }}}

" fzf commands {{{

command! GitLs call fzf#run({ 'source': 'git status --short' })
command! GitMod call fzf#run({ 'source': 'git ls-files --modified', 'options': ['--preview', 'bat {}'] })

" }}}


" }}}

" JavaScript {{{

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" }}}

" icons {{{

let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
" change the default open folder/directory glyph/icon (default is '')
let g:DevIconsDefaultFolderOpenSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

" Disable arrow icons at the left side of folders for NERDTree.
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = 'P'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['tsconfig.json'] = ''

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" }}}

