
lua << EOF

local plugins = R('comfy.plugins')

plugins.plugin 'telescope'

plugins.plugin 'nvim-treesitter'
plugins.plugin 'lspconfig'
plugins.plugin 'luasnip'
plugins.plugin 'completion'
plugins.plugin 'commentary'

plugins.plugin 'color'
plugins.plugin 'flowtype'
plugins.plugin 'isolate'

plugins.plugin 'filetype/cpp'
plugins.plugin 'filetype/c'

EOF
