" my vimrc  Last Change: 12-May-2011.

:if version < 701
   :finish
:endif

"reset MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END
" autocmd!

" pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



" ---------------------------------------------------------------------
" standard configure 基本設定

" viとの互換性をとらない(vimの独自拡張機能を使う)
" set nocompatible

" backup configure バックアップの設定
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backupがオフである場合、バックアップは上書き成功後に削除される)
set writebackup

" buffer adv バッファを保存せずに切り替え
set hidden

" autoread 他で書き換えられたファイルを自動でリロード
set autoread

" excommand history コマンド/検索の最大履歴
set history=500


" auto indent オートインデントの設定
set smartindent
" set cindent
" set cinoptions=:0

" set tabindent タブインデントの設定
" space indent
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
autocmd MyAutoCmd FileType make setlocal noexpandtab

" break delete バックスペース拡張
set backspace=indent,eol,start

" virtual editing 仮想編集 block選択のみ
set virtualedit+=block

" command complete コマンド補完
set wildmenu
set wildmode=longest,list,full

" insert mode complete 入力補完の設定
set completeopt=menuone,preview

" swap file ~/tmp スワップの置き場所
set directory-=.
" set directory=~/vim/swap

" always current directory 開いている場所をcurrent
au BufEnter * execute ":lcd " . expand("%:p:h")

" netrw config ディレクトリブラウザの設定
let g:netrw_liststyle = 1
" let g:netrw_list_hide = '.*\.swp$ , .*\.zip$'

" search 検索の設定
set incsearch
set hlsearch
set ignorecase
set smartcase

" search easy slash$question 検索時にスラッシュと？を自動エスケープ
cnoremap <expr> / getcmdtype() ==  '/' ? '\/' : '/'

" unused key Nop 使わないキーをNop
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" keyremap4macbook patch
if has('kaoriya')
  map <Down> <C-n>
  map <Up> <C-p>
  map <backspace> <C-h>
  " nnoremap <Del> <C-d>
endif

" Save fold settings.
" autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
" autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
" set viewoptions-=options



" ---------------------------------------------------------------------
" display configure 表示設定

" colorscheme カラーテーマ
" colorscheme desert
" colorscheme koehler
" colorscheme wombat
" colorscheme lucius
" colorscheme elflord
colorscheme nevfn

" syntax_on 構文ハイライト
syntax on

" 行番号を表示
set number

" コマンドを画面の最下行に表示
set showcmd

" statusline ステータスライン(buftabs.vimも参照)
" ステータスラインを常に表示
set laststatus=2
" ステータスラインの表示内容
set statusline=%<%F\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set statusline+=%=
" set statusline+=[ci=%c]
" set statusline+=[L=%l/%L]
set statusline+=[%04l,%04v]
" set statusline+=[%p%%]
set statusline+=[%02p%%]

" display tab & end of line タブ文字行末表示
set list
set listchars=tab:»\ \,trail:-,nbsp:%

" 2byte文字の表示
set ambiwidth=double

" search-highlight 検索時にハイライト&space連打でnoハイライト
nnoremap <Space><Space> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#


" カーソルの下にラインを引く(描画が遅くなる)
" set cursorline

" window width ウィンドウの横幅を84より大きくとる
" nnoremap <C-w>h <C-w>h:call <SID>good_width()<CR>
" nnoremap <C-w>l <C-w>l:call <SID>good_width()<CR>
" nnoremap <C-w>H <C-w>H:call <SID>good_width()<CR>
" nnoremap <C-w>L <C-w>L:call <SID>good_width()<CR>
"
" function! s:good_width()
"   if winwidth(0) < 84
"    vertical resize 84
"   endif
" endfunction

" kwbd keep window buffer delete バッファを削除してもウィンドウは消さない
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" window bigger アクティブのウィンドウを拡大表示する
command! Big wincmd _ | wincmd |



" ---------------------------------------------------------------------
" key-change ショートカットキーの変更・設定

" <C-h> -> :help
" nnoremap <C-h> :<C-u>help<Space>
" nnoremap <Space>h :<C-u>help<space>
" open mytips
nnoremap <Space>t :<C-u>help<space>mytips.txt<CR>

" open vimrc
nnoremap <Space>, :<C-u>edit $MYVIMRC<CR>
" reload vimrc
if has("gui_running")
  command! ReloadVimrc source $MYVIMRC | source $MYGVIMRC
else
  command! ReloadVimrc source $MYVIMRC
endif

" graphic move && center
vmap j gjzz
vmap k gkzz
vmap G Gzz
nmap j gjzz
nmap k gkzz
nmap G Gzz

" search etc keep center 真ん中をキープ
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" <TAB> completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" undo redefintion undo再定義
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" easy buffer move バッファ移動のショートカット
nnoremap <silent> <Space>n :<C-u>bnext<CR>
nnoremap <silent> <Space>p :<C-u>bprevious<CR>

" easy tab move タブ移動のショートカット
" nnoremap <silent> <Space>n :<C-u>tabnext<CR>
" nnoremap <silent> <Space>p :<C-u>tabprevious<CR>
map <silent> <F2> <ESC>:tabnext<CR>
map <silent> <F3> <ESC>:tabprevious<CR>

" commentout コメントアウトのショートカット
" all
vnoremap <Space> <Nop>
vnoremap <Space>" :s/^/"<CR>:nohlsearch<CR>
vnoremap <Space>/ :s/^/\/\/<CR>:nohlsearch<CR>
vnoremap <Space># :s/^/#<CR>:nohlsearch<CR>
vnoremap <Space>% :s/^/%/<CR>:nohlsearch<CR>
vnoremap <Space>! :s/^/!/<CR>:nohlsearch<CR>
vnoremap <Space>- :s/^/--/<CR>:nohlsearch<CR>

" commentout delete コメント削除
" vnoremap <Space>d :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" ファイルタイプで簡単コメントアウト
" commentop.vimに乗り換え
" java mode
" autocmd FileType java vnoremap <Space>c :s/^/\/\/<CR>:nohlsearch<CR>
" ruby mode
" autocmd FileType ruby vnoremap <Space>c :s/^/#<CR>:nohlsearch<CR>
" commentout end コメントアウトのショートカットおしまい


" quick write & quit & kwbd(keep window buf del)
nnoremap <Space>w :<C-u>up<CR>
nnoremap <Space>q :<C-u>quit<CR>
nnoremap <Space>d :<C-u>Kwbd<CR>
"<Leader><Leader>で変更があれば保存
noremap <Leader><Leader> :<C-u>up<CR>
" date insert
command! Date :r !date
" sudo write
" nnoremap <Space>S :<C-u>w !sudo tee %<CR>


" rename excmd exコマンドでリネーム
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))))

" emacs move
noremap! <C-f> <Right>
noremap! <C-b> <Left>
" noremap! <C-a> <Home>
" noremap! <C-e> <End>
noremap! <C-d> <Del>

" cmdline change :;
noremap ; :
noremap : ;

" auto-case  自動で括弧入力
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" syntaxファイルによる補完
" autocmd FileType *
" \   if &l:omnifunc == ''
" \ |   setlocal omnifunc=syntaxcomplete#Complete
" \ | endif

" nomal mode : enter->o+esc ノーマルモードでエンター改行
" 前の行のコメントを引き継ぐ
" noremap <CR> o<ESC>
" 改行オンリー
nnoremap <CR> :<C-u>call append(expand('.'), '')<Cr>j

" serach keyword under the cursor カーソル下のキーワードを検索 
" nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'
nnoremap <expr> <Space>* ':%substitute/\<' . expand('<cword>') . '\>/'

" tags-and-searches タグ移動
nnoremap [Tag]   <Nop>
nmap     t [Tag]
nnoremap [Tag]t  <C-]>zz
nnoremap <silent> [Tag]j  :<C-u>tag<CR>zz
nnoremap <silent> [Tag]k  :<C-u>pop<CR>zz
nnoremap <silent> [Tag]s  :<C-u>tags<CR>
" nnoremap t  <Nop>
" nnoremap tt  <C-]>zz
" nnoremap tj  :<C-u>tag<CR>
" nnoremap tk  :<C-u>pop<CR>
" nnoremap tl  :<C-u>tags<CR>

" its esay marksi & registers マーク・レジスタショートカット
nnoremap <Space>m :<C-u>marks<CR>
" nnoremap <Space>r :<C-u>registers<CR>

" file open encoding shortcut 各エンコーディングで開き直すショートカット
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Euc edit<bang> ++enc=euc-jp <args>
" files open shortcut ディレクトリ以下を再帰的にargs
nnoremap <Space>a :<C-u>args **/*.*

" vimdiff diff略語
cabbrev dt diffthis
cabbrev ds diffsplit
cabbrev do diffoff

" Homedir easy コマンドラインモード時に~/をバックスラッシュで入力
function! HomedirOrBackslash()
  if getcmdtype() == ':' && (getcmdline() =~# '^e ' || getcmdline() =~? '^r\?!' || getcmdline() =~? '^cd ')
    return '~/'
  else
    return '\'
  endif
endfunction
cnoremap <expr> <Bslash> HomedirOrBackslash()

" v mode search 直前に選択した範囲で検索
" vnoremap z/ <ESC>/\%V
" vnoremap z? <ESC>?\%V

" grepコマンド改良
":Grep {file} ... {pattern}
command! -complete=file -nargs=+ Grep  call s:grep([<f-args>])
function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction


"vimの戦闘力を計算する
command! -bar -nargs=? -complete=file CalcFP echo len(filter(readfile(empty(<q-args>) ? $MYVIMRC : expand(<q-args>)),'v:val !~ "^\\s*$\\|^\\s*\""'))

" fortune autoupdate
let $Myfortune_path = $HOME . '/mytools/myfortune/myfortune'
autocmd MyAutoCmd BufWritePost $Myfortune_path nested !/usr/local/bin/strfile $Myfortune_path

" tips helptags autoupdate
let $Mydoc_path = $HOME . '/.vim/doc/'
autocmd MyAutoCmd BufWritePost $Mydoc_path . '/mytips.txt' nested helptags $Mydoc_path


" ---------------------------------------------------------------------
" plugin configure プラグインの設定

" autocomplpop.vim
" acp startup 開始時に起動しない
" let g:acp_enableAtStartup = 0
" let g:acp_ignorecaseOption = 1
" let g:acp_behaviorSnipmateLength = 1

" align.vim
let g:Align_xstrlen=3

" buftabs.vim
" バッファタブにパスを省略してファイル名のみ表示する
let g:buftabs_only_basename = 1
" バッファタブをステータスライン内に表示する
" let g:buftabs_in_statusline = 1
" アクティブなバッファをハイライト表示する
" let g:buftabs_active_highlight_group="Visual"
" statusline ステータスライン
" set statusline=%{g:buftabs_list}%=\[%<%F]\%m%r%h%w[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\%y\[%04l,%04v][%02p%%]
" set laststatus=2

" fuf.vim(fuzzyfinder.vim)
" Mru-file and Mru-cmd on
" let g:fuf_modesDisable = []
" let g:fuf_mrufile_maxItem = 500
" let g:fuf_mrucmd_maxItem = 500
" shortcut
" nnoremap [Fuzzy]  <Nop>
" nmap     f [Fuzzy]
" nnoremap <silent> [Fuzzy]f :<C-u>FufFile!<CR>
" nnoremap <silent> [Fuzzy]d :<C-u>FufDir!<CR>
" nnoremap <silent> [Fuzzy]m :<C-u>FufMruFile!<CR>
" nnoremap <silent> [Fuzzy]b :<C-u>FufBuffer!<CR>
" nnoremap <silent> [Fuzzy]c :<C-u>FufMruCmd!<CR>
" nnoremap <silent> [Fuzzy]t :<C-u>FufTag!<CR>
" nnoremap <silent> [Fuzzy]a :<C-u>FufAddBookmark<CR>
" nnoremap <silent> [Fuzzy]' :<C-u>FufBookmark<CR>
" nnoremap <silent> [Fuzzy]r :<C-u>FufRenewCache<CR>
" ctl+Enter vsp
" let g:FufOptionVsplit = '<C-Enter>'
"ctl+Enter tabnew
" let g:FufOptionTabpage = '<C-Enter>'

" git.vim
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Space>ga :<C-u>GitAdd<Enter>
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit -a<Enter>
nnoremap <Space>gC :<C-u>GitCommit -a --amend<Enter>
nnoremap <Space>gp :<C-u>Git push

" Gundo.vim
" let g:gundo_width = 60
" let g:gundo_preview_height = 40
" let g:gundo_right = 1

" Ku.vim
" enter mapping overwrite
" autocmd MyAutoCmd User plugin-ku-buffer-initialized call ku#default_key_mappings(1)
" shortcut
" nnoremap <Space>kb :<C-u>Ku buffer<Return>
" nnoremap <Space>kf :<C-u>Ku file<Return>
" nnoremap <Space>kh :<C-u>Ku history<Return>
" nnoremap <Space>km :<C-u>Ku file_mru<Return>
" nnoremap <Space>kcc :<C-u>Ku cmd_mru/cmd<Return>
" nnoremap <Space>kcs :<C-u>Ku cmd_mru/search<Return>

" MRU -Most Recently Used
" let MRU_Max_Entries = 400
" let MRU_Window_Height = 15
" let MRU_Use_Current_Window = 1
" let MRU_Auto_Close = 0
" let MRU_Add_Menu   = 0

" neocomplcache.vim
" Use neocomplcache. neocomplcacheを開始時から有効にする
let g:neocomplcache_enable_at_startup = 1
" popup max list ポップアップで表示される候補の最大数
let g:neocomplcache_max_list = 50
" hoge -> hoge,Hoge || Hoge -> Hoge
let g:neocomplcache_enable_smart_case = 1
" Use previous keyword completion.(前の単語を考慮して候補の並びを決定する)
let g:NeoComplCache_PreviousKeywordCompletion = 1
" Use tags auto update.
let g:NeoComplCache_TagsAutoUpdate = 1
" Use preview window.
let g:NeoComplCache_EnableInfo = 1
" Use camel case completion. (AE -> ArgumentsException)
" let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion. (p_h -> public_html)
" let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" quick select '-'を入力すると英数字で候補選択
" let g:neocomplcache_enable_quick_match = 1
" Set skip input time.
let g:NeoComplCache_SkipInputTime = '0.2'
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 1
" 自動的に一番上の候補を選択する
" let g:neocomplcache_enable_auto_select = 1
" C-jでneocomplcache補完
" inoremap <expr><C-j>  pumvisible() ? "\<C-j>" : "\<C-x>\<C-u>\<C-p>"
" snippets key-mappings
imap <silent><C-l>  <Plug>(neocomplcache_snippets_expand)
smap <silent><C-l>  <Plug>(neocomplcache_snippets_expand)
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" NERD_commenter.vim
map co <plug>NERDCommenterToggle
map cs <plug>NERDCommenterSexy
map ca <plug>NERDCommenteryAppend
map cu <plug>NERDCommenterUncomment
let NERDSpaceDelims = 1

" quickrun.vim
silent! nmap <unique> <Space>r <Plug>(Quickrun)
" async mode 非同期実行
" let g:quickrun_config = {
" \   '*': {'runmode': 'async:remote:vimproc'},
" \ }

" refe.vim
" refer to ftplugin

" sudo.vim
nnoremap <Space>S :<C-u>e sudo:%<CR>

" scrach.vim (kaoriya patch)
" nnoremap <silent> <Space>s :<C-u>Scratch<CR>
nmap <unique> <silent> <Space>s <Plug>ShowScratchBuffer
" imap <unique> <silent> <Space>s <Plug>InsShowScratchBuffer
let g:scratchBackupFile=$HOME . "/tmp/scratch.txt"

" smartchr.vim
inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
inoremap <expr> < smartchr#loop('<', ' < ', ' <= ')
inoremap <expr> > smartchr#loop('>', ' > ', ' >= ')
inoremap <expr> & smartchr#loop('&', ' && ')
inoremap <expr> <Bar> smartchr#loop('<Bar>', ' <Bar><Bar> ')
inoremap <expr> , smartchr#one_of(', ', ',', '<><Left>')
inoremap <buffer><expr> + smartchr#one_of('+', ' + ', '++')
inoremap <buffer><expr> - smartchr#one_of('-', ' - ', '--')
" inoremap <buffer><expr> + smartchr#one_of(' + ', '++', '+')
" inoremap <buffer><expr> - smartchr#one_of(' - ', '--', '-')

" smartword.vim
map w  <Plug>(smartword-w)zz
map b  <Plug>(smartword-b)zz
map e  <Plug>(smartword-e)zz
map ge <Plug>(smartword-ge)zz
noremap W  w
noremap B  b
noremap E  e
noremap gE ge

" surround.vim
" nnoremap gt cst
" ftpluginの方に書いたよ
" 今後もそっちに追加
" 追加内容をdocのmytipsに書こう

" taglist.vim
"right window 右側に表示
let Tlist_Use_Right_Window = 1
" exit only window
let Tlist_Exit_OnlyWindow = 1
" 編集中のファイルのみ表示
let Tlist_Show_One_File = 1
" vertically split taglist width
let Tlist_WinWidth = 40
" Automatically update the taglist to include newly edit files
let Tlist_Auto_Update = 1
" Maximum number of items in a tags sub-menu.
" Tlist_Max_Submenu_Items = 300
" Tlist shortcut
nnoremap <silent> [Tag]l  :<C-u>TlistToggle<CR><C-w>=
" FileExplorer+ winmanager.vimとの連携
" let winManagerWindowLayout = 'FileExplorer|TagList'
" objective-cに対応
if has('kaoriya')
  let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
endif

" unite.vim
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]
" nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]m  :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]w  :<C-u>UniteWithCursorWord -buffer-name=register buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" nnoremap <silent> [Space]b  :<C-u>UniteBookmarkAdd<CR>
" nnoremap  [unite]f  :<C-u>Unite source<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  nmap <buffer> <ESC>     <Plug>(unite_exit)
  " imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
endfunction"}}}
" 絞込みテキストを入力するごとに表示される候補の更新間隔
let g:unite_update_time = 150
" 実行したあとすぐに入力モード
let g:unite_enable_start_insert = 1
" uniteのウィンドウを垂直分割
let g:unite_enable_split_vertically = 1
" 最近使用したファイルの最大保存件数
let g:unite_source_file_mru_limit = 400
" unite-help
" Execute help.
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <Space>h  :<C-u>UniteWithCursorWord help<CR>

" vimball.vim(STD)
" vimball install directory
let g:vimball_home = $HOME . '/.vim/bundle/vimballplugin/'

" vimfiler.vim
" instead of netrw
let g:vimfiler_as_default_explorer = 1
" The prefix key.
nnoremap <silent> [unite]f  :<C-u>VimFiler<CR>
" コマンドラインでの短縮入力
cabbrev vf VimFiler

" vimshell.vim
" nnoremap <Space>v :<C-u>VimShell<CR>
" 非同期実行
" let g:VimShell_EnableInteractive = 1
" let g:vimshell_enable_smart_case = 1
" ,is: シェルを起動
" nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
" nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
" nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
" vmap <silent> ,ss :VimShellSendString<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
" nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

" writebackup.vim
" nnoremap <Space>b :<C-u>WriteBackup<CR>

" yankring.vim
nnoremap <Space>y :<C-u>YRShow<CR>
let g:yankring_window_height = 10

" zencoding.vim
let g:user_zen_expandabbr_key = '<C-y>'



" ---------------------------------------------------------------------
" encoding 文字コードの自動認識(by ずんwiki 基本コピペなのでそのうち勉強すること)
if has(! "kaoriya")
  if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
  endif
  if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'eucjp-ms'
      let s:enc_jis = 'iso-2022-jp-3'
      " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'euc-jisx0213'
      let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
      let s:fileencodings_default = &fileencodings
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
      unlet s:fileencodings_default
    else
      let &fileencodings = &fileencodings .','. s:enc_jis
      set fileencodings+=utf-8,ucs-2le,ucs-2
      if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
        set fileencodings+=cp932
        set fileencodings-=euc-jp
        set fileencodings-=euc-jisx0213
        set fileencodings-=eucjp-ms
        let &encoding = s:enc_euc
        let &fileencoding = s:enc_euc
      else
        let &fileencodings = &fileencodings .','. s:enc_euc
      endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
  endif
  " 日本語を含まない場合は fileencoding に encoding を使うようにする
  if has('autocmd')
    function! AU_ReCheck_FENC()
      if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding=&encoding
      endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
  endif
  " 改行コードの自動認識
  set fileformats=unix,dos,mac
  " □とか○の文字があってもカーソル位置がずれないようにする
  if exists('&ambiwidth')
    set ambiwidth=double
  endif
endif
