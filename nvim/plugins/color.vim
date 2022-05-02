
lua R('comfy.color')

colorscheme Base2Tone_ForestDark

lua << EOF

local color = R 'comfy.color'

color.loadScheme 'DuoTone'
-- color.loadTheme 'nocursorline'
-- color.loadTheme 'transparent'
color.loadTheme 'link'

EOF

" set termguicolors&

