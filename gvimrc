" ---------------------------------------------------------------------
" display configure 表示に関する設定

" macvim color カラー設定
" colorscheme macvim
colorscheme koehler
" colorscheme Blacksea

" ウインドウの幅
set columns=180
" ウインドウの高さ
set lines=48
" ウィンドウの位置
winpos 0 0

" guioptions
" 水平スクロールバーを表示
" set guioptions+=b
" 左右のスクロールバーを非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" ツールバーを非表示
set guioptions-=T

" macvim only
if has("gui_macvim")
  " window maximum ウィンドウサイズをMAXに指定 
  " set fuoptions=maxvert,maxhorz
  " fullscreen フルスクリーン
  au GUIEnter * set fullscreen
  " transparency 半透明
  set transparency=25
end 

" IME状態に応じたカーソル色を設定
highlight CursorIM guifg=NONE guibg=Red
" if has('multi_byte_ime')
  " highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  " highlight CursorIM guifg=NONE guibg=#ecbcbc
" endif

" 常にタブを表示
set showtabline=2

" fontの設定
if has("gui_running")
  if has("gui_macvim")
    :set guifont=Osaka-Mono:h16
    :set guifontwide=ヒラギノ丸ゴ\ ProN\ w4:h15
    " :set guifontwide=ヒラギノ角ゴ\ StdN\ w8:h14
  elseif has("gui_gtk2")
    :set guifont=Luxi\ Mono\ 12
  elseif has("x11")
    " Also for GTK 1
    :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_win32")
    :set guifont=Luxi_Mono:h12:cANSI
  endif
endif


" ---------------------------------------------------------------------
" other configure その他の設定

" 入力時にマウスポインタを隠す
set mousehide

" autoreload gvimrc vimrcを変更時に自動でリロード
" autocmd! bufwritepost $MYVIMRC source $MYGVIMRC
" autocmd! bufwritepost $MYGVIMRC source $MYGVIMRC

" メニューを英語に戻す
source $VIMRUNTIME/delmenu.vim
set langmenu=none
source $VIMRUNTIME/menu.vim
 
" 様々な箇所を英語に戻す
lang en_gb
