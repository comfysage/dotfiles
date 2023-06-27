CR = CR or "~/.config"

ENV = function(v)
    if not vim.fn.has_key(vim.fn.environ(), v) then
        return ""
    end
    return vim.fn.environ()[v]
end

CR_PATH = function (v)
    return CR .. "/" .. v
end

P = function (v)
 print(vim.inspect(v))
 return v
end

RELOAD = function (...)
 return require("plenary.reload").reload_module(...)
end

R = function (name)
 RELOAD(name)
 return require(name)
end

V = function ()
 vim.ui.input({ prompt = '' }, function (name)
  local sp = vim.split(name, ".", { plain = true, trimempty = true })

  local basepath = CR_PATH 'nvim'
  local p = ''

  for i, n in pairs(sp) do
    p = p .. "/"
   if i == #sp then
    p = p .. n .. '.lua'
   else
    p = p .. n
   end
  end

  local path = basepath .. p
  vim.notify(path)
 end)
end

MT = function (t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                MergeTable(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

