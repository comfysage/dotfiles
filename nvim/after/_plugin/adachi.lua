local status, _ = pcall(require, 'adachi')
if not status then return end

require 'adachi'.setup {
    inverse = { tabline = true, search = true },
    contrast_dark = 'medium',
    contrast_light = 'medium',
    plugins = { 'Telescope', 'GitGutter' }
}
