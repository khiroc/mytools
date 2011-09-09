" setlocal tabindent タブインデントの設定
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" refe.vim
" let g:RefeUseLookupFile=0
" let g:RefeMinPatLength=1
" let g:RefeCommand='/opt/local/bin/refe'
" nnoremap <buffer> <silent> K :Refe <cword><CR>
" nnoremap <buffer> <silent> <C-K> :Refe<CR>

"smartchr.vim
" inoremap <expr> < smartchr#loop('<', ' < ', ' <= ', ' << ')
" inoremap <expr> - smartchr#loop('-', ' => ')
" inoremap <expr> > smartchr#loop('>', ' > ', ' => ', ' >= ')
inoremap <expr> , smartchr#loop(', ', ' < ', ' << ', ' <= ')
inoremap <expr> . smartchr#loop('.', '>', ' > ', ' => ', ' >= ')
inoremap <expr> ~ smartchr#loop('~', ' =~ ')
inoremap <expr> % smartchr#loop('%', '%= ')
