
lua require('comfy.color')

lua require('plenary.reload').reload_module('comfy.color')

" colorscheme fantastic-cterm

lua << EOF

local color = require 'comfy.color'

color.loadScheme 'gruvbox'
-- color.loadTheme 'nocursorline'
color.loadTheme 'link'
color.loadTheme 'transparent'

EOF

" set termguicolors&
