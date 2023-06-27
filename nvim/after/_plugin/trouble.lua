local status, _ = pcall(require, 'trouble')
if not status then return end

require 'trouble'.setup {
    height = 15,
    width = 24,
    mode = 'document_diagnostics',
    group = true,
    padding = false,
    auto_open = false,
    auto_close = true,
    auto_jump = {'lsp_definitions', 'quickfix'},
}
