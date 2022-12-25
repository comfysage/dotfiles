local status, _ = pcall(require, 'FTerm')
if not status then return end

require'FTerm'.setup({
    ---Filetype of the terminal buffer
    ---@type string
    ft = 'FTerm',

    ---Command to run inside the terminal
    ---NOTE: if given string[], it will skip the shell and directly executes the command
    ---@type fun():(string|string[])|string|string[]
    -- cmd = os.getenv('SHELL'),

    ---Neovim's native window border. See `:h nvim_open_win` for more configuration options.
    border = 'rounded',

    ---Close the terminal as soon as shell/command exits.
    ---Disabling this will mimic the native terminal behaviour.
    ---@type boolean
    auto_close = true,

    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = 'Normal',

    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,

    ---Object containing the terminal window dimensions.
    ---The value for each field should be between `0` and `1`
    ---@type table<string,number>
    dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.6, -- Width of the terminal window
        x = 0.5, -- X axis of the terminal window
        y = 0.5, -- Y axis of the terminal window
    },

    ---Replace instead of extend the current environment with `env`.
    ---See `:h jobstart-options`
    ---@type boolean
    -- clear_env = false,

    ---Map of environment variables extending the current environment.
    ---See `:h jobstart-options`
    ---@type table<string,string>|nil
    -- env = nil,

    ---Callback invoked when the terminal exits.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    -- on_exit = nil,

    ---Callback invoked when the terminal emits stdout data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    -- on_stdout = nil,

    ---Callback invoked when the terminal emits stderr data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    -- on_stderr = nil,
})

-- Example keybindings
vim.keymap.set('n', '<space>w', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<space>w', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
