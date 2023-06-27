if true then return end

vim.g.airline_powerline_fonts = 0
vim.g.airline_mode_map = {
    ['__']     = '-',
    ['c']      = 'C',
    ['i']      = 'I',
    ['ic']     = 'I',
    ['ix']     = 'I',
    ['n']      = 'N',
    ['multi']  = 'M',
    ['ni']     = 'N',
    ['no']     = 'N',
    ['R']      = 'R',
    ['Rv']     = 'R',
    ['s']      = 'S',
    ['S']      = 'S',
    ['']     = 'S',
    ['t']      = 'T',
    ['v']      = 'V',
    ['V']      = 'V',
    ['']     = 'V',
    }

vim.g.airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'

vim.g['airline#extensions#wordcount#formatter#default#fmt'] = 'W %s'

-- call g:airline#extensions#whitespace#disable()

vim.g.airline_left_sep = ""
vim.g.airline_left_alt_sep = "|"
vim.g.airline_right_sep = ""
vim.g.airline_right_alt_sep = "|"

vim.g.airline_symbols = {
    ['linenr'] = ' ',
    ['modified'] = '+',
    ['whitespace'] = '',
    ['branch'] = '',
    ['ellipsis'] = '...',
    ['paste'] = 'PASTE',
    ['maxlinenr'] = ' ',
    ['readonly'] = '-',
    ['spell'] = 'SPELL',
    ['space'] = ' ',
    ['dirty'] = '*',
    ['colnr'] = '',
    ['keymap'] = 'Keymap:',
    ['crypt'] = '-',
    ['notexists'] = 'E',
    }

vim.g.airline_section_y = '%{airline#util#wrap(airline#parts#ffenc() == "utf-8[unix]" ? "" : airline#parts#ffenc(),0)}'
vim.g.airline_section_z = "%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#"
vim.g.airline_section_z = "%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#:%L%{g:airline_symbols.maxlinenr}%#__restore__#"
vim.g.airline_section_b = '%{expand("%:.:h")}'
vim.g.airline_section_c = '%<%<%{expand("%:t")}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold#%#__restore__#'

-- Disable Airline
-- vim.g.airline_disable_statusline = 1

--vim.cmd [[ AirlineRefresh ]]
