local auid = vim.api.nvim_create_augroup('TSFileType', {
  clear = true
})

---@alias TSLnAuProps { [1]: string[], [2]: string }

---@param props TSLnAuProps
local createTSLNAutocmd = function(props)
  local ext = props[1]
  local ln = props[2]
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = ext,
    group = auid,
    callback = function()
      if vim.treesitter.language.get_lang(ln) then return end
      vim.cmd('TSInstall ' .. ln)
    end,
    once = true,
    desc = '[TS] ' .. ln .. ' parser installed on BufEnter',
  })
end

---@type TSLnAuProps[]
local opts = {
  { { '*.c', '*.h'     } , 'c' },
  { { '*.cpp', '*.hpp' } , 'cpp' },
  { { '*.css'          } , 'css' },

  { { '*.go'   } , 'go' },
  { { 'go.*'   } , 'gomod' },

  { { '*.js' }, 'javascript' },
  { { '*.ts' }, 'typescript' },
  { { '*.tsx' }, 'tsx' },

  { { '*.lua' }, 'lua' },
  { { '*.vim' }, 'vim' },

  { { '*.html' }, 'html' },
  { { '*.scss', }, 'scss' },
  { { '*.sass', }, 'sass' },
}

for _, opt in ipairs(opts) do
  createTSLNAutocmd(opt)
end
