# my zshenv Last Change: 21-Nov-2010.

# プロファイルがあれば読み込む
# if [ -f /etc/profile ]; then
	# . /etc/profile
# fi

# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:${PATH}

# MacPorts manファイル
# export MANPATH=/opt/local/man:${MANPATH}

# git-core とりあえず
# export PATH=$PATH:/usr/local/Cellar/git/1.7.3.2/libexec/git-core

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

