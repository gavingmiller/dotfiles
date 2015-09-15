# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi

# set editor for bundle open
export EDITOR=vim
export BUNDLER_EDITOR=vim

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'

# psql
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

# vim installation
export PATH="$PATH:/opt/local/bin"

# local bin path
export PATH="$PATH:./bin"

# work bin path
export PATH="$PATH:~/bin/cisco"

# global bin path
export PATH="$PATH:~/bin"

# Include scriptx -- bonus script folder for personal scripts
export PATH="$PATH:./scriptx"

# vim
export PATH="$PATH:/usr/local/bin"

# git
export PATH="$PATH:/usr/local/git/bin"

# node
export PATH="$PATH:/usr/local/share/npm/bin"

# rabbit mq
export PATH="$PATH:/usr/local/sbin"

# mongodb
export PATH="$PATH:/usr/local/mongodb/bin"

# Set less output options
# Don't escape coloring
export LESS="-R"

# Export android home
export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Added neo4j to path
export PATH="$PATH:/usr/local/neo4j/bin"

# Include .bashrc and git-completion
source ~/.bashrc
source ~/bin/git-completion.bash

# nvm
export NVM_DIR="/Users/gmiller/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

