# .bashrc
# settings here will be sourced into .bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
# Aliases
#

# specific to this machine
alias adium='open -a adium'
alias dug='~/.bin/dug.sh'
alias bounce='echo "restarting httpd..."; sudo apachectl restart'
alias eclipse='open -a Eclipse'
alias evernote='open -a Evernote'
alias ical='open -a ical'
alias ichat='open -a Messages'
alias chat='open -a Messages'
alias itunes='open -a itunes'
alias mate='/Applications/TextMate.app/Contents/SharedSupport/Support/bin/mate'
alias oxygen='open -a Oxygen.app'
alias portscan='stroke'
alias stoptomcat='/usr/local/tomcat/bin/shutdown.sh'
alias tomcat='/usr/local/tomcat/bin/startup.sh'
alias unravel='gpg --decrypt '
alias z='_z 2>&1'

alias df='df -TP '
[[ ! $( which md5 ) ]] && alias md5="md5sum"
alias gimme='/usr/bin/find . -type f -name  2>/dev/null'
alias hover="watch -n 5 ps -o pid,user,etime,args -p "
alias ldapme="ldapsearch -h ldap.virginia.edu -D '' -w '' -x -v -b 'o=University of Virginia, c=US' '(uid=ms3uf)' cn '*'"
alias ll='ls -lahG'
alias ls='ls -aG'
alias rgrep="grep -R --exclude-dir=.svn "
alias myip="ifconfig | grep -o -E 'inet.*[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.*[bB].*cast' | grep --color -o -E '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}'"
alias tping="ps -ef -l | grep -E '(tomcat|PPID)' | grep -v grep"
alias tpid='ps -U tomcat -eo pid,command | grep tomcat | grep -v ps | grep -v grep | grep -o -E '\''^[0-9]+'\'''
alias tomkill='sudo kill -9 `tpid`'

# the ever mysterious "sudo space" alias, which passes aliases to sudo
alias sudo='sudo '

# vim/vi alias
[[ $( which vim ) ]] && alias vi=$( which vim )

#
# Environment Variables
#

# need more history!
HISTFILESIZE=10000
HISTTIMEFORMAT='%F %T '

# editor vars
SVN_EDITOR=vim
EDITOR=vim
GREP_COLOR='01;37' # white

#
# PATH adjustments
#
PATH=$PATH:$HOME/bin
export PATH


#
# functions (mostly terminal look-and-feel)
#
function mdcd() { echo "mkdir $@ && cd $_"; mkdir -p "$@" && cd "${@:$#}"; }

function set_term_bg_color() {
: ${3?"Usage: $FUNCNAME RED GREEN BLUE"}
  echo -ne "\033]6;1;bg;red;brightness;$1\a" 
  echo -ne "\033]6;1;bg;green;brightness;$2\a" 
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
  return 0
}

function prompt_command() {
  PS1="[\u]${yellow}$(ruby_version_prompt) ${white}\h${reset_color} in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
  # sets title in iTerm2 tab/window
  echo -ne "\033]0;`hostname -s`\007"
  # tweaks color in same
  set_term_bg_color 230 84 82
}

#
# Application-specific extensions
#

# Ruby 
RUBYLIB="/usr/lib/ruby/gems/1.8/gems"

# Git helper
[[ -r $HOME/.git-completion.bash ]] && source $HOME/.git-completion.bash

# Rvm (only if installed, now primarily using rbenv)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

