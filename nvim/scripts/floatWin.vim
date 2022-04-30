
function! OpenFloatingWin()
  let height = &lines - 3
  " let width = float2nr(&columns - (&columns * 2 / 10))
  let width = &columns
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let windowHeight = height / 5 * 4
  let windowWidth  = width / 5 * 3

  let yOffSet = ( height / 2 ) - ( windowHeight / 2 )
  let xOffSet = ( width / 2 ) - ( windowWidth / 2 )
 
  let opts = {
        \ 'relative': 'editor',
        \ 'border': 'rounded',
        \ 'row': yOffSet,
        \ 'col': xOffSet,
        \ 'width': windowWidth,
        \ 'height': windowHeight
        \ }

  let buf = nvim_create_buf(v:true, v:false)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Normal')

  setlocal
        "\ nobuflisted
        "\ bufhidden=hide
        "\ nonumber
        \ modifiable
        \ norelativenumber
        "\ signcolumn=no
endfunction

