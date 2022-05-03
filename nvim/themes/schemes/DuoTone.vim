
lua << EOF

local color = R 'comfy.color'

local schemes = {
"Lavender", -- light cyan & white
"Evening", -- light cyan & yellow
"Earth", -- Brown & Yellow
"Forest", -- Green & Lime
"Desert", -- Green & Orange
"Porch", -- Purple & Yellow
"Pool", -- Purple & Orange ( lighter than Porch )
"Cave", -- red & yellow
"Garden", -- green & yellow
 }

local scheme = schemes[math.floor( math.random() * table.getn( schemes ) )]
scheme = 'Base2Tone_' .. scheme .. 'Dark'

vim.cmd('colorscheme ' .. scheme)
vim.notify('colorscheme: ' .. scheme)

EOF
