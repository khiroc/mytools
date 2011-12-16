export LANG=ja_JP.UTF-8

# プロンプト、表示
# rootは普段使わないからてきとー
if [ $USER = "root" ]
then
	PROMPT="%B%{[31m%}[${USER}@${HOSTNAME}%/#%{[m%}%b "
	RPROMPT="[%~]"
	HOME=/root
else
	#PROMPT="%B%{[31m%}[$USER]%/#%{[m%}%b "
	PROMPT="[${USER}@${HOSTNAME}][%T]%(!.#.$)"
	RPROMPT='[%~]'
fi

#プロンプトのカラー表示
autoload -U colors
colors


# エスケプシーケンスを使う
setopt prompt_subst

#コマンドの履歴を残す
HISTFILE=~/.zsh_history
HISTSIZE=12000000
SAVEHIST=12000000

# ヒストリファイルに時刻を記録
setopt extended_history
# ヒストリをインクリメンタルに追加
setopt inc_append_history
# ヒストリに追加されるコマンドが前に使った削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 最初に空白がある場合はヒストリに追加しない
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify


# 補完機能
autoload -U compinit; compinit
# 私的補完ファイルのパス
typeset -U fpath
fpath=(~/mytools/zsh_completion.d ${fpath})
# git補完候補の追加
[ -f ~/mytools/zsh_completion.d/git/zsh.zsh ] && source ~/mytools/zsh_completion.d/git/zsh.zsh

# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# "#", "~", "^" を正規表現として扱う
setopt extended_glob

# 明確なドットの指定なしで.から始まるファイルをマッチ
# setopt glob_dots

# 補完機能の候補をつめて表示する
setopt list_packed

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# 補完侯補をEmacsのキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完の表示を過剰にする
zstyle ':completion:*' verbose yes
# 様々な補完（ミススペル、履歴などなど
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# 補完をグループ毎にわけて表示
zstyle ':completion:*' group-name ''

# いろいろ色つき表示
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'

#LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# sudo complete sudoでの補完対象を追加
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin


# 間違ってディレクトリ名だけを入力しても移動
setopt auto_cd

# cdでpushdする。
setopt auto_pushd

# 日本語ファイル名等8ビットを通す
setopt print_eight_bit

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# コマンドを間違っても修正してくれる
setopt correct

# ^Dでログアウトしない
setopt ignore_eof

# "rm * " を実行する前に必ず確認する
# unsetopt rm_star_silent
setopt rm_star_wait

# cdを打ったら自動的にlsを打ってくれる関数
function cd(){
    builtin cd $@ && ls -GF;
}


# screenのときに自動命名
# preexec () {
    # if [ $TERM = "screen" ]; then
        # 1="$1 " # deprecated.
        # echo -ne "\ek${${(s: :)1}[0]}\e\\"
    # fi
  # }

# function ssh_screen(){
 # eval server=\${$#}
 # screen -t $server ssh "$@"
# }
# if [ x$TERM = xscreen ]; then
  # alias ssh=ssh_screen
# fi

# screenのセッション保存先
# export SCREENDIR=~/tmp/screen/


# gitのブランチ名を右側に表示
# ${fg[...]} や $reset_color をロード
# autoload -U colors; colors

# function rprompt-git-current-branch {
        # local name st color
        # name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
        # if [[ -z $name ]]; then
                # return
        # fi
        # st=`git status`
        # if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                # color=${fg[green]}
        # elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                # color=${fg[yellow]}
        # elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                # color=${fg_bold[red]}
        # else
                # color=${fg[red]}
        # fi

        # # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
        # # これをしないと右プロンプトの位置がずれる
        # echo "%{$color%}$name%{$reset_color%} "
# }

# # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst
# RPROMPT='[`rprompt-git-current-branch`%~]'

# バックスラッシュで~/
expand-to-home-or-insert () {
  if [ "$LBUFFER" = "" -o "$LBUFFER[-1]" = " " ]; then
    LBUFFER+="~/"
  else
    zle self-insert
  fi
}
zle -N expand-to-home-or-insert
bindkey "\\"  expand-to-home-or-insert


# 辞書.app
dict () { open dict:///"$@" ; }

# 大学でのproxy
cist_proxy () {
    # proxy
    export http_proxy=http://proxy.mc.chitose.ac.jp:8080
    export HTTP_PROXY=http://proxy.mc.chitose.ac.jp:8080
    export ftp_proxy=http://proxy.mc.chitose.ac.jp:8080
    export FTP_PROXY=http://proxy.mc.chitose.ac.jp:8080
    export https_proxy=http://proxy.mc.chitose.ac.jp:8080
    export HTTPS_PROXY=http://proxy.mc.chitose.ac.jp:8080
    export ALL_PROXY=$http_proxy
    echo "http_proxy = "$http_proxy
    echo "ftp_proxy = "$ftp_proxy
    echo "set cist proxy"
}


###alias###
alias lf="less +F"
alias less="less -R"

alias l="ls -GF"
alias ls="ls -GF"
alias la="ls -lhAGFTv"
alias ll="ls -lhAGFTv | less"

alias c="cd"

alias cp="cp -ir"
alias cpf="/bin/cp -frv"
alias rm="rm -ir"
alias rmf="/bin/rm -frv"
alias mv="mv -i"
alias t="tar zxvf"

alias s="sudo"
alias ka="killall"
alias kk="kill -KILL"

alias eclipse="/Applications/eclipse/Eclipse.app/Contents/MacOS/eclipse -clean"
alias cemacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
# alias v="/Applications/MacVim.app/Contents/MacOS/Vim"
# alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gv='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias gvi='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias ctags_mv='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'

alias myfortune="fortune ~/mytools/myfortune"

alias fcd="source /usr/local/bin/fcd.sh"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g G='| grep'
alias -g H=' --help | less'
alias -g L='| less'
alias -g VL='| vless'
alias -g T='| tail'

alias -g C='| pbcopy'

# alias tmux
alias tc="tmux new-window"
alias tn="tmux next-window"
alias tp="tmux previous-window"
