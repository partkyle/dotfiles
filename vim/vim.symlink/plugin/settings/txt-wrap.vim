function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
