# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
export PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]] '

PATH=$PATH:$HOME/bin
export PATH

# get ssh-agent running if it's not
SSH_SOCKET_FILE=/home/ms3uf/.ssh/agent.socket
SSH_ENV_FILE=/home/ms3uf/.ssh/agent.env
test -S $SSH_SOCKET_FILE || eval `/usr/local/bin/ssh-agent-wrapper.sh`
test -s $SSH_ENV_FILE && . $SSH_ENV_FILE

if [ ! -S $SSH_SOCKET_FILE  ]; then
  echo "Please start ssh-agent"
fi

# load identities
list=$( ssh-add -l )
ssh_add_status=$?
if [[ $ssh_add_status -eq 1 ]]
then
  echo "Loading GitHub identity:"
  eval `ssh-add "$HOME/.ssh/github_rsa"`
else
  ssh-add -l 
fi

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# prompt setup
source "/home/ms3uf/.bash_it/themes/colors.theme.bash"
source "/home/ms3uf/.bash_it/themes/base.theme.bash"
function set_term_bg_color() {
: ${3?"Usage: $FUNCNAME RED GREEN BLUE"}
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
  return 0
}
function prompt_command() {
  PS1="[\u]${yellow}$(ruby_version_prompt) ${blue}\h${reset_color} in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
  # sets title in iTerm2 tab/window
  echo -ne "\033]0;`hostname -s`\007"
  # tweaks color in same
  set_term_bg_color 132 201 230
}
PROMPT_COMMAND=prompt_command;
if [[ $PROMPT ]]; then
  export PS1=$PROMPT
fi
