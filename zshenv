# my zshenv Last Change: 28-Apr-2011.

# プロファイルがあれば読み込む
# if [ -f /etc/profile ]; then
	# . /etc/profile
# fi

# 重複パスを削除
typeset -U PATH

path=(/usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/) $PATH)

# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:${PATH}


# MacPorts manファイル
# export MANPATH=/opt/local/man:${MANPATH}


# ===============[ tomcat ]=================
export CATALINA_HOME=/usr/local/tomcat
export CATALINA_BASE=/usr/local/tomcat
export CATALINA_OPTS="-server -Xmx256M -Xms128M -Xss256k"
export PATH=$PATH:$CATALINA_HOME/bin

# ===============[ pgsql ]=================
export POSTGRES_HOME=/usr/local/pgsql
export PGDATA=$POSTGRES_HOME/data
export PATH=$PATH:$POSTGRES_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$POSTGRES_HOME
export PGCLIENTENCODING=UTF8

