set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  " let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g') " Default
  let sub = substitute(line, '/\*\|\*/\|\"\|{{{\d\=', ' ', 'g')
  return v:folddashes . sub
endfunction

