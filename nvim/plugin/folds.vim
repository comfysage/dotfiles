function s:MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|\"\s*\|{{{\d\=', '', 'g')
  return v:folddashes .. " " .. sub
endfunction

function s:CenteredFold()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|\"\s*\|{{{\d\=', '', 'g')
  return repeat("-", ( &columns - len( sub ) ) / 2 ) .. " " .. sub
  return v:folddashes .. sub
endfunction

set foldtext=CenteredFold()

