
lua << EOF

local color = R 'comfy.color'

local schemes = {
"Base2Tone_LavenderDark",
"Base2Tone_EveningDark",
"Base2Tone_EarthDark",
"Base2Tone_ForestDark",
"Base2Tone_DesertDark",
"Base2Tone_PorchDark",
"Base2Tone_PoolDark",
"Base2Tone_CaveDark",
"Base2Tone_GardenDark",
 }

local scheme = schemes[math.floor( math.random() * table.getn( schemes ) )]

vim.cmd('colorscheme ' .. scheme)

EOF

set termguicolors
