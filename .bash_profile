[[ -r ~/.bashrc ]] && . ~/.bashrc
#PS1='\e[1;34m\][\u@\h \w] \[\e[m\]'
export PS1='[\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\]\w\033[33;1m\]$(git_branch)\[\033[00m\]] '
export EDITOR='mvim'

alias adium='open -a adium'
alias dug='~/.bin/dug.sh'
alias bounce='echo "restarting httpd..."; sudo apachectl restart'
alias eclipse='open -a Eclipse'
alias evernote='open -a Evernote'
alias grep='grep --exclude=*.svn-base '
alias hover='watch -n 5 ps -o pid,user,etime,args -p '
alias howbig='du -hs .'
alias ical='open -a ical'
alias ichat='open -a Messages'
alias chat='open -a Messages'
alias itunes='open -a itunes'
alias less='less -r'
alias ll='ls -laG'
alias ls='ls -aG'
alias luke='java -jar /usr/local/src/lukeall-3.5.0.jar &'
alias mate='/Applications/TextMate.app/Contents/SharedSupport/Support/bin/mate'
alias oxygen='open -a Oxygen.app'
alias portscan='stroke'
alias rgrep='grep -R '
alias stoptomcat='/usr/local/tomcat/bin/shutdown.sh'
alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias tomcat='/usr/local/tomcat/bin/startup.sh'
alias tping='ps -ef -l | grep -E '\''(tomcat|PPID)'\'' | grep -v grep'
alias unravel='gpg --decrypt '
alias z='_z 2>&1'

source "/Users/ms3uf/.bash_it/themes/colors.theme.bash"
source "/Users/ms3uf/.bash_it/themes/base.theme.bash"
function set_term_bg_color() {
: ${3?"Usage: $FUNCNAME RED GREEN BLUE"}
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
  return 0
}
function prompt_command() {
    #PS1="${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${purple}$(ruby_version_prompt) ${yellow}\h ${reset_color}in ${green}\w ${reset_color}\n${green}→${reset_color} "
    PS1="\n${yellow}$(ruby_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
    # set iTerm2 tab/window title
    echo -ne "\033]0;`hostname -s`\007"
    # set color on same
    set_term_bg_color 230 84 82

}
PROMPT_COMMAND=prompt_command;
if [[ $PROMPT ]]; then
  export PS1=$PROMPT
fi
eval "$(rbenv init -)"
