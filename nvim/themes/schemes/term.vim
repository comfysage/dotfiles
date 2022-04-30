" a Simple colorscheme based on your terminal colors
set termguicolors&
hi clear
" set nocursorline

"  Colors
hi Red     ctermfg=Red     cterm=NONE
hi Green   ctermfg=Green   cterm=NONE
hi Yellow  ctermfg=Yellow  cterm=NONE
hi Blue    ctermfg=Blue    cterm=NONE
hi Magenta ctermfg=Magenta cterm=NONE
hi Cyan    ctermfg=Cyan    cterm=NONE
hi White   ctermfg=White   cterm=NONE
hi Gray    ctermfg=Gray    cterm=NONE

hi LightRed     ctermfg=LightRed     cterm=NONE
hi LightGreen   ctermfg=LightGreen   cterm=NONE
hi LightYellow  ctermfg=LightYellow  cterm=NONE
hi LightBlue    ctermfg=LightBlue    cterm=NONE
hi LightMagenta ctermfg=LightMagenta cterm=NONE
hi LightCyan    ctermfg=LightCyan    cterm=NONE
hi LightGray    ctermfg=LightGray    cterm=NONE

hi DarkRed     ctermfg=DarkRed     cterm=NONE
hi DarkGreen   ctermfg=DarkGreen   cterm=NONE
hi DarkYellow  ctermfg=DarkYellow  cterm=NONE
hi DarkBlue    ctermfg=DarkBlue    cterm=NONE
hi DarkMagenta ctermfg=DarkMagenta cterm=NONE
hi DarkCyan    ctermfg=DarkCyan    cterm=NONE
hi DarkGray    ctermfg=DarkGray    cterm=NONE

" Basic UI {{{

hi! link VertSplit White
hi! link LineNr    Gray

hi TabLineFill ctermbg=Black ctermfg=White cterm=NONE
hi TabLineSel ctermbg=Black ctermfg=Red cterm=NONE
hi TabLine ctermbg=Black ctermfg=White cterm=NONE

hi! link ModeMsg Red
hi CursorLine ctermbg=60 cterm=NONE
hi CursorLineNr ctermfg=Yellow cterm=NONE

hi Comment ctermfg=Grey
hi! link Folded Comment

" }}}

" Increase Readability {{{

hi Visual ctermbg=White ctermfg=Black
hi Error	  ctermfg=Black
hi DiffAdd	  ctermfg=Black
hi DiffChange ctermfg=Black
hi DiffDelete ctermfg=Black
hi DiffText	  ctermfg=Black
hi SpellBad	  ctermfg=Black
hi SpellCap	  ctermfg=Black
hi SpellRare  ctermfg=Black
hi SpellLocal ctermfg=Black

hi RedrawDebugClear	    ctermfg=Black
hi RedrawDebugComposed  ctermfg=Black
hi RedrawDebugRecompose ctermfg=Black

hi NvimInternalError ctermfg=Black

" }}}

" Languages {{{

" Syntax
hi! link Identifier Cyan
hi! link Constant Magenta
hi! link Statement Yellow
hi! link Type LightGreen
hi! link Special LightRed
hi! link PreProc LightBlue

"  }}}
