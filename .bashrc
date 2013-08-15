# .bashrc

# User specific aliases and functions

alias ls='ls -a --color'
alias rm='rm -i'
alias cp='cp -ip'
alias mv='mv -i'
alias tping="ps -ef -l | grep -E '(tomcat|PPID)' | grep -v grep"
export JAVA_HOME="/etc/alternatives/java_sdk"
export JDK_HOME="/etc/alternatives/java_sdk"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
