
lua R('comfy.color')

" colorscheme tokyonight

lua << EOF

local color = R 'comfy.color'

color.loadScheme 'fantastic'
-- color.loadTheme 'nocursorline'
-- color.loadTheme 'transparent'
color.loadTheme 'link'

EOF

" set termguicolors&

