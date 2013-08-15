bit_branch ()
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
parse_git_branch () {
  git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}

. `brew --prefix`/etc/profile.d/z.sh
source /Users/ms3uf/.git-completion.bash

# Added for /usr/local/bin 
export PATH="/usr/local/bin:$PATH"

### Added for rbenv
export PATH="/Users/ms3uf/.rbenv/shims:$PATH"

# Added for personal scripts
export PATH="/Users/ms3uf/bin/fits:/Users/ms3uf/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Added for npm (Node.js and Coffeescript)
export PATH="$PATH:/usr/local/share/npm/bin"
