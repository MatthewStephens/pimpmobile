<<<<<<< HEAD
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
export GREP_COLOR='01;37'

# pimped-out prompt
export PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]] '


# get ssh-agent running if it's not
# (relies on custom script)

SSH_SOCKET_FILE=$HOME/.ssh/agent.socket
SSH_ENV_FILE=$HOME/.ssh/agent.env
if [[ $( which ssh-agent-wrapper.sh ) ]]; then
  test -S $SSH_SOCKET_FILE || eval `ssh-agent-wrapper.sh`
  test -s $SSH_ENV_FILE && . $SSH_ENV_FILE

  if [ ! -S $SSH_SOCKET_FILE  ]; then
    echo "Please start ssh-agent"
  fi
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

# load color themes
source "$HOME/.bash_it/themes/colors.theme.bash"
source "$HOME/.bash_it/themes/base.theme.bash"

# setting terminal title as well as refreshing PS1
PROMPT_COMMAND=prompt_command;
if [[ $PROMPT ]]; then
  export PS1=$PROMPT
fi

# if rbenv in use, initialize
hash rbenv 2>/dev/null && eval "$(rbenv init -)"
