local status, _ = pcall(require, 'bufferline')
if not status then return end

require "bufferline" .setup {
    options = {
        --mode = "tabs",
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon'-- | 'underline' | 'none',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = ' ',
        left_trunc_marker = '.',
        right_trunc_marker = '.',
        diagnostics = "nvim_lsp",
        color_icons = false, -- whether or not to add the filetype icon highlights
        show_buffer_icons = false, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "padded_slant"--[[ | { 'any', 'any' } ]],
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
}

if vim.g.colors_name == "gruvboxed" then
    vim.cmd [[ let g:gruvbox_transparent_background = 0 | colorscheme gruvboxed ]]
end

vim.cmd [[
hi! BufferLineBufferSelected cterm=bold gui=bold
]]
