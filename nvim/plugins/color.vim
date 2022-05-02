
lua R('comfy.color')

" colorscheme fantastic-cterm

lua << EOF

local color = R 'comfy.color'

color.loadScheme 'gruvbox'
-- color.loadTheme 'nocursorline'
color.loadTheme 'link'
color.loadTheme 'transparent'

EOF

" set termguicolors&
