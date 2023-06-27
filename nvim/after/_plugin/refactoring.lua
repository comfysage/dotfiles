local status, _ = pcall(require, 'refactoring')
if not status then return end

require 'refactoring'.setup {}

status, _ = pcall(require, 'telescope')

if status then
    require 'telescope'.load_extension 'refactoring'
    vim.keymap.set("v", "<space>rr",
        function() require 'telescope'.extensions.refactoring.refactors() end,
        { noremap = true }
    )
else
    vim.keymap.set("v", "<space>rr",
        function() require 'refactoring'.select_refactor() end,
        { noremap = true, silent = true, expr = false }
    )
end
