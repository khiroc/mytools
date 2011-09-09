# my zshenv Last Change: 13-Jun-2011.

# プロファイルがあれば読み込む
# if [ -f /etc/profile ]; then
	# . /etc/profile
# fi

# 重複パスを削除
typeset -U PATH

path=(/usr/*/(bin|sbin)(N-/) /usr/local/*/(bin|sbin)(N-/) /var/*/(bin|sbin)(N-/) $PATH)

# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
path=(/usr/local/(bin|sbin) $PATH)

fpath=($HOME/.zsh/functions/ $fpath)

# MacPorts manファイル
# export MANPATH=/opt/local/man:${MANPATH}


# ===============[ tomcat ]=================
export CATALINA_HOME=/usr/local/tomcat
export CATALINA_BASE=/usr/local/tomcat
export CATALINA_OPTS="-server -Xmx256M -Xms128M -Xss256k"
export PATH=$CATALINA_HOME/bin:$PATH

# ===============[ pgsql ]=================
export POSTGRES_HOME=/usr/local/pgsql
export PGDATA=$POSTGRES_HOME/data
export PATH=$POSTGRES_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$POSTGRES_HOME
export PGCLIENTENCODING=UTF8

