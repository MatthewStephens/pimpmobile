# .bashrc

# the ever mysterious "sudo space" alias, which passes aliases to sudo
alias sudo='sudo '

# vim vi alias
alias vi=`which vim`

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# need more history!
HISTFILESIZE=10000
HISTTIMEFORMAT='%F %T '

# editor vars
SVN_EDITOR=vim
EDITOR=vi

# User specific aliases and functions
alias md5="md5sum"
alias tping='ps -ef | grep tomcat'
alias gimme='/usr/bin/find . -type f -name  2>/dev/null'
alias gimmed='/usr/bin/find . -type d -name  2>/dev/null'
alias ll='ls -lah'
alias ls='ls -a'
alias tping="ps -ef -l | grep -E '(tomcat|PPID)' | grep -v grep"
alias tpid='ps -U tomcat -eo pid,command | grep tomcat | grep -v ps | grep -v grep | grep -o -E '\''^[0-9]+'\'''
alias tomkill='sudo kill -9 `tpid`'
alias ldapme="ldapsearch -h ldap.virginia.edu -D '' -w '' -x -v -b 'o=University of Virginia, c=US' '(uid=ms3uf)' cn '*'"
alias rgrep="grep -R --exclude-dir=.svn "
alias hover="watch -n 5 ps -o pid,user,etime,args -p "
# Ruby vars
RUBYLIB="/usr/lib/ruby/gems/1.8/gems"
