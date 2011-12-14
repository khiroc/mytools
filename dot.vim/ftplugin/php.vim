""
" PHP Lint
"

" nmap ,c :call PHPLint()<CR>
:command! SyntaxCheck :call PHPLint()

function! PHPLint()
  let result = system(&ft . ' -l ' . bufname(""))
  echo result
endfunction
